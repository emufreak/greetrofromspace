
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
       4:	       move.l #237568,d3
       a:	       subi.l #237568,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #237568,d0
      18:	       cmpi.l #237568,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 3a000 <FrameCountBufferDraw>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #237568,d3
      38:	       subi.l #237568,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #237568,d0
      46:	       cmpi.l #237568,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 3a000 <FrameCountBufferDraw>,a2
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
      66:	                         subq.l #8,sp
      68:	                         movem.l d2-d3/d7/a2-a6,-(sp)
	SysBase = *((struct ExecBase**)4UL);
      6c:	                         movea.l 4 <_start+0x4>,a6
      70:	                         move.l a6,49ca8 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                         move.l #14675968,49ca4 <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                         lea 3886c <incbin_MercuryLetterData2Lz4_end+0x14c>,a1
      86:	                         moveq #0,d0
      88:	                         jsr -552(a6)
      8c:	                         move.l d0,49ca0 <GfxBase>
	if (!GfxBase)
      92:	      /----------------- beq.w 30c <main+0x2a6>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	      |                  movea.l 49ca8 <SysBase>,a6
      9c:	      |                  lea 3887d <incbin_MercuryLetterData2Lz4_end+0x15d>,a1
      a2:	      |                  moveq #0,d0
      a4:	      |                  jsr -552(a6)
      a8:	      |                  move.l d0,49c9c <DOSBase>
	if (!DOSBase)
      ae:	/-----|----------------- beq.w 29a <main+0x234>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	|  /--|----------------> pea 38889 <incbin_MercuryLetterData2Lz4_end+0x169>
      b8:	|  |  |                  lea cde <KPrintF>,a5
      be:	|  |  |                  jsr (a5)
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      c0:	|  |  |                  movea.l 49c9c <DOSBase>,a6
      c6:	|  |  |                  jsr -60(a6)
      ca:	|  |  |                  movea.l 49c9c <DOSBase>,a6
      d0:	|  |  |                  move.l d0,d1
      d2:	|  |  |                  move.l #231589,d2
      d8:	|  |  |                  moveq #15,d3
      da:	|  |  |                  jsr -48(a6)
	Delay(50);
      de:	|  |  |                  movea.l 49c9c <DOSBase>,a6
      e4:	|  |  |                  moveq #50,d1
      e6:	|  |  |                  jsr -198(a6)

	warpmode(1);
      ea:	|  |  |                  pea 1 <_start+0x1>
      ee:	|  |  |                  lea d50 <warpmode>,a4
      f4:	|  |  |                  jsr (a4)
		register volatile const void* _a0 ASM("a0") = module;
      f6:	|  |  |                  lea 3a338 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      fc:	|  |  |                  suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      fe:	|  |  |                  suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     100:	|  |  |                  lea 225a <incbin_player_start>,a3
		__asm volatile (
     106:	|  |  |                  movem.l d1-d7/a4-a6,-(sp)
     10a:	|  |  |                  jsr (a3)
     10c:	|  |  |                  movem.l (sp)+,d1-d7/a4-a6
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     110:	|  |  |                  addq.l #8,sp
     112:	|  |  |                  tst.l d0
     114:	|  |  |  /-------------- bne.w 212 <main+0x1ac>
		KPrintF("p61Init failed!\n");
#endif
	warpmode(0);
     118:	|  |  |  |  /----------> clr.l -(sp)
     11a:	|  |  |  |  |            jsr (a4)
	Forbid();
     11c:	|  |  |  |  |            movea.l 49ca8 <SysBase>,a6
     122:	|  |  |  |  |            jsr -132(a6)
	SystemADKCON=custom->adkconr;
     126:	|  |  |  |  |            movea.l 49ca4 <custom>,a0
     12c:	|  |  |  |  |            move.w 16(a0),d0
	SystemInts=custom->intenar;
     130:	|  |  |  |  |            move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     134:	|  |  |  |  |            move.w 2(a0),d0
	LoadView(0);
     138:	|  |  |  |  |            movea.l 49ca0 <GfxBase>,a6
     13e:	|  |  |  |  |            suba.l a1,a1
     140:	|  |  |  |  |            jsr -222(a6)
	WaitTOF();
     144:	|  |  |  |  |            movea.l 49ca0 <GfxBase>,a6
     14a:	|  |  |  |  |            jsr -270(a6)
	WaitTOF();
     14e:	|  |  |  |  |            movea.l 49ca0 <GfxBase>,a6
     154:	|  |  |  |  |            jsr -270(a6)
	WaitVbl();
     158:	|  |  |  |  |            lea 3a2 <WaitVbl>,a2
     15e:	|  |  |  |  |            jsr (a2)
	WaitVbl();
     160:	|  |  |  |  |            jsr (a2)
	OwnBlitter();
     162:	|  |  |  |  |            movea.l 49ca0 <GfxBase>,a6
     168:	|  |  |  |  |            jsr -456(a6)
	WaitBlit();	
     16c:	|  |  |  |  |            movea.l 49ca0 <GfxBase>,a6
     172:	|  |  |  |  |            jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     176:	|  |  |  |  |            movea.l 49ca4 <custom>,a0
     17c:	|  |  |  |  |            move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     182:	|  |  |  |  |            move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     188:	|  |  |  |  |            move.w #16383,150(a0)
     18e:	|  |  |  |  |            addq.l #4,sp
	for(int a=0;a<32;a++)
     190:	|  |  |  |  |            moveq #0,d1
		custom->color[a]=0;
     192:	|  |  |  |  |        /-> move.l d1,d0
     194:	|  |  |  |  |        |   addi.l #192,d0
     19a:	|  |  |  |  |        |   add.l d0,d0
     19c:	|  |  |  |  |        |   move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     1a2:	|  |  |  |  |        |   addq.l #1,d1
     1a4:	|  |  |  |  |        |   moveq #32,d0
     1a6:	|  |  |  |  |        |   cmp.l d1,d0
     1a8:	|  |  |  |  |        +-- bne.s 192 <main+0x12c>
	WaitVbl();
     1aa:	|  |  |  |  |        |   jsr (a2)
	WaitVbl();
     1ac:	|  |  |  |  |        |   jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     1ae:	|  |  |  |  |        |   move.w #20090,34(sp)
     1b4:	|  |  |  |  |        |   move.w #2049,36(sp)
     1ba:	|  |  |  |  |        |   move.w #20083,38(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     1c0:	|  |  |  |  |        |   movea.l 49ca8 <SysBase>,a6
     1c6:	|  |  |  |  |        |   btst #0,297(a6)
     1cc:	|  |  |  |  |  /-----|-- beq.w 338 <main+0x2d2>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1d0:	|  |  |  |  |  |     |   moveq #34,d7
     1d2:	|  |  |  |  |  |     |   add.l sp,d7
     1d4:	|  |  |  |  |  |     |   exg d7,a5
     1d6:	|  |  |  |  |  |     |   jsr -30(a6)
     1da:	|  |  |  |  |  |     |   exg d7,a5
	VBR=GetVBR();
     1dc:	|  |  |  |  |  |     |   move.l d0,49c98 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1e2:	|  |  |  |  |  |     |   movea.l 49c98 <VBR>,a0
     1e8:	|  |  |  |  |  |     |   move.l 108(a0),d0

	TakeSystem();
	WaitVbl();
     1ec:	|  |  |  |  |  |     |   jsr (a2)

	Sw_PrepareDisplay();
     1ee:	|  |  |  |  |  |     |   jsr eac <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;
     1f4:	|  |  |  |  |  |     |   movea.l 49ca4 <custom>,a0
     1fa:	|  |  |  |  |  |     |   move.w #-31745,150(a0)
	custom->intena=0xc010;//Enable vblank
     200:	|  |  |  |  |  |     |   move.w #-16368,154(a0)
     206:	|  |  |  |  |  |     |   lea 3e8 <Sw_Run>,a2

	while(1) {
		Sw_Run();
     20c:	|  |  |  |  |  |  /--|-> jsr (a2)
     20e:	|  |  |  |  |  |  |  |   jsr (a2)
	while(1) {
     210:	|  |  |  |  |  |  +--|-- bra.s 20c <main+0x1a6>
		KPrintF("p61Init failed!\n");
     212:	|  |  |  >--|--|--|--|-> pea 388b5 <incbin_MercuryLetterData2Lz4_end+0x195>
     218:	|  |  |  |  |  |  |  |   jsr (a5)
     21a:	|  |  |  |  |  |  |  |   addq.l #4,sp
	warpmode(0);
     21c:	|  |  |  |  |  |  |  |   clr.l -(sp)
     21e:	|  |  |  |  |  |  |  |   jsr (a4)
	Forbid();
     220:	|  |  |  |  |  |  |  |   movea.l 49ca8 <SysBase>,a6
     226:	|  |  |  |  |  |  |  |   jsr -132(a6)
	SystemADKCON=custom->adkconr;
     22a:	|  |  |  |  |  |  |  |   movea.l 49ca4 <custom>,a0
     230:	|  |  |  |  |  |  |  |   move.w 16(a0),d0
	SystemInts=custom->intenar;
     234:	|  |  |  |  |  |  |  |   move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     238:	|  |  |  |  |  |  |  |   move.w 2(a0),d0
	LoadView(0);
     23c:	|  |  |  |  |  |  |  |   movea.l 49ca0 <GfxBase>,a6
     242:	|  |  |  |  |  |  |  |   suba.l a1,a1
     244:	|  |  |  |  |  |  |  |   jsr -222(a6)
	WaitTOF();
     248:	|  |  |  |  |  |  |  |   movea.l 49ca0 <GfxBase>,a6
     24e:	|  |  |  |  |  |  |  |   jsr -270(a6)
	WaitTOF();
     252:	|  |  |  |  |  |  |  |   movea.l 49ca0 <GfxBase>,a6
     258:	|  |  |  |  |  |  |  |   jsr -270(a6)
	WaitVbl();
     25c:	|  |  |  |  |  |  |  |   lea 3a2 <WaitVbl>,a2
     262:	|  |  |  |  |  |  |  |   jsr (a2)
	WaitVbl();
     264:	|  |  |  |  |  |  |  |   jsr (a2)
	OwnBlitter();
     266:	|  |  |  |  |  |  |  |   movea.l 49ca0 <GfxBase>,a6
     26c:	|  |  |  |  |  |  |  |   jsr -456(a6)
	WaitBlit();	
     270:	|  |  |  |  |  |  |  |   movea.l 49ca0 <GfxBase>,a6
     276:	|  |  |  |  |  |  |  |   jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     27a:	|  |  |  |  |  |  |  |   movea.l 49ca4 <custom>,a0
     280:	|  |  |  |  |  |  |  |   move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     286:	|  |  |  |  |  |  |  |   move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     28c:	|  |  |  |  |  |  |  |   move.w #16383,150(a0)
     292:	|  |  |  |  |  |  |  |   addq.l #4,sp
	for(int a=0;a<32;a++)
     294:	|  |  |  |  |  |  |  |   moveq #0,d1
     296:	|  |  |  |  |  |  |  \-- bra.w 192 <main+0x12c>
		Exit(0);
     29a:	>--|--|--|--|--|--|----> suba.l a6,a6
     29c:	|  |  |  |  |  |  |      moveq #0,d1
     29e:	|  |  |  |  |  |  |      jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     2a2:	|  |  |  |  |  |  |      pea 38889 <incbin_MercuryLetterData2Lz4_end+0x169>
     2a8:	|  |  |  |  |  |  |      lea cde <KPrintF>,a5
     2ae:	|  |  |  |  |  |  |      jsr (a5)
	Write(Output(), (APTR)"Hello console!\n", 15);
     2b0:	|  |  |  |  |  |  |      movea.l 49c9c <DOSBase>,a6
     2b6:	|  |  |  |  |  |  |      jsr -60(a6)
     2ba:	|  |  |  |  |  |  |      movea.l 49c9c <DOSBase>,a6
     2c0:	|  |  |  |  |  |  |      move.l d0,d1
     2c2:	|  |  |  |  |  |  |      move.l #231589,d2
     2c8:	|  |  |  |  |  |  |      moveq #15,d3
     2ca:	|  |  |  |  |  |  |      jsr -48(a6)
	Delay(50);
     2ce:	|  |  |  |  |  |  |      movea.l 49c9c <DOSBase>,a6
     2d4:	|  |  |  |  |  |  |      moveq #50,d1
     2d6:	|  |  |  |  |  |  |      jsr -198(a6)
	warpmode(1);
     2da:	|  |  |  |  |  |  |      pea 1 <_start+0x1>
     2de:	|  |  |  |  |  |  |      lea d50 <warpmode>,a4
     2e4:	|  |  |  |  |  |  |      jsr (a4)
		register volatile const void* _a0 ASM("a0") = module;
     2e6:	|  |  |  |  |  |  |      lea 3a338 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     2ec:	|  |  |  |  |  |  |      suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     2ee:	|  |  |  |  |  |  |      suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     2f0:	|  |  |  |  |  |  |      lea 225a <incbin_player_start>,a3
		__asm volatile (
     2f6:	|  |  |  |  |  |  |      movem.l d1-d7/a4-a6,-(sp)
     2fa:	|  |  |  |  |  |  |      jsr (a3)
     2fc:	|  |  |  |  |  |  |      movem.l (sp)+,d1-d7/a4-a6
	if(p61Init(module) != 0)
     300:	|  |  |  |  |  |  |      addq.l #8,sp
     302:	|  |  |  |  |  |  |      tst.l d0
     304:	|  |  |  |  \--|--|----- beq.w 118 <main+0xb2>
     308:	|  |  |  \-----|--|----- bra.w 212 <main+0x1ac>
		Exit(0);
     30c:	|  |  \--------|--|----> movea.l 49c9c <DOSBase>,a6
     312:	|  |           |  |      moveq #0,d1
     314:	|  |           |  |      jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     318:	|  |           |  |      movea.l 49ca8 <SysBase>,a6
     31e:	|  |           |  |      lea 3887d <incbin_MercuryLetterData2Lz4_end+0x15d>,a1
     324:	|  |           |  |      moveq #0,d0
     326:	|  |           |  |      jsr -552(a6)
     32a:	|  |           |  |      move.l d0,49c9c <DOSBase>
	if (!DOSBase)
     330:	|  \-----------|--|----- bne.w b2 <main+0x4c>
     334:	\--------------|--|----- bra.w 29a <main+0x234>
	APTR vbr = 0;
     338:	               \--|----> moveq #0,d0
	VBR=GetVBR();
     33a:	                  |      move.l d0,49c98 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     340:	                  |      movea.l 49c98 <VBR>,a0
     346:	                  |      move.l 108(a0),d0
	WaitVbl();
     34a:	                  |      jsr (a2)
	Sw_PrepareDisplay();
     34c:	                  |      jsr eac <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;
     352:	                  |      movea.l 49ca4 <custom>,a0
     358:	                  |      move.w #-31745,150(a0)
	custom->intena=0xc010;//Enable vblank
     35e:	                  |      move.w #-16368,154(a0)
     364:	                  |      lea 3e8 <Sw_Run>,a2
     36a:	                  \----- bra.w 20c <main+0x1a6>
     36e:	                         nop

00000370 <Utils_Lz4DepackAsm>:
  register volatile void* _d6 ASM("d6") = bltstart;
	__asm volatile (
		"jsr _smartlinefillasm");
}

void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     370:	subq.l #4,sp
     372:	move.l 16(sp),d0
     376:	move.w d0,d0
     378:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     37c:	moveq #11,d0
     37e:	add.l 8(sp),d0
     382:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     384:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     388:	moveq #0,d0
     38a:	move.w 2(sp),d0
	__asm volatile (
     38e:	movem.l d0-d7/a2-a6,-(sp)
     392:	jsr 13d0 <_lz4_depack>
     398:	movem.l (sp)+,d0-d7/a2-a6
		"movem.l %%d0-%%d7/%%a2-%%a6,-(%%sp)\n"
		"jsr _lz4_depack\n"
		"movem.l (%%sp)+,%%d0-%%d7/%%a2-%%a6"
	: "+rf"(_a0), "+rf"(_a1), "=r"(_d1)
	);
}
     39c:	nop
     39e:	addq.l #4,sp
     3a0:	rts

000003a2 <WaitVbl>:
void WaitVbl() {
     3a2:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     3a4:	/-> move.l dff004 <_end+0xdb5358>,d0
     3aa:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     3ac:	|   move.l (sp),d0
     3ae:	|   andi.l #130816,d0
     3b4:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     3b6:	|   move.l (sp),d0
     3b8:	|   cmpi.l #79616,d0
     3be:	\-- beq.s 3a4 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     3c0:	/-> move.l dff004 <_end+0xdb5358>,d0
     3c6:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     3ca:	|   move.l 4(sp),d0
     3ce:	|   andi.l #130816,d0
     3d4:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     3d8:	|   move.l 4(sp),d0
     3dc:	|   cmpi.l #79616,d0
     3e2:	\-- bne.s 3c0 <WaitVbl+0x1e>
}
     3e4:	    addq.l #8,sp
     3e6:	    rts

000003e8 <Sw_Run>:
                "vero eos et accusam et justo duo dolores"
                "et ea rebum. Stet clita kasd gubergren, "
                "no sea takimata sanctus est Lorem ipsum " 
                "dolor sit amet.                         ";

void Sw_Run() {                                     
     3e8:	          movem.l d2-d4/a2-a4/a6,-(sp)
int Sw_framecountscreen = 0;
int Sw_framecount = 49;
int Sw_textoffset = 0;

void Sw_WritePlainText() {
  if(Sw_framecount == 50) {
     3ec:	          move.l 3a334 <Sw_framecount>,d0
     3f2:	          moveq #50,d1
     3f4:	          cmp.l d0,d1
     3f6:	   /----- beq.w 722 <Sw_Run+0x33a>
    Sw_textoffset += 40;
    if( Sw_textoffset >= 16*40) {
      Sw_textoffset = 0;
    }    
  }  
  Sw_framecount++;
     3fa:	   |      addq.l #1,d0
     3fc:	   |      move.l d0,3a334 <Sw_framecount>
UWORD Sw_CopyLines[] = { 189,	54,	138,	223,	1,	119,	155,	34,	101,	206,	1,	73,	172,	22, 91,	240,	1 };
UWORD Sw_BlitFinished = 0;

void Sw_DrawScreen3() {    
  
  while ( Sw_BlitFrame == 0)
     402:	/--|----> move.w 49c96 <Sw_BlitFrame>,d0
     408:	+--|----- beq.s 402 <Sw_Run+0x1a>
    /* code */
  }
  

  int *bp = 0x200;
  *bp = 0;
     40a:	|  |      clr.l 200 <main+0x19a>

  Sw_BlitFinished = 0;
  Sw_BlitFrame = 0;
     40e:	|  |      move.w #0,49c96 <Sw_BlitFrame>
  
  //Prepare
  WaitBlit();
     416:	|  |      lea 49ca0 <GfxBase>,a2
     41c:	|  |      movea.l (a2),a6
     41e:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     422:	|  |      movea.l 49ca4 <custom>,a0
     428:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     42e:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     434:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     43a:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     440:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     446:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     44c:	|  |      move.w #2544,64(a0)



  //Fontblit  
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     452:	|  |      move.l 3a334 <Sw_framecount>,d1
     458:	|  |      subq.l #1,d1
     45a:	|  |      move.l d1,d0
     45c:	|  |      add.l d1,d0
     45e:	|  |      add.l d0,d0
     460:	|  |      add.l d1,d0
     462:	|  |      lsl.l #4,d0
     464:	|  |      add.l 49c92 <Sw_FontBuffer>,d0
     46a:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     46e:	|  |      move.l 49c8e <Sw_DrawBuffer>,d0
     474:	|  |      addi.l #20400,d0
     47a:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     47e:	|  |      move.w #104,88(a0)

  //Copy
  WaitBlit();
     484:	|  |      movea.l (a2),a6
     486:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     48a:	|  |      movea.l 49ca4 <custom>,a0
     490:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     496:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     49c:	|  |      move.l 49c8a <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     4a4:	|  |      move.l 49c8e <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     4ac:	|  |      lea 38926 <Sw_CopyLines>,a3
     4b2:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     4b8:	|  |      add.l d0,d0
     4ba:	|  |      move.w (0,a3,d0.l),d0
     4be:	|  |      lsl.w #6,d0
     4c0:	|  |      addi.w #40,d0
     4c4:	|  |      move.w d0,88(a0)

  //Generate Right Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMaskLeft

  WaitBlit();
     4c8:	|  |      movea.l (a2),a6
     4ca:	|  |      jsr -228(a6)

  //custom->color[0] = 0x0f00;

  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     4ce:	|  |      movea.l 49ca4 <custom>,a0
     4d4:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     4da:	|  |      move.w #-1,68(a0)

  custom->bltamod = 40; // Skip Left Part of Screen
     4e0:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     4e6:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     4ec:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     4f2:	|  |      add.l d0,d0
     4f4:	|  |      move.w (0,a3,d0.l),d1
     4f8:	|  |      move.w d1,d0
     4fa:	|  |      mulu.w #80,d0
     4fe:	|  |      movea.l d0,a1
     500:	|  |      lea 120(a1),a4
     504:	|  |      move.l 49c8a <Sw_ViewBufferP1>,d0
     50a:	|  |      add.l a4,d0
     50c:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     510:	|  |      lea 40(a1),a1
     514:	|  |      adda.l 49c8e <Sw_DrawBuffer>,a1
     51a:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     51e:	|  |      move.w d1,d0
     520:	|  |      mulu.w #40,d0
     524:	|  |      addi.l #291878,d0
     52a:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     52e:	|  |      move.w #255,d0
     532:	|  |      sub.w d1,d0
     534:	|  |      lsl.w #6,d0
     536:	|  |      addi.w #20,d0
     53a:	|  |      move.w d0,88(a0)

  //Generate Right Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskLeft and merge with unmoved on conflicting pixel
  WaitBlit();
     53e:	|  |      movea.l (a2),a6
     540:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     544:	|  |      movea.l 49ca4 <custom>,a0
     54a:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     550:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     556:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     55c:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     562:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     568:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     56e:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     574:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     57a:	|  |      add.l d0,d0
     57c:	|  |      move.w (0,a3,d0.l),d1
     580:	|  |      move.w d1,d0
     582:	|  |      mulu.w #80,d0
     586:	|  |      movea.l d0,a1
     588:	|  |      lea 120(a1),a4
     58c:	|  |      move.l 49c8a <Sw_ViewBufferP1>,d0
     592:	|  |      add.l a4,d0
     594:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     598:	|  |      move.w d1,d0
     59a:	|  |      mulu.w #40,d0
     59e:	|  |      addi.l #291878,d0
     5a4:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     5a8:	|  |      lea 38(a1),a1
     5ac:	|  |      move.l 49c8e <Sw_DrawBuffer>,d0
     5b2:	|  |      add.l a1,d0
     5b4:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     5b8:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     5bc:	|  |      move.w #255,d0
     5c0:	|  |      sub.w d1,d0
     5c2:	|  |      lsl.w #6,d0
     5c4:	|  |      addi.w #21,d0
     5c8:	|  |      move.w d0,88(a0)

  //Generate Left Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMaskLeft

  WaitBlit();
     5cc:	|  |      movea.l (a2),a6
     5ce:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     5d2:	|  |      movea.l 49ca4 <custom>,a1
     5d8:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     5de:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     5e4:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     5ea:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     5f0:	|  |      move.w #0,66(a1)

  custom->bltamod = 40; // Skip Right Part of Screen
     5f6:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     5fc:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     602:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     608:	|  |      add.l d0,d0
     60a:	|  |      move.w (0,a3,d0.l),d1
     60e:	|  |      moveq #0,d2
     610:	|  |      move.w d1,d2
     612:	|  |      movea.l d2,a0
     614:	|  |      addq.l #1,a0
     616:	|  |      move.l a0,d0
     618:	|  |      add.l a0,d0
     61a:	|  |      add.l d0,d0
     61c:	|  |      add.l a0,d0
     61e:	|  |      lsl.l #4,d0
     620:	|  |      movea.l 49c8a <Sw_ViewBufferP1>,a0
     626:	|  |      adda.l d0,a0
     628:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     62c:	|  |      movea.w #-80,a0
     630:	|  |      adda.l d0,a0
     632:	|  |      move.l 49c8e <Sw_DrawBuffer>,d0
     638:	|  |      add.l a0,d0
     63a:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     63e:	|  |      mulu.w #40,d1
     642:	|  |      addi.l #281636,d1
     648:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     64c:	|  |      moveq #0,d0
     64e:	|  |      not.b d0
     650:	|  |      sub.l d2,d0
     652:	|  |      lsl.w #6,d0
     654:	|  |      addi.w #20,d0
     658:	|  |      move.w d0,88(a1)

  //Generate Left Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskLeft and merge with unmoved on conflicting pixel
  WaitBlit();
     65c:	|  |      movea.l (a2),a6
     65e:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     662:	|  |      movea.l 49ca4 <custom>,a1
     668:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     66e:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     674:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     67a:	|  |      move.w #40,96(a1)

  custom->bltamod = 40; // Skip Right Part of Screen
     680:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     686:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     68c:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     692:	|  |      add.l d0,d0
     694:	|  |      move.w (0,a3,d0.l),d1
     698:	|  |      move.w d1,d2
     69a:	|  |      movea.l d2,a0
     69c:	|  |      addq.l #1,a0
     69e:	|  |      move.l a0,d0
     6a0:	|  |      add.l a0,d0
     6a2:	|  |      add.l d0,d0
     6a4:	|  |      add.l a0,d0
     6a6:	|  |      lsl.l #4,d0
     6a8:	|  |      movea.l 49c8a <Sw_ViewBufferP1>,a0
     6ae:	|  |      adda.l d0,a0
     6b0:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     6b4:	|  |      mulu.w #40,d1
     6b8:	|  |      addi.l #281636,d1
     6be:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     6c2:	|  |      movea.w #-80,a0
     6c6:	|  |      adda.l d0,a0
     6c8:	|  |      move.l 49c8e <Sw_DrawBuffer>,d0
     6ce:	|  |      add.l a0,d0
     6d0:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     6d4:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     6d8:	|  |      moveq #0,d0
     6da:	|  |      not.b d0
     6dc:	|  |      sub.l d2,d0
     6de:	|  |      lsl.w #6,d0
     6e0:	|  |      addi.w #20,d0
     6e4:	|  |      move.w d0,88(a1)

  WaitBlit();
     6e8:	|  |      movea.l (a2),a6
     6ea:	|  |      jsr -228(a6)
  
  Sw_BlitFinished = 1;

  custom->color[0] = 0x00;
     6ee:	|  |      movea.l 49ca4 <custom>,a0
     6f4:	|  |      move.w #0,384(a0)

  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     6fa:	|  |      move.l 49c86 <Sw_framecountscreen>,d0
     700:	|  |      addq.l #1,d0
     702:	|  |      moveq #17,d1
     704:	|  |      cmp.l d0,d1
     706:	|  |  /-- beq.s 714 <Sw_Run+0x32c>
     708:	|  |  |   move.l d0,49c86 <Sw_framecountscreen>
}
     70e:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     712:	|  |  |   rts
     714:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     716:	|  |      move.l d0,49c86 <Sw_framecountscreen>
}
     71c:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     720:	|  |      rts
    Sw_framecount = 0;
     722:	|  \----> clr.l 3a334 <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
     728:	|         move.l 49c92 <Sw_FontBuffer>,d3

void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
{
  for( int i=0;i<lines; i++) {
    for( int i2=0;i2<linelength;i2++) 
      *target++ = pattern;
     72e:	|         pea fa0 <Sw_PrepareDisplay.isra.0+0xf4>
     732:	|         clr.l -(sp)
     734:	|         move.l d3,-(sp)
     736:	|         jsr 10dc <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
     73a:	|         movea.l 49c82 <Sw_textoffset>,a3
     740:	|         adda.l #237746,a3
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
     746:	|         move.b (a3),d0
     748:	|         ext.w d0
     74a:	|         movea.w d0,a2
     74c:	|         lea -32(a2),a2
     750:	|         lea 12(sp),sp
    int x = 0;
     754:	|         moveq #0,d2
     756:	|         lea 388c6 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
     75c:	|         move.w #3204,d4
    WaitBlit();
     760:	|     /-> movea.l 49ca0 <GfxBase>,a6
     766:	|     |   jsr -228(a6)
    custom->bltamod = 0;
     76a:	|     |   move.w #0,dff064 <_end+0xdb53b8>
    custom->bltbmod = 72;
     772:	|     |   move.w #72,dff062 <_end+0xdb53b6>
    custom->bltdmod = 72;
     77a:	|     |   move.w #72,dff066 <_end+0xdb53ba>
    custom->bltafwm = 0xffff;
     782:	|     |   move.w #-1,dff044 <_end+0xdb5398>
    custom->bltalwm = 0xffff;
     78a:	|     |   move.w #-1,dff046 <_end+0xdb539a>
    custom->bltcon1 = 0;  
     792:	|     |   move.w #0,dff042 <_end+0xdb5396>
    custom->bltcon0 = 0xdfc + (restx << 12);
     79a:	|     |   move.w d2,d0
     79c:	|     |   moveq #12,d1
     79e:	|     |   lsl.w d1,d0
     7a0:	|     |   addi.w #3580,d0
     7a4:	|     |   move.w d0,dff040 <_end+0xdb5394>
    custom->bltapt = font+4*50*index;
     7aa:	|     |   move.l a2,d0
     7ac:	|     |   add.l a2,d0
     7ae:	|     |   add.l a2,d0
     7b0:	|     |   lsl.l #3,d0
     7b2:	|     |   add.l a2,d0
     7b4:	|     |   lsl.l #4,d0
     7b6:	|     |   addi.l #243634,d0
     7bc:	|     |   move.l d0,dff050 <_end+0xdb53a4>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
     7c2:	|     |   move.l d2,d0
     7c4:	|     |   asr.l #4,d0
     7c6:	|     |   add.l d0,d0
     7c8:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
     7ca:	|     |   move.l d0,dff04c <_end+0xdb53a0>
    custom->bltdpt = targetlocation;
     7d0:	|     |   move.l d0,dff054 <_end+0xdb53a8>
    custom->bltsize = 4+64*50;
     7d6:	|     |   move.w d4,dff058 <_end+0xdb53ac>
        x += LetterSize[*text++ - 0x20];
     7dc:	|     |   move.b (a3)+,d0
     7de:	|     |   ext.w d0
     7e0:	|     |   move.b (-32,a4,d0.w),d0
     7e4:	|     |   andi.l #255,d0
     7ea:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
     7ec:	|     |   move.b (a3),d0
     7ee:	|     |   ext.w d0
     7f0:	|     |   movea.w d0,a2
     7f2:	|     |   lea -32(a2),a2
     7f6:	|     |   moveq #0,d0
     7f8:	|     |   move.b (0,a4,a2.l),d0
     7fc:	|     |   add.l d2,d0
     7fe:	|     |   cmpi.l #639,d0
     804:	|     \-- ble.w 760 <Sw_Run+0x378>
    Sw_textoffset += 40;
     808:	|         moveq #40,d0
     80a:	|         add.l 49c82 <Sw_textoffset>,d0
     810:	|         move.l d0,49c82 <Sw_textoffset>
    if( Sw_textoffset >= 16*40) {
     816:	|         cmpi.l #639,d0
     81c:	|     /-- ble.s 824 <Sw_Run+0x43c>
      Sw_textoffset = 0;
     81e:	|     |   clr.l 49c82 <Sw_textoffset>
  Sw_framecount++;
     824:	|     \-> move.l 3a334 <Sw_framecount>,d0
     82a:	|         addq.l #1,d0
     82c:	|         move.l d0,3a334 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     832:	\-------- bra.w 402 <Sw_Run+0x1a>

00000836 <Sw_ClBuild>:
}

UWORD Sw_ClColorDimPos = 0;
UWORD Sw_ClColorDimLength = 111;

UWORD * Sw_ClBuild() {
     836:	    movem.l d2-d3/a2/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     83a:	    movea.l 49ca8 <SysBase>,a6
     840:	    move.l #1360,d0
     846:	    moveq #2,d1
     848:	    jsr -198(a6)
     84c:	    movea.l d0,a2
  
  if( retval == 0) {
     84e:	    tst.l d0
     850:	/-- beq.w 9b6 <Sw_ClBuild+0x180>
  /**cl = 0xfffffffe;
  return retval;*/
  ULONG *clpartinstruction;
  clpartinstruction = Sw_ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
     854:	|   move.l 3a072 <Sw_ClsSprites>,(a2)
     85a:	|   move.l 3a076 <Sw_ClsSprites+0x4>,4(a2)
     862:	|   move.l 3a07a <Sw_ClsSprites+0x8>,8(a2)
     86a:	|   move.l 3a07e <Sw_ClsSprites+0xc>,12(a2)
     872:	|   move.l 3a082 <Sw_ClsSprites+0x10>,16(a2)
     87a:	|   move.l 3a086 <Sw_ClsSprites+0x14>,20(a2)
     882:	|   move.l 3a08a <Sw_ClsSprites+0x18>,24(a2)
     88a:	|   move.l 3a08e <Sw_ClsSprites+0x1c>,28(a2)
     892:	|   move.l 3a092 <Sw_ClsSprites+0x20>,32(a2)
     89a:	|   move.l 3a096 <Sw_ClsSprites+0x24>,36(a2)
     8a2:	|   move.l 3a09a <Sw_ClsSprites+0x28>,40(a2)
     8aa:	|   move.l 3a09e <Sw_ClsSprites+0x2c>,44(a2)
     8b2:	|   move.l 3a0a2 <Sw_ClsSprites+0x30>,48(a2)
     8ba:	|   move.l 3a0a6 <Sw_ClsSprites+0x34>,52(a2)
     8c2:	|   move.l 3a0aa <Sw_ClsSprites+0x38>,56(a2)
     8ca:	|   move.l 3a0ae <Sw_ClsSprites+0x3c>,60(a2)

  clpartinstruction = Sw_ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
     8d2:	|   move.l 3a042 <Sw_ClScreen>,64(a2)
     8da:	|   move.l 3a046 <Sw_ClScreen+0x4>,68(a2)
     8e2:	|   move.l 3a04a <Sw_ClScreen+0x8>,72(a2)
     8ea:	|   move.l 3a04e <Sw_ClScreen+0xc>,76(a2)
     8f2:	|   move.l 3a052 <Sw_ClScreen+0x10>,80(a2)
     8fa:	|   move.l 3a056 <Sw_ClScreen+0x14>,84(a2)
     902:	|   move.l 3a05a <Sw_ClScreen+0x18>,88(a2)
     90a:	|   move.l 3a05e <Sw_ClScreen+0x1c>,92(a2)
     912:	|   move.l 3a062 <Sw_ClScreen+0x20>,96(a2)
     91a:	|   move.l 3a066 <Sw_ClScreen+0x24>,100(a2)
     922:	|   move.l 3a06a <Sw_ClScreen+0x28>,104(a2)
     92a:	|   move.l 3a06e <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
     932:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
     93a:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
     942:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
     94a:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
     952:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
     95a:	|   move.l #15335424,132(a2)
  clpartinstruction = Sw_ClColor;
  for(int i=0; i<4;i++)
  {
    *cl++ = *clpartinstruction++;
     962:	|   move.l 3a002 <Sw_ClColor>,136(a2)
     96a:	|   move.l 3a006 <Sw_ClColor+0x4>,140(a2)
     972:	|   move.l 3a00a <Sw_ClColor+0x8>,144(a2)
     97a:	|   move.l 3a00e <Sw_ClColor+0xc>,148(a2)

  clpartinstruction = Sw_ClColorDim;

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
     982:	|   pea 1bc <main+0x156>
     986:	|   pea 3bc2 <incbin_Sw_ClColorDim_start>
     98c:	|   pea 152(a2)
     990:	|   jsr 10fe <memcpy>(pc)
  }
  //*cl++ = 0xffdffffe;
  *cl++ = 0x20bffffe;
     994:	|   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
     99c:	|   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
     9a4:	|   moveq #-2,d0
     9a6:	|   move.l d0,604(a2)
  return (UWORD *) retval;  
     9aa:	|   lea 12(sp),sp
}
     9ae:	|   move.l a2,d0
     9b0:	|   movem.l (sp)+,d2-d3/a2/a6
     9b4:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     9b6:	\-> movea.l 49c9c <DOSBase>,a6
     9bc:	    jsr -60(a6)
     9c0:	    movea.l 49c9c <DOSBase>,a6
     9c6:	    move.l d0,d1
     9c8:	    move.l #231201,d2
     9ce:	    moveq #40,d3
     9d0:	    jsr -48(a6)
    Exit(1);
     9d4:	    movea.l 49c9c <DOSBase>,a6
     9da:	    moveq #1,d1
     9dc:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
     9e0:	    move.l 3a072 <Sw_ClsSprites>,(a2)
     9e6:	    move.l 3a076 <Sw_ClsSprites+0x4>,4(a2)
     9ee:	    move.l 3a07a <Sw_ClsSprites+0x8>,8(a2)
     9f6:	    move.l 3a07e <Sw_ClsSprites+0xc>,12(a2)
     9fe:	    move.l 3a082 <Sw_ClsSprites+0x10>,16(a2)
     a06:	    move.l 3a086 <Sw_ClsSprites+0x14>,20(a2)
     a0e:	    move.l 3a08a <Sw_ClsSprites+0x18>,24(a2)
     a16:	    move.l 3a08e <Sw_ClsSprites+0x1c>,28(a2)
     a1e:	    move.l 3a092 <Sw_ClsSprites+0x20>,32(a2)
     a26:	    move.l 3a096 <Sw_ClsSprites+0x24>,36(a2)
     a2e:	    move.l 3a09a <Sw_ClsSprites+0x28>,40(a2)
     a36:	    move.l 3a09e <Sw_ClsSprites+0x2c>,44(a2)
     a3e:	    move.l 3a0a2 <Sw_ClsSprites+0x30>,48(a2)
     a46:	    move.l 3a0a6 <Sw_ClsSprites+0x34>,52(a2)
     a4e:	    move.l 3a0aa <Sw_ClsSprites+0x38>,56(a2)
     a56:	    move.l 3a0ae <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
     a5e:	    move.l 3a042 <Sw_ClScreen>,64(a2)
     a66:	    move.l 3a046 <Sw_ClScreen+0x4>,68(a2)
     a6e:	    move.l 3a04a <Sw_ClScreen+0x8>,72(a2)
     a76:	    move.l 3a04e <Sw_ClScreen+0xc>,76(a2)
     a7e:	    move.l 3a052 <Sw_ClScreen+0x10>,80(a2)
     a86:	    move.l 3a056 <Sw_ClScreen+0x14>,84(a2)
     a8e:	    move.l 3a05a <Sw_ClScreen+0x18>,88(a2)
     a96:	    move.l 3a05e <Sw_ClScreen+0x1c>,92(a2)
     a9e:	    move.l 3a062 <Sw_ClScreen+0x20>,96(a2)
     aa6:	    move.l 3a066 <Sw_ClScreen+0x24>,100(a2)
     aae:	    move.l 3a06a <Sw_ClScreen+0x28>,104(a2)
     ab6:	    move.l 3a06e <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
     abe:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
     ac6:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
     ace:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
     ad6:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
     ade:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
     ae6:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
     aee:	    move.l 3a002 <Sw_ClColor>,136(a2)
     af6:	    move.l 3a006 <Sw_ClColor+0x4>,140(a2)
     afe:	    move.l 3a00a <Sw_ClColor+0x8>,144(a2)
     b06:	    move.l 3a00e <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
     b0e:	    pea 1bc <main+0x156>
     b12:	    pea 3bc2 <incbin_Sw_ClColorDim_start>
     b18:	    pea 152(a2)
     b1c:	    jsr 10fe <memcpy>(pc)
  *cl++ = 0x20bffffe;
     b20:	    move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
     b28:	    move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
     b30:	    moveq #-2,d0
     b32:	    move.l d0,604(a2)
  return (UWORD *) retval;  
     b36:	    lea 12(sp),sp
}
     b3a:	    move.l a2,d0
     b3c:	    movem.l (sp)+,d2-d3/a2/a6
     b40:	    rts

00000b42 <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
     b42:	moveq #0,d0
     b44:	move.w 49c80 <Sw_ScreenBufferOffset>,d0
     b4a:	lea 49c44 <Sw_ScreenBufferList>,a0
     b50:	move.l d0,d1
     b52:	add.l d0,d1
     b54:	add.l d1,d1
     b56:	move.l (0,a0,d1.l),49c8e <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
     b5e:	addq.l #1,d0
     b60:	add.l d0,d0
     b62:	add.l d0,d0
     b64:	move.l (0,a0,d0.l),d0
     b68:	move.l d0,49c8a <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
     b6e:	moveq #80,d1
     b70:	add.l d0,d1
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
     b72:	movea.l 49c40 <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
     b78:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
     b7c:	clr.w d0
     b7e:	swap d0
     b80:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
     b84:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
     b88:	clr.w d1
     b8a:	swap d1
     b8c:	move.w d1,122(a0)
  /*highword = (ULONG)Sw_ViewBufferP3 >> 16;
  lowword = (ULONG)Sw_ViewBufferP3 & 0xffff;
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;*/

}
     b90:	rts

00000b92 <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
     b92:	          movea.l 49c40 <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
     b98:	          move.w 3a000 <FrameCountBufferDraw>,d0
     b9e:	          lea 3a002 <Sw_ClColor>,a1
     ba4:	          andi.l #65535,d0
     baa:	          lsl.l #4,d0
     bac:	          move.l (0,a1,d0.l),136(a0)
     bb2:	          move.w 3a000 <FrameCountBufferDraw>,d0
     bb8:	          andi.l #65535,d0
     bbe:	          add.l d0,d0
     bc0:	          add.l d0,d0
     bc2:	          addq.l #1,d0
     bc4:	          add.l d0,d0
     bc6:	          add.l d0,d0
     bc8:	          move.l (0,a1,d0.l),140(a0)
     bce:	          move.w 3a000 <FrameCountBufferDraw>,d0
     bd4:	          andi.l #65535,d0
     bda:	          add.l d0,d0
     bdc:	          add.l d0,d0
     bde:	          addq.l #2,d0
     be0:	          add.l d0,d0
     be2:	          add.l d0,d0
     be4:	          move.l (0,a1,d0.l),144(a0)
     bea:	          move.w 3a000 <FrameCountBufferDraw>,d0
     bf0:	          andi.l #65535,d0
     bf6:	          add.l d0,d0
     bf8:	          add.l d0,d0
     bfa:	          addq.l #3,d0
     bfc:	          add.l d0,d0
     bfe:	          add.l d0,d0
     c00:	          move.l (0,a1,d0.l),148(a0)
  for(int i=0;i<4;i++) {
     c06:	          lea 152(a0),a0
  }
  if( ColPos == 12) {
     c0a:	          cmpi.w #12,49c3e <ColPos>
     c12:	   /----- beq.s c48 <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
     c14:	/--|----> move.w 49c3c <Sw_ClColorDimPos>,d0
     c1a:	|  |      moveq #0,d1
     c1c:	|  |      move.w d0,d1
     c1e:	|  |      addi.l #15298,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
     c24:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
     c28:	|  |      cmpi.w #22643,d0
     c2c:	|  |  /-- bls.s c30 <Sw_SetColors+0x9e>
     c2e:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
     c30:	|  |  \-> move.w d0,49c3c <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
     c36:	|  |      pea 1bc <main+0x156>
     c3a:	|  |      move.l d1,-(sp)
     c3c:	|  |      move.l a0,-(sp)
     c3e:	|  |      jsr 111c <memmove>(pc)

  }
}
     c42:	|  |      lea 12(sp),sp
     c46:	|  |      rts
    ColPos = 0;
     c48:	|  \----> clr.w 49c3e <ColPos>
     c4e:	\-------- bra.s c14 <Sw_SetColors+0x82>

00000c50 <Sw_SwapCl>:

void Sw_SwapCl() {

  ULONG tmp = (ULONG) Sw_DrawCopper;
     c50:	move.l 49c40 <Sw_DrawCopper>,d0
  Sw_DrawCopper = Sw_ViewCopper;
     c56:	move.l 49c38 <Sw_ViewCopper>,49c40 <Sw_DrawCopper>
  Sw_ViewCopper = (UWORD *)tmp;
     c60:	move.l d0,49c38 <Sw_ViewCopper>
  custom->cop1lc = (ULONG) Sw_ViewCopper;
     c66:	movea.l 49ca4 <custom>,a0
     c6c:	move.l d0,128(a0)
  //custom->copjmp1 = tmp;
}
     c70:	rts

00000c72 <Sw_VblankHandler>:
  custom->intreq = 0x0010;
     c72:	    movea.l 49ca4 <custom>,a0
     c78:	    move.w #16,156(a0)
  if( FrameCountBufferDraw == 2) {
     c7e:	    move.w 3a000 <FrameCountBufferDraw>,d0
     c84:	    cmpi.w #2,d0
     c88:	/-- beq.s ca2 <Sw_VblankHandler+0x30>
    FrameCountBufferDraw++;
     c8a:	|   move.w 3a000 <FrameCountBufferDraw>,d0
     c90:	|   addq.w #1,d0
     c92:	|   move.w d0,3a000 <FrameCountBufferDraw>
  Sw_SetBplPointers();
     c98:	|   jsr b42 <Sw_SetBplPointers>(pc)
  Sw_SetColors();
     c9c:	|   jsr b92 <Sw_SetColors>(pc)
  Sw_SwapCl();
     ca0:	|   bra.s c50 <Sw_SwapCl>
    FrameCountBufferDraw = 0;
     ca2:	\-> move.w #0,3a000 <FrameCountBufferDraw>
    Sw_BlitFrame = 1;
     caa:	    move.w #1,49c96 <Sw_BlitFrame>
    if(Sw_ScreenBufferOffset == 0) { 
     cb2:	    tst.w 49c80 <Sw_ScreenBufferOffset>
     cb8:	/-- bne.s ccc <Sw_VblankHandler+0x5a>
      Sw_ScreenBufferOffset = 2; 
     cba:	|   move.w #2,49c80 <Sw_ScreenBufferOffset>
  Sw_SetBplPointers();
     cc2:	|   jsr b42 <Sw_SetBplPointers>(pc)
  Sw_SetColors();
     cc6:	|   jsr b92 <Sw_SetColors>(pc)
  Sw_SwapCl();
     cca:	|   bra.s c50 <Sw_SwapCl>
      Sw_ScreenBufferOffset = 0; 
     ccc:	\-> clr.w 49c80 <Sw_ScreenBufferOffset>
  Sw_SetBplPointers();
     cd2:	    jsr b42 <Sw_SetBplPointers>(pc)
  Sw_SetColors();
     cd6:	    jsr b92 <Sw_SetColors>(pc)
  Sw_SwapCl();
     cda:	    bra.w c50 <Sw_SwapCl>

00000cde <KPrintF>:
void KPrintF(const char* fmt, ...) {
     cde:	    lea -128(sp),sp
     ce2:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     ce6:	    move.w f0ff60 <_end+0xec62b4>,d0
     cec:	    cmpi.w #20153,d0
     cf0:	/-- beq.s d1c <KPrintF+0x3e>
     cf2:	|   cmpi.w #-24562,d0
     cf6:	+-- beq.s d1c <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
     cf8:	|   movea.l 49ca8 <SysBase>,a6
     cfe:	|   movea.l 144(sp),a0
     d02:	|   lea 148(sp),a1
     d06:	|   lea 1262 <KPutCharX>,a2
     d0c:	|   suba.l a3,a3
     d0e:	|   jsr -522(a6)
}
     d12:	|   movem.l (sp)+,a2-a3/a6
     d16:	|   lea 128(sp),sp
     d1a:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
     d1c:	\-> movea.l 49ca8 <SysBase>,a6
     d22:	    movea.l 144(sp),a0
     d26:	    lea 148(sp),a1
     d2a:	    lea 1270 <PutChar>,a2
     d30:	    lea 12(sp),a3
     d34:	    jsr -522(a6)
		UaeDbgLog(86, temp);
     d38:	    move.l a3,-(sp)
     d3a:	    pea 56 <_start+0x56>
     d3e:	    jsr f0ff60 <_end+0xec62b4>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     d44:	    addq.l #8,sp
}
     d46:	    movem.l (sp)+,a2-a3/a6
     d4a:	    lea 128(sp),sp
     d4e:	    rts

00000d50 <warpmode>:
	count = __fini_array_end - __fini_array_start;
	for (i = count; i > 0; i--)
		__fini_array_start[i - 1]();
}

void warpmode(int on) { // bool
     d50:	       subq.l #4,sp
     d52:	       move.l a2,-(sp)
     d54:	       move.l d2,-(sp)
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
	if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
     d56:	       move.w f0ff60 <_end+0xec62b4>,d0
     d5c:	       cmpi.w #20153,d0
     d60:	   /-- beq.s d70 <warpmode+0x20>
     d62:	   |   cmpi.w #-24562,d0
     d66:	   +-- beq.s d70 <warpmode+0x20>
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
	}
}
     d68:	   |   move.l (sp)+,d2
     d6a:	   |   movea.l (sp)+,a2
     d6c:	   |   addq.l #4,sp
     d6e:	   |   rts
		UaeConf(82, -1, on ? "cpu_speed max" : "cpu_speed real", 0, &outbuf, 1);
     d70:	   \-> tst.l 16(sp)
     d74:	/----- beq.w e14 <warpmode+0xc4>
     d78:	|      pea 1 <_start+0x1>
     d7c:	|      moveq #15,d2
     d7e:	|      add.l sp,d2
     d80:	|      move.l d2,-(sp)
     d82:	|      clr.l -(sp)
     d84:	|      pea 387b5 <incbin_MercuryLetterData2Lz4_end+0x95>
     d8a:	|      pea ffffffff <_end+0xfffb6353>
     d8e:	|      pea 52 <_start+0x52>
     d92:	|      movea.l #15794016,a2
     d98:	|      jsr (a2)
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
     d9a:	|      pea 1 <_start+0x1>
     d9e:	|      move.l d2,-(sp)
     da0:	|      clr.l -(sp)
     da2:	|      pea 387c3 <incbin_MercuryLetterData2Lz4_end+0xa3>
     da8:	|      pea ffffffff <_end+0xfffb6353>
     dac:	|      pea 52 <_start+0x52>
     db0:	|      jsr (a2)
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
     db2:	|      lea 48(sp),sp
     db6:	|      pea 1 <_start+0x1>
     dba:	|      move.l d2,-(sp)
     dbc:	|      clr.l -(sp)
     dbe:	|      pea 387d9 <incbin_MercuryLetterData2Lz4_end+0xb9>
     dc4:	|      pea ffffffff <_end+0xfffb6353>
     dc8:	|      pea 52 <_start+0x52>
     dcc:	|      jsr (a2)
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     dce:	|      pea 1 <_start+0x1>
     dd2:	|      move.l d2,-(sp)
     dd4:	|      clr.l -(sp)
     dd6:	|      pea 387f6 <incbin_MercuryLetterData2Lz4_end+0xd6>
     ddc:	|      pea ffffffff <_end+0xfffb6353>
     de0:	|      pea 52 <_start+0x52>
     de4:	|      jsr (a2)
     de6:	|      lea 48(sp),sp
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     dea:	|      move.l #231239,d0
     df0:	|      pea 1 <_start+0x1>
     df4:	|      move.l d2,-(sp)
     df6:	|      clr.l -(sp)
     df8:	|      move.l d0,-(sp)
     dfa:	|      pea ffffffff <_end+0xfffb6353>
     dfe:	|      pea 52 <_start+0x52>
     e02:	|      jsr f0ff60 <_end+0xec62b4>
}
     e08:	|      lea 24(sp),sp
     e0c:	|  /-> move.l (sp)+,d2
     e0e:	|  |   movea.l (sp)+,a2
     e10:	|  |   addq.l #4,sp
     e12:	|  |   rts
		UaeConf(82, -1, on ? "cpu_speed max" : "cpu_speed real", 0, &outbuf, 1);
     e14:	\--|-> pea 1 <_start+0x1>
     e18:	   |   moveq #15,d2
     e1a:	   |   add.l sp,d2
     e1c:	   |   move.l d2,-(sp)
     e1e:	   |   clr.l -(sp)
     e20:	   |   pea 3875c <incbin_MercuryLetterData2Lz4_end+0x3c>
     e26:	   |   pea ffffffff <_end+0xfffb6353>
     e2a:	   |   pea 52 <_start+0x52>
     e2e:	   |   movea.l #15794016,a2
     e34:	   |   jsr (a2)
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
     e36:	   |   pea 1 <_start+0x1>
     e3a:	   |   move.l d2,-(sp)
     e3c:	   |   clr.l -(sp)
     e3e:	   |   pea 3876b <incbin_MercuryLetterData2Lz4_end+0x4b>
     e44:	   |   pea ffffffff <_end+0xfffb6353>
     e48:	   |   pea 52 <_start+0x52>
     e4c:	   |   jsr (a2)
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
     e4e:	   |   lea 48(sp),sp
     e52:	   |   pea 1 <_start+0x1>
     e56:	   |   move.l d2,-(sp)
     e58:	   |   clr.l -(sp)
     e5a:	   |   pea 38780 <incbin_MercuryLetterData2Lz4_end+0x60>
     e60:	   |   pea ffffffff <_end+0xfffb6353>
     e64:	   |   pea 52 <_start+0x52>
     e68:	   |   jsr (a2)
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     e6a:	   |   pea 1 <_start+0x1>
     e6e:	   |   move.l d2,-(sp)
     e70:	   |   clr.l -(sp)
     e72:	   |   pea 3879c <incbin_MercuryLetterData2Lz4_end+0x7c>
     e78:	   |   pea ffffffff <_end+0xfffb6353>
     e7c:	   |   pea 52 <_start+0x52>
     e80:	   |   jsr (a2)
     e82:	   |   lea 48(sp),sp
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     e86:	   |   move.l #231249,d0
     e8c:	   |   pea 1 <_start+0x1>
     e90:	   |   move.l d2,-(sp)
     e92:	   |   clr.l -(sp)
     e94:	   |   move.l d0,-(sp)
     e96:	   |   pea ffffffff <_end+0xfffb6353>
     e9a:	   |   pea 52 <_start+0x52>
     e9e:	   |   jsr f0ff60 <_end+0xec62b4>
}
     ea4:	   |   lea 24(sp),sp
     ea8:	   \-- bra.w e0c <warpmode+0xbc>

00000eac <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
     eac:	                   movem.l d2-d3/a2/a6,-(sp)
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
     eb0:	                   movea.l 49ca8 <SysBase>,a6
     eb6:	                   move.l #4000,d0
     ebc:	                   moveq #2,d1
     ebe:	                   jsr -198(a6)
     ec2:	                   move.l d0,49c92 <Sw_FontBuffer>
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
     ec8:	                   movea.l 49ca8 <SysBase>,a6
     ece:	                   move.l #20560,d0
     ed4:	                   moveq #2,d1
     ed6:	                   jsr -198(a6)
     eda:	                   move.l d0,49c34 <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
     ee0:	      /----------- beq.w 1062 <Sw_PrepareDisplay.isra.0+0x1b6>
      *target++ = pattern;
     ee4:	      |            move.l #20560,d2
     eea:	      |            move.l d2,-(sp)
     eec:	      |            clr.l -(sp)
     eee:	      |            move.l d0,-(sp)
     ef0:	      |            lea 10dc <memset>(pc),a2
     ef4:	      |            jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
     ef6:	      |            movea.l 49ca8 <SysBase>,a6
     efc:	      |            move.l d2,d0
     efe:	      |            moveq #2,d1
     f00:	      |            jsr -198(a6)
     f04:	      |            move.l d0,49c30 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
     f0a:	      |            lea 12(sp),sp
     f0e:	/-----|----------- beq.w 1002 <Sw_PrepareDisplay.isra.0+0x156>
     f12:	|  /--|----------> move.l #20560,d2
     f18:	|  |  |            move.l d2,-(sp)
     f1a:	|  |  |            clr.l -(sp)
     f1c:	|  |  |            move.l d0,-(sp)
     f1e:	|  |  |            jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
     f20:	|  |  |            movea.l 49ca8 <SysBase>,a6
     f26:	|  |  |            move.l d2,d0
     f28:	|  |  |            moveq #2,d1
     f2a:	|  |  |            jsr -198(a6)
     f2e:	|  |  |            move.l d0,d2
     f30:	|  |  |            move.l d0,49c2c <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
     f36:	|  |  |            lea 12(sp),sp
     f3a:	|  |  |  /-------- beq.w fce <Sw_PrepareDisplay.isra.0+0x122>
     f3e:	|  |  |  |  /----> pea 5050 <incbin_Sw_ClColorDim_start+0x148e>
     f42:	|  |  |  |  |      clr.l -(sp)
     f44:	|  |  |  |  |      move.l d2,-(sp)
     f46:	|  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
     f48:	|  |  |  |  |      lea 836 <Sw_ClBuild>(pc),a2
     f4c:	|  |  |  |  |      jsr (a2)
     f4e:	|  |  |  |  |      move.l d0,d3
  Sw_DrawCopper = Sw_ClBuild( );
     f50:	|  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ViewCopper;
     f52:	|  |  |  |  |      move.l d3,49c40 <Sw_DrawCopper>
  Sw_ViewCopper = (UWORD *)tmp;
     f58:	|  |  |  |  |      move.l d0,49c38 <Sw_ViewCopper>
  custom->cop1lc = (ULONG) Sw_ViewCopper;
     f5e:	|  |  |  |  |      movea.l 49ca4 <custom>,a0
     f64:	|  |  |  |  |      move.l d0,128(a0)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
     f68:	|  |  |  |  |      move.l d2,49c44 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
     f6e:	|  |  |  |  |      move.l 49c30 <Sw_ScreenBuffer2>,d0
     f74:	|  |  |  |  |      move.l d0,49c48 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
     f7a:	|  |  |  |  |      move.l d0,49c4c <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;  
     f80:	|  |  |  |  |      move.l d2,49c50 <Sw_ScreenBufferList+0xc>
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
     f86:	|  |  |  |  |      movea.l 49ca8 <SysBase>,a6
     f8c:	|  |  |  |  |      moveq #22,d0
     f8e:	|  |  |  |  |      move.l #65537,d1
     f94:	|  |  |  |  |      jsr -198(a6)
     f98:	|  |  |  |  |      movea.l d0,a1
     f9a:	|  |  |  |  |      lea 12(sp),sp
     f9e:	|  |  |  |  |      tst.l d0
     fa0:	|  |  |  |  |  /-- beq.s fbc <Sw_PrepareDisplay.isra.0+0x110>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     fa2:	|  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
     fa8:	|  |  |  |  |  |   move.l #231518,10(a1)
    Sw_Vbint->is_Data = NULL;
     fb0:	|  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
     fb4:	|  |  |  |  |  |   move.l #3186,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
     fbc:	|  |  |  |  |  \-> movea.l 49ca8 <SysBase>,a6
     fc2:	|  |  |  |  |      moveq #4,d0
     fc4:	|  |  |  |  |      jsr -168(a6)
}
     fc8:	|  |  |  |  |      movem.l (sp)+,d2-d3/a2/a6
     fcc:	|  |  |  |  |      rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     fce:	|  |  |  >--|----> movea.l 49c9c <DOSBase>,a6
     fd4:	|  |  |  |  |      jsr -60(a6)
     fd8:	|  |  |  |  |      movea.l 49c9c <DOSBase>,a6
     fde:	|  |  |  |  |      move.l d0,d1
     fe0:	|  |  |  |  |      move.l #231479,d2
     fe6:	|  |  |  |  |      moveq #38,d3
     fe8:	|  |  |  |  |      jsr -48(a6)
    Exit(1);
     fec:	|  |  |  |  |      movea.l 49c9c <DOSBase>,a6
     ff2:	|  |  |  |  |      moveq #1,d1
     ff4:	|  |  |  |  |      jsr -144(a6)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 257, 20,0);  
     ff8:	|  |  |  |  |      move.l 49c2c <Sw_ScreenBuffer1>,d2
     ffe:	|  |  |  |  +----- bra.w f3e <Sw_PrepareDisplay.isra.0+0x92>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1002:	>--|--|--|--|----> movea.l 49c9c <DOSBase>,a6
    1008:	|  |  |  |  |      jsr -60(a6)
    100c:	|  |  |  |  |      movea.l 49c9c <DOSBase>,a6
    1012:	|  |  |  |  |      move.l d0,d1
    1014:	|  |  |  |  |      move.l #231479,d2
    101a:	|  |  |  |  |      moveq #38,d3
    101c:	|  |  |  |  |      jsr -48(a6)
    Exit(1);
    1020:	|  |  |  |  |      movea.l 49c9c <DOSBase>,a6
    1026:	|  |  |  |  |      moveq #1,d1
    1028:	|  |  |  |  |      jsr -144(a6)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 257, 20,0);  
    102c:	|  |  |  |  |      move.l 49c30 <Sw_ScreenBuffer2>,d0
    1032:	|  |  |  |  |      move.l #20560,d2
    1038:	|  |  |  |  |      move.l d2,-(sp)
    103a:	|  |  |  |  |      clr.l -(sp)
    103c:	|  |  |  |  |      move.l d0,-(sp)
    103e:	|  |  |  |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    1040:	|  |  |  |  |      movea.l 49ca8 <SysBase>,a6
    1046:	|  |  |  |  |      move.l d2,d0
    1048:	|  |  |  |  |      moveq #2,d1
    104a:	|  |  |  |  |      jsr -198(a6)
    104e:	|  |  |  |  |      move.l d0,d2
    1050:	|  |  |  |  |      move.l d0,49c2c <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    1056:	|  |  |  |  |      lea 12(sp),sp
    105a:	|  |  |  |  \----- bne.w f3e <Sw_PrepareDisplay.isra.0+0x92>
    105e:	|  |  |  \-------- bra.w fce <Sw_PrepareDisplay.isra.0+0x122>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1062:	|  |  \----------> movea.l 49c9c <DOSBase>,a6
    1068:	|  |               jsr -60(a6)
    106c:	|  |               movea.l 49c9c <DOSBase>,a6
    1072:	|  |               move.l d0,d1
    1074:	|  |               move.l #231440,d2
    107a:	|  |               moveq #38,d3
    107c:	|  |               jsr -48(a6)
    Exit(1);
    1080:	|  |               movea.l 49c9c <DOSBase>,a6
    1086:	|  |               moveq #1,d1
    1088:	|  |               jsr -144(a6)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 257, 20,0);   
    108c:	|  |               move.l 49c34 <Sw_ScreenBuffer3>,d0
    1092:	|  |               move.l #20560,d2
    1098:	|  |               move.l d2,-(sp)
    109a:	|  |               clr.l -(sp)
    109c:	|  |               move.l d0,-(sp)
    109e:	|  |               lea 10dc <memset>(pc),a2
    10a2:	|  |               jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    10a4:	|  |               movea.l 49ca8 <SysBase>,a6
    10aa:	|  |               move.l d2,d0
    10ac:	|  |               moveq #2,d1
    10ae:	|  |               jsr -198(a6)
    10b2:	|  |               move.l d0,49c30 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    10b8:	|  |               lea 12(sp),sp
    10bc:	|  \-------------- bne.w f12 <Sw_PrepareDisplay.isra.0+0x66>
    10c0:	\----------------- bra.w 1002 <Sw_PrepareDisplay.isra.0+0x156>

000010c4 <strlen>:
	while(*s++)
    10c4:	   /-> movea.l 4(sp),a0
    10c8:	   |   tst.b (a0)+
    10ca:	/--|-- beq.s 10d8 <strlen+0x14>
    10cc:	|  |   move.l a0,-(sp)
    10ce:	|  \-- jsr 10c4 <strlen>(pc)
    10d2:	|      addq.l #4,sp
    10d4:	|      addq.l #1,d0
}
    10d6:	|      rts
	unsigned long t=0;
    10d8:	\----> moveq #0,d0
}
    10da:	       rts

000010dc <memset>:
void* memset(void *dest, int val, unsigned long len) {
    10dc:	       move.l d2,-(sp)
    10de:	       move.l 8(sp),d0
	while(len-- > 0)
    10e2:	       tst.l 16(sp)
    10e6:	/----- beq.s 10fa <memset+0x1e>
		*ptr++ = val;
    10e8:	|      move.b 15(sp),d2
    10ec:	|      move.l 16(sp),d1
    10f0:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    10f2:	|      movea.l d0,a0
		*ptr++ = val;
    10f4:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    10f6:	|  |   cmpa.l d1,a0
    10f8:	|  \-- bne.s 10f4 <memset+0x18>
}
    10fa:	\----> move.l (sp)+,d2
    10fc:	       rts

000010fe <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    10fe:	       move.l 4(sp),d0
    1102:	       movea.l 8(sp),a0
	while(len--)
    1106:	       tst.l 12(sp)
    110a:	/----- beq.s 111a <memcpy+0x1c>
    110c:	|      movea.l d0,a1
    110e:	|      move.l 12(sp),d1
    1112:	|      add.l a0,d1
		*d++ = *s++;
    1114:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    1116:	|  |   cmp.l a0,d1
    1118:	|  \-- bne.s 1114 <memcpy+0x16>
}
    111a:	\----> rts

0000111c <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    111c:	          move.l d2,-(sp)
    111e:	          move.l 8(sp),d0
    1122:	          movea.l 12(sp),a0
    1126:	          move.l 16(sp),d2
	if (d < s) {
    112a:	          cmpa.l d0,a0
    112c:	   /----- bls.s 1142 <memmove+0x26>
		while (len--)
    112e:	   |      tst.l d2
    1130:	/--|----- beq.s 113e <memmove+0x22>
    1132:	|  |      movea.l d0,a1
    1134:	|  |      move.l a0,d1
    1136:	|  |      add.l d2,d1
			*d++ = *s++;
    1138:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    113a:	|  |  |   cmp.l a0,d1
    113c:	|  |  \-- bne.s 1138 <memmove+0x1c>
}
    113e:	>--|----> move.l (sp)+,d2
    1140:	|  |      rts
		while (len--)
    1142:	|  \----> movea.l d2,a1
    1144:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    1146:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    1148:	|         adda.l d0,a1
		while (len--)
    114a:	|         tst.l d2
    114c:	+-------- beq.s 113e <memmove+0x22>
    114e:	|         move.l a0,d1
    1150:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    1152:	|     /-> move.b (a0),(a1)
		while (len--)
    1154:	|     |   subq.l #1,a0
    1156:	|     |   subq.l #1,a1
    1158:	|     |   cmpa.l d1,a0
    115a:	+-----|-- beq.s 113e <memmove+0x22>
			*lastd-- = *lasts--;
    115c:	|     |   move.b (a0),(a1)
		while (len--)
    115e:	|     |   subq.l #1,a0
    1160:	|     |   subq.l #1,a1
    1162:	|     |   cmpa.l d1,a0
    1164:	|     \-- bne.s 1152 <memmove+0x36>
    1166:	\-------- bra.s 113e <memmove+0x22>

00001168 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    1168:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    116c:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1170:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1174:	mulu.w 8(sp),d1
	addw	d1, d0
    1178:	add.w d1,d0
	swap	d0
    117a:	swap d0
	clrw	d0
    117c:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    117e:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1182:	mulu.w 10(sp),d1
	addl	d1, d0
    1186:	add.l d1,d0
	rts
    1188:	rts

0000118a <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    118a:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    118c:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1190:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    1194:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    119a:	   /-- bcc.s 11b2 <__udivsi3+0x28>
	movel	d0, d2
    119c:	   |   move.l d0,d2
	clrw	d2
    119e:	   |   clr.w d2
	swap	d2
    11a0:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    11a2:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    11a4:	   |   move.w d2,d0
	swap	d0
    11a6:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    11a8:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    11ac:	   |   divu.w d1,d2
	movew	d2, d0
    11ae:	   |   move.w d2,d0
	jra	6f
    11b0:	/--|-- bra.s 11e2 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    11b2:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    11b4:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    11b6:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    11b8:	|  |   cmpi.l #65536,d1
	jcc	4b
    11be:	|  \-- bcc.s 11b4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    11c0:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    11c2:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    11c8:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    11ca:	|      mulu.w d0,d1
	swap	d2
    11cc:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    11ce:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    11d0:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    11d2:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    11d4:	|  /-- bne.s 11e0 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    11d6:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    11d8:	|  +-- bcs.s 11e0 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    11da:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    11de:	+--|-- bls.s 11e2 <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    11e0:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    11e2:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    11e4:	       rts

000011e6 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    11e6:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    11e8:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    11ea:	    move.l 12(sp),d1
	jpl	1f
    11ee:	/-- bpl.s 11f4 <__divsi3+0xe>
	negl	d1
    11f0:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    11f2:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    11f4:	\-> move.l 8(sp),d0
	jpl	2f
    11f8:	/-- bpl.s 11fe <__divsi3+0x18>
	negl	d0
    11fa:	|   neg.l d0
	negb	d2
    11fc:	|   neg.b d2

2:	movel	d1, sp@-
    11fe:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1200:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    1202:	    bsr.s 118a <__udivsi3>
	addql	#8, sp
    1204:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    1206:	    tst.b d2
	jpl	3f
    1208:	/-- bpl.s 120c <__divsi3+0x26>
	negl	d0
    120a:	|   neg.l d0

3:	movel	sp@+, d2
    120c:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    120e:	    rts

00001210 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1210:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1214:	move.l 4(sp),d0
	movel	d1, sp@-
    1218:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    121a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    121c:	bsr.s 11e6 <__divsi3>
	addql	#8, sp
    121e:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1220:	move.l 8(sp),d1
	movel	d1, sp@-
    1224:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1226:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    1228:	bsr.w 1168 <__mulsi3>
	addql	#8, sp
    122c:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    122e:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1232:	sub.l d0,d1
	movel	d1, d0
    1234:	move.l d1,d0
	rts
    1236:	rts

00001238 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1238:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    123c:	move.l 4(sp),d0
	movel	d1, sp@-
    1240:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1242:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    1244:	bsr.w 118a <__udivsi3>
	addql	#8, sp
    1248:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    124a:	move.l 8(sp),d1
	movel	d1, sp@-
    124e:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1250:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    1252:	bsr.w 1168 <__mulsi3>
	addql	#8, sp
    1256:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1258:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    125c:	sub.l d0,d1
	movel	d1, d0
    125e:	move.l d1,d0
	rts
    1260:	rts

00001262 <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    1262:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    1264:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1268:	jsr -516(a6)
    move.l (sp)+, a6
    126c:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    126e:	rts

00001270 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    1270:	move.b d0,(a3)+
	rts
    1272:	rts

00001274 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    1274:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    1276:	                         adda.l a0,a2
	move.l	a2,a3
    1278:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    127a:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    127c:	                         moveq #56,d4
	moveq	#8,d5
    127e:	                         moveq #8,d5
	bra.s	.Lliteral
    1280:	   /-------------------- bra.s 12ea <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    1282:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    1284:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    1286:	+--|-------------------- dbf d1,1282 <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    128a:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    128c:	|  |     /-------------- bcc.s 1290 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    128e:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    1290:	|  |  |  >-------------> tst.w d0
    1292:	|  |  |  |           /-- bne.s 129c <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    1294:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    1296:	|  |  |  |           |   bls.s 130e <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    1298:	|  |  |  |           |   move.w (a0)+,d0
    129a:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    129c:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    129e:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    12a0:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    12a2:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    12a4:	|  |  |  |               movem.w (1308 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    12aa:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    12ac:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    12ae:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    12b0:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    12b2:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    12b4:	|  |  |  |               tst.w d0
    12b6:	|  |  |  |           /-- bne.s 12bc <_doynaxdepack_asm+0x48>
    12b8:	|  |  |  |           |   move.w (a0)+,d0
    12ba:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    12bc:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    12be:	|  |  |  |  /----------- beq.s 12d6 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    12c0:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    12c2:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    12c4:	|  |  |  |  |  /-------- bpl.s 12d2 <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    12c6:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    12c8:	|  |  |  |  |  |  /----- bpl.s 12d0 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    12ca:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    12cc:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    12ce:	|  |  |  |  |  |  |  \-- bmi.s 12ca <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    12d0:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    12d2:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    12d4:	|  |  |  |  |        /-- bcc.s 12d8 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    12d6:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    12d8:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    12da:	|  |  |  |  \----------- dbf d1,12d6 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    12de:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    12e0:	|  |  |  \-------------- bcc.s 1290 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    12e2:	|  |  |                  tst.w d0
    12e4:	|  +--|----------------- bne.s 12ea <_doynaxdepack_asm+0x76>
    12e6:	|  |  |                  move.w (a0)+,d0
    12e8:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    12ea:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    12ec:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    12ee:	|     \----------------- bcc.s 128e <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    12f0:	|                 /----- bpl.s 12f8 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    12f2:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    12f4:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    12f6:	|                 |  \-- bmi.s 12f2 <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    12f8:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    12fa:	\--------------------/-X dbv.s d1,1282 <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    12fe:	                     |   add.l d0,d0
	eor.w	d1,d0		
    1300:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    1302:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    1304:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    1306:	                     \-- bra.s 12fa <_doynaxdepack_asm+0x86>

00001308 <doy_table>:
    1308:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    1318:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    1328:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    1338:	.............oNq

00001348 <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    1348:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    134c:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    134e:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    1352:	cmpi.w #0,d2
    bgt.s br1
    1356:	bgt.s 1362 <br1>
    |{
    |direction = -64;  
    neg.w d7    
    1358:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    135a:	addq.w #1,d2
    lsl.l   #6,d2
    135c:	lsl.l #6,d2
    sub.w   d2,d1
    135e:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    1360:	neg.w d2

00001362 <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    1362:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    1364:	lsl.w #3,d6
    sub.w d6,d0
    1366:	sub.w d6,d0
    mulu.w #1200,d6
    1368:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    136c:	move.w d2,d0
    subq.w #1,d0
    136e:	subq.w #1,d0
    mulu.w #100,d0
    1370:	mulu.w #100,d0
    subq.w #1,d3
    1374:	subq.w #1,d3
    add.w d3,d0
    1376:	add.w d3,d0
    add.w d0,a0
    1378:	adda.w d0,a0
    move.w (a0),d0
    137a:	move.w (a0),d0
    sub.w  d5,d0
    137c:	sub.w d5,d0
    sub.w  d5,d0
    137e:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    1380:	sub.w d5,d7
    sub.w d5,d7
    1382:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    1384:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    1386:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    1388:	lsl.w #6,d2
    add.w d5,d2
    138a:	add.w d5,d2
    lea   0xdff000,a3
    138c:	lea dff000 <_end+0xdb5354>,a3
    tst.w 0x2(a3)
    1392:	tst.w 2(a3)

00001396 <waitblit>:
waitblit:
    btst #6,2(a3)
    1396:	/-> btst #6,2(a3)
    bne.s waitblit
    139c:	\-- bne.s 1396 <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    139e:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    13a2:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    13a6:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    13aa:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    13ae:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    13b2:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    13b6:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    13ba:	    movem.l (sp)+,d0-a3
    rts
    13be:	    rts

000013c0 <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    13c0:	lea 13c0 <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    13c4:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    13c8:	adda.l a1,a1
    add.l #zmult,a1
    13ca:	adda.l #5056,a1

000013d0 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    13d0:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    13d4:	moveq #0,d1
			moveq	#0,d2
    13d6:	moveq #0,d2
			moveq	#0,d3
    13d8:	moveq #0,d3
			moveq	#16,d7
    13da:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    13dc:	lea 205a <lz4jmp>(pc),a3
		moveq	#0,d0
    13e0:	moveq #0,d0
		move.b	(a0)+,d0
    13e2:	move.b (a0)+,d0
		add.w	d0,d0
    13e4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    13e6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    13ea:	jmp (0,a3,d0.w)

000013ee <lz4Rts0>:
lz4Rts0:	rts
    13ee:	rts

000013f0 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    13f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    13fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1400:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1402:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1404:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1406:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1408:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    140a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    140c:	cmpa.l a0,a4
		beq.s	lz4Rts1
    140e:	beq.s 1432 <lz4Rts1>
		move.b	(a0)+,d0
    1410:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1412:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1414:	move.w (sp)+,d3
		move.b	d0,d3
    1416:	move.b d0,d3
		move.l	a1,a2
    1418:	movea.l a1,a2
		sub.l	d3,a2
    141a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    141c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    141e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1420:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1422:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1424:	moveq #0,d0
		move.b	(a0)+,d0
    1426:	move.b (a0)+,d0
		add.w	d0,d0
    1428:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    142a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    142e:	jmp (0,a3,d0.w)

00001432 <lz4Rts1>:
lz4Rts1:	rts
    1432:	rts

00001434 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    1434:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1436:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1438:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    143a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    143c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    143e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1440:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1442:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1444:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1446:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1448:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    144a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    144c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    144e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1450:	cmpa.l a0,a4
		beq.s	lz4Rts2
    1452:	beq.s 1478 <lz4Rts2>
		move.b	(a0)+,d0
    1454:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1456:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1458:	move.w (sp)+,d3
		move.b	d0,d3
    145a:	move.b d0,d3
		move.l	a1,a2
    145c:	movea.l a1,a2
		sub.l	d3,a2
    145e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1460:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1462:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1464:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1466:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1468:	move.b (a2)+,(a1)+
		moveq	#0,d0
    146a:	moveq #0,d0
		move.b	(a0)+,d0
    146c:	move.b (a0)+,d0
		add.w	d0,d0
    146e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1470:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1474:	jmp (0,a3,d0.w)

00001478 <lz4Rts2>:
lz4Rts2:	rts
    1478:	rts

0000147a <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    147a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    147c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    147e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1480:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1482:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1484:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1486:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1488:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    148a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    148c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    148e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1490:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1492:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1494:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1496:	cmpa.l a0,a4
		beq.s	lz4Rts3
    1498:	beq.s 14c0 <lz4Rts3>
		move.b	(a0)+,d0
    149a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    149c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    149e:	move.w (sp)+,d3
		move.b	d0,d3
    14a0:	move.b d0,d3
		move.l	a1,a2
    14a2:	movea.l a1,a2
		sub.l	d3,a2
    14a4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    14a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14b0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    14b2:	moveq #0,d0
		move.b	(a0)+,d0
    14b4:	move.b (a0)+,d0
		add.w	d0,d0
    14b6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    14b8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    14bc:	jmp (0,a3,d0.w)

000014c0 <lz4Rts3>:
lz4Rts3:	rts
    14c0:	rts

000014c2 <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    14c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    14dc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    14de:	cmpa.l a0,a4
		beq.s	lz4Rts4
    14e0:	beq.s 150a <lz4Rts4>
		move.b	(a0)+,d0
    14e2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    14e4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    14e6:	move.w (sp)+,d3
		move.b	d0,d3
    14e8:	move.b d0,d3
		move.l	a1,a2
    14ea:	movea.l a1,a2
		sub.l	d3,a2
    14ec:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    14ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    14fa:	move.b (a2)+,(a1)+
		moveq	#0,d0
    14fc:	moveq #0,d0
		move.b	(a0)+,d0
    14fe:	move.b (a0)+,d0
		add.w	d0,d0
    1500:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1502:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1506:	jmp (0,a3,d0.w)

0000150a <lz4Rts4>:
lz4Rts4:	rts
    150a:	rts

0000150c <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    150c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    150e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1510:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1512:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1514:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1516:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1518:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    151a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    151c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    151e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1520:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1522:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1524:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1526:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1528:	cmpa.l a0,a4
		beq.s	lz4Rts5
    152a:	beq.s 1556 <lz4Rts5>
		move.b	(a0)+,d0
    152c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    152e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1530:	move.w (sp)+,d3
		move.b	d0,d3
    1532:	move.b d0,d3
		move.l	a1,a2
    1534:	movea.l a1,a2
		sub.l	d3,a2
    1536:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1538:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    153a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    153c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    153e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1540:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1542:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1544:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1546:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1548:	moveq #0,d0
		move.b	(a0)+,d0
    154a:	move.b (a0)+,d0
		add.w	d0,d0
    154c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    154e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1552:	jmp (0,a3,d0.w)

00001556 <lz4Rts5>:
lz4Rts5:	rts
    1556:	rts

00001558 <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    1558:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    155a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    155c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    155e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1560:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1562:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1564:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1566:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1568:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    156a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    156c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    156e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1570:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1572:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1574:	cmpa.l a0,a4
		beq.s	lz4Rts6
    1576:	beq.s 15a4 <lz4Rts6>
		move.b	(a0)+,d0
    1578:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    157a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    157c:	move.w (sp)+,d3
		move.b	d0,d3
    157e:	move.b d0,d3
		move.l	a1,a2
    1580:	movea.l a1,a2
		sub.l	d3,a2
    1582:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1584:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1586:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1588:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    158a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    158c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    158e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1590:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1592:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1594:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1596:	moveq #0,d0
		move.b	(a0)+,d0
    1598:	move.b (a0)+,d0
		add.w	d0,d0
    159a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    159c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    15a0:	jmp (0,a3,d0.w)

000015a4 <lz4Rts6>:
lz4Rts6:	rts
    15a4:	rts

000015a6 <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    15a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15c0:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    15c2:	cmpa.l a0,a4
		beq.s	lz4Rts7
    15c4:	beq.s 15f4 <lz4Rts7>
		move.b	(a0)+,d0
    15c6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    15c8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    15ca:	move.w (sp)+,d3
		move.b	d0,d3
    15cc:	move.b d0,d3
		move.l	a1,a2
    15ce:	movea.l a1,a2
		sub.l	d3,a2
    15d0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    15d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    15e4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    15e6:	moveq #0,d0
		move.b	(a0)+,d0
    15e8:	move.b (a0)+,d0
		add.w	d0,d0
    15ea:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    15ec:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    15f0:	jmp (0,a3,d0.w)

000015f4 <lz4Rts7>:
lz4Rts7:	rts
    15f4:	rts

000015f6 <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    15f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    15fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1600:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1602:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1604:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1606:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1608:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    160a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    160c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    160e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1610:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1612:	cmpa.l a0,a4
		beq.s	lz4Rts8
    1614:	beq.s 1646 <lz4Rts8>
		move.b	(a0)+,d0
    1616:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1618:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    161a:	move.w (sp)+,d3
		move.b	d0,d3
    161c:	move.b d0,d3
		move.l	a1,a2
    161e:	movea.l a1,a2
		sub.l	d3,a2
    1620:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1622:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1624:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1626:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1628:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    162a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    162c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    162e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1630:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1632:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1634:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1636:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1638:	moveq #0,d0
		move.b	(a0)+,d0
    163a:	move.b (a0)+,d0
		add.w	d0,d0
    163c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    163e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1642:	jmp (0,a3,d0.w)

00001646 <lz4Rts8>:
lz4Rts8:	rts
    1646:	rts

00001648 <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    1648:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    164a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    164c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    164e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1650:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1652:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1654:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1656:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1658:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    165a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    165c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    165e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1660:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1662:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1664:	cmpa.l a0,a4
		beq.s	lz4Rts9
    1666:	beq.s 169a <lz4Rts9>
		move.b	(a0)+,d0
    1668:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    166a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    166c:	move.w (sp)+,d3
		move.b	d0,d3
    166e:	move.b d0,d3
		move.l	a1,a2
    1670:	movea.l a1,a2
		sub.l	d3,a2
    1672:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1674:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1676:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1678:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    167a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    167c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    167e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1680:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1682:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1684:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1686:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1688:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    168a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    168c:	moveq #0,d0
		move.b	(a0)+,d0
    168e:	move.b (a0)+,d0
		add.w	d0,d0
    1690:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1692:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1696:	jmp (0,a3,d0.w)

0000169a <lz4Rts9>:
lz4Rts9:	rts
    169a:	rts

0000169c <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    169c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    169e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16b6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    16b8:	cmpa.l a0,a4
		beq.s	lz4Rts10
    16ba:	beq.s 16f0 <lz4Rts10>
		move.b	(a0)+,d0
    16bc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    16be:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    16c0:	move.w (sp)+,d3
		move.b	d0,d3
    16c2:	move.b d0,d3
		move.l	a1,a2
    16c4:	movea.l a1,a2
		sub.l	d3,a2
    16c6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    16c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    16e0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    16e2:	moveq #0,d0
		move.b	(a0)+,d0
    16e4:	move.b (a0)+,d0
		add.w	d0,d0
    16e6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    16e8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    16ec:	jmp (0,a3,d0.w)

000016f0 <lz4Rts10>:
lz4Rts10:	rts
    16f0:	rts

000016f2 <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    16f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    16fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1700:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1702:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1704:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1706:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1708:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    170a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    170c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    170e:	cmpa.l a0,a4
		beq.s	lz4Rts11
    1710:	beq.s 1748 <lz4Rts11>
		move.b	(a0)+,d0
    1712:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1714:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1716:	move.w (sp)+,d3
		move.b	d0,d3
    1718:	move.b d0,d3
		move.l	a1,a2
    171a:	movea.l a1,a2
		sub.l	d3,a2
    171c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    171e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1720:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1722:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1724:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1726:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1728:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    172a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    172c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    172e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1730:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1732:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1734:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1736:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1738:	move.b (a2)+,(a1)+
		moveq	#0,d0
    173a:	moveq #0,d0
		move.b	(a0)+,d0
    173c:	move.b (a0)+,d0
		add.w	d0,d0
    173e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1740:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1744:	jmp (0,a3,d0.w)

00001748 <lz4Rts11>:
lz4Rts11:	rts
    1748:	rts

0000174a <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    174a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    174c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    174e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1750:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1752:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1754:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1756:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1758:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    175a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    175c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    175e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1760:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1762:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1764:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    1766:	cmpa.l a0,a4
		beq.s	lz4Rts12
    1768:	beq.s 17a2 <lz4Rts12>
		move.b	(a0)+,d0
    176a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    176c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    176e:	move.w (sp)+,d3
		move.b	d0,d3
    1770:	move.b d0,d3
		move.l	a1,a2
    1772:	movea.l a1,a2
		sub.l	d3,a2
    1774:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1776:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1778:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    177a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    177c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    177e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1780:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1782:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1784:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1786:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1788:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    178a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    178c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    178e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1790:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1792:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1794:	moveq #0,d0
		move.b	(a0)+,d0
    1796:	move.b (a0)+,d0
		add.w	d0,d0
    1798:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    179a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    179e:	jmp (0,a3,d0.w)

000017a2 <lz4Rts12>:
lz4Rts12:	rts
    17a2:	rts

000017a4 <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    17a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    17be:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    17c0:	cmpa.l a0,a4
		beq.s	lz4Rts13
    17c2:	beq.s 17fe <lz4Rts13>
		move.b	(a0)+,d0
    17c4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    17c6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    17c8:	move.w (sp)+,d3
		move.b	d0,d3
    17ca:	move.b d0,d3
		move.l	a1,a2
    17cc:	movea.l a1,a2
		sub.l	d3,a2
    17ce:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    17d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    17ee:	move.b (a2)+,(a1)+
		moveq	#0,d0
    17f0:	moveq #0,d0
		move.b	(a0)+,d0
    17f2:	move.b (a0)+,d0
		add.w	d0,d0
    17f4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    17f6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    17fa:	jmp (0,a3,d0.w)

000017fe <lz4Rts13>:
lz4Rts13:	rts
    17fe:	rts

00001800 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    1800:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1802:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1804:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1806:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1808:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    180a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    180c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    180e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1810:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1812:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1814:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1816:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1818:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    181a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    181c:	cmpa.l a0,a4
		beq.s	lz4Rts14
    181e:	beq.s 185c <lz4Rts14>
		move.b	(a0)+,d0
    1820:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1822:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1824:	move.w (sp)+,d3
		move.b	d0,d3
    1826:	move.b d0,d3
		move.l	a1,a2
    1828:	movea.l a1,a2
		sub.l	d3,a2
    182a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    182c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    182e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1830:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1832:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1834:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1836:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1838:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    183a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    183c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    183e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1840:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1842:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1844:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1846:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1848:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    184a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    184c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    184e:	moveq #0,d0
		move.b	(a0)+,d0
    1850:	move.b (a0)+,d0
		add.w	d0,d0
    1852:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1854:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1858:	jmp (0,a3,d0.w)

0000185c <lz4Rts14>:
lz4Rts14:	rts
    185c:	rts

0000185e <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    185e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1860:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1862:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1864:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1866:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1868:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    186a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    186c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    186e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1870:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1872:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1874:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1876:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1878:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    187a:	cmpa.l a0,a4
		beq.s	lz4Rts15
    187c:	beq.s 18bc <lz4Rts15>
		move.b	(a0)+,d0
    187e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1880:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1882:	move.w (sp)+,d3
		move.b	d0,d3
    1884:	move.b d0,d3
		move.l	a1,a2
    1886:	movea.l a1,a2
		sub.l	d3,a2
    1888:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    188a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    188c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    188e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1890:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1892:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1894:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1896:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1898:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    189a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    189c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    189e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    18ac:	move.b (a2)+,(a1)+
		moveq	#0,d0
    18ae:	moveq #0,d0
		move.b	(a0)+,d0
    18b0:	move.b (a0)+,d0
		add.w	d0,d0
    18b2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    18b4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    18b8:	jmp (0,a3,d0.w)

000018bc <lz4Rts15>:
lz4Rts15:	rts
    18bc:	rts

000018be <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    18be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    18d8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    18da:	cmpa.l a0,a4
		beq.s	lz4Rts16
    18dc:	beq.s 1932 <lz4Rts16>
		move.b	(a0)+,d0
    18de:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    18e0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    18e2:	move.w (sp)+,d3
		move.b	d0,d3
    18e4:	move.b d0,d3
		move.l	a1,a2
    18e6:	movea.l a1,a2
		sub.l	d3,a2
    18e8:	suba.l d3,a2
		moveq	#15+4,d1
    18ea:	moveq #19,d1

000018ec <.cl0>:
.cl0:	move.b	(a0)+,d2
    18ec:	/-> move.b (a0)+,d2
		add.l d2,d1
    18ee:	|   add.l d2,d1
		not.b	d2
    18f0:	|   not.b d2
		beq.s	.cl0
    18f2:	\-- beq.s 18ec <.cl0>
		moveq	#15,d5
    18f4:	    moveq #15,d5
		and.w	d1,d5
    18f6:	    and.w d1,d5
		add.w	d5,d5
    18f8:	    add.w d5,d5
		neg.w	d5
    18fa:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    18fc:	    jmp (1920 <.eloop1>,pc,d5.w)

00001900 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    1900:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1902:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1904:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1906:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1908:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    190a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    190c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    190e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1910:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1912:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1914:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1916:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1918:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    191a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    191c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    191e:	move.b (a2)+,(a1)+

00001920 <.eloop1>:
.eloop1:	sub.l	d7,d1
    1920:	sub.l d7,d1
		bpl.s	.tloop1
    1922:	bpl.s 1900 <.tloop1>
		moveq	#0,d0
    1924:	moveq #0,d0
		move.b	(a0)+,d0
    1926:	move.b (a0)+,d0
		add.w	d0,d0
    1928:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    192a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    192e:	jmp (0,a3,d0.w)

00001932 <lz4Rts16>:
lz4Rts16:	rts
    1932:	rts

00001934 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    1934:	moveq #15,d1

00001936 <.cl2>:
.cl2:	move.b	(a0)+,d2
    1936:	/-> move.b (a0)+,d2
		add.l d2,d1
    1938:	|   add.l d2,d1
		not.b	d2
    193a:	|   not.b d2
		beq.s	.cl2
    193c:	\-- beq.s 1936 <.cl2>
		moveq	#15,d5
    193e:	    moveq #15,d5
		and.w	d1,d5
    1940:	    and.w d1,d5
		add.w	d5,d5
    1942:	    add.w d5,d5
		neg.w	d5
    1944:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    1946:	    jmp (196a <.eloop3>,pc,d5.w)

0000194a <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    194a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    194c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    194e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1950:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1952:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1954:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1956:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1958:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    195a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    195c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    195e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1960:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1962:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1964:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1966:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1968:	move.b (a0)+,(a1)+

0000196a <.eloop3>:
.eloop3:	sub.l	d7,d1
    196a:	sub.l d7,d1
		bpl.s	.tloop3
    196c:	bpl.s 194a <.tloop3>
		cmpa.l	a0,a4
    196e:	cmpa.l a0,a4
		beq.s	lz4Rts17
    1970:	beq.s 1994 <lz4Rts17>
		move.b	(a0)+,d0
    1972:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1974:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1976:	move.w (sp)+,d3
		move.b	d0,d3
    1978:	move.b d0,d3
		move.l	a1,a2
    197a:	movea.l a1,a2
		sub.l	d3,a2
    197c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    197e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1980:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1982:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1984:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1986:	moveq #0,d0
		move.b	(a0)+,d0
    1988:	move.b (a0)+,d0
		add.w	d0,d0
    198a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    198c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1990:	jmp (0,a3,d0.w)

00001994 <lz4Rts17>:
lz4Rts17:	rts
    1994:	rts

00001996 <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    1996:	moveq #15,d1

00001998 <.cl4>:
.cl4:	move.b	(a0)+,d2
    1998:	/-> move.b (a0)+,d2
		add.l d2,d1
    199a:	|   add.l d2,d1
		not.b	d2
    199c:	|   not.b d2
		beq.s	.cl4
    199e:	\-- beq.s 1998 <.cl4>
		moveq	#15,d5
    19a0:	    moveq #15,d5
		and.w	d1,d5
    19a2:	    and.w d1,d5
		add.w	d5,d5
    19a4:	    add.w d5,d5
		neg.w	d5
    19a6:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    19a8:	    jmp (19cc <.eloop5>,pc,d5.w)

000019ac <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    19ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    19ca:	move.b (a0)+,(a1)+

000019cc <.eloop5>:
.eloop5:	sub.l	d7,d1
    19cc:	sub.l d7,d1
		bpl.s	.tloop5
    19ce:	bpl.s 19ac <.tloop5>
		cmpa.l	a0,a4
    19d0:	cmpa.l a0,a4
		beq.s	lz4Rts18
    19d2:	beq.s 19f8 <lz4Rts18>
		move.b	(a0)+,d0
    19d4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    19d6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    19d8:	move.w (sp)+,d3
		move.b	d0,d3
    19da:	move.b d0,d3
		move.l	a1,a2
    19dc:	movea.l a1,a2
		sub.l	d3,a2
    19de:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    19e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    19e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    19e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    19e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    19e8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    19ea:	moveq #0,d0
		move.b	(a0)+,d0
    19ec:	move.b (a0)+,d0
		add.w	d0,d0
    19ee:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    19f0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    19f4:	jmp (0,a3,d0.w)

000019f8 <lz4Rts18>:
lz4Rts18:	rts
    19f8:	rts

000019fa <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    19fa:	moveq #15,d1

000019fc <.cl6>:
.cl6:	move.b	(a0)+,d2
    19fc:	/-> move.b (a0)+,d2
		add.l d2,d1
    19fe:	|   add.l d2,d1
		not.b	d2
    1a00:	|   not.b d2
		beq.s	.cl6
    1a02:	\-- beq.s 19fc <.cl6>
		moveq	#15,d5
    1a04:	    moveq #15,d5
		and.w	d1,d5
    1a06:	    and.w d1,d5
		add.w	d5,d5
    1a08:	    add.w d5,d5
		neg.w	d5
    1a0a:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    1a0c:	    jmp (1a30 <.eloop7>,pc,d5.w)

00001a10 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    1a10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a2e:	move.b (a0)+,(a1)+

00001a30 <.eloop7>:
.eloop7:	sub.l	d7,d1
    1a30:	sub.l d7,d1
		bpl.s	.tloop7
    1a32:	bpl.s 1a10 <.tloop7>
		cmpa.l	a0,a4
    1a34:	cmpa.l a0,a4
		beq.s	lz4Rts19
    1a36:	beq.s 1a5e <lz4Rts19>
		move.b	(a0)+,d0
    1a38:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1a3a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1a3c:	move.w (sp)+,d3
		move.b	d0,d3
    1a3e:	move.b d0,d3
		move.l	a1,a2
    1a40:	movea.l a1,a2
		sub.l	d3,a2
    1a42:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1a44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1a46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1a48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1a4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1a4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1a4e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1a50:	moveq #0,d0
		move.b	(a0)+,d0
    1a52:	move.b (a0)+,d0
		add.w	d0,d0
    1a54:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1a56:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1a5a:	jmp (0,a3,d0.w)

00001a5e <lz4Rts19>:
lz4Rts19:	rts
    1a5e:	rts

00001a60 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    1a60:	moveq #15,d1

00001a62 <.cl8>:
.cl8:	move.b	(a0)+,d2
    1a62:	/-> move.b (a0)+,d2
		add.l d2,d1
    1a64:	|   add.l d2,d1
		not.b	d2
    1a66:	|   not.b d2
		beq.s	.cl8
    1a68:	\-- beq.s 1a62 <.cl8>
		moveq	#15,d5
    1a6a:	    moveq #15,d5
		and.w	d1,d5
    1a6c:	    and.w d1,d5
		add.w	d5,d5
    1a6e:	    add.w d5,d5
		neg.w	d5
    1a70:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    1a72:	    jmp (1a96 <.eloop9>,pc,d5.w)

00001a76 <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    1a76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1a94:	move.b (a0)+,(a1)+

00001a96 <.eloop9>:
.eloop9:	sub.l	d7,d1
    1a96:	sub.l d7,d1
		bpl.s	.tloop9
    1a98:	bpl.s 1a76 <.tloop9>
		cmpa.l	a0,a4
    1a9a:	cmpa.l a0,a4
		beq.s	lz4Rts20
    1a9c:	beq.s 1ac6 <lz4Rts20>
		move.b	(a0)+,d0
    1a9e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1aa0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1aa2:	move.w (sp)+,d3
		move.b	d0,d3
    1aa4:	move.b d0,d3
		move.l	a1,a2
    1aa6:	movea.l a1,a2
		sub.l	d3,a2
    1aa8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1aaa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1aac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1aae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ab0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ab2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ab4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ab6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1ab8:	moveq #0,d0
		move.b	(a0)+,d0
    1aba:	move.b (a0)+,d0
		add.w	d0,d0
    1abc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1abe:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1ac2:	jmp (0,a3,d0.w)

00001ac6 <lz4Rts20>:
lz4Rts20:	rts
    1ac6:	rts

00001ac8 <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    1ac8:	moveq #15,d1

00001aca <.cl10>:
.cl10:	move.b	(a0)+,d2
    1aca:	/-> move.b (a0)+,d2
		add.l d2,d1
    1acc:	|   add.l d2,d1
		not.b	d2
    1ace:	|   not.b d2
		beq.s	.cl10
    1ad0:	\-- beq.s 1aca <.cl10>
		moveq	#15,d5
    1ad2:	    moveq #15,d5
		and.w	d1,d5
    1ad4:	    and.w d1,d5
		add.w	d5,d5
    1ad6:	    add.w d5,d5
		neg.w	d5
    1ad8:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    1ada:	    jmp (1afe <.eloop11>,pc,d5.w)

00001ade <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    1ade:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ae0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ae2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ae4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ae6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ae8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1aea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1aec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1aee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1af0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1af2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1af4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1af6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1af8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1afa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1afc:	move.b (a0)+,(a1)+

00001afe <.eloop11>:
.eloop11:	sub.l	d7,d1
    1afe:	sub.l d7,d1
		bpl.s	.tloop11
    1b00:	bpl.s 1ade <.tloop11>
		cmpa.l	a0,a4
    1b02:	cmpa.l a0,a4
		beq.s	lz4Rts21
    1b04:	beq.s 1b30 <lz4Rts21>
		move.b	(a0)+,d0
    1b06:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1b08:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1b0a:	move.w (sp)+,d3
		move.b	d0,d3
    1b0c:	move.b d0,d3
		move.l	a1,a2
    1b0e:	movea.l a1,a2
		sub.l	d3,a2
    1b10:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1b12:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b20:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1b22:	moveq #0,d0
		move.b	(a0)+,d0
    1b24:	move.b (a0)+,d0
		add.w	d0,d0
    1b26:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1b28:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1b2c:	jmp (0,a3,d0.w)

00001b30 <lz4Rts21>:
lz4Rts21:	rts
    1b30:	rts

00001b32 <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    1b32:	moveq #15,d1

00001b34 <.cl12>:
.cl12:	move.b	(a0)+,d2
    1b34:	/-> move.b (a0)+,d2
		add.l d2,d1
    1b36:	|   add.l d2,d1
		not.b	d2
    1b38:	|   not.b d2
		beq.s	.cl12
    1b3a:	\-- beq.s 1b34 <.cl12>
		moveq	#15,d5
    1b3c:	    moveq #15,d5
		and.w	d1,d5
    1b3e:	    and.w d1,d5
		add.w	d5,d5
    1b40:	    add.w d5,d5
		neg.w	d5
    1b42:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    1b44:	    jmp (1b68 <.eloop13>,pc,d5.w)

00001b48 <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    1b48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1b66:	move.b (a0)+,(a1)+

00001b68 <.eloop13>:
.eloop13:	sub.l	d7,d1
    1b68:	sub.l d7,d1
		bpl.s	.tloop13
    1b6a:	bpl.s 1b48 <.tloop13>
		cmpa.l	a0,a4
    1b6c:	cmpa.l a0,a4
		beq.s	lz4Rts22
    1b6e:	beq.s 1b9c <lz4Rts22>
		move.b	(a0)+,d0
    1b70:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1b72:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1b74:	move.w (sp)+,d3
		move.b	d0,d3
    1b76:	move.b d0,d3
		move.l	a1,a2
    1b78:	movea.l a1,a2
		sub.l	d3,a2
    1b7a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1b7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1b8c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1b8e:	moveq #0,d0
		move.b	(a0)+,d0
    1b90:	move.b (a0)+,d0
		add.w	d0,d0
    1b92:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1b94:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1b98:	jmp (0,a3,d0.w)

00001b9c <lz4Rts22>:
lz4Rts22:	rts
    1b9c:	rts

00001b9e <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    1b9e:	moveq #15,d1

00001ba0 <.cl14>:
.cl14:	move.b	(a0)+,d2
    1ba0:	/-> move.b (a0)+,d2
		add.l d2,d1
    1ba2:	|   add.l d2,d1
		not.b	d2
    1ba4:	|   not.b d2
		beq.s	.cl14
    1ba6:	\-- beq.s 1ba0 <.cl14>
		moveq	#15,d5
    1ba8:	    moveq #15,d5
		and.w	d1,d5
    1baa:	    and.w d1,d5
		add.w	d5,d5
    1bac:	    add.w d5,d5
		neg.w	d5
    1bae:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    1bb0:	    jmp (1bd4 <.eloop15>,pc,d5.w)

00001bb4 <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    1bb4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bb6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bc4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1bd2:	move.b (a0)+,(a1)+

00001bd4 <.eloop15>:
.eloop15:	sub.l	d7,d1
    1bd4:	sub.l d7,d1
		bpl.s	.tloop15
    1bd6:	bpl.s 1bb4 <.tloop15>
		cmpa.l	a0,a4
    1bd8:	cmpa.l a0,a4
		beq.s	lz4Rts23
    1bda:	beq.s 1c0a <lz4Rts23>
		move.b	(a0)+,d0
    1bdc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1bde:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1be0:	move.w (sp)+,d3
		move.b	d0,d3
    1be2:	move.b d0,d3
		move.l	a1,a2
    1be4:	movea.l a1,a2
		sub.l	d3,a2
    1be6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1be8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bf0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bf2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bf4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bf6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bf8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1bfa:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1bfc:	moveq #0,d0
		move.b	(a0)+,d0
    1bfe:	move.b (a0)+,d0
		add.w	d0,d0
    1c00:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1c02:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1c06:	jmp (0,a3,d0.w)

00001c0a <lz4Rts23>:
lz4Rts23:	rts
    1c0a:	rts

00001c0c <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    1c0c:	moveq #15,d1

00001c0e <.cl16>:
.cl16:	move.b	(a0)+,d2
    1c0e:	/-> move.b (a0)+,d2
		add.l d2,d1
    1c10:	|   add.l d2,d1
		not.b	d2
    1c12:	|   not.b d2
		beq.s	.cl16
    1c14:	\-- beq.s 1c0e <.cl16>
		moveq	#15,d5
    1c16:	    moveq #15,d5
		and.w	d1,d5
    1c18:	    and.w d1,d5
		add.w	d5,d5
    1c1a:	    add.w d5,d5
		neg.w	d5
    1c1c:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    1c1e:	    jmp (1c42 <.eloop17>,pc,d5.w)

00001c22 <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    1c22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c40:	move.b (a0)+,(a1)+

00001c42 <.eloop17>:
.eloop17:	sub.l	d7,d1
    1c42:	sub.l d7,d1
		bpl.s	.tloop17
    1c44:	bpl.s 1c22 <.tloop17>
		cmpa.l	a0,a4
    1c46:	cmpa.l a0,a4
		beq.s	lz4Rts24
    1c48:	beq.s 1c7a <lz4Rts24>
		move.b	(a0)+,d0
    1c4a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1c4c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1c4e:	move.w (sp)+,d3
		move.b	d0,d3
    1c50:	move.b d0,d3
		move.l	a1,a2
    1c52:	movea.l a1,a2
		sub.l	d3,a2
    1c54:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1c56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c5a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1c6a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1c6c:	moveq #0,d0
		move.b	(a0)+,d0
    1c6e:	move.b (a0)+,d0
		add.w	d0,d0
    1c70:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1c72:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1c76:	jmp (0,a3,d0.w)

00001c7a <lz4Rts24>:
lz4Rts24:	rts
    1c7a:	rts

00001c7c <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    1c7c:	moveq #15,d1

00001c7e <.cl18>:
.cl18:	move.b	(a0)+,d2
    1c7e:	/-> move.b (a0)+,d2
		add.l d2,d1
    1c80:	|   add.l d2,d1
		not.b	d2
    1c82:	|   not.b d2
		beq.s	.cl18
    1c84:	\-- beq.s 1c7e <.cl18>
		moveq	#15,d5
    1c86:	    moveq #15,d5
		and.w	d1,d5
    1c88:	    and.w d1,d5
		add.w	d5,d5
    1c8a:	    add.w d5,d5
		neg.w	d5
    1c8c:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    1c8e:	    jmp (1cb2 <.eloop19>,pc,d5.w)

00001c92 <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    1c92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1c9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ca0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ca2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ca4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ca6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ca8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1caa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1cac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1cae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1cb0:	move.b (a0)+,(a1)+

00001cb2 <.eloop19>:
.eloop19:	sub.l	d7,d1
    1cb2:	sub.l d7,d1
		bpl.s	.tloop19
    1cb4:	bpl.s 1c92 <.tloop19>
		cmpa.l	a0,a4
    1cb6:	cmpa.l a0,a4
		beq.s	lz4Rts25
    1cb8:	beq.s 1cec <lz4Rts25>
		move.b	(a0)+,d0
    1cba:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1cbc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1cbe:	move.w (sp)+,d3
		move.b	d0,d3
    1cc0:	move.b d0,d3
		move.l	a1,a2
    1cc2:	movea.l a1,a2
		sub.l	d3,a2
    1cc4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1cc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cc8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ccc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cd6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cd8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cda:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1cdc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1cde:	moveq #0,d0
		move.b	(a0)+,d0
    1ce0:	move.b (a0)+,d0
		add.w	d0,d0
    1ce2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1ce4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1ce8:	jmp (0,a3,d0.w)

00001cec <lz4Rts25>:
lz4Rts25:	rts
    1cec:	rts

00001cee <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    1cee:	moveq #15,d1

00001cf0 <.cl20>:
.cl20:	move.b	(a0)+,d2
    1cf0:	/-> move.b (a0)+,d2
		add.l d2,d1
    1cf2:	|   add.l d2,d1
		not.b	d2
    1cf4:	|   not.b d2
		beq.s	.cl20
    1cf6:	\-- beq.s 1cf0 <.cl20>
		moveq	#15,d5
    1cf8:	    moveq #15,d5
		and.w	d1,d5
    1cfa:	    and.w d1,d5
		add.w	d5,d5
    1cfc:	    add.w d5,d5
		neg.w	d5
    1cfe:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    1d00:	    jmp (1d24 <.eloop21>,pc,d5.w)

00001d04 <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    1d04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d22:	move.b (a0)+,(a1)+

00001d24 <.eloop21>:
.eloop21:	sub.l	d7,d1
    1d24:	sub.l d7,d1
		bpl.s	.tloop21
    1d26:	bpl.s 1d04 <.tloop21>
		cmpa.l	a0,a4
    1d28:	cmpa.l a0,a4
		beq.s	lz4Rts26
    1d2a:	beq.s 1d60 <lz4Rts26>
		move.b	(a0)+,d0
    1d2c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1d2e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1d30:	move.w (sp)+,d3
		move.b	d0,d3
    1d32:	move.b d0,d3
		move.l	a1,a2
    1d34:	movea.l a1,a2
		sub.l	d3,a2
    1d36:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1d38:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d3a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d3e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d40:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d42:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1d50:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1d52:	moveq #0,d0
		move.b	(a0)+,d0
    1d54:	move.b (a0)+,d0
		add.w	d0,d0
    1d56:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1d58:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1d5c:	jmp (0,a3,d0.w)

00001d60 <lz4Rts26>:
lz4Rts26:	rts
    1d60:	rts

00001d62 <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    1d62:	moveq #15,d1

00001d64 <.cl22>:
.cl22:	move.b	(a0)+,d2
    1d64:	/-> move.b (a0)+,d2
		add.l d2,d1
    1d66:	|   add.l d2,d1
		not.b	d2
    1d68:	|   not.b d2
		beq.s	.cl22
    1d6a:	\-- beq.s 1d64 <.cl22>
		moveq	#15,d5
    1d6c:	    moveq #15,d5
		and.w	d1,d5
    1d6e:	    and.w d1,d5
		add.w	d5,d5
    1d70:	    add.w d5,d5
		neg.w	d5
    1d72:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    1d74:	    jmp (1d98 <.eloop23>,pc,d5.w)

00001d78 <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    1d78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1d96:	move.b (a0)+,(a1)+

00001d98 <.eloop23>:
.eloop23:	sub.l	d7,d1
    1d98:	sub.l d7,d1
		bpl.s	.tloop23
    1d9a:	bpl.s 1d78 <.tloop23>
		cmpa.l	a0,a4
    1d9c:	cmpa.l a0,a4
		beq.s	lz4Rts27
    1d9e:	beq.s 1dd6 <lz4Rts27>
		move.b	(a0)+,d0
    1da0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1da2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1da4:	move.w (sp)+,d3
		move.b	d0,d3
    1da6:	move.b d0,d3
		move.l	a1,a2
    1da8:	movea.l a1,a2
		sub.l	d3,a2
    1daa:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1dac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1db0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1db2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1db4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1db6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1db8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1dc6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1dc8:	moveq #0,d0
		move.b	(a0)+,d0
    1dca:	move.b (a0)+,d0
		add.w	d0,d0
    1dcc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1dce:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1dd2:	jmp (0,a3,d0.w)

00001dd6 <lz4Rts27>:
lz4Rts27:	rts
    1dd6:	rts

00001dd8 <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    1dd8:	moveq #15,d1

00001dda <.cl24>:
.cl24:	move.b	(a0)+,d2
    1dda:	/-> move.b (a0)+,d2
		add.l d2,d1
    1ddc:	|   add.l d2,d1
		not.b	d2
    1dde:	|   not.b d2
		beq.s	.cl24
    1de0:	\-- beq.s 1dda <.cl24>
		moveq	#15,d5
    1de2:	    moveq #15,d5
		and.w	d1,d5
    1de4:	    and.w d1,d5
		add.w	d5,d5
    1de6:	    add.w d5,d5
		neg.w	d5
    1de8:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    1dea:	    jmp (1e0e <.eloop25>,pc,d5.w)

00001dee <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    1dee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1df0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1df2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1df4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1df6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1df8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1dfa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1dfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1dfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e0c:	move.b (a0)+,(a1)+

00001e0e <.eloop25>:
.eloop25:	sub.l	d7,d1
    1e0e:	sub.l d7,d1
		bpl.s	.tloop25
    1e10:	bpl.s 1dee <.tloop25>
		cmpa.l	a0,a4
    1e12:	cmpa.l a0,a4
		beq.s	lz4Rts28
    1e14:	beq.s 1e4e <lz4Rts28>
		move.b	(a0)+,d0
    1e16:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1e18:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1e1a:	move.w (sp)+,d3
		move.b	d0,d3
    1e1c:	move.b d0,d3
		move.l	a1,a2
    1e1e:	movea.l a1,a2
		sub.l	d3,a2
    1e20:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1e22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e30:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e32:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e34:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e36:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e38:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e3a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e3e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1e40:	moveq #0,d0
		move.b	(a0)+,d0
    1e42:	move.b (a0)+,d0
		add.w	d0,d0
    1e44:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1e46:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1e4a:	jmp (0,a3,d0.w)

00001e4e <lz4Rts28>:
lz4Rts28:	rts
    1e4e:	rts

00001e50 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    1e50:	moveq #15,d1

00001e52 <.cl26>:
.cl26:	move.b	(a0)+,d2
    1e52:	/-> move.b (a0)+,d2
		add.l d2,d1
    1e54:	|   add.l d2,d1
		not.b	d2
    1e56:	|   not.b d2
		beq.s	.cl26
    1e58:	\-- beq.s 1e52 <.cl26>
		moveq	#15,d5
    1e5a:	    moveq #15,d5
		and.w	d1,d5
    1e5c:	    and.w d1,d5
		add.w	d5,d5
    1e5e:	    add.w d5,d5
		neg.w	d5
    1e60:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    1e62:	    jmp (1e86 <.eloop27>,pc,d5.w)

00001e66 <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    1e66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1e84:	move.b (a0)+,(a1)+

00001e86 <.eloop27>:
.eloop27:	sub.l	d7,d1
    1e86:	sub.l d7,d1
		bpl.s	.tloop27
    1e88:	bpl.s 1e66 <.tloop27>
		cmpa.l	a0,a4
    1e8a:	cmpa.l a0,a4
		beq.s	lz4Rts29
    1e8c:	beq.s 1ec8 <lz4Rts29>
		move.b	(a0)+,d0
    1e8e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1e90:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1e92:	move.w (sp)+,d3
		move.b	d0,d3
    1e94:	move.b d0,d3
		move.l	a1,a2
    1e96:	movea.l a1,a2
		sub.l	d3,a2
    1e98:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1e9a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e9c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1e9e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ea0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ea2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ea4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ea6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1ea8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eaa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eb0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eb2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eb4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eb6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1eb8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1eba:	moveq #0,d0
		move.b	(a0)+,d0
    1ebc:	move.b (a0)+,d0
		add.w	d0,d0
    1ebe:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1ec0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1ec4:	jmp (0,a3,d0.w)

00001ec8 <lz4Rts29>:
lz4Rts29:	rts
    1ec8:	rts

00001eca <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    1eca:	moveq #15,d1

00001ecc <.cl28>:
.cl28:	move.b	(a0)+,d2
    1ecc:	/-> move.b (a0)+,d2
		add.l d2,d1
    1ece:	|   add.l d2,d1
		not.b	d2
    1ed0:	|   not.b d2
		beq.s	.cl28
    1ed2:	\-- beq.s 1ecc <.cl28>
		moveq	#15,d5
    1ed4:	    moveq #15,d5
		and.w	d1,d5
    1ed6:	    and.w d1,d5
		add.w	d5,d5
    1ed8:	    add.w d5,d5
		neg.w	d5
    1eda:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    1edc:	    jmp (1f00 <.eloop29>,pc,d5.w)

00001ee0 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    1ee0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ee2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ee4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ee6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ee8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1eea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1eec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1eee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ef0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ef2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ef4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ef6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ef8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1efa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1efc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1efe:	move.b (a0)+,(a1)+

00001f00 <.eloop29>:
.eloop29:	sub.l	d7,d1
    1f00:	sub.l d7,d1
		bpl.s	.tloop29
    1f02:	bpl.s 1ee0 <.tloop29>
		cmpa.l	a0,a4
    1f04:	cmpa.l a0,a4
		beq.s	lz4Rts30
    1f06:	beq.s 1f44 <lz4Rts30>
		move.b	(a0)+,d0
    1f08:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1f0a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1f0c:	move.w (sp)+,d3
		move.b	d0,d3
    1f0e:	move.b d0,d3
		move.l	a1,a2
    1f10:	movea.l a1,a2
		sub.l	d3,a2
    1f12:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1f14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f30:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f32:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f34:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1f36:	moveq #0,d0
		move.b	(a0)+,d0
    1f38:	move.b (a0)+,d0
		add.w	d0,d0
    1f3a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1f3c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1f40:	jmp (0,a3,d0.w)

00001f44 <lz4Rts30>:
lz4Rts30:	rts
    1f44:	rts

00001f46 <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    1f46:	moveq #15,d1

00001f48 <.cl30>:
.cl30:	move.b	(a0)+,d2
    1f48:	/-> move.b (a0)+,d2
		add.l d2,d1
    1f4a:	|   add.l d2,d1
		not.b	d2
    1f4c:	|   not.b d2
		beq.s	.cl30
    1f4e:	\-- beq.s 1f48 <.cl30>
		moveq	#15,d5
    1f50:	    moveq #15,d5
		and.w	d1,d5
    1f52:	    and.w d1,d5
		add.w	d5,d5
    1f54:	    add.w d5,d5
		neg.w	d5
    1f56:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    1f58:	    jmp (1f7c <.eloop31>,pc,d5.w)

00001f5c <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    1f5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1f7a:	move.b (a0)+,(a1)+

00001f7c <.eloop31>:
.eloop31:	sub.l	d7,d1
    1f7c:	sub.l d7,d1
		bpl.s	.tloop31
    1f7e:	bpl.s 1f5c <.tloop31>
		cmpa.l	a0,a4
    1f80:	cmpa.l a0,a4
		beq.s	lz4Rts31
    1f82:	beq.s 1fc2 <lz4Rts31>
		move.b	(a0)+,d0
    1f84:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    1f86:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    1f88:	move.w (sp)+,d3
		move.b	d0,d3
    1f8a:	move.b d0,d3
		move.l	a1,a2
    1f8c:	movea.l a1,a2
		sub.l	d3,a2
    1f8e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    1f90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f92:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f94:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f96:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f98:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f9a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f9c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1f9e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fa0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fa2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fa4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fa6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fa8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1faa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fb0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    1fb2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    1fb4:	moveq #0,d0
		move.b	(a0)+,d0
    1fb6:	move.b (a0)+,d0
		add.w	d0,d0
    1fb8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    1fba:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    1fbe:	jmp (0,a3,d0.w)

00001fc2 <lz4Rts31>:
lz4Rts31:	rts
    1fc2:	rts

00001fc4 <ll_lm>:

ll_lm:
		moveq	#15,d1
    1fc4:	moveq #15,d1

00001fc6 <.cl32>:
.cl32:	move.b	(a0)+,d2
    1fc6:	/-> move.b (a0)+,d2
		add.l d2,d1
    1fc8:	|   add.l d2,d1
		not.b	d2
    1fca:	|   not.b d2
		beq.s	.cl32
    1fcc:	\-- beq.s 1fc6 <.cl32>
		moveq	#15,d5
    1fce:	    moveq #15,d5
		and.w	d1,d5
    1fd0:	    and.w d1,d5
		add.w	d5,d5
    1fd2:	    add.w d5,d5
		neg.w	d5
    1fd4:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    1fd6:	    jmp (1ffa <.eloop33>,pc,d5.w)

00001fda <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    1fda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fdc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fe0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fe2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fe4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fe6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fe8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1fee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ff0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ff2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ff4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ff6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    1ff8:	move.b (a0)+,(a1)+

00001ffa <.eloop33>:
.eloop33:	sub.l	d7,d1
    1ffa:	sub.l d7,d1
		bpl.s	.tloop33
    1ffc:	bpl.s 1fda <.tloop33>
		cmpa.l	a0,a4
    1ffe:	cmpa.l a0,a4
		beq.s	lz4Rts32
    2000:	beq.s 2056 <lz4Rts32>
		move.b	(a0)+,d0
    2002:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    2004:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    2006:	move.w (sp)+,d3
		move.b	d0,d3
    2008:	move.b d0,d3
		move.l	a1,a2
    200a:	movea.l a1,a2
		sub.l	d3,a2
    200c:	suba.l d3,a2
		moveq	#15+4,d1
    200e:	moveq #19,d1

00002010 <.cl34>:
.cl34:	move.b	(a0)+,d2
    2010:	/-> move.b (a0)+,d2
		add.l d2,d1
    2012:	|   add.l d2,d1
		not.b	d2
    2014:	|   not.b d2
		beq.s	.cl34
    2016:	\-- beq.s 2010 <.cl34>
		moveq	#15,d5
    2018:	    moveq #15,d5
		and.w	d1,d5
    201a:	    and.w d1,d5
		add.w	d5,d5
    201c:	    add.w d5,d5
		neg.w	d5
    201e:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    2020:	    jmp (2044 <.eloop35>,pc,d5.w)

00002024 <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    2024:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2026:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2028:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    202a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    202c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    202e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2030:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2032:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2034:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2036:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2038:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    203a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    203c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    203e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2040:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    2042:	move.b (a2)+,(a1)+

00002044 <.eloop35>:
.eloop35:	sub.l	d7,d1
    2044:	sub.l d7,d1
		bpl.s	.tloop35
    2046:	bpl.s 2024 <.tloop35>
		moveq	#0,d0
    2048:	moveq #0,d0
		move.b	(a0)+,d0
    204a:	move.b (a0)+,d0
		add.w	d0,d0
    204c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    204e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    2052:	jmp (0,a3,d0.w)

00002056 <lz4Rts32>:
lz4Rts32:				
			rts
    2056:	rts

00002058 <lz4Over>:

lz4Over:	rts
    2058:	rts

0000205a <lz4jmp>:
    205a:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    205c:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    205e:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    2060:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    2062:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    2064:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    2066:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    2068:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    206a:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    206c:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    206e:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    2070:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    2072:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    2074:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    2076:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    2078:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    207a:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    207c:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    207e:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    2080:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    2082:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    2084:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    2086:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    2088:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    208a:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    208c:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    208e:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    2090:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    2092:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    2094:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    2096:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    2098:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    209a:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    209c:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    209e:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    20a0:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    20a2:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    20a4:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    20a6:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    20a8:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    20aa:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    20ac:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    20ae:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    20b0:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    20b2:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    20b4:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    20b6:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    20b8:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    20ba:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    20bc:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    20be:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    20c0:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    20c2:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    20c4:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    20c6:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    20c8:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    20ca:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    20cc:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    20ce:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    20d0:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    20d2:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    20d4:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    20d6:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    20d8:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    20da:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    20dc:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    20de:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    20e0:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    20e2:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    20e4:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    20e6:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    20e8:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    20ea:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    20ec:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    20ee:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    20f0:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    20f2:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    20f4:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    20f6:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    20f8:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    20fa:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    20fc:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    20fe:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    2100:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    2102:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    2104:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    2106:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    2108:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    210a:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    210c:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    210e:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    2110:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    2112:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    2114:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    2116:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    2118:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    211a:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    211c:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    211e:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    2120:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    2122:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    2124:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    2126:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    2128:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    212a:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    212c:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    212e:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    2130:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    2132:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    2134:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    2136:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    2138:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    213a:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    213c:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    213e:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    2140:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    2142:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    2144:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    2146:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    2148:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    214a:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    214c:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    214e:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    2150:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    2152:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    2154:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    2156:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    2158:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    215a:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    215c:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    215e:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    2160:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    2162:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    2164:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    2166:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    2168:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    216a:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    216c:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    216e:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    2170:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    2172:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    2174:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    2176:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    2178:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    217a:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    217c:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    217e:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    2180:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    2182:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    2184:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    2186:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    2188:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    218a:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    218c:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    218e:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    2190:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    2192:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    2194:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    2196:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    2198:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    219a:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    219c:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    219e:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    21a0:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    21a2:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    21a4:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    21a6:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    21a8:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    21aa:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    21ac:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    21ae:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    21b0:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    21b2:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    21b4:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    21b6:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    21b8:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    21ba:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    21bc:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    21be:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    21c0:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    21c2:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    21c4:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    21c6:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    21c8:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    21ca:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    21cc:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    21ce:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    21d0:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    21d2:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    21d4:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    21d6:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    21d8:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    21da:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    21dc:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    21de:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    21e0:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    21e2:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    21e4:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    21e6:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    21e8:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    21ea:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    21ec:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    21ee:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    21f0:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    21f2:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    21f4:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    21f6:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    21f8:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    21fa:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    21fc:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    21fe:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    2200:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    2202:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    2204:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    2206:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    2208:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    220a:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    220c:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    220e:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    2210:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    2212:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    2214:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    2216:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    2218:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    221a:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    221c:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    221e:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    2220:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    2222:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    2224:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    2226:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    2228:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    222a:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    222c:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    222e:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    2230:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    2232:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    2234:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    2236:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    2238:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    223a:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    223c:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    223e:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    2240:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    2242:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    2244:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    2246:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    2248:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    224a:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    224c:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    224e:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    2250:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    2252:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    2254:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    2256:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    2258:	.short 0xff6a
