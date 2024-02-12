
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
       4:	       move.l #282152,d3
       a:	       subi.l #282152,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #282152,d0
      18:	       cmpi.l #282152,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 44e28 <debugpal>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #282152,d3
      38:	       subi.l #282152,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #282152,d0
      46:	       cmpi.l #282152,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 44e28 <debugpal>,a2
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
      66:	                                                             subq.l #8,sp
      68:	                                                             movem.l d2-d7/a2-a6,-(sp)
	SysBase = *((struct ExecBase**)4UL);
      6c:	                                                             movea.l 4 <_start+0x4>,a6
      70:	                                                             move.l a6,75fc0 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                             move.l #14675968,75fbc <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                             lea 3cc7d <incbin_MercuryLetterData2Lz4_end+0x119>,a1
      86:	                                                             moveq #0,d0
      88:	                                                             jsr -552(a6)
      8c:	                                                             move.l d0,75fb8 <GfxBase>
	if (!GfxBase)
      92:	               /-------------------------------------------- beq.w 822 <main+0x7bc>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                             movea.l 75fc0 <SysBase>,a6
      9c:	               |                                             lea 3cc8e <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
      a2:	               |                                             moveq #0,d0
      a4:	               |                                             jsr -552(a6)
      a8:	               |                                             move.l d0,75fb4 <DOSBase>
	if (!DOSBase)
      ae:	         /-----|-------------------------------------------- beq.w 7bc <main+0x756>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|-------------------------------------------> pea 3cc9a <incbin_MercuryLetterData2Lz4_end+0x136>
      b8:	         |  |  |                                             lea 2352 <KPrintF>,a4
      be:	         |  |  |                                             jsr (a4)
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      c0:	         |  |  |                                             movea.l 75fb4 <DOSBase>,a6
      c6:	         |  |  |                                             jsr -60(a6)
      ca:	         |  |  |                                             movea.l 75fb4 <DOSBase>,a6
      d0:	         |  |  |                                             move.l d0,d1
      d2:	         |  |  |                                             move.l #249014,d2
      d8:	         |  |  |                                             moveq #15,d3
      da:	         |  |  |                                             jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                             movea.l 75fb4 <DOSBase>,a6
      e4:	         |  |  |                                             moveq #50,d1
      e6:	         |  |  |                                             jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
      ea:	         |  |  |                                             lea 66248 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      f0:	         |  |  |                                             suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      f2:	         |  |  |                                             suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
      f4:	         |  |  |                                             lea 669e <incbin_player_start>,a3
		__asm volatile (
      fa:	         |  |  |                                             movem.l d1-d7/a4-a6,-(sp)
      fe:	         |  |  |                                             jsr (a3)
     100:	         |  |  |                                             movem.l (sp)+,d1-d7/a4-a6

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     104:	         |  |  |                                             addq.l #4,sp
     106:	         |  |  |                                             tst.l d0
     108:	         |  |  |  /----------------------------------------- bne.w 73a <main+0x6d4>
	Forbid();
     10c:	         |  |  |  |  /-------------------------------------> movea.l 75fc0 <SysBase>,a6
     112:	         |  |  |  |  |                                       jsr -132(a6)
	SystemADKCON=custom->adkconr;
     116:	         |  |  |  |  |                                       movea.l 75fbc <custom>,a0
     11c:	         |  |  |  |  |                                       move.w 16(a0),d0
	SystemInts=custom->intenar;
     120:	         |  |  |  |  |                                       move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     124:	         |  |  |  |  |                                       move.w 2(a0),d0
	LoadView(0);
     128:	         |  |  |  |  |                                       movea.l 75fb8 <GfxBase>,a6
     12e:	         |  |  |  |  |                                       suba.l a1,a1
     130:	         |  |  |  |  |                                       jsr -222(a6)
	WaitTOF();
     134:	         |  |  |  |  |                                       movea.l 75fb8 <GfxBase>,a6
     13a:	         |  |  |  |  |                                       jsr -270(a6)
	WaitTOF();
     13e:	         |  |  |  |  |                                       movea.l 75fb8 <GfxBase>,a6
     144:	         |  |  |  |  |                                       jsr -270(a6)
	WaitVbl();
     148:	         |  |  |  |  |                                       lea a0a <WaitVbl>,a2
     14e:	         |  |  |  |  |                                       jsr (a2)
	WaitVbl();
     150:	         |  |  |  |  |                                       jsr (a2)
	OwnBlitter();
     152:	         |  |  |  |  |                                       movea.l 75fb8 <GfxBase>,a6
     158:	         |  |  |  |  |                                       jsr -456(a6)
	WaitBlit();	
     15c:	         |  |  |  |  |                                       movea.l 75fb8 <GfxBase>,a6
     162:	         |  |  |  |  |                                       jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     166:	         |  |  |  |  |                                       movea.l 75fbc <custom>,a0
     16c:	         |  |  |  |  |                                       move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     172:	         |  |  |  |  |                                       move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     178:	         |  |  |  |  |                                       move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     17e:	         |  |  |  |  |                                       moveq #0,d1
		custom->color[a]=0;
     180:	         |  |  |  |  |  /----------------------------------> move.l d1,d0
     182:	         |  |  |  |  |  |                                    addi.l #192,d0
     188:	         |  |  |  |  |  |                                    add.l d0,d0
     18a:	         |  |  |  |  |  |                                    move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     190:	         |  |  |  |  |  |                                    addq.l #1,d1
     192:	         |  |  |  |  |  |                                    moveq #32,d0
     194:	         |  |  |  |  |  |                                    cmp.l d1,d0
     196:	         |  |  |  |  |  +----------------------------------- bne.s 180 <main+0x11a>
	WaitVbl();
     198:	         |  |  |  |  |  |                                    jsr (a2)
	WaitVbl();
     19a:	         |  |  |  |  |  |                                    jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     19c:	         |  |  |  |  |  |                                    move.w #20090,46(sp)
     1a2:	         |  |  |  |  |  |                                    move.w #2049,48(sp)
     1a8:	         |  |  |  |  |  |                                    move.w #20083,50(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     1ae:	         |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     1b4:	         |  |  |  |  |  |                                    btst #0,297(a6)
     1ba:	/--------|--|--|--|--|--|----------------------------------- beq.w 996 <main+0x930>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1be:	|        |  |  |  |  |  |                                    moveq #46,d7
     1c0:	|        |  |  |  |  |  |                                    add.l sp,d7
     1c2:	|        |  |  |  |  |  |                                    exg d7,a5
     1c4:	|        |  |  |  |  |  |                                    jsr -30(a6)
     1c8:	|        |  |  |  |  |  |                                    exg d7,a5
	VBR=GetVBR();
     1ca:	|        |  |  |  |  |  |                                    move.l d0,75eb0 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1d0:	|        |  |  |  |  |  |                                    movea.l 75eb0 <VBR>,a0
     1d6:	|        |  |  |  |  |  |                                    move.l 108(a0),d0
		KPrintF("p61Init failed!\n");
#endif
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     1da:	|        |  |  |  |  |  |                                    jsr (a2)

	Sw_PrepareDisplay();
     1dc:	|        |  |  |  |  |  |                                    jsr 4858 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;	
     1e2:	|        |  |  |  |  |  |                                    movea.l 75fbc <custom>,a0
     1e8:	|        |  |  |  |  |  |                                    move.w #-31745,150(a0)
	custom->intena=0xc020;//Enable vblank
     1ee:	|        |  |  |  |  |  |                                    move.w #-16352,154(a0)

	while(SwScrollerFinished == 0) {
     1f4:	|        |  |  |  |  |  |                                    lea aca <Sw_Run>,a3
     1fa:	|        |  |  |  |  |  |                                    tst.w 75fb2 <SwScrollerFinished>
     200:	|  /-----|--|--|--|--|--|----------------------------------- bne.s 20c <main+0x1a6>
		Sw_Run();
     202:	|  |  /--|--|--|--|--|--|----------------------------------> jsr (a3)
	while(SwScrollerFinished == 0) {
     204:	|  |  |  |  |  |  |  |  |                                    tst.w 75fb2 <SwScrollerFinished>
     20a:	|  |  +--|--|--|--|--|--|----------------------------------- beq.s 202 <main+0x19c>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     20c:	|  >--|--|--|--|--|--|--|----------------------------------> movea.l 75fc0 <SysBase>,a6
     212:	|  |  |  |  |  |  |  |  |                                    movea.l 75ec0 <Sw_ScreenBuffer1>,a1
     218:	|  |  |  |  |  |  |  |  |                                    move.l #20560,d0
     21e:	|  |  |  |  |  |  |  |  |                                    jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     222:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     228:	|  |  |  |  |  |  |  |  |                                    movea.l 75ebc <Sw_ScreenBuffer2>,a1
     22e:	|  |  |  |  |  |  |  |  |                                    move.l #20560,d0
     234:	|  |  |  |  |  |  |  |  |                                    jsr -210(a6)
  FreeMem( Sw_ScreenBuffer3, BPLSIZE*BPLDEPTH);
     238:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     23e:	|  |  |  |  |  |  |  |  |                                    movea.l 75eb8 <Sw_ScreenBuffer3>,a1
     244:	|  |  |  |  |  |  |  |  |                                    move.l #20560,d0
     24a:	|  |  |  |  |  |  |  |  |                                    jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     24e:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     254:	|  |  |  |  |  |  |  |  |                                    movea.l 75eb4 <Sw_FontBuffer>,a1
     25a:	|  |  |  |  |  |  |  |  |                                    move.l #4000,d0
     260:	|  |  |  |  |  |  |  |  |                                    jsr -210(a6)
  FreeMem( Sw_font, 38000);
     264:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     26a:	|  |  |  |  |  |  |  |  |                                    lea 676c2 <incbin_Sw_font_start>,a1
     270:	|  |  |  |  |  |  |  |  |                                    move.l #38000,d0
     276:	|  |  |  |  |  |  |  |  |                                    jsr -210(a6)
	}
	Sw_Cleanup();

	WaitBlit();
     27a:	|  |  |  |  |  |  |  |  |                                    movea.l 75fb8 <GfxBase>,a6
     280:	|  |  |  |  |  |  |  |  |                                    jsr -228(a6)
		
	custom->dmacon = 0x83ff;
     284:	|  |  |  |  |  |  |  |  |                                    movea.l 75fbc <custom>,a0
     28a:	|  |  |  |  |  |  |  |  |                                    move.w #-31745,150(a0)
}


int PrepareDisplay() {

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     290:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     296:	|  |  |  |  |  |  |  |  |                                    move.l #25000,d0
     29c:	|  |  |  |  |  |  |  |  |                                    moveq #0,d1
     29e:	|  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     2a2:	|  |  |  |  |  |  |  |  |                                    move.l d0,75fa4 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     2a8:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     2ae:	|  |  |  |  |  |  |  |  |                                    move.l #120000,d0
     2b4:	|  |  |  |  |  |  |  |  |                                    moveq #2,d1
     2b6:	|  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     2ba:	|  |  |  |  |  |  |  |  |                                    move.l d0,75fa0 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     2c0:	|  |  |  |  |  |  |  |  |                                    pea 3 <_start+0x3>
     2c4:	|  |  |  |  |  |  |  |  |                                    pea 2710 <DrawRect+0x34c>
     2c8:	|  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     2ca:	|  |  |  |  |  |  |  |  |                                    lea a96 <Utils_FillLong.constprop.0>,a3
     2d0:	|  |  |  |  |  |  |  |  |                                    jsr (a3)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     2d2:	|  |  |  |  |  |  |  |  |                                    movea.l 75fb8 <GfxBase>,a6
     2d8:	|  |  |  |  |  |  |  |  |                                    jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     2dc:	|  |  |  |  |  |  |  |  |                                    move.w #-1,dff044 <_end+0xd89080>
  custom->bltalwm = 0xffff; //Static
     2e4:	|  |  |  |  |  |  |  |  |                                    move.w #-1,dff046 <_end+0xd89082>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     2ec:	|  |  |  |  |  |  |  |  |                                    movea.l 75fa0 <LineBuffer>,a5
  for( WORD i=0;i <=5;i++) {
     2f2:	|  |  |  |  |  |  |  |  |                                    movea.l a5,a1
     2f4:	|  |  |  |  |  |  |  |  |                                    lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     2f8:	|  |  |  |  |  |  |  |  |                                    moveq #0,d5
  for( WORD i=0;i <=5;i++) {
     2fa:	|  |  |  |  |  |  |  |  |                                    clr.w d4
      data = data >> i2;
     2fc:	|  |  |  |  |  |  |  |  |                                    moveq #0,d3
     2fe:	|  |  |  |  |  |  |  |  |                                    not.w d3
	APTR vbr = 0;
     300:	|  |  |  |  |  |  |  |  |                                    movea.l a1,a0
     302:	|  |  |  |  |  |  |  |  |                                    moveq #1,d1
     304:	|  |  |  |  |  |  |  |  |                          /-------> move.l d3,d2
     306:	|  |  |  |  |  |  |  |  |                          |         asr.l d1,d2
      data = data ^ 0xffff;
     308:	|  |  |  |  |  |  |  |  |                          |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     30a:	|  |  |  |  |  |  |  |  |                          |         move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     310:	|  |  |  |  |  |  |  |  |                          |     /-> move.w dff002 <_end+0xd8903e>,d0
     316:	|  |  |  |  |  |  |  |  |                          |     |   btst #14,d0
     31a:	|  |  |  |  |  |  |  |  |                          |     \-- bne.s 310 <main+0x2aa>
  custom->bltcon0 = 0x01f0;
     31c:	|  |  |  |  |  |  |  |  |                          |         move.w #496,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0;
     324:	|  |  |  |  |  |  |  |  |                          |         move.w #0,dff042 <_end+0xd8907e>
  custom->bltadat = data;
     32c:	|  |  |  |  |  |  |  |  |                          |         move.w d2,dff074 <_end+0xd890b0>
  custom->bltdpt = Target;  
     332:	|  |  |  |  |  |  |  |  |                          |         move.l a0,dff054 <_end+0xd89090>
  custom->bltdmod = mod;
     338:	|  |  |  |  |  |  |  |  |                          |         move.w #10,dff066 <_end+0xd890a2>
  custom->bltsize = lines*64+linelength;
     340:	|  |  |  |  |  |  |  |  |                          |         move.w #6401,dff058 <_end+0xd89094>
    for( WORD i2=1;i2<=16; i2++) {        
     348:	|  |  |  |  |  |  |  |  |                          |         addq.l #1,d1
     34a:	|  |  |  |  |  |  |  |  |                          |         lea 1200(a0),a0
     34e:	|  |  |  |  |  |  |  |  |                          |         moveq #17,d0
     350:	|  |  |  |  |  |  |  |  |                          |         cmp.l d1,d0
     352:	|  |  |  |  |  |  |  |  |                          +-------- bne.s 304 <main+0x29e>
    if( i > 0) {
     354:	|  |  |  |  |  |  |  |  |                          |         tst.w d4
     356:	|  |  |  |  |  |  |  |  |                          |     /-- bne.s 36a <main+0x304>
    startbuffer += repeats*linesize*2*16;
     358:	|  |  |  |  |  |  |  |  |                          |     |   lea 19200(a5),a5
  for( WORD i=0;i <=5;i++) {
     35c:	|  |  |  |  |  |  |  |  |                          |     |   lea 19202(a1),a1
     360:	|  |  |  |  |  |  |  |  |                          |     |   addq.l #2,d5
     362:	|  |  |  |  |  |  |  |  |                          |     |   moveq #1,d4
     364:	|  |  |  |  |  |  |  |  |                          |     |   movea.l a1,a0
     366:	|  |  |  |  |  |  |  |  |                          |     |   moveq #1,d1
     368:	|  |  |  |  |  |  |  |  |                          +-----|-- bra.s 304 <main+0x29e>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     36a:	|  |  |  |  |  |  |  |  |                          |     \-> moveq #12,d0
     36c:	|  |  |  |  |  |  |  |  |                          |         sub.w d5,d0
     36e:	|  |  |  |  |  |  |  |  |                          |         movea.w d0,a0
     370:	|  |  |  |  |  |  |  |  |                          |         move.w d4,d6
     372:	|  |  |  |  |  |  |  |  |                          |         addi.w #-32768,d6
     376:	|  |  |  |  |  |  |  |  |                          |         move.l a5,d1
     378:	|  |  |  |  |  |  |  |  |                          |         move.l a5,d2
     37a:	|  |  |  |  |  |  |  |  |                          |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     380:	|  |  |  |  |  |  |  |  |                          |  /----> move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     386:	|  |  |  |  |  |  |  |  |                          |  |  /-> move.w dff002 <_end+0xd8903e>,d0
     38c:	|  |  |  |  |  |  |  |  |                          |  |  |   btst #14,d0
     390:	|  |  |  |  |  |  |  |  |                          |  |  \-- bne.s 386 <main+0x320>
  custom->bltcon0 = 0x01f0;
     392:	|  |  |  |  |  |  |  |  |                          |  |      move.w #496,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0;
     39a:	|  |  |  |  |  |  |  |  |                          |  |      move.w #0,dff042 <_end+0xd8907e>
  custom->bltadat = data;
     3a2:	|  |  |  |  |  |  |  |  |                          |  |      move.w #-1,dff074 <_end+0xd890b0>
  custom->bltdpt = Target;  
     3aa:	|  |  |  |  |  |  |  |  |                          |  |      move.l d1,dff054 <_end+0xd89090>
  custom->bltdmod = mod;
     3b0:	|  |  |  |  |  |  |  |  |                          |  |      move.w a0,dff066 <_end+0xd890a2>
  custom->bltsize = lines*64+linelength;
     3b6:	|  |  |  |  |  |  |  |  |                          |  |      move.w d6,dff058 <_end+0xd89094>
      while( height > 512) {
     3bc:	|  |  |  |  |  |  |  |  |                          |  |      addi.l #6144,d1
     3c2:	|  |  |  |  |  |  |  |  |                          |  |      cmp.l d2,d1
     3c4:	|  |  |  |  |  |  |  |  |                          |  \----- bne.s 380 <main+0x31a>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     3c6:	|  |  |  |  |  |  |  |  |                          |         move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3cc:	|  |  |  |  |  |  |  |  |                          |     /-> move.w dff002 <_end+0xd8903e>,d0
     3d2:	|  |  |  |  |  |  |  |  |                          |     |   btst #14,d0
     3d6:	|  |  |  |  |  |  |  |  |                          |     \-- bne.s 3cc <main+0x366>
  custom->bltcon0 = 0x01f0;
     3d8:	|  |  |  |  |  |  |  |  |                          |         move.w #496,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0;
     3e0:	|  |  |  |  |  |  |  |  |                          |         move.w #0,dff042 <_end+0xd8907e>
  custom->bltadat = data;
     3e8:	|  |  |  |  |  |  |  |  |                          |         move.w #-1,dff074 <_end+0xd890b0>
  custom->bltdpt = Target;  
     3f0:	|  |  |  |  |  |  |  |  |                          |         move.l d1,dff054 <_end+0xd89090>
  custom->bltdmod = mod;
     3f6:	|  |  |  |  |  |  |  |  |                          |         move.w a0,dff066 <_end+0xd890a2>
  custom->bltsize = lines*64+linelength;
     3fc:	|  |  |  |  |  |  |  |  |                          |         move.w d4,d0
     3fe:	|  |  |  |  |  |  |  |  |                          |         addi.w #4096,d0
     402:	|  |  |  |  |  |  |  |  |                          |         move.w d0,dff058 <_end+0xd89094>
  for( WORD i=0;i <=5;i++) {
     408:	|  |  |  |  |  |  |  |  |                          |         addi.w #-4095,d0
     40c:	|  |  |  |  |  |  |  |  |                          |         cmpi.w #5,d4
     410:	|  |  |  |  |  |  |  |  |                          |     /-- beq.s 426 <main+0x3c0>
    startbuffer += repeats*linesize*2*16;
     412:	|  |  |  |  |  |  |  |  |                          |     |   lea 19200(a5),a5
  for( WORD i=0;i <=5;i++) {
     416:	|  |  |  |  |  |  |  |  |                          |     |   move.w d0,d4
     418:	|  |  |  |  |  |  |  |  |                          |     |   lea 19202(a1),a1
     41c:	|  |  |  |  |  |  |  |  |                          |     |   addq.l #2,d5
     41e:	|  |  |  |  |  |  |  |  |                          |     |   movea.l a1,a0
     420:	|  |  |  |  |  |  |  |  |                          |     |   moveq #1,d1
     422:	|  |  |  |  |  |  |  |  |                          \-----|-- bra.w 304 <main+0x29e>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     426:	|  |  |  |  |  |  |  |  |                                \-> movea.l 75fc0 <SysBase>,a6
     42c:	|  |  |  |  |  |  |  |  |                                    move.l #33024,d0
     432:	|  |  |  |  |  |  |  |  |                                    moveq #2,d1
     434:	|  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     438:	|  |  |  |  |  |  |  |  |                                    move.l d0,d2
     43a:	|  |  |  |  |  |  |  |  |                                    move.l d0,75f9c <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     440:	|  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     444:	|  |  |  |  |  |  |  |  |                                    pea 204 <main+0x19e>
     448:	|  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     44a:	|  |  |  |  |  |  |  |  |                                    jsr (a3)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     44c:	|  |  |  |  |  |  |  |  |                                    pea 2 <_start+0x2>
     450:	|  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     454:	|  |  |  |  |  |  |  |  |                                    pea 3ccd7 <incbin_MercuryLetterData2Lz4_end+0x173>
     45a:	|  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     45c:	|  |  |  |  |  |  |  |  |                                    lea 423c <debug_register_bitmap.constprop.0>,a5
     462:	|  |  |  |  |  |  |  |  |                                    jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     464:	|  |  |  |  |  |  |  |  |                                    movea.l 75fc0 <SysBase>,a6
     46a:	|  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     470:	|  |  |  |  |  |  |  |  |                                    moveq #2,d1
     472:	|  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     476:	|  |  |  |  |  |  |  |  |                                    move.l d0,75f98 <Bitmap1>
  if(Bitmap1 == 0) {
     47c:	|  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     480:	|  |  |  |  |  |  |  |  |        /-------------------------- beq.w 90c <main+0x8a6>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     484:	|  |  |  |  |  |  |  |  |        |                           pea 3 <_start+0x3>
     488:	|  |  |  |  |  |  |  |  |        |                           pea 100 <main+0x9a>
     48c:	|  |  |  |  |  |  |  |  |        |                           pea 3cd08 <incbin_MercuryLetterData2Lz4_end+0x1a4>
     492:	|  |  |  |  |  |  |  |  |        |                           move.l d0,-(sp)
     494:	|  |  |  |  |  |  |  |  |        |                           jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     496:	|  |  |  |  |  |  |  |  |        |                           move.l 75f98 <Bitmap1>,d2
     49c:	|  |  |  |  |  |  |  |  |        |                           pea 10 <_start+0x10>
     4a0:	|  |  |  |  |  |  |  |  |        |                           pea 306 <main+0x2a0>
     4a4:	|  |  |  |  |  |  |  |  |        |                           move.l d2,-(sp)
     4a6:	|  |  |  |  |  |  |  |  |        |                           jsr (a3)

  ScreenBuffer1.BitPlane = Bitmap1;
     4a8:	|  |  |  |  |  |  |  |  |        |                           move.l d2,75f60 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     4ae:	|  |  |  |  |  |  |  |  |        |                           clr.l 75f64 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     4b4:	|  |  |  |  |  |  |  |  |        |                           clr.l 75f70 <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4ba:	|  |  |  |  |  |  |  |  |        |                           movea.l 75fc0 <SysBase>,a6
     4c0:	|  |  |  |  |  |  |  |  |        |                           move.l #49536,d0
     4c6:	|  |  |  |  |  |  |  |  |        |                           moveq #2,d1
     4c8:	|  |  |  |  |  |  |  |  |        |                           jsr -198(a6)
     4cc:	|  |  |  |  |  |  |  |  |        |                           move.l d0,75f5c <Bitmap2>
  if(Bitmap2 == 0) {
     4d2:	|  |  |  |  |  |  |  |  |        |                           lea 28(sp),sp
     4d6:	|  |  |  |  |  |  |  |  |  /-----|-------------------------- beq.w 882 <main+0x81c>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     4da:	|  |  |  |  |  |  |  |  |  |  /--|-------------------------> pea 3 <_start+0x3>
     4de:	|  |  |  |  |  |  |  |  |  |  |  |                           pea 100 <main+0x9a>
     4e2:	|  |  |  |  |  |  |  |  |  |  |  |                           pea 3cd39 <incbin_MercuryLetterData2Lz4_end+0x1d5>
     4e8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l d0,-(sp)
     4ea:	|  |  |  |  |  |  |  |  |  |  |  |                           jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     4ec:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l 75f5c <Bitmap2>,d2
     4f2:	|  |  |  |  |  |  |  |  |  |  |  |                           pea 10 <_start+0x10>
     4f6:	|  |  |  |  |  |  |  |  |  |  |  |                           pea 306 <main+0x2a0>
     4fa:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l d2,-(sp)
     4fc:	|  |  |  |  |  |  |  |  |  |  |  |                           jsr (a3)

  ScreenBuffer2.BitPlane = Bitmap2;
     4fe:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l d2,75f24 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     504:	|  |  |  |  |  |  |  |  |  |  |  |                           clr.l 75f28 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     50a:	|  |  |  |  |  |  |  |  |  |  |  |                           clr.l 75f34 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     510:	|  |  |  |  |  |  |  |  |  |  |  |                           movea.l 75fc0 <SysBase>,a6
     516:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l #49536,d0
     51c:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #2,d1
     51e:	|  |  |  |  |  |  |  |  |  |  |  |                           jsr -198(a6)
     522:	|  |  |  |  |  |  |  |  |  |  |  |                           move.l d0,75f20 <Bitmap3>
  if(Bitmap3 == 0) {
     528:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 28(sp),sp
     52c:	|  |  |  |  |  |  |  |  |  |  |  |  /----------------------- beq.w 84e <main+0x7e8>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     530:	|  |  |  |  |  |  |  |  |  |  |  |  |  /-------------------> pea 3 <_start+0x3>
     534:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     pea 100 <main+0x9a>
     538:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     pea 3cd6a <incbin_MercuryLetterData2Lz4_end+0x206>
     53e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,-(sp)
     540:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     542:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 75f20 <Bitmap3>,d2
     548:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     pea 10 <_start+0x10>
     54c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     pea 306 <main+0x2a0>
     550:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,-(sp)
     552:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)

  ScreenBuffer3.BitPlane = Bitmap3;
     554:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 75ee8 <ScreenBuffer3>,a3
     55a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     55c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     clr.l 75eec <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     562:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     clr.l 75ef8 <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     568:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 1f56 <Clbuild>,a5
     56e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
     570:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,d3
  DrawCopper = Clbuild( );
     572:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
     574:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,d2
     576:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,75fac <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     57c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483168,75ec4 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     586:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483108,75ec8 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,75ecc <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     596:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,75ed0 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     59c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483168,75ed4 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     5a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483108,75ed8 <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     5b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483108,75edc <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     5ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,75ee0 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     5c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #483168,75ee4 <ScreenBufferList+0x20>

  SetBplPointers(); 
     5ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 22b6 <SetBplPointers>,a3
     5d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     5d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d3,75fac <DrawCopper>
  ViewCopper = tmp;
     5d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,75fa8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     5de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,dff080 <_end+0xd890bc>
  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     5e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fc0 <SysBase>,a6
     5ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #22,d0
     5ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #65537,d1
     5f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -198(a6)
     5f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l d0,a1
     5f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 28(sp),sp
     5fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     tst.l d0
     5fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- beq.s 61a <main+0x5b4>
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     600:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #708,8(a1)
    Vbint->is_Node.ln_Name = "VertB-Example";
     606:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.l #248943,10(a1)
    Vbint->is_Data = NULL;
     60e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.l #2674,18(a1)
  AddIntServer( INTB_VERTB, Vbint); 
     61a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> movea.l 75fc0 <SysBase>,a6
     620:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #5,d0
     622:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -168(a6)
	PrepareDisplay();	
	custom->intena=0xc020;//Enable vblank
     626:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fbc <custom>,a0
     62c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
     632:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
  UBYTE *tmp = DrawCopper;
     634:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 75fac <DrawCopper>,d0
  DrawCopper = ViewCopper;
     63a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 75fa8 <ViewCopper>,75fac <DrawCopper>
  ViewCopper = tmp;
     644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,75fa8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     64a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,dff080 <_end+0xd890bc>
	//LoadVectors();
	SwapCl();
	WaitVbl();	
     650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
     652:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 4bec <DrawScreen>,a5

	while(1) {		
		DrawScreen();
     658:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
		SetBplPointers();
     65a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     65c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w f0ff60 <_end+0xe99f9c>,d0
     662:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #20153,d0
     666:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /----------- beq.s 6d8 <main+0x672>
     668:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |     /----> cmpi.w #-24562,d0
     66c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        +-----|----- beq.s 6d8 <main+0x672>
		debug_start_idle();
		while(FrameCounter<2);
     66e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----|----> move.w 75fb0 <FrameCounter>,d0
     674:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |      cmpi.w #1,d0
     678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-----|----- bls.s 66e <main+0x608>
		if(FrameCounter >= 3) {
     67a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----|----> move.w 75fb0 <FrameCounter>,d0
     680:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      cmpi.w #2,d0
     684:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  /-- bls.s 690 <main+0x62a>
    		KPrintF("Framerate below 25FPS\n");
     686:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   pea 3cd76 <incbin_MercuryLetterData2Lz4_end+0x212>
     68c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   jsr (a4)
     68e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   addq.l #4,sp
		}
		FrameCounter = 0;
     690:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \-> move.w #0,75fb0 <FrameCounter>
		WaitVbl();
     698:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      jsr (a2)
     69a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      move.w f0ff60 <_end+0xe99f9c>,d0
     6a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      cmpi.w #20153,d0
     6a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  /-- beq.s 704 <main+0x69e>
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   cmpi.w #-24562,d0
     6aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  +-- beq.s 704 <main+0x69e>
  UBYTE *tmp = DrawCopper;
     6ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l 75fac <DrawCopper>,d0
  DrawCopper = ViewCopper;
     6b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l 75fa8 <ViewCopper>,75fac <DrawCopper>
  ViewCopper = tmp;
     6bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l d0,75fa8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     6c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l d0,dff080 <_end+0xd890bc>
		DrawScreen();
     6c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-> jsr (a5)
		SetBplPointers();
     6ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a3)
     6cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w f0ff60 <_end+0xe99f9c>,d0
     6d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmpi.w #20153,d0
     6d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-- bne.s 668 <main+0x602>
		UaeLib(88, arg1, arg2, arg3, arg4);
     6d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-----|-> clr.l -(sp)
     6da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   clr.l -(sp)
     6dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 1 <_start+0x1>
     6e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 5 <_start+0x5>
     6e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 58 <_start+0x58>
     6e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   jsr f0ff60 <_end+0xe99f9c>
	}
}
     6ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   lea 20(sp),sp
		while(FrameCounter<2);
     6f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   move.w 75fb0 <FrameCounter>,d0
     6f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   cmpi.w #1,d0
     6fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-----|-----|-- bls.w 66e <main+0x608>
     700:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     \-----|-----|-- bra.w 67a <main+0x614>
		UaeLib(88, arg1, arg2, arg3, arg4);
     704:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |     \-> clr.l -(sp)
     706:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.l -(sp)
     708:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.l -(sp)
     70a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         pea 5 <_start+0x5>
     70e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         pea 58 <_start+0x58>
     712:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         jsr f0ff60 <_end+0xe99f9c>
}
     718:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     71c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l 75fac <DrawCopper>,d0
  DrawCopper = ViewCopper;
     722:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l 75fa8 <ViewCopper>,75fac <DrawCopper>
  ViewCopper = tmp;
     72c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l d0,75fa8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     732:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l d0,dff080 <_end+0xd890bc>
	while(1) {		
     738:	|  |  |  |  |  |  |  |  |  |  |  |  |  |           \-------- bra.s 6c8 <main+0x662>
		KPrintF("p61Init failed!\n");
     73a:	|  |  |  |  |  |  >--|--|--|--|--|--|--|-------------------> pea 3ccc6 <incbin_MercuryLetterData2Lz4_end+0x162>
     740:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a4)
     742:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     addq.l #4,sp
	Forbid();
     744:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fc0 <SysBase>,a6
     74a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -132(a6)
	SystemADKCON=custom->adkconr;
     74e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fbc <custom>,a0
     754:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 16(a0),d0
	SystemInts=custom->intenar;
     758:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     75c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 2(a0),d0
	LoadView(0);
     760:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fb8 <GfxBase>,a6
     766:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     suba.l a1,a1
     768:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -222(a6)
	WaitTOF();
     76c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fb8 <GfxBase>,a6
     772:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -270(a6)
	WaitTOF();
     776:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fb8 <GfxBase>,a6
     77c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -270(a6)
	WaitVbl();
     780:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea a0a <WaitVbl>,a2
     786:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
	WaitVbl();
     788:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
	OwnBlitter();
     78a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fb8 <GfxBase>,a6
     790:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -456(a6)
	WaitBlit();	
     794:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fb8 <GfxBase>,a6
     79a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     79e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 75fbc <custom>,a0
     7a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     7aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     7b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     7b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
     7b8:	|  |  |  |  |  |  |  |  \--|--|--|--|--|-------------------- bra.w 180 <main+0x11a>
		Exit(0);
     7bc:	|  |  |  >--|--|--|--|-----|--|--|--|--|-------------------> suba.l a6,a6
     7be:	|  |  |  |  |  |  |  |     |  |  |  |  |                     moveq #0,d1
     7c0:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     7c4:	|  |  |  |  |  |  |  |     |  |  |  |  |                     pea 3cc9a <incbin_MercuryLetterData2Lz4_end+0x136>
     7ca:	|  |  |  |  |  |  |  |     |  |  |  |  |                     lea 2352 <KPrintF>,a4
     7d0:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr (a4)
	Write(Output(), (APTR)"Hello console!\n", 15);
     7d2:	|  |  |  |  |  |  |  |     |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     7d8:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr -60(a6)
     7dc:	|  |  |  |  |  |  |  |     |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     7e2:	|  |  |  |  |  |  |  |     |  |  |  |  |                     move.l d0,d1
     7e4:	|  |  |  |  |  |  |  |     |  |  |  |  |                     move.l #249014,d2
     7ea:	|  |  |  |  |  |  |  |     |  |  |  |  |                     moveq #15,d3
     7ec:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr -48(a6)
	Delay(50);
     7f0:	|  |  |  |  |  |  |  |     |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     7f6:	|  |  |  |  |  |  |  |     |  |  |  |  |                     moveq #50,d1
     7f8:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
     7fc:	|  |  |  |  |  |  |  |     |  |  |  |  |                     lea 66248 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     802:	|  |  |  |  |  |  |  |     |  |  |  |  |                     suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     804:	|  |  |  |  |  |  |  |     |  |  |  |  |                     suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     806:	|  |  |  |  |  |  |  |     |  |  |  |  |                     lea 669e <incbin_player_start>,a3
		__asm volatile (
     80c:	|  |  |  |  |  |  |  |     |  |  |  |  |                     movem.l d1-d7/a4-a6,-(sp)
     810:	|  |  |  |  |  |  |  |     |  |  |  |  |                     jsr (a3)
     812:	|  |  |  |  |  |  |  |     |  |  |  |  |                     movem.l (sp)+,d1-d7/a4-a6
	if(p61Init(module) != 0)
     816:	|  |  |  |  |  |  |  |     |  |  |  |  |                     addq.l #4,sp
     818:	|  |  |  |  |  |  |  |     |  |  |  |  |                     tst.l d0
     81a:	|  |  |  |  |  |  |  \-----|--|--|--|--|-------------------- beq.w 10c <main+0xa6>
     81e:	|  |  |  |  |  |  \--------|--|--|--|--|-------------------- bra.w 73a <main+0x6d4>
		Exit(0);
     822:	|  |  |  |  |  \-----------|--|--|--|--|-------------------> movea.l 75fb4 <DOSBase>,a6
     828:	|  |  |  |  |              |  |  |  |  |                     moveq #0,d1
     82a:	|  |  |  |  |              |  |  |  |  |                     jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     82e:	|  |  |  |  |              |  |  |  |  |                     movea.l 75fc0 <SysBase>,a6
     834:	|  |  |  |  |              |  |  |  |  |                     lea 3cc8e <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
     83a:	|  |  |  |  |              |  |  |  |  |                     moveq #0,d0
     83c:	|  |  |  |  |              |  |  |  |  |                     jsr -552(a6)
     840:	|  |  |  |  |              |  |  |  |  |                     move.l d0,75fb4 <DOSBase>
	if (!DOSBase)
     846:	|  |  |  |  \--------------|--|--|--|--|-------------------- bne.w b2 <main+0x4c>
     84a:	|  |  |  \-----------------|--|--|--|--|-------------------- bra.w 7bc <main+0x756>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     84e:	|  |  |                    |  |  |  >--|-------------------> movea.l 75fb4 <DOSBase>,a6
     854:	|  |  |                    |  |  |  |  |                     jsr -60(a6)
     858:	|  |  |                    |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     85e:	|  |  |                    |  |  |  |  |                     move.l d0,d1
     860:	|  |  |                    |  |  |  |  |                     move.l #249157,d2
     866:	|  |  |                    |  |  |  |  |                     moveq #38,d3
     868:	|  |  |                    |  |  |  |  |                     jsr -48(a6)
    Exit(1);
     86c:	|  |  |                    |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     872:	|  |  |                    |  |  |  |  |                     moveq #1,d1
     874:	|  |  |                    |  |  |  |  |                     jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     878:	|  |  |                    |  |  |  |  |                     move.l 75f20 <Bitmap3>,d0
     87e:	|  |  |                    |  |  |  |  +-------------------- bra.w 530 <main+0x4ca>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     882:	|  |  |                    >--|--|--|--|-------------------> movea.l 75fb4 <DOSBase>,a6
     888:	|  |  |                    |  |  |  |  |                     jsr -60(a6)
     88c:	|  |  |                    |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     892:	|  |  |                    |  |  |  |  |                     move.l d0,d1
     894:	|  |  |                    |  |  |  |  |                     move.l #249108,d2
     89a:	|  |  |                    |  |  |  |  |                     moveq #38,d3
     89c:	|  |  |                    |  |  |  |  |                     jsr -48(a6)
    Exit(1);
     8a0:	|  |  |                    |  |  |  |  |                     movea.l 75fb4 <DOSBase>,a6
     8a6:	|  |  |                    |  |  |  |  |                     moveq #1,d1
     8a8:	|  |  |                    |  |  |  |  |                     jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     8ac:	|  |  |                    |  |  |  |  |                     move.l 75f5c <Bitmap2>,d0
     8b2:	|  |  |                    |  |  |  |  |                     pea 3 <_start+0x3>
     8b6:	|  |  |                    |  |  |  |  |                     pea 100 <main+0x9a>
     8ba:	|  |  |                    |  |  |  |  |                     pea 3cd39 <incbin_MercuryLetterData2Lz4_end+0x1d5>
     8c0:	|  |  |                    |  |  |  |  |                     move.l d0,-(sp)
     8c2:	|  |  |                    |  |  |  |  |                     jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     8c4:	|  |  |                    |  |  |  |  |                     move.l 75f5c <Bitmap2>,d2
     8ca:	|  |  |                    |  |  |  |  |                     pea 10 <_start+0x10>
     8ce:	|  |  |                    |  |  |  |  |                     pea 306 <main+0x2a0>
     8d2:	|  |  |                    |  |  |  |  |                     move.l d2,-(sp)
     8d4:	|  |  |                    |  |  |  |  |                     jsr (a3)
  ScreenBuffer2.BitPlane = Bitmap2;
     8d6:	|  |  |                    |  |  |  |  |                     move.l d2,75f24 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     8dc:	|  |  |                    |  |  |  |  |                     clr.l 75f28 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     8e2:	|  |  |                    |  |  |  |  |                     clr.l 75f34 <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     8e8:	|  |  |                    |  |  |  |  |                     movea.l 75fc0 <SysBase>,a6
     8ee:	|  |  |                    |  |  |  |  |                     move.l #49536,d0
     8f4:	|  |  |                    |  |  |  |  |                     moveq #2,d1
     8f6:	|  |  |                    |  |  |  |  |                     jsr -198(a6)
     8fa:	|  |  |                    |  |  |  |  |                     move.l d0,75f20 <Bitmap3>
  if(Bitmap3 == 0) {
     900:	|  |  |                    |  |  |  |  |                     lea 28(sp),sp
     904:	|  |  |                    |  |  |  |  \-------------------- bne.w 530 <main+0x4ca>
     908:	|  |  |                    |  |  |  \----------------------- bra.w 84e <main+0x7e8>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     90c:	|  |  |                    |  |  \-------------------------> movea.l 75fb4 <DOSBase>,a6
     912:	|  |  |                    |  |                              jsr -60(a6)
     916:	|  |  |                    |  |                              movea.l 75fb4 <DOSBase>,a6
     91c:	|  |  |                    |  |                              move.l d0,d1
     91e:	|  |  |                    |  |                              move.l #249059,d2
     924:	|  |  |                    |  |                              moveq #38,d3
     926:	|  |  |                    |  |                              jsr -48(a6)
    Exit(1);
     92a:	|  |  |                    |  |                              movea.l 75fb4 <DOSBase>,a6
     930:	|  |  |                    |  |                              moveq #1,d1
     932:	|  |  |                    |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     936:	|  |  |                    |  |                              move.l 75f98 <Bitmap1>,d0
     93c:	|  |  |                    |  |                              pea 3 <_start+0x3>
     940:	|  |  |                    |  |                              pea 100 <main+0x9a>
     944:	|  |  |                    |  |                              pea 3cd08 <incbin_MercuryLetterData2Lz4_end+0x1a4>
     94a:	|  |  |                    |  |                              move.l d0,-(sp)
     94c:	|  |  |                    |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     94e:	|  |  |                    |  |                              move.l 75f98 <Bitmap1>,d2
     954:	|  |  |                    |  |                              pea 10 <_start+0x10>
     958:	|  |  |                    |  |                              pea 306 <main+0x2a0>
     95c:	|  |  |                    |  |                              move.l d2,-(sp)
     95e:	|  |  |                    |  |                              jsr (a3)
  ScreenBuffer1.BitPlane = Bitmap1;
     960:	|  |  |                    |  |                              move.l d2,75f60 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     966:	|  |  |                    |  |                              clr.l 75f64 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     96c:	|  |  |                    |  |                              clr.l 75f70 <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     972:	|  |  |                    |  |                              movea.l 75fc0 <SysBase>,a6
     978:	|  |  |                    |  |                              move.l #49536,d0
     97e:	|  |  |                    |  |                              moveq #2,d1
     980:	|  |  |                    |  |                              jsr -198(a6)
     984:	|  |  |                    |  |                              move.l d0,75f5c <Bitmap2>
  if(Bitmap2 == 0) {
     98a:	|  |  |                    |  |                              lea 28(sp),sp
     98e:	|  |  |                    |  \----------------------------- bne.w 4da <main+0x474>
     992:	|  |  |                    \-------------------------------- bra.w 882 <main+0x81c>
	APTR vbr = 0;
     996:	\--|--|----------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     998:	   |  |                                                      move.l d0,75eb0 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     99e:	   |  |                                                      movea.l 75eb0 <VBR>,a0
     9a4:	   |  |                                                      move.l 108(a0),d0
	WaitVbl();
     9a8:	   |  |                                                      jsr (a2)
	Sw_PrepareDisplay();
     9aa:	   |  |                                                      jsr 4858 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;	
     9b0:	   |  |                                                      movea.l 75fbc <custom>,a0
     9b6:	   |  |                                                      move.w #-31745,150(a0)
	custom->intena=0xc020;//Enable vblank
     9bc:	   |  |                                                      move.w #-16352,154(a0)
	while(SwScrollerFinished == 0) {
     9c2:	   |  |                                                      lea aca <Sw_Run>,a3
     9c8:	   |  |                                                      tst.w 75fb2 <SwScrollerFinished>
     9ce:	   |  \----------------------------------------------------- beq.w 202 <main+0x19c>
     9d2:	   \-------------------------------------------------------- bra.w 20c <main+0x1a6>
     9d6:	                                                             nop

000009d8 <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     9d8:	subq.l #4,sp
     9da:	move.l 16(sp),d0
     9de:	move.w d0,d0
     9e0:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     9e4:	moveq #11,d0
     9e6:	add.l 8(sp),d0
     9ea:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     9ec:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     9f0:	moveq #0,d0
     9f2:	move.w 2(sp),d0
	__asm volatile (
     9f6:	movem.l d0-d7/a2-a6,-(sp)
     9fa:	jsr 5814 <_lz4_depack>
     a00:	movem.l (sp)+,d0-d7/a2-a6
}
     a04:	nop
     a06:	addq.l #4,sp
     a08:	rts

00000a0a <WaitVbl>:
void WaitVbl() {
     a0a:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     a0c:	/-> move.l dff004 <_end+0xd89040>,d0
     a12:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     a14:	|   move.l (sp),d0
     a16:	|   andi.l #130816,d0
     a1c:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     a1e:	|   move.l (sp),d0
     a20:	|   cmpi.l #79616,d0
     a26:	\-- beq.s a0c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     a28:	/-> move.l dff004 <_end+0xd89040>,d0
     a2e:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     a32:	|   move.l 4(sp),d0
     a36:	|   andi.l #130816,d0
     a3c:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     a40:	|   move.l 4(sp),d0
     a44:	|   cmpi.l #79616,d0
     a4a:	\-- bne.s a28 <WaitVbl+0x1e>
}
     a4c:	    addq.l #8,sp
     a4e:	    rts

00000a50 <p61Music>:
	void p61Music() {
     a50:	move.l a6,-(sp)
     a52:	move.l a3,-(sp)
		register volatile const void* _a3 ASM("a3") = player;
     a54:	lea 669e <incbin_player_start>,a3
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
     a5a:	movea.l #14675968,a6
		__asm volatile (
     a60:	movem.l d0-a2/a4-a5,-(sp)
     a64:	jsr 4(a3)
     a68:	movem.l (sp)+,d0-a2/a4-a5
	}
     a6c:	movea.l (sp)+,a3
     a6e:	movea.l (sp)+,a6
     a70:	rts

00000a72 <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     a72:	move.w #32,dff09c <_end+0xd890d8>
  custom->intreq = 1 << INTB_VERTB;
     a7a:	move.w #32,dff09c <_end+0xd890d8>
  p61Music();
     a82:	jsr a50 <p61Music>(pc)
  FrameCounter++;
     a86:	move.w 75fb0 <FrameCounter>,d0
     a8c:	addq.w #1,d0
     a8e:	move.w d0,75fb0 <FrameCounter>
}
     a94:	rts

00000a96 <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
     a96:	    movem.l d2-d5/a2,-(sp)
     a9a:	    move.l 24(sp),d3
     a9e:	    move.l 28(sp),d5
      *target++ = pattern;
     aa2:	    move.l 32(sp),d4
     aa6:	    add.l d4,d4
     aa8:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
     aaa:	    moveq #0,d2
     aac:	    lea 551e <memset>(pc),a2
      *target++ = pattern;
     ab0:	/-> move.l d4,-(sp)
     ab2:	|   clr.l -(sp)
     ab4:	|   move.l d3,-(sp)
     ab6:	|   jsr (a2)
     ab8:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
     aba:	|   addq.l #1,d2
     abc:	|   lea 12(sp),sp
     ac0:	|   cmp.l d2,d5
     ac2:	\-- bne.s ab0 <Utils_FillLong.constprop.0+0x1a>
}
     ac4:	    movem.l (sp)+,d2-d5/a2
     ac8:	    rts

00000aca <Sw_Run>:
void Sw_Run() {                                     
     aca:	          movem.l d2-d4/a2-a4/a6,-(sp)
  if(Sw_framecount == 50) {
     ace:	          move.l 66244 <Sw_framecount>,d0
     ad4:	          moveq #50,d1
     ad6:	          cmp.l d0,d1
     ad8:	   /----- beq.w e04 <Sw_Run+0x33a>
  Sw_framecount++;
     adc:	   |      addq.l #1,d0
     ade:	   |      move.l d0,66244 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     ae4:	/--|----> move.w 75eae <Sw_BlitFrame>,d0
     aea:	+--|----- beq.s ae4 <Sw_Run+0x1a>
  *bp = 0;
     aec:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     af0:	|  |      move.w #0,75eae <Sw_BlitFrame>
  WaitBlit();
     af8:	|  |      lea 75fb8 <GfxBase>,a2
     afe:	|  |      movea.l (a2),a6
     b00:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     b04:	|  |      movea.l 75fbc <custom>,a0
     b0a:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     b10:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     b16:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     b1c:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     b22:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     b28:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     b2e:	|  |      move.w #2544,64(a0)
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     b34:	|  |      move.l 66244 <Sw_framecount>,d1
     b3a:	|  |      subq.l #1,d1
     b3c:	|  |      move.l d1,d0
     b3e:	|  |      add.l d1,d0
     b40:	|  |      add.l d0,d0
     b42:	|  |      add.l d1,d0
     b44:	|  |      lsl.l #4,d0
     b46:	|  |      add.l 75eb4 <Sw_FontBuffer>,d0
     b4c:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     b50:	|  |      move.l 75eaa <Sw_DrawBuffer>,d0
     b56:	|  |      addi.l #20400,d0
     b5c:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     b60:	|  |      move.w #104,88(a0)
  WaitBlit();
     b66:	|  |      movea.l (a2),a6
     b68:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     b6c:	|  |      movea.l 75fbc <custom>,a0
     b72:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     b78:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     b7e:	|  |      move.l 75ea6 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     b86:	|  |      move.l 75eaa <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     b8e:	|  |      lea 42e06 <Sw_CopyLines>,a3
     b94:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     b9a:	|  |      add.l d0,d0
     b9c:	|  |      move.w (0,a3,d0.l),d0
     ba0:	|  |      lsl.w #6,d0
     ba2:	|  |      addi.w #40,d0
     ba6:	|  |      move.w d0,88(a0)
  WaitBlit();
     baa:	|  |      movea.l (a2),a6
     bac:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     bb0:	|  |      movea.l 75fbc <custom>,a0
     bb6:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     bbc:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     bc2:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     bc8:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     bce:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     bd4:	|  |      add.l d0,d0
     bd6:	|  |      move.w (0,a3,d0.l),d1
     bda:	|  |      move.w d1,d0
     bdc:	|  |      mulu.w #80,d0
     be0:	|  |      movea.l d0,a1
     be2:	|  |      lea 120(a1),a4
     be6:	|  |      move.l 75ea6 <Sw_ViewBufferP1>,d0
     bec:	|  |      add.l a4,d0
     bee:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     bf2:	|  |      lea 40(a1),a1
     bf6:	|  |      adda.l 75eaa <Sw_DrawBuffer>,a1
     bfc:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     c00:	|  |      move.w d1,d0
     c02:	|  |      mulu.w #40,d0
     c06:	|  |      addi.l #471862,d0
     c0c:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     c10:	|  |      move.w #255,d0
     c14:	|  |      sub.w d1,d0
     c16:	|  |      lsl.w #6,d0
     c18:	|  |      addi.w #20,d0
     c1c:	|  |      move.w d0,88(a0)
  WaitBlit();
     c20:	|  |      movea.l (a2),a6
     c22:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     c26:	|  |      movea.l 75fbc <custom>,a0
     c2c:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     c32:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     c38:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     c3e:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     c44:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     c4a:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     c50:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     c56:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     c5c:	|  |      add.l d0,d0
     c5e:	|  |      move.w (0,a3,d0.l),d1
     c62:	|  |      move.w d1,d0
     c64:	|  |      mulu.w #80,d0
     c68:	|  |      movea.l d0,a1
     c6a:	|  |      lea 120(a1),a4
     c6e:	|  |      move.l 75ea6 <Sw_ViewBufferP1>,d0
     c74:	|  |      add.l a4,d0
     c76:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     c7a:	|  |      move.w d1,d0
     c7c:	|  |      mulu.w #40,d0
     c80:	|  |      addi.l #471862,d0
     c86:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     c8a:	|  |      lea 38(a1),a1
     c8e:	|  |      move.l 75eaa <Sw_DrawBuffer>,d0
     c94:	|  |      add.l a1,d0
     c96:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     c9a:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     c9e:	|  |      move.w #255,d0
     ca2:	|  |      sub.w d1,d0
     ca4:	|  |      lsl.w #6,d0
     ca6:	|  |      addi.w #21,d0
     caa:	|  |      move.w d0,88(a0)
  WaitBlit();
     cae:	|  |      movea.l (a2),a6
     cb0:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     cb4:	|  |      movea.l 75fbc <custom>,a1
     cba:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     cc0:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     cc6:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     ccc:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     cd2:	|  |      move.w #0,66(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     cd8:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     cde:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     ce4:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     cea:	|  |      add.l d0,d0
     cec:	|  |      move.w (0,a3,d0.l),d1
     cf0:	|  |      moveq #0,d2
     cf2:	|  |      move.w d1,d2
     cf4:	|  |      movea.l d2,a0
     cf6:	|  |      addq.l #1,a0
     cf8:	|  |      move.l a0,d0
     cfa:	|  |      add.l a0,d0
     cfc:	|  |      add.l d0,d0
     cfe:	|  |      add.l a0,d0
     d00:	|  |      lsl.l #4,d0
     d02:	|  |      movea.l 75ea6 <Sw_ViewBufferP1>,a0
     d08:	|  |      adda.l d0,a0
     d0a:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     d0e:	|  |      movea.w #-80,a0
     d12:	|  |      adda.l d0,a0
     d14:	|  |      move.l 75eaa <Sw_DrawBuffer>,d0
     d1a:	|  |      add.l a0,d0
     d1c:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     d20:	|  |      mulu.w #40,d1
     d24:	|  |      addi.l #461620,d1
     d2a:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     d2e:	|  |      moveq #0,d0
     d30:	|  |      not.b d0
     d32:	|  |      sub.l d2,d0
     d34:	|  |      lsl.w #6,d0
     d36:	|  |      addi.w #20,d0
     d3a:	|  |      move.w d0,88(a1)
  WaitBlit();
     d3e:	|  |      movea.l (a2),a6
     d40:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     d44:	|  |      movea.l 75fbc <custom>,a1
     d4a:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     d50:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     d56:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     d5c:	|  |      move.w #40,96(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     d62:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     d68:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     d6e:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     d74:	|  |      add.l d0,d0
     d76:	|  |      move.w (0,a3,d0.l),d1
     d7a:	|  |      move.w d1,d2
     d7c:	|  |      movea.l d2,a0
     d7e:	|  |      addq.l #1,a0
     d80:	|  |      move.l a0,d0
     d82:	|  |      add.l a0,d0
     d84:	|  |      add.l d0,d0
     d86:	|  |      add.l a0,d0
     d88:	|  |      lsl.l #4,d0
     d8a:	|  |      movea.l 75ea6 <Sw_ViewBufferP1>,a0
     d90:	|  |      adda.l d0,a0
     d92:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     d96:	|  |      mulu.w #40,d1
     d9a:	|  |      addi.l #461620,d1
     da0:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     da4:	|  |      movea.w #-80,a0
     da8:	|  |      adda.l d0,a0
     daa:	|  |      move.l 75eaa <Sw_DrawBuffer>,d0
     db0:	|  |      add.l a0,d0
     db2:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     db6:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     dba:	|  |      moveq #0,d0
     dbc:	|  |      not.b d0
     dbe:	|  |      sub.l d2,d0
     dc0:	|  |      lsl.w #6,d0
     dc2:	|  |      addi.w #20,d0
     dc6:	|  |      move.w d0,88(a1)
  WaitBlit();
     dca:	|  |      movea.l (a2),a6
     dcc:	|  |      jsr -228(a6)
  custom->color[0] = 0x00;
     dd0:	|  |      movea.l 75fbc <custom>,a0
     dd6:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     ddc:	|  |      move.l 75ea2 <Sw_framecountscreen>,d0
     de2:	|  |      addq.l #1,d0
     de4:	|  |      moveq #17,d1
     de6:	|  |      cmp.l d0,d1
     de8:	|  |  /-- beq.s df6 <Sw_Run+0x32c>
     dea:	|  |  |   move.l d0,75ea2 <Sw_framecountscreen>
}
     df0:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     df4:	|  |  |   rts
     df6:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     df8:	|  |      move.l d0,75ea2 <Sw_framecountscreen>
}
     dfe:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     e02:	|  |      rts
    Sw_framecount = 0;
     e04:	|  \----> clr.l 66244 <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
     e0a:	|         move.l 75eb4 <Sw_FontBuffer>,d3
      *target++ = pattern;
     e10:	|         pea fa0 <Sw_ClBuild+0x80>
     e14:	|         clr.l -(sp)
     e16:	|         move.l d3,-(sp)
     e18:	|         jsr 551e <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
     e1c:	|         movea.l 75e9e <Sw_textoffset>,a3
     e22:	|         adda.l #417090,a3
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
     e28:	|         move.b (a3),d0
     e2a:	|         ext.w d0
     e2c:	|         movea.w d0,a2
     e2e:	|         lea -32(a2),a2
     e32:	|         lea 12(sp),sp
    int x = 0;
     e36:	|         moveq #0,d2
     e38:	|         lea 42da6 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
     e3e:	|         move.w #3204,d4
    WaitBlit();
     e42:	|     /-> movea.l 75fb8 <GfxBase>,a6
     e48:	|     |   jsr -228(a6)
    custom->bltamod = 0;
     e4c:	|     |   move.w #0,dff064 <_end+0xd890a0>
    custom->bltbmod = 72;
     e54:	|     |   move.w #72,dff062 <_end+0xd8909e>
    custom->bltdmod = 72;
     e5c:	|     |   move.w #72,dff066 <_end+0xd890a2>
    custom->bltafwm = 0xffff;
     e64:	|     |   move.w #-1,dff044 <_end+0xd89080>
    custom->bltalwm = 0xffff;
     e6c:	|     |   move.w #-1,dff046 <_end+0xd89082>
    custom->bltcon1 = 0;  
     e74:	|     |   move.w #0,dff042 <_end+0xd8907e>
    custom->bltcon0 = 0xdfc + (restx << 12);
     e7c:	|     |   move.w d2,d0
     e7e:	|     |   moveq #12,d1
     e80:	|     |   lsl.w d1,d0
     e82:	|     |   addi.w #3580,d0
     e86:	|     |   move.w d0,dff040 <_end+0xd8907c>
    custom->bltapt = font+4*50*index;
     e8c:	|     |   move.l a2,d0
     e8e:	|     |   add.l a2,d0
     e90:	|     |   add.l a2,d0
     e92:	|     |   lsl.l #3,d0
     e94:	|     |   add.l a2,d0
     e96:	|     |   lsl.l #4,d0
     e98:	|     |   addi.l #423618,d0
     e9e:	|     |   move.l d0,dff050 <_end+0xd8908c>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
     ea4:	|     |   move.l d2,d0
     ea6:	|     |   asr.l #4,d0
     ea8:	|     |   add.l d0,d0
     eaa:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
     eac:	|     |   move.l d0,dff04c <_end+0xd89088>
    custom->bltdpt = targetlocation;
     eb2:	|     |   move.l d0,dff054 <_end+0xd89090>
    custom->bltsize = 4+64*50;
     eb8:	|     |   move.w d4,dff058 <_end+0xd89094>
        x += LetterSize[*text++ - 0x20];
     ebe:	|     |   move.b (a3)+,d0
     ec0:	|     |   ext.w d0
     ec2:	|     |   move.b (-32,a4,d0.w),d0
     ec6:	|     |   andi.l #255,d0
     ecc:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
     ece:	|     |   move.b (a3),d0
     ed0:	|     |   ext.w d0
     ed2:	|     |   movea.w d0,a2
     ed4:	|     |   lea -32(a2),a2
     ed8:	|     |   moveq #0,d0
     eda:	|     |   move.b (0,a4,a2.l),d0
     ede:	|     |   add.l d2,d0
     ee0:	|     |   cmpi.l #639,d0
     ee6:	|     \-- ble.w e42 <Sw_Run+0x378>
    Sw_textoffset += 40;
     eea:	|         moveq #40,d0
     eec:	|         add.l 75e9e <Sw_textoffset>,d0
     ef2:	|         move.l d0,75e9e <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
     ef8:	|         cmpi.l #1279,d0
     efe:	|     /-- ble.s f0e <Sw_Run+0x444>
      Sw_textoffset = 0;
     f00:	|     |   clr.l 75e9e <Sw_textoffset>
      SwScrollerFinished = 1;
     f06:	|     |   move.w #1,75fb2 <SwScrollerFinished>
  Sw_framecount++;
     f0e:	|     \-> move.l 66244 <Sw_framecount>,d0
     f14:	|         addq.l #1,d0
     f16:	|         move.l d0,66244 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     f1c:	\-------- bra.w ae4 <Sw_Run+0x1a>

00000f20 <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
     f20:	    movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     f24:	    movea.l 75fc0 <SysBase>,a6
     f2a:	    move.l #1360,d0
     f30:	    moveq #2,d1
     f32:	    jsr -198(a6)
     f36:	    movea.l d0,a2
  if( retval == 0) {
     f38:	    tst.l d0
     f3a:	/-- beq.w 10a0 <Sw_ClBuild+0x180>
    *cl++ = *clpartinstruction++;
     f3e:	|   move.l 65d02 <Sw_ClsSprites>,(a2)
     f44:	|   move.l 65d06 <Sw_ClsSprites+0x4>,4(a2)
     f4c:	|   move.l 65d0a <Sw_ClsSprites+0x8>,8(a2)
     f54:	|   move.l 65d0e <Sw_ClsSprites+0xc>,12(a2)
     f5c:	|   move.l 65d12 <Sw_ClsSprites+0x10>,16(a2)
     f64:	|   move.l 65d16 <Sw_ClsSprites+0x14>,20(a2)
     f6c:	|   move.l 65d1a <Sw_ClsSprites+0x18>,24(a2)
     f74:	|   move.l 65d1e <Sw_ClsSprites+0x1c>,28(a2)
     f7c:	|   move.l 65d22 <Sw_ClsSprites+0x20>,32(a2)
     f84:	|   move.l 65d26 <Sw_ClsSprites+0x24>,36(a2)
     f8c:	|   move.l 65d2a <Sw_ClsSprites+0x28>,40(a2)
     f94:	|   move.l 65d2e <Sw_ClsSprites+0x2c>,44(a2)
     f9c:	|   move.l 65d32 <Sw_ClsSprites+0x30>,48(a2)
     fa4:	|   move.l 65d36 <Sw_ClsSprites+0x34>,52(a2)
     fac:	|   move.l 65d3a <Sw_ClsSprites+0x38>,56(a2)
     fb4:	|   move.l 65d3e <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
     fbc:	|   move.l 65cd2 <Sw_ClScreen>,64(a2)
     fc4:	|   move.l 65cd6 <Sw_ClScreen+0x4>,68(a2)
     fcc:	|   move.l 65cda <Sw_ClScreen+0x8>,72(a2)
     fd4:	|   move.l 65cde <Sw_ClScreen+0xc>,76(a2)
     fdc:	|   move.l 65ce2 <Sw_ClScreen+0x10>,80(a2)
     fe4:	|   move.l 65ce6 <Sw_ClScreen+0x14>,84(a2)
     fec:	|   move.l 65cea <Sw_ClScreen+0x18>,88(a2)
     ff4:	|   move.l 65cee <Sw_ClScreen+0x1c>,92(a2)
     ffc:	|   move.l 65cf2 <Sw_ClScreen+0x20>,96(a2)
    1004:	|   move.l 65cf6 <Sw_ClScreen+0x24>,100(a2)
    100c:	|   move.l 65cfa <Sw_ClScreen+0x28>,104(a2)
    1014:	|   move.l 65cfe <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    101c:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    1024:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    102c:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    1034:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    103c:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    1044:	|   move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    104c:	|   move.l 65c92 <Sw_ClColor>,136(a2)
    1054:	|   move.l 65c96 <Sw_ClColor+0x4>,140(a2)
    105c:	|   move.l 65c9a <Sw_ClColor+0x8>,144(a2)
    1064:	|   move.l 65c9e <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    106c:	|   pea 1bc <main+0x156>
    1070:	|   pea 8006 <incbin_Sw_ClColorDim_start>
    1076:	|   pea 152(a2)
    107a:	|   jsr 5540 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    107e:	|   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    1086:	|   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    108e:	|   moveq #-2,d0
    1090:	|   move.l d0,604(a2)
  return (UWORD *) retval;  
    1094:	|   lea 12(sp),sp
}
    1098:	|   move.l a2,d0
    109a:	|   movem.l (sp)+,d2-d3/a2/a6
    109e:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    10a0:	\-> movea.l 75fb4 <DOSBase>,a6
    10a6:	    jsr -60(a6)
    10aa:	    movea.l 75fb4 <DOSBase>,a6
    10b0:	    move.l d0,d1
    10b2:	    move.l #248677,d2
    10b8:	    moveq #40,d3
    10ba:	    jsr -48(a6)
    Exit(1);
    10be:	    movea.l 75fb4 <DOSBase>,a6
    10c4:	    moveq #1,d1
    10c6:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    10ca:	    move.l 65d02 <Sw_ClsSprites>,(a2)
    10d0:	    move.l 65d06 <Sw_ClsSprites+0x4>,4(a2)
    10d8:	    move.l 65d0a <Sw_ClsSprites+0x8>,8(a2)
    10e0:	    move.l 65d0e <Sw_ClsSprites+0xc>,12(a2)
    10e8:	    move.l 65d12 <Sw_ClsSprites+0x10>,16(a2)
    10f0:	    move.l 65d16 <Sw_ClsSprites+0x14>,20(a2)
    10f8:	    move.l 65d1a <Sw_ClsSprites+0x18>,24(a2)
    1100:	    move.l 65d1e <Sw_ClsSprites+0x1c>,28(a2)
    1108:	    move.l 65d22 <Sw_ClsSprites+0x20>,32(a2)
    1110:	    move.l 65d26 <Sw_ClsSprites+0x24>,36(a2)
    1118:	    move.l 65d2a <Sw_ClsSprites+0x28>,40(a2)
    1120:	    move.l 65d2e <Sw_ClsSprites+0x2c>,44(a2)
    1128:	    move.l 65d32 <Sw_ClsSprites+0x30>,48(a2)
    1130:	    move.l 65d36 <Sw_ClsSprites+0x34>,52(a2)
    1138:	    move.l 65d3a <Sw_ClsSprites+0x38>,56(a2)
    1140:	    move.l 65d3e <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1148:	    move.l 65cd2 <Sw_ClScreen>,64(a2)
    1150:	    move.l 65cd6 <Sw_ClScreen+0x4>,68(a2)
    1158:	    move.l 65cda <Sw_ClScreen+0x8>,72(a2)
    1160:	    move.l 65cde <Sw_ClScreen+0xc>,76(a2)
    1168:	    move.l 65ce2 <Sw_ClScreen+0x10>,80(a2)
    1170:	    move.l 65ce6 <Sw_ClScreen+0x14>,84(a2)
    1178:	    move.l 65cea <Sw_ClScreen+0x18>,88(a2)
    1180:	    move.l 65cee <Sw_ClScreen+0x1c>,92(a2)
    1188:	    move.l 65cf2 <Sw_ClScreen+0x20>,96(a2)
    1190:	    move.l 65cf6 <Sw_ClScreen+0x24>,100(a2)
    1198:	    move.l 65cfa <Sw_ClScreen+0x28>,104(a2)
    11a0:	    move.l 65cfe <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    11a8:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    11b0:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    11b8:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    11c0:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    11c8:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    11d0:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    11d8:	    move.l 65c92 <Sw_ClColor>,136(a2)
    11e0:	    move.l 65c96 <Sw_ClColor+0x4>,140(a2)
    11e8:	    move.l 65c9a <Sw_ClColor+0x8>,144(a2)
    11f0:	    move.l 65c9e <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    11f8:	    pea 1bc <main+0x156>
    11fc:	    pea 8006 <incbin_Sw_ClColorDim_start>
    1202:	    pea 152(a2)
    1206:	    jsr 5540 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    120a:	    move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    1212:	    move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    121a:	    moveq #-2,d0
    121c:	    move.l d0,604(a2)
  return (UWORD *) retval;  
    1220:	    lea 12(sp),sp
}
    1224:	    move.l a2,d0
    1226:	    movem.l (sp)+,d2-d3/a2/a6
    122a:	    rts

0000122c <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    122c:	moveq #0,d0
    122e:	move.w 75e9c <Sw_ScreenBufferOffset>,d0
    1234:	lea 75e60 <Sw_ScreenBufferList>,a0
    123a:	move.l d0,d1
    123c:	add.l d0,d1
    123e:	add.l d1,d1
    1240:	move.l (0,a0,d1.l),75eaa <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1248:	addq.l #1,d0
    124a:	add.l d0,d0
    124c:	add.l d0,d0
    124e:	move.l (0,a0,d0.l),d0
    1252:	move.l d0,75ea6 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    1258:	moveq #80,d1
    125a:	add.l d0,d1
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    125c:	movea.l 75e5c <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    1262:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    1266:	clr.w d0
    1268:	swap d0
    126a:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    126e:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    1272:	clr.w d1
    1274:	swap d1
    1276:	move.w d1,122(a0)
  /*highword = (ULONG)Sw_ViewBufferP3 >> 16;
  lowword = (ULONG)Sw_ViewBufferP3 & 0xffff;
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;*/

}
    127a:	rts

0000127c <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    127c:	          movea.l 75e5c <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    1282:	          move.w 65c90 <FrameCountBufferDraw>,d0
    1288:	          lea 65c92 <Sw_ClColor>,a1
    128e:	          andi.l #65535,d0
    1294:	          lsl.l #4,d0
    1296:	          move.l (0,a1,d0.l),136(a0)
    129c:	          move.w 65c90 <FrameCountBufferDraw>,d0
    12a2:	          andi.l #65535,d0
    12a8:	          add.l d0,d0
    12aa:	          add.l d0,d0
    12ac:	          addq.l #1,d0
    12ae:	          add.l d0,d0
    12b0:	          add.l d0,d0
    12b2:	          move.l (0,a1,d0.l),140(a0)
    12b8:	          move.w 65c90 <FrameCountBufferDraw>,d0
    12be:	          andi.l #65535,d0
    12c4:	          add.l d0,d0
    12c6:	          add.l d0,d0
    12c8:	          addq.l #2,d0
    12ca:	          add.l d0,d0
    12cc:	          add.l d0,d0
    12ce:	          move.l (0,a1,d0.l),144(a0)
    12d4:	          move.w 65c90 <FrameCountBufferDraw>,d0
    12da:	          andi.l #65535,d0
    12e0:	          add.l d0,d0
    12e2:	          add.l d0,d0
    12e4:	          addq.l #3,d0
    12e6:	          add.l d0,d0
    12e8:	          add.l d0,d0
    12ea:	          move.l (0,a1,d0.l),148(a0)
  for(int i=0;i<4;i++) {
    12f0:	          lea 152(a0),a0
  }
  if( ColPos == 12) {
    12f4:	          cmpi.w #12,75e5a <ColPos>
    12fc:	   /----- beq.s 1332 <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    12fe:	/--|----> move.w 75e58 <Sw_ClColorDimPos>,d0
    1304:	|  |      moveq #0,d1
    1306:	|  |      move.w d0,d1
    1308:	|  |      addi.l #32774,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    130e:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    1312:	|  |      cmpi.w #22643,d0
    1316:	|  |  /-- bls.s 131a <Sw_SetColors+0x9e>
    1318:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
    131a:	|  |  \-> move.w d0,75e58 <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    1320:	|  |      pea 1bc <main+0x156>
    1324:	|  |      move.l d1,-(sp)
    1326:	|  |      move.l a0,-(sp)
    1328:	|  |      jsr 555e <memmove>(pc)

  }
}
    132c:	|  |      lea 12(sp),sp
    1330:	|  |      rts
    ColPos = 0;
    1332:	|  \----> clr.w 75e5a <ColPos>
    1338:	\-------- bra.s 12fe <Sw_SetColors+0x82>

0000133a <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    133a:	    movea.l 75fbc <custom>,a0
    1340:	    move.w #32,156(a0)
  if( FrameCountBufferDraw == 2) {
    1346:	    move.w 65c90 <FrameCountBufferDraw>,d0
    134c:	    cmpi.w #2,d0
    1350:	/-- beq.s 1368 <Sw_VblankHandler+0x2e>
    FrameCountBufferDraw++;
    1352:	|   move.w 65c90 <FrameCountBufferDraw>,d0
    1358:	|   addq.w #1,d0
    135a:	|   move.w d0,65c90 <FrameCountBufferDraw>
  Sw_SetBplPointers();
    1360:	|   jsr 122c <Sw_SetBplPointers>(pc)
  Sw_SetColors();
    1364:	|   bra.w 127c <Sw_SetColors>
    FrameCountBufferDraw = 0;
    1368:	\-> move.w #0,65c90 <FrameCountBufferDraw>
    Sw_BlitFrame = 1;
    1370:	    move.w #1,75eae <Sw_BlitFrame>
    if(Sw_ScreenBufferOffset == 0) { 
    1378:	    tst.w 75e9c <Sw_ScreenBufferOffset>
    137e:	/-- bne.s 1390 <Sw_VblankHandler+0x56>
      Sw_ScreenBufferOffset = 2; 
    1380:	|   move.w #2,75e9c <Sw_ScreenBufferOffset>
  Sw_SetBplPointers();
    1388:	|   jsr 122c <Sw_SetBplPointers>(pc)
  Sw_SetColors();
    138c:	|   bra.w 127c <Sw_SetColors>
      Sw_ScreenBufferOffset = 0; 
    1390:	\-> clr.w 75e9c <Sw_ScreenBufferOffset>
  Sw_SetBplPointers();
    1396:	    jsr 122c <Sw_SetBplPointers>(pc)
  Sw_SetColors();
    139a:	    bra.w 127c <Sw_SetColors>

0000139e <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    139e:	                                                             lea -20(sp),sp
    13a2:	                                                             movem.l d2-d5/a2,-(sp)
    13a6:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    13aa:	                                                             movea.l 75fac <DrawCopper>,a1
    13b0:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    13b4:	                                                             movea.l 75e4c <DrawBuffer>,a0
    13ba:	                                                             move.w 52(a0),d0
    13be:	                                                /----------- bmi.w 155e <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    13c2:	                                                |            move.w 54(a0),d2
    13c6:	                                                |     /----- bmi.w 151a <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    13ca:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    13cc:	                                                |     |      move.w d2,d4
    13ce:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    13d0:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    13d4:	                                                |     |      cmp.w d1,d0
    13d6:	                                          /-----|-----|----- bhi.w 1606 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    13da:	                                          |     |     |      move.w #70,30(sp)
    13e0:	                                          |     |     |      move.w d2,32(sp)
    13e4:	                                          |     |     |      move.w #109,34(sp)
    13ea:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    13f0:	                                          |     |     |      clr.w 20(sp)
    13f4:	                                          |     |     |      move.w #1,22(sp)
    13fa:	                                          |     |     |      move.w #2,24(sp)
    1400:	                                          |     |     |      move.w #3,26(sp)
    1406:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    140c:	                                          |     |     |      cmpi.w #69,d2
    1410:	                                       /--|-----|-----|----- bhi.w 159c <SetCl+0x1fe>
              values[j] = values[j + 1];
    1414:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1418:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    141e:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    1424:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1428:	                                       |  |  |  |     |      moveq #70,d0
    142a:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    142e:	|                                      |  |  |  |     |  /-- bcc.s 1440 <SetCl+0xa2>
              int temp2 = ids[j];
    1430:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    1436:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    143a:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    1440:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    1444:	|                                      |  |  |  |     |      cmp.w a0,d0
    1446:	|                                      |  |  |  |     |  /-- bcc.s 1464 <SetCl+0xc6>
              int temp2 = ids[j];
    1448:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    144c:	|                                      |  |  |  |     |  |   move.w d0,d2
    144e:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    1452:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1458:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    145c:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    1460:	|                                      |  |  |  |     |  |   move.w a0,d0
    1462:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    1464:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1468:	|                                      |  |  |  |     |      cmp.w d0,d2
    146a:	|                                      |  |  |  |     |  /-- bcc.s 1484 <SetCl+0xe6>
              int temp2 = ids[j];
    146c:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    1470:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    1474:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    147a:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    147e:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    1482:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    1484:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    1488:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    148c:	|                                      |  |  |  |     |  /-- bcc.s 14a0 <SetCl+0x102>
              int temp2 = ids[j];
    148e:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    1492:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    1496:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    149c:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    14a0:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    14a2:	|                                      |  |  |  |     |  /-- bcc.s 14ba <SetCl+0x11c>
              int temp2 = ids[j];
    14a4:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    14a8:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    14ac:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    14b2:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    14b6:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    14ba:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    14be:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    14c2:	|                                      |  |  |  |     |  /-- bcc.s 14e6 <SetCl+0x148>
              int temp2 = ids[j];
    14c4:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    14c8:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    14ce:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    14d2:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    14d6:	|                                      |  |  |  |     |  +-- bcc.s 14e6 <SetCl+0x148>
              int temp2 = ids[j];
    14d8:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    14dc:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    14e2:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    14e6:	|                                      |  |  |  |     |  \-> move.w d1,d0
    14e8:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    14ea:	|                                      |  |  |  |     |      addi.w #11521,d0
    14ee:	|                                      |  |  |  |     |      cmpi.w #210,d1
    14f2:	|                                      |  |  |  |     |  /-- bhi.w 15e2 <SetCl+0x244>
    switch( ids[i]) 
    14f6:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    14fc:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 1dee <SetCl+0xa50>
    1500:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    1502:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    1506:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    1508:	|  |                                   |  |  |  |     |  |   move.w (1510 <SetCl+0x172>,pc,d1.l),d1
    150c:	|  |                                   |  |  |  |     |  |   jmp (1510 <SetCl+0x172>,pc,d1.w)
    1510:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    1514:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    151a:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    151c:	|  |                                   |  |  |  |  /-----|-- bhi.w 1646 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1520:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1526:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    152c:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    1532:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1538:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    153e:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    1542:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    1544:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1548:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    154e:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    1554:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1558:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    155a:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 142a <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    155e:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    1564:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    156a:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    1570:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1576:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    157a:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    1580:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    1586:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    158c:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    1592:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    1596:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    159a:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    159c:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    15a0:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    15a4:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 142a <SetCl+0x8c>
              int temp2 = ids[j];
    15a8:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    15ac:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    15b2:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    15b8:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    15bc:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    15c0:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    15c4:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 1dd6 <SetCl+0xa38>
              values[j] = values[j + 1];
    15c8:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    15ce:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    15d4:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    15d8:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    15dc:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    15de:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 142a <SetCl+0x8c>
    switch( ids[i]) 
    15e2:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    15e8:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 1ddc <SetCl+0xa3e>
    15ec:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    15ee:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    15f2:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    15f4:	|  |  |  |                             |  |  |     |  |      move.w (15fc <SetCl+0x25e>,pc,d1.l),d1
    15f8:	|  |  |  |                             |  |  |     |  |      jmp (15fc <SetCl+0x25e>,pc,d1.w)
    15fc:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    15fe:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    1604:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1608:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    160e:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    1612:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1618:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    161e:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    1622:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1628:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    162e:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    1634:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    163a:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    163e:	|  |  |  |                             |     \-----|--|----- bls.w 1414 <SetCl+0x76>
    1642:	|  |  |  |                             \-----------|--|----- bra.w 159c <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1646:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1648:	|  |  |  |                                            |      move.w #109,34(sp)
    164e:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1654:	|  |  |  |                                            |      move.w #2,24(sp)
    165a:	|  |  |  |                                            |      move.w #3,26(sp)
    1660:	|  |  |  |                                            |      move.w #4,28(sp)
    1666:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    166a:	|  |  |  |                                            |      clr.w d3
    166c:	|  |  |  |                                            \----- bra.w 1544 <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    1670:	|  |  |  |                                                   cmpi.w #211,d3
    1674:	|  |  |  |                                               /-- bls.s 1686 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    1676:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    167c:	|  |  |  |                                               |   lea 172(a1),a2
    1680:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1686:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1688:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    168e:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    1694:	|  |  |  |                                                   lea 8(a2),a0
    1698:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    169e:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    16a4:	|  |  |  |  /--|-------------------------------------------- bhi.w 1df4 <SetCl+0xa56>
    16a8:	|  |  |  |  |  |                                             moveq #0,d1
    16aa:	|  |  |  |  |  |                                             move.w 22(sp),d1
    16ae:	|  |  |  |  |  |                                             add.l d1,d1
    16b0:	|  |  |  |  |  |                                             move.w (16b8 <SetCl+0x31a>,pc,d1.l),d1
    16b4:	|  |  |  |  |  |                                             jmp (16b8 <SetCl+0x31a>,pc,d1.w)
    16b8:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    16bc:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    16c6:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    16ce:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    16d4:	|  |  |  |  |  |                                             lea 176(a1),a0
    16d8:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    16de:	|  |  |  |  |  +-------------------------------------------- bra.s 169e <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    16e0:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    16e6:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    16ec:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    16f2:	|  |  |  |  |  |                                             lea 176(a1),a0
    16f6:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    16fc:	|  |  |  |  |  +-------------------------------------------- bra.s 169e <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    16fe:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1704:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    170a:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    1710:	|  |  |  |  |  |                                             lea 176(a1),a0
    1714:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    171a:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    1720:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 1e00 <SetCl+0xa62>
    1724:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1726:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    172a:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    172c:	|  |  |  |  |  |  |  |                                       move.w (1734 <SetCl+0x396>,pc,d1.l),d1
    1730:	|  |  |  |  |  |  |  |                                       jmp (1734 <SetCl+0x396>,pc,d1.w)
    1734:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1736:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    173a:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    173c:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    173e:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    1744:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    174a:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    1750:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1754:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    175a:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 171a <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    175c:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    1760:	|  |  |  |  |  |  |  |                                   /-- bls.s 1772 <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    1762:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1768:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    176c:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1772:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1774:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    177a:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    1780:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    1784:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    178a:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 171a <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    178c:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    1792:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1798:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    179e:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    17a2:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    17a8:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 171a <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    17ac:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    17b2:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    17b8:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    17be:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    17c2:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    17c8:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 169e <SetCl+0x300>
        *tmp++ = line + 0x001;
    17cc:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    17d0:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    17d6:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    17dc:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    17e0:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    17e6:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 171a <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    17ea:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    17ee:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    17f4:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    17fa:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    17fe:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    1804:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    180a:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 1de8 <SetCl+0xa4a>
    180e:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    1810:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    1814:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1816:	|  |  |  |  |  |  |  |  |  |                                 move.w (181e <SetCl+0x480>,pc,d1.l),d1
    181a:	|  |  |  |  |  |  |  |  |  |                                 jmp (181e <SetCl+0x480>,pc,d1.w)
    181e:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1820:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1822:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    182a:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    182c:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1832:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1838:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    183c:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1842:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1804 <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1844:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1848:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1856 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    184a:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    184e:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1854:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1856:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1858:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    185e:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1864:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1868:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    186e:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1804 <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1870:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1874:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    187a:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1880:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1884:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    188a:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 1804 <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    188e:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1892:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1898:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    189e:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    18a2:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    18a8:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    18ae:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 1dfa <SetCl+0xa5c>
    18b2:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    18b4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    18b8:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    18ba:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (18c2 <SetCl+0x524>,pc,d1.l),d1
    18be:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (18c2 <SetCl+0x524>,pc,d1.w)
    18c2:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    18c4:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    18c6:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    18c8:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    18ca:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    18cc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    18d0:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    18d6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    18dc:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    18e0:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    18e6:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 18a8 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    18e8:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    18ec:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 18fa <SetCl+0x55c>
          *tmp++ = 0xffdf;
    18ee:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    18f2:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    18f8:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    18fa:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    18fc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1902:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1908:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    190c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1912:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 18a8 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1914:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1918:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    191e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1924:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1928:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    192e:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 18a8 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1932:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1934:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    193a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1940:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1944:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    194a:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 18a8 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    194e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1952:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1958:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    195e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1962:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1968:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    196e:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 1e1c <SetCl+0xa7e>
    1972:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1974:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1978:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    197a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1982 <SetCl+0x5e4>,pc,d1.l),d1
    197e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1982 <SetCl+0x5e4>,pc,d1.w)
    1982:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1984:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1986:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1988:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    198a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    198e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1990:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1996:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    199c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    19a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    19a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1968 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    19a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    19ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    19b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    19b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    19bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    19c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1968 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    19c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    19c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    19cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    19d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    19d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    19dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1968 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    19de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    19e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 19f0 <SetCl+0x652>
          *tmp++ = 0xffdf;
    19e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    19e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    19ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    19f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    19f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    19f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    19fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1a02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1a08:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1968 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1a1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1a2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 1e06 <SetCl+0xa68>
    1a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1a32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1a40 <SetCl+0x6a2>,pc,d1.l),d1
    1a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1a40 <SetCl+0x6a2>,pc,d1.w)
    1a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1a42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1a4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    1a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1a26 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    1a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1a78 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    1a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    1a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1a26 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1a92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1aa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1aac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1a26 <SetCl+0x688>
        *tmp++ = line + 0x001;
    1ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    1ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ab8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1abe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1a26 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1aea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1afa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1afe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1b0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    1b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    1b28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1b3a <SetCl+0x79c>
          *tmp++ = 0xffdf;
    1b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    1b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    1b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    1b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1ba6 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    1bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    1bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 1de2 <SetCl+0xa44>
    1bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1c06 <SetCl+0x868>,pc,d1.l),d1
    1c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1c06 <SetCl+0x868>,pc,d1.w)
    1c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    1c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    1c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1bec <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    1c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    1c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 1c3e <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    1c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    1c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    1c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    1c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1bec <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    1c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1bec <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    1c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 1e06 <SetCl+0xa68>
    1c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    1ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    1ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1caa <SetCl+0x90c>,pc,d1.l),d1
    1ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1caa <SetCl+0x90c>,pc,d1.w)
    1caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    1cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    1cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1c90 <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    1cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    1cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 1ce2 <SetCl+0x944>
          *tmp++ = 0xffdf;
    1cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    1cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1c90 <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    1d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1c90 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1d2c <SetCl+0x98e>
          *tmp++ = 0xffdf;
    1d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1c90 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1d5a <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    1d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    1d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    1d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    1d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    1d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1bec <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1d88 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1da0:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 1804 <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1dba <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    1db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    1dd2:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 169e <SetCl+0x300>
    1dd6:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    1dd8:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 142a <SetCl+0x8c>
    switch( ids[i]) 
    1ddc:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    1dde:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 169e <SetCl+0x300>
    1de2:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    1de4:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 1c90 <SetCl+0x8f2>
    1de8:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    1dea:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1bec <SetCl+0x84e>
    1dee:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    1df0:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 171a <SetCl+0x37c>
    1df4:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    1df6:	                  |     \-----|--|--|--|--|--|-------------- bra.w 1804 <SetCl+0x466>
    1dfa:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    1dfc:	                  |           |     |  \--|--|-------------- bra.w 1968 <SetCl+0x5ca>
    1e00:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    1e02:	                              \-----|-----|--|-------------- bra.w 18a8 <SetCl+0x50a>
    1e06:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    1e08:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    1e0c:	                                    |     |                  move.w #-2,2(a0)
}
    1e12:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    1e16:	                                    |     |                  lea 20(sp),sp
    1e1a:	                                    |     |                  rts
    switch( ids[i]) 
    1e1c:	                                    \-----|----------------> movea.l a0,a1
    1e1e:	                                          \----------------- bra.w 1a26 <SetCl+0x688>

00001e22 <LoadVectors>:
{
    1e22:	       move.l a3,-(sp)
    1e24:	       move.l a2,-(sp)
    1e26:	       movea.l 12(sp),a2
    1e2a:	       movea.l 16(sp),a1
    1e2e:	       movea.l 20(sp),a3
  while( *source != 127) {
    1e32:	       move.w (a2),d0
    1e34:	       movea.l a3,a0
    1e36:	       cmpi.w #127,d0
    1e3a:	/----- beq.s 1e90 <LoadVectors+0x6e>
    *target++ = *source++;
    1e3c:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    1e3e:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    1e44:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    1e4a:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    1e50:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    1e56:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    1e5c:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    1e62:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    1e68:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    1e6e:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    1e74:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    1e7a:	|  |   lea 24(a2),a2
    1e7e:	|  |   lea 24(a0),a0
    1e82:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    1e88:	|  |   move.w (a2),d0
    1e8a:	|  |   cmpi.w #127,d0
    1e8e:	|  \-- bne.s 1e3c <LoadVectors+0x1a>
  while( *source2 != 127) {  
    1e90:	\----> move.b (a1),d0
    1e92:	       cmpi.b #127,d0
    1e96:	/----- beq.w 1f50 <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    1e9a:	|  /-> ext.w d0
    1e9c:	|  |   add.w (a3),d0
    1e9e:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    1ea0:	|  |   move.b 1(a1),d0
    1ea4:	|  |   ext.w d0
    1ea6:	|  |   add.w 2(a3),d0
    1eaa:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    1eae:	|  |   move.b 2(a1),d0
    1eb2:	|  |   ext.w d0
    1eb4:	|  |   add.w 4(a3),d0
    1eb8:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    1ebc:	|  |   move.b 3(a1),d0
    1ec0:	|  |   ext.w d0
    1ec2:	|  |   add.w 6(a3),d0
    1ec6:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    1eca:	|  |   move.b 4(a1),d0
    1ece:	|  |   ext.w d0
    1ed0:	|  |   add.w 8(a3),d0
    1ed4:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    1ed8:	|  |   move.b 5(a1),d0
    1edc:	|  |   ext.w d0
    1ede:	|  |   add.w 10(a3),d0
    1ee2:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    1ee6:	|  |   move.b 6(a1),d0
    1eea:	|  |   ext.w d0
    1eec:	|  |   add.w 12(a3),d0
    1ef0:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    1ef4:	|  |   move.b 7(a1),d0
    1ef8:	|  |   ext.w d0
    1efa:	|  |   add.w 14(a3),d0
    1efe:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    1f02:	|  |   move.b 8(a1),d0
    1f06:	|  |   ext.w d0
    1f08:	|  |   add.w 16(a3),d0
    1f0c:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    1f10:	|  |   move.b 9(a1),d0
    1f14:	|  |   ext.w d0
    1f16:	|  |   add.w 18(a3),d0
    1f1a:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    1f1e:	|  |   move.b 10(a1),d0
    1f22:	|  |   ext.w d0
    1f24:	|  |   add.w 20(a3),d0
    1f28:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    1f2c:	|  |   lea 24(a3),a3
    1f30:	|  |   lea 12(a1),a1
    1f34:	|  |   lea 24(a0),a0
    1f38:	|  |   move.b -1(a1),d0
    1f3c:	|  |   ext.w d0
    1f3e:	|  |   add.w -2(a3),d0
    1f42:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    1f46:	|  |   move.b (a1),d0
    1f48:	|  |   cmpi.b #127,d0
    1f4c:	|  \-- bne.w 1e9a <LoadVectors+0x78>
}
    1f50:	\----> movea.l (sp)+,a2
    1f52:	       movea.l (sp)+,a3
    1f54:	       rts

00001f56 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    1f56:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1f5a:	    movea.l 75fc0 <SysBase>,a6
    1f60:	    move.l #1360,d0
    1f66:	    moveq #2,d1
    1f68:	    jsr -198(a6)
    1f6c:	    movea.l d0,a2
  
  if( retval == 0) {
    1f6e:	    tst.l d0
    1f70:	/-- beq.w 2100 <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    1f74:	|   move.l 44ecc <ClsSprites>,(a2)
    1f7a:	|   move.l 44ed0 <ClsSprites+0x4>,4(a2)
    1f82:	|   move.l 44ed4 <ClsSprites+0x8>,8(a2)
    1f8a:	|   move.l 44ed8 <ClsSprites+0xc>,12(a2)
    1f92:	|   move.l 44edc <ClsSprites+0x10>,16(a2)
    1f9a:	|   move.l 44ee0 <ClsSprites+0x14>,20(a2)
    1fa2:	|   move.l 44ee4 <ClsSprites+0x18>,24(a2)
    1faa:	|   move.l 44ee8 <ClsSprites+0x1c>,28(a2)
    1fb2:	|   move.l 44eec <ClsSprites+0x20>,32(a2)
    1fba:	|   move.l 44ef0 <ClsSprites+0x24>,36(a2)
    1fc2:	|   move.l 44ef4 <ClsSprites+0x28>,40(a2)
    1fca:	|   move.l 44ef8 <ClsSprites+0x2c>,44(a2)
    1fd2:	|   move.l 44efc <ClsSprites+0x30>,48(a2)
    1fda:	|   move.l 44f00 <ClsSprites+0x34>,52(a2)
    1fe2:	|   move.l 44f04 <ClsSprites+0x38>,56(a2)
    1fea:	|   move.l 44f08 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    1ff2:	|   move.l 44e9c <ClScreen>,64(a2)
    1ffa:	|   move.l 44ea0 <ClScreen+0x4>,68(a2)
    2002:	|   move.l 44ea4 <ClScreen+0x8>,72(a2)
    200a:	|   move.l 44ea8 <ClScreen+0xc>,76(a2)
    2012:	|   move.l 44eac <ClScreen+0x10>,80(a2)
    201a:	|   move.l 44eb0 <ClScreen+0x14>,84(a2)
    2022:	|   move.l 44eb4 <ClScreen+0x18>,88(a2)
    202a:	|   move.l 44eb8 <ClScreen+0x1c>,92(a2)
    2032:	|   move.l 44ebc <ClScreen+0x20>,96(a2)
    203a:	|   move.l 44ec0 <ClScreen+0x24>,100(a2)
    2042:	|   move.l 44ec4 <ClScreen+0x28>,104(a2)
    204a:	|   move.l 44ec8 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2052:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    205a:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2062:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    206a:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2072:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    207a:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    2082:	|   move.l 44e7c <ClColor>,136(a2)
    208a:	|   move.l 44e80 <ClColor+0x4>,140(a2)
    2092:	|   move.l 44e84 <ClColor+0x8>,144(a2)
    209a:	|   move.l 44e88 <ClColor+0xc>,148(a2)
    20a2:	|   move.l 44e8c <ClColor+0x10>,152(a2)
    20aa:	|   move.l 44e90 <ClColor+0x14>,156(a2)
    20b2:	|   move.l 44e94 <ClColor+0x18>,160(a2)
    20ba:	|   move.l 44e98 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    20c2:	|   move.l 44e2c <ClToggleBitPlanes>,168(a2)
    20ca:	|   move.l 44e30 <ClToggleBitPlanes+0x4>,172(a2)
    20d2:	|   move.l 44e34 <ClToggleBitPlanes+0x8>,176(a2)
    20da:	|   move.l 44e38 <ClToggleBitPlanes+0xc>,180(a2)
    20e2:	|   move.l 44e3c <ClToggleBitPlanes+0x10>,184(a2)
    20ea:	|   move.l 44e40 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    20f2:	|   moveq #-2,d0
    20f4:	|   move.l d0,192(a2)
  return retval;  
}
    20f8:	|   move.l a2,d0
    20fa:	|   movem.l (sp)+,d2-d3/a2/a6
    20fe:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2100:	\-> movea.l 75fb4 <DOSBase>,a6
    2106:	    jsr -60(a6)
    210a:	    movea.l 75fb4 <DOSBase>,a6
    2110:	    move.l d0,d1
    2112:	    move.l #248677,d2
    2118:	    moveq #40,d3
    211a:	    jsr -48(a6)
    Exit(1);
    211e:	    movea.l 75fb4 <DOSBase>,a6
    2124:	    moveq #1,d1
    2126:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    212a:	    move.l 44ecc <ClsSprites>,(a2)
    2130:	    move.l 44ed0 <ClsSprites+0x4>,4(a2)
    2138:	    move.l 44ed4 <ClsSprites+0x8>,8(a2)
    2140:	    move.l 44ed8 <ClsSprites+0xc>,12(a2)
    2148:	    move.l 44edc <ClsSprites+0x10>,16(a2)
    2150:	    move.l 44ee0 <ClsSprites+0x14>,20(a2)
    2158:	    move.l 44ee4 <ClsSprites+0x18>,24(a2)
    2160:	    move.l 44ee8 <ClsSprites+0x1c>,28(a2)
    2168:	    move.l 44eec <ClsSprites+0x20>,32(a2)
    2170:	    move.l 44ef0 <ClsSprites+0x24>,36(a2)
    2178:	    move.l 44ef4 <ClsSprites+0x28>,40(a2)
    2180:	    move.l 44ef8 <ClsSprites+0x2c>,44(a2)
    2188:	    move.l 44efc <ClsSprites+0x30>,48(a2)
    2190:	    move.l 44f00 <ClsSprites+0x34>,52(a2)
    2198:	    move.l 44f04 <ClsSprites+0x38>,56(a2)
    21a0:	    move.l 44f08 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    21a8:	    move.l 44e9c <ClScreen>,64(a2)
    21b0:	    move.l 44ea0 <ClScreen+0x4>,68(a2)
    21b8:	    move.l 44ea4 <ClScreen+0x8>,72(a2)
    21c0:	    move.l 44ea8 <ClScreen+0xc>,76(a2)
    21c8:	    move.l 44eac <ClScreen+0x10>,80(a2)
    21d0:	    move.l 44eb0 <ClScreen+0x14>,84(a2)
    21d8:	    move.l 44eb4 <ClScreen+0x18>,88(a2)
    21e0:	    move.l 44eb8 <ClScreen+0x1c>,92(a2)
    21e8:	    move.l 44ebc <ClScreen+0x20>,96(a2)
    21f0:	    move.l 44ec0 <ClScreen+0x24>,100(a2)
    21f8:	    move.l 44ec4 <ClScreen+0x28>,104(a2)
    2200:	    move.l 44ec8 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2208:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    2210:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2218:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    2220:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2228:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    2230:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    2238:	    move.l 44e7c <ClColor>,136(a2)
    2240:	    move.l 44e80 <ClColor+0x4>,140(a2)
    2248:	    move.l 44e84 <ClColor+0x8>,144(a2)
    2250:	    move.l 44e88 <ClColor+0xc>,148(a2)
    2258:	    move.l 44e8c <ClColor+0x10>,152(a2)
    2260:	    move.l 44e90 <ClColor+0x14>,156(a2)
    2268:	    move.l 44e94 <ClColor+0x18>,160(a2)
    2270:	    move.l 44e98 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    2278:	    move.l 44e2c <ClToggleBitPlanes>,168(a2)
    2280:	    move.l 44e30 <ClToggleBitPlanes+0x4>,172(a2)
    2288:	    move.l 44e34 <ClToggleBitPlanes+0x8>,176(a2)
    2290:	    move.l 44e38 <ClToggleBitPlanes+0xc>,180(a2)
    2298:	    move.l 44e3c <ClToggleBitPlanes+0x10>,184(a2)
    22a0:	    move.l 44e40 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    22a8:	    moveq #-2,d0
    22aa:	    move.l d0,192(a2)
}
    22ae:	    move.l a2,d0
    22b0:	    movem.l (sp)+,d2-d3/a2/a6
    22b4:	    rts

000022b6 <SetBplPointers>:

void SetBplPointers() {
    22b6:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    22b8:	    movea.w 75b38 <ScreenBufferOffset>,a0
    22be:	    moveq #0,d0
    22c0:	    move.w a0,d0
    22c2:	    lea 75ec4 <ScreenBufferList>,a2
    22c8:	    move.l d0,d1
    22ca:	    add.l d0,d1
    22cc:	    add.l d1,d1
    22ce:	    move.l (0,a2,d1.l),75e4c <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    22d6:	    move.l d0,d1
    22d8:	    addq.l #1,d1
    22da:	    add.l d1,d1
    22dc:	    add.l d1,d1
    22de:	    movea.l (0,a2,d1.l),a1
    22e2:	    move.l a1,75e3c <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    22e8:	    addq.l #2,d0
    22ea:	    add.l d0,d0
    22ec:	    add.l d0,d0
    22ee:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    22f2:	    move.w a0,d0
    22f4:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    22f6:	    cmpi.w #8,d0
    22fa:	/-- bls.s 22fe <SetBplPointers+0x48>
    22fc:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    22fe:	\-> move.l d1,75e40 <ClearBuffer>
  ScreenBufferOffset += 3;
    2304:	    move.w d0,75b38 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    230a:	    move.w 54(a1),d0
    230e:	    ext.l d0
    2310:	    lsl.l #6,d0
    2312:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    2314:	    movea.l 75fac <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    231a:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    231e:	    move.l d0,d1
    2320:	    clr.w d1
    2322:	    swap d1
    2324:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2328:	    move.l d0,d1
    232a:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    2330:	    move.w d1,126(a0)
  highword = ptr >> 16;
    2334:	    clr.w d1
    2336:	    swap d1
    2338:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    233c:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    2342:	    move.w d0,134(a0)
  highword = ptr >> 16;
    2346:	    clr.w d0
    2348:	    swap d0
    234a:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    234e:	    movea.l (sp)+,a2
    2350:	    rts

00002352 <KPrintF>:
void KPrintF(const char* fmt, ...) {
    2352:	    lea -128(sp),sp
    2356:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    235a:	    move.w f0ff60 <_end+0xe99f9c>,d0
    2360:	    cmpi.w #20153,d0
    2364:	/-- beq.s 2390 <KPrintF+0x3e>
    2366:	|   cmpi.w #-24562,d0
    236a:	+-- beq.s 2390 <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    236c:	|   movea.l 75fc0 <SysBase>,a6
    2372:	|   movea.l 144(sp),a0
    2376:	|   lea 148(sp),a1
    237a:	|   lea 56a6 <KPutCharX>,a2
    2380:	|   suba.l a3,a3
    2382:	|   jsr -522(a6)
}
    2386:	|   movem.l (sp)+,a2-a3/a6
    238a:	|   lea 128(sp),sp
    238e:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    2390:	\-> movea.l 75fc0 <SysBase>,a6
    2396:	    movea.l 144(sp),a0
    239a:	    lea 148(sp),a1
    239e:	    lea 56b4 <PutChar>,a2
    23a4:	    lea 12(sp),a3
    23a8:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    23ac:	    move.l a3,-(sp)
    23ae:	    pea 56 <_start+0x56>
    23b2:	    jsr f0ff60 <_end+0xe99f9c>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    23b8:	    addq.l #8,sp
}
    23ba:	    movem.l (sp)+,a2-a3/a6
    23be:	    lea 128(sp),sp
    23c2:	    rts

000023c4 <DrawRect>:
{  
    23c4:	                                                                                                                                                             lea -24(sp),sp
    23c8:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    23cc:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    23d0:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    23d4:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    23d8:	                                                                                                                                                             tst.w d0
    23da:	                                                                                                               /-------------------------------------------- blt.w 25f4 <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    23de:	                                                                                                               |                                             move.w d0,d4
    23e0:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    23e2:	                                                                                                               |                                             cmpi.w #256,d0
    23e6:	                                                                                                               |                                         /-- ble.s 23f2 <DrawRect+0x2e>
}
    23e8:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    23ec:	                                                                                                               |        |                                |   lea 24(sp),sp
    23f0:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    23f2:	                                                                                                               |        |                                \-> movea.w d1,a0
    23f4:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    23f8:	                                                                                                               |        |                                    cmpa.w #256,a0
    23fc:	                                                                                                            /--|--------|----------------------------------- ble.w 261c <DrawRect+0x258>
    height = 256 - square->YPosMin;
    2400:	                                                                                                            |  |        |                                    move.w #256,d5
    2404:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    2406:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    2408:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    240c:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2410:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 260a <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    2414:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    2416:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    241a:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    241c:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 23e8 <DrawRect+0x24>
    241e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    2422:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 23e8 <DrawRect+0x24>
    2424:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    2428:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 23e8 <DrawRect+0x24>
  xlength = xlength/16;
    242a:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    242c:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    242e:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    2430:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    2434:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    2436:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    2438:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    243a:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    243c:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    243e:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    2440:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    2442:	                                                                                                            |  |  |  |  |  |  |                              movea.l 75f9c <PrepareBuffer>,a1
    2448:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    244a:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd8903e>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2450:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd8903e>,d0
    2456:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    245a:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 2450 <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    245c:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0;
    2464:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd8907e>
  custom->bltadat = data;
    246c:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd890b0>
  custom->bltdpt = Target;  
    2474:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd89090>
  custom->bltdmod = mod;
    247a:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd890a2>
  custom->bltsize = lines*64+linelength;
    2480:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    2482:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    2484:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd89094>
    custom->bltcon1 = 0x0000;      
    248a:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd8907e>
    custom->bltcdat = 0x0;
    2492:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd890ac>
    BltCon0LineDraw = 0x0500;
    249a:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,75b3a <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    24a2:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    24a4:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    24a8:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    24ac:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    24b0:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    24b2:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    24b4:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    24b8:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 2d10 <DrawRect+0x94c>
  if(height != 0) {
    24bc:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    24be:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 2d24 <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    24c2:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,75b3a <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    24ca:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    24ce:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    24d2:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    24d4:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    24d6:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    24da:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2ae8 <DrawRect+0x724>
  if(height != 0) {
    24de:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    24e0:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2afc <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    24e4:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    24e8:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    24ec:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    24ee:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    24f0:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    24f4:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 28d8 <DrawRect+0x514>
  if(height != 0) {
    24f8:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    24fa:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 28ec <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    24fe:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    2500:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    2504:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    2506:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2508:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    250c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 2696 <DrawRect+0x2d2>
  if(height != 0) {
    2510:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    2512:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 26aa <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2516:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 75f9c <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    251c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2520:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    2522:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    2524:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    252a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 75e4c <DrawBuffer>,a0
    2530:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2532:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    2534:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2536:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2538:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    253a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd8903e>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2540:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd8903e>,d1
    2546:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2548:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    254c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    2550:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 2540 <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    2552:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd890a0>
  custom->bltbmod = 64 - length*2;
    2558:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd8909e>
  custom->bltdmod = 64 - length*2;  
    255e:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd890a2>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    2564:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2568:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 2624 <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    256c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    256e:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 2f20 <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2572:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    2578:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    257c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    257e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2580:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2582:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    2588:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    258a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    258c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    2590:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    2594:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    2598:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    259c:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    25a0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 2682 <DrawRect+0x2be>
    25a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    25a6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    25aa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 2654 <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    25ae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd8907c>
    custom->bltapt = (UBYTE *)bltapt;
    25b4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd8908c>
    custom->bltbpt = (UBYTE *)bltdpt;
    25ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd89088>
    custom->bltdpt = (UBYTE *)bltdpt;
    25c0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd89090>
    custom->bltsize = bltsize;
    25c6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd89094>
    bltdpt += 64*256;
    25cc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    25d0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd8903e>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    25d6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd8903e>,d0
    25dc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    25e0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 25d6 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    25e2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    25e4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    25e6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 23e8 <DrawRect+0x24>
    if( planes > 1) {
    25ea:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    25ee:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 25a4 <DrawRect+0x1e0>
    25f0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 2682 <DrawRect+0x2be>
    height += square->YPosMin;
    25f4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    25f6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    25f8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    25fa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    25fc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    25fe:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    2602:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2606:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 2414 <DrawRect+0x50>
    xlength += xposmin - 16;    
    260a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    260c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    260e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    2612:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2616:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2618:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 241a <DrawRect+0x56>
  WORD height = square->Height;
    261c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    261e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    2620:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 2408 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2624:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    262a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    2630:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    2632:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2634:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2636:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    263c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    263e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    2640:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    2644:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2648:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    264c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    2650:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 259c <DrawRect+0x1d8>
    2654:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2656:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd8907c>
    custom->bltapt = (UBYTE *)bltapt;
    265c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd8908c>
    custom->bltbpt = (UBYTE *)bltdpt;
    2662:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd89088>
    custom->bltdpt = (UBYTE *)bltdpt;
    2668:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd89090>
    custom->bltsize = bltsize;
    266e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd89094>
    bltdpt += 64*256;
    2674:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2678:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd8903e>,d0
    267e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 25d6 <DrawRect+0x212>
      bit = color & 1;
    2682:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    2684:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    2688:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    268a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    268c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    2690:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 25ae <DrawRect+0x1ea>
    2694:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 2654 <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    2696:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 3cb8b <incbin_MercuryLetterData2Lz4_end+0x27>
    269c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    26a0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 2352 <KPrintF>(pc)
    26a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    26a6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    26aa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    26ac:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2516 <DrawRect+0x152>
      WORD length = x1 - x2;
    26b0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    26b4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    26b6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    26b8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    26ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    26bc:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 2fe2 <DrawRect+0xc1e>
    26c0:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    26c4:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    26c8:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    26ca:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    26cc:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2856 <DrawRect+0x492>
      height += 1; 
    26d0:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    26d2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    26d4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    26d8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 26e0 <DrawRect+0x31c>
    26da:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    26e0:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    26e4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    26e8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    26ea:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    26ec:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2864 <DrawRect+0x4a0>
      if(yposmin <= 0) {
    26f0:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    26f2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    26f4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 284a <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    26f8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    26fa:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    2700:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 28b0 <DrawRect+0x4ec>
    2704:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    270a:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 32da <DrawRect+0xf16>
    270e:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    2714:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 32aa <DrawRect+0xee6>
          startx -= 1;
    2718:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    271c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    271e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    2720:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    2722:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 28c2 <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2726:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2728:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    272a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    272c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    272e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    2730:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    2732:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 289c <DrawRect+0x4d8>
    2736:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2738:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    273a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    273c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2742:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    2744:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2746:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2748:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    274a:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    274c:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 31ea <DrawRect+0xe26>
    2750:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2754:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2756:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2758:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    275a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    275e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    2764:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2766:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2768:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    276a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    276c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    276e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    2770:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2772:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2774:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2776:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2778:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    277a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    277c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    277e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    2780:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2782:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    2784:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    2786:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    2788:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    278a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    278c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    278e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    2790:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    2792:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    2794:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    2796:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    279a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    279c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    279e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 3cd8e <LookupSlope>,a1
    27a4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    27a6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    27a8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    27ac:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    27ae:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    27b0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    27b2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    27b4:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 287c <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    27b8:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd8903e>,d0
    27be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    27c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd8903e>,d0
    27c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    27ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 27c0 <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    27cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    27ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 75b3a <BltCon0LineDraw>,d0
    27d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    27d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd8907c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    27de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 75f9c <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    27e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 75fa0 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    27ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd89088>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    27f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    27f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    27f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    27f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    27f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89084>
  custom->bltdpt = (UBYTE *)bltdpt;  
    27fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89090>
  custom->bltbmod = bltbmod;
    2804:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd8909e>
  custom->bltcmod = bltdmod;
    280a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd8909c>
  custom->bltdmod = bltdmod;
    2810:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd890a2>
  custom->bltsize = bltwidth + 64*height;
    2816:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2818:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    281a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    281c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89094>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2822:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2826:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2828:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    282a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2830:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 75e4c <DrawBuffer>,a0
    2836:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    283a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    283c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    283e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2840:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd8903e>,d1
    2846:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 2540 <DrawRect+0x17c>
        starty += 96;
    284a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    284e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2852:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 26f8 <DrawRect+0x334>
        height = -height;
    2856:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2858:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    285a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    285c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2860:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 26d0 <DrawRect+0x30c>
        startx += 96;
    2864:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    286a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    286e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2872:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2874:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2876:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 26f8 <DrawRect+0x334>
    287a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 284a <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    287c:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 3cba1 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2886:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 2352 <KPrintF>(pc)
    288a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    288c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2890:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd8903e>,d0
    2896:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2898:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 27c0 <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    289c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    28a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    28a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    28a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    28a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    28ac:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 2742 <DrawRect+0x37e>
          height *= -1;
    28b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    28b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    28b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    28b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    28ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    28bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    28be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2726 <DrawRect+0x362>
    28c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    28c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    28c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    28ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    28cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    28ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    28d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    28d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2736 <DrawRect+0x372>
    28d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 289c <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    28d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 3cb8b <incbin_MercuryLetterData2Lz4_end+0x27>
    28de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    28e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 2352 <KPrintF>(pc)
    28e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    28e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    28ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    28ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 2a60 <DrawRect+0x69c>
      WORD length = x1 - x2;
    28f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    28f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    28f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    28fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    28fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    28fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 3144 <DrawRect+0xd80>
    2902:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2906:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2908:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    290a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    290c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2910:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2912:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 2a94 <DrawRect+0x6d0>
      height += 1; 
    2916:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2918:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    291a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    291e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2928 <DrawRect+0x564>
    2920:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2922:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2926:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2928:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    292c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2930:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2932:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2934:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2a7c <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2938:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    293a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    293c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 2a70 <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2940:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2942:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2944:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2946:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 2f94 <DrawRect+0xbd0>
    294a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    294c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    294e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 2ad2 <DrawRect+0x70e>
    2952:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2954:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2956:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 2f98 <DrawRect+0xbd4>
          height *= -1;
    295a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    295c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    295e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2960:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2ad8 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2964:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2966:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2968:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    296a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 2ac2 <DrawRect+0x6fe>
    296e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2970:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2972:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2976:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2978:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    297a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    297c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    297e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2980:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3168 <DrawRect+0xda4>
    2984:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2988:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    298a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    298c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2990:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2996:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2998:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    299a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    299c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    299e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    29a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    29a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    29a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    29a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    29a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    29aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    29ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    29ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    29b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    29b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    29b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    29b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    29ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    29be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    29c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    29c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    29c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    29c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    29ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    29cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    29d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    29d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    29d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 3cd8e <LookupSlope>,a0
    29da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    29dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    29de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    29e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    29e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    29e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    29ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    29ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2aa0 <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd8903e>,d0
    29f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd8903e>,d0
    2a00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 29fa <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2a06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2a0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 75b3a <BltCon0LineDraw>,a0
    2a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2a12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2a16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd8907c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2a1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 75f9c <PrepareBuffer>,a5
    2a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 75fa0 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2a2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd89088>
  custom->bltcpt = (UBYTE *)bltdpt;
    2a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89084>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89090>
  custom->bltbmod = bltbmod;
    2a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd8909e>
  custom->bltcmod = bltdmod;
    2a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd8909c>
  custom->bltdmod = bltdmod;
    2a4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd890a2>
  custom->bltsize = bltwidth + 64*height;
    2a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89094>
  WORD x1 = square->Vertices[index1].X;
    2a60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    2a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    2a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 24fe <DrawRect+0x13a>
        starty += 96;
    2a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2940 <DrawRect+0x57c>
        startx += 96;
    2a7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2a82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2940 <DrawRect+0x57c>
    2a92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 2a70 <DrawRect+0x6ac>
        height = -height;
    2a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2a98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2916 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 3cba1 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 2352 <KPrintF>(pc)
    2aae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    2ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ab4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd8903e>,d0
    2aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2abe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 29fa <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    2ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2ac6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2aca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2ace:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2976 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    2ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    2ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2964 <DrawRect+0x5a0>
    2ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2ade:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    2ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 296e <DrawRect+0x5aa>
    2ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 2ac2 <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 3cb8b <incbin_MercuryLetterData2Lz4_end+0x27>
    2aee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    2af2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 2352 <KPrintF>(pc)
    2af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2afe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 2c6c <DrawRect+0x8a8>
      WORD length = x1 - x2;
    2b02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2b06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2b0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 30a8 <DrawRect+0xce4>
    2b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    2b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    2b1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    2b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    2b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 2ca0 <DrawRect+0x8dc>
      height += 1; 
    2b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    2b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    2b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 2b32 <DrawRect+0x76e>
    2b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    2b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    2b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    2b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2c88 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    2b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    2b44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    2b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2c7c <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    2b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    2b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    2b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2ce8 <DrawRect+0x924>
    2b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    2b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3298 <DrawRect+0xed4>
    2b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    2b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3268 <DrawRect+0xea4>
          startx -= 1;
    2b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    2b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    2b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    2b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2cfa <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    2b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    2b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    2b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 2cd4 <DrawRect+0x910>
    2b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 30c8 <DrawRect+0xd04>
    2ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    2bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 3cd8e <LookupSlope>,a1
    2bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    2c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2cae <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd8903e>,d0
    2c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2c0e <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 75b3a <BltCon0LineDraw>,d0
    2c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd8907c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 75f9c <PrepareBuffer>,a5
    2c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 75fa0 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd89088>
  custom->bltcpt = (UBYTE *)bltdpt;
    2c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89084>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2c48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89090>
  custom->bltbmod = bltbmod;
    2c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd8909e>
  custom->bltcmod = bltdmod;
    2c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd8909c>
  custom->bltdmod = bltdmod;
    2c5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd890a2>
  custom->bltsize = bltwidth + 64*height;
    2c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    2c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89094>
  WORD x1 = square->Vertices[index1].X;
    2c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    2c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 24e4 <DrawRect+0x120>
        starty += 96;
    2c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    2c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 2b4a <DrawRect+0x786>
        startx += 96;
    2c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2c8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 2b4a <DrawRect+0x786>
    2c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2c7c <DrawRect+0x8b8>
        height = -height;
    2ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    2ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    2ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 2b22 <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 3cba1 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 2352 <KPrintF>(pc)
    2cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    2cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2c0e <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    2cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    2ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 2b94 <DrawRect+0x7d0>
          height *= -1;
    2ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    2cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    2cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2b78 <DrawRect+0x7b4>
    2cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    2d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    2d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2b88 <DrawRect+0x7c4>
    2d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 2cd4 <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    2d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 3cb8b <incbin_MercuryLetterData2Lz4_end+0x27>
    2d16:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    2d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 2352 <KPrintF>(pc)
    2d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    2d20:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    2d24:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    2d26:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 2e98 <DrawRect+0xad4>
      WORD length = x1 - x2;
    2d2a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    2d2e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    2d30:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2d32:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    2d34:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    2d36:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 3002 <DrawRect+0xc3e>
    2d3a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    2d3e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    2d40:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    2d42:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    2d44:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    2d48:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    2d4a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 2ecc <DrawRect+0xb08>
      height += 1; 
    2d4e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    2d50:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2d52:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    2d56:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 2d60 <DrawRect+0x99c>
    2d58:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    2d5a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    2d5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2d60:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2d64:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2d68:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    2d6a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 2eb4 <DrawRect+0xaf0>
      if(yposmin <= 0) {
    2d70:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    2d72:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    2d74:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 2ea8 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2d78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2d7a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2d7c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2d7e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 2f44 <DrawRect+0xb80>
    2d82:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    2d84:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2d86:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 2f0a <DrawRect+0xb46>
    2d8a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2d8c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2d8e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 2f48 <DrawRect+0xb84>
          height *= -1;
    2d92:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    2d94:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2d98:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 2f10 <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2d9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2d9e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2da0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    2da2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 2efa <DrawRect+0xb36>
    2da6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2da8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2daa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2dae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2db0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2db2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2db4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2db6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 3026 <DrawRect+0xc62>
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2dc0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2dc2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    2dc4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2dc8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2dce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2dd0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2dd2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    2dd4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2ddc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2dde:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2de2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2de4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    2de6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2dec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2df0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2df2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2df6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2dfa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2dfe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2e00:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2e02:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2e04:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2e08:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    2e0a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2e0c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 3cd8e <LookupSlope>,a0
    2e12:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    2e16:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2e1a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2e1c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2e20:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2e22:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    2e24:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 2ed8 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2e28:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd8903e>,d0
    2e2e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd8903e>,d0
    2e38:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2e3c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 2e32 <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2e3e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2e42:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 75b3a <BltCon0LineDraw>,a0
    2e48:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2e4a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2e4c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2e4e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd8907c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2e54:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2e56:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2e58:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 75f9c <PrepareBuffer>,a5
    2e5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2e60:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 75fa0 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2e66:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd89088>
  custom->bltcpt = (UBYTE *)bltdpt;
    2e6c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89084>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89090>
  custom->bltbmod = bltbmod;
    2e78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd8909e>
  custom->bltcmod = bltdmod;
    2e80:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd8909c>
  custom->bltdmod = bltdmod;
    2e86:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd890a2>
  custom->bltsize = bltwidth + 64*height;
    2e8c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2e8e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2e90:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2e92:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89094>
  WORD x1 = square->Vertices[index1].X;
    2e98:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    2e9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2ea0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    2ea4:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 24c2 <DrawRect+0xfe>
        starty += 96;
    2ea8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2eac:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2eb0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2d78 <DrawRect+0x9b4>
        startx += 96;
    2eb4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2eba:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2ebe:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2ec2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    2ec4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    2ec6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2d78 <DrawRect+0x9b4>
    2eca:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 2ea8 <DrawRect+0xae4>
        height = -height;
    2ecc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    2ece:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    2ed0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    2ed2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    2ed4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 2d4e <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2ed8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 3cba1 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2ede:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    2ee2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 2352 <KPrintF>(pc)
    2ee6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    2ee8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2eec:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd8903e>,d0
    2ef2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    2ef6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 2e32 <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    2efa:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    2efe:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    2f00:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2f02:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    2f06:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2dae <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    2f0a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    2f0c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2d9c <DrawRect+0x9d8>
    2f10:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    2f14:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    2f16:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2f18:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    2f1a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2da6 <DrawRect+0x9e2>
    2f1e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 2efa <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    2f20:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    2f22:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2f24:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2f26:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    2f2c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    2f2e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    2f30:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    2f34:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    2f38:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    2f3c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    2f40:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 259c <DrawRect+0x1d8>
          height *= -1;
    2f44:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    2f46:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    2f48:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    2f4c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    2f50:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 2f80 <DrawRect+0xbbc>
    2f52:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    2f54:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2f56:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    2f58:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    2f5a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    2f5c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    2f5e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 2f6e <DrawRect+0xbaa>
    2f60:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    2f62:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    2f64:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    2f66:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    2f6a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2dae <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    2f6e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    2f72:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    2f74:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    2f76:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    2f78:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    2f7c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2dae <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    2f80:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    2f84:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    2f86:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2f88:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    2f8a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    2f8c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    2f8e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    2f90:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 2f60 <DrawRect+0xb9c>
    2f92:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 2f6e <DrawRect+0xbaa>
          height *= -1;
    2f94:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    2f96:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    2f98:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    2f9c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    2fa0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 2fbe <DrawRect+0xbfa>
    2fa2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    2fa4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2fa6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    2fa8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    2faa:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    2fac:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    2fae:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 2fd0 <DrawRect+0xc0c>
    2fb0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    2fb2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    2fb4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    2fb6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    2fba:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2976 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    2fbe:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    2fc2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    2fc4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2fc6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    2fc8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    2fca:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    2fcc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    2fce:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 2fb0 <DrawRect+0xbec>
    2fd0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    2fd4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    2fd6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    2fd8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    2fda:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    2fde:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2976 <DrawRect+0x5b2>
        length *= -1;
    2fe2:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    2fe4:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    2fe6:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    2fe8:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    2fec:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    2ff0:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    2ff6:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    2ff8:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    2ffa:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 26d0 <DrawRect+0x30c>
    2ffe:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2856 <DrawRect+0x492>
        length *= -1;
    3002:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    3004:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    3006:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    3008:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    300c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    3010:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    3014:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    3016:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    3018:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    301c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    301e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 2d4e <DrawRect+0x98a>
    3022:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 2ecc <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    3026:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    3028:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    302a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    302c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    3030:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    3032:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    3034:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    3036:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    3038:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    303c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    303e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    3040:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    3044:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    304a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    304c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    304e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    3050:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3052:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    3054:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3056:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3058:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    305a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    305c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    305e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3060:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    3062:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3066:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3068:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    306a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    306c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    306e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    3072:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    3074:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3076:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    307a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    307c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    307e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    3080:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    3084:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    3086:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3088:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 3cd8e <LookupSlope>,a0
    308e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    3090:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    3092:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    3096:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    3098:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    309c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    309e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    30a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 2e28 <DrawRect+0xa64>
    30a4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 2ed8 <DrawRect+0xb14>
        length *= -1;
    30a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    30aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    30ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    30ae:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    30b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    30b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    30bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    30be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    30c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 2b22 <DrawRect+0x75e>
    30c4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 2ca0 <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    30c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    30ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    30cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    30ce:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    30d2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    30d4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    30d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    30d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    30da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    30de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    30e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    30e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    30e4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    30e8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    30ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    30f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    30f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    30f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    30f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    30f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    30fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    30fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    30fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    3100:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    3102:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3104:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    3106:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    3108:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    310a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    310c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    310e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    3110:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    3112:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3114:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    3116:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3118:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    311a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    311c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    311e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    3120:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    3124:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    3126:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3128:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 3cd8e <LookupSlope>,a1
    312e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    3130:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    3132:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    3136:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    3138:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    313a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    313c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2c08 <DrawRect+0x844>
    3140:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2cae <DrawRect+0x8ea>
        length *= -1;
    3144:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    3146:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    3148:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    314a:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    314e:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    3152:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    3156:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    3158:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    315a:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    315e:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    3160:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2916 <DrawRect+0x552>
    3164:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 2a94 <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3168:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    316a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    316c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    316e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    3172:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    3174:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    3176:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    3178:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    317a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    317e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3180:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    3182:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    3186:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    318c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    318e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    3190:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    3192:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3194:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    3196:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3198:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    319a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    319c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    319e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    31a0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    31a2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    31a4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    31a8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    31aa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    31ac:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    31ae:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    31b0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    31b4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    31b6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    31b8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    31bc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    31be:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    31c0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    31c2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    31c6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    31c8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    31ca:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 3cd8e <LookupSlope>,a0
    31d0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    31d2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    31d4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    31d8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    31da:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    31de:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    31e0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    31e2:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 29f0 <DrawRect+0x62c>
    31e6:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 2aa0 <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    31ea:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    31ec:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    31ee:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    31f0:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    31f4:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    31f6:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    31f8:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    31fa:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    31fc:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    3200:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    3202:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3204:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    3206:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    320a:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    3210:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    3212:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3214:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    3216:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3218:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    321a:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    321c:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    321e:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    3220:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3222:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    3224:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3226:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    3228:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    322a:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    322c:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    322e:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    3230:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    3232:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    3234:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3236:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    3238:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    323a:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    323c:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    323e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    3240:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    3242:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    3246:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    3248:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    324a:	|  |  |  |  |                                                  |  |  |                                                                                       lea 3cd8e <LookupSlope>,a1
    3250:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    3252:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    3254:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    3258:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    325a:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    325c:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    325e:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    3260:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 27b8 <DrawRect+0x3f4>
    3264:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 287c <DrawRect+0x4b8>
          height *= -1;
    3268:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    326a:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    326c:	|  |  |                                                        |     |                                                                                       tst.w d3
    326e:	|  |  |                                                        |     |                                                                                /----- blt.s 329c <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    3270:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    3272:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    3274:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    3276:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 3286 <DrawRect+0xec2>
    3278:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    327a:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    327c:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3282:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 2b94 <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    3286:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    328a:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    328c:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    328e:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3294:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 2b94 <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    3298:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    329a:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 3270 <DrawRect+0xeac>
    329c:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    32a0:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    32a2:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    32a4:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    32a6:	|  |  |                                                                                                                                         |  \-------- bpl.s 3278 <DrawRect+0xeb4>
    32a8:	|  |  |                                                                                                                                         \----------- bra.s 3286 <DrawRect+0xec2>
          height *= -1;
    32aa:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    32ac:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    32ae:	|     |                                                                                                                                                      tst.w d3
    32b0:	|     |                                                                                                                                               /----- blt.s 32de <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    32b2:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    32b4:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    32b6:	|     |                                                                                                                                               |  |   move.w a4,d0
    32b8:	|     |                                                                                                                                         /-----|--|-- bmi.s 32c8 <DrawRect+0xf04>
    32ba:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    32bc:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    32be:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    32c4:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2742 <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    32c8:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    32cc:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    32ce:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    32d0:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    32d6:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2742 <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    32da:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    32dc:	                                                                                                                                                |  |  |  \-- bge.s 32b2 <DrawRect+0xeee>
    32de:	                                                                                                                                                |  |  \----> addi.w #15,d3
    32e2:	                                                                                                                                                |  |         asr.w #4,d3
    32e4:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    32e6:	                                                                                                                                                |  |         move.w a4,d0
    32e8:	                                                                                                                                                |  \-------- bpl.s 32ba <DrawRect+0xef6>
    32ea:	                                                                                                                                                \----------- bra.s 32c8 <DrawRect+0xf04>

000032ec <DrawCube3d>:
{
    32ec:	                                                                                                                      lea -72(sp),sp
    32f0:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    32f4:	                                                                                                                      movea.l 120(sp),a2
    32f8:	                                                                                                                      move.w 126(sp),108(sp)
    32fe:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    3304:	                                                                                                                      move.w #0,dff042 <_end+0xd8907e>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    330c:	                                                                                                                      move.l 75e40 <ClearBuffer>,54(sp)
    3314:	                                                                                                                      lea 75b3c <Cubes>,a3
    331a:	                                                                                                                      moveq #0,d5
    331c:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    331e:	|                                                                                                                     add.l d5,d2
    3320:	|                                                                                                                     move.l d2,102(sp)
    3324:	|                                                                                                                     add.l d5,d2
    3326:	|                                                                                                                     add.l d2,d2
    3328:	|                                                                                                                     add.l d2,d2
    332a:	|                                                                                                                     movea.l 54(sp),a0
    332e:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    3332:	|                                                                                                                     movea.l 75fb8 <GfxBase>,a6
    3338:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    333c:	|                                                                                                                     move.w #496,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0;
    3344:	|                                                                                                                     move.w #0,dff042 <_end+0xd8907e>
  custom->bltdmod = bltmod;
    334c:	|                                                                                                                     move.w d3,dff066 <_end+0xd890a2>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    3352:	|                                                                                                                     move.l 75e40 <ClearBuffer>,54(sp)
    335a:	|                                                                                                                     movea.l 54(sp),a4
    335e:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3362:	|                                                                                                                     cmpa.w #0,a6
    3366:	|                       /-------------------------------------------------------------------------------------------- bne.w 3c70 <DrawCube3d+0x984>
    336a:	|                       |                                                                                             move.l d5,d1
    336c:	|                       |                                                                                             addq.l #1,d1
    336e:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    3372:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    3374:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    337a:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    337e:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    3382:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    3386:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    338a:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    338e:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    3392:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3398:	|                    |  |                                                                                             movea.w a0,a1
    339a:	|                    |  |                                                                                             subq.l #1,a1
    339c:	|                    |  |                                                                                             adda.l a1,a1
    339e:	|                    |  |                                                                                             lea 41bae <zMult>,a5
    33a4:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    33aa:	|                    |  |                                                                                             move.w 62(sp),d0
    33ae:	|                    |  |                                                                                             muls.w d1,d0
    33b0:	|                    |  |                                                                                             moveq #15,d7
    33b2:	|                    |  |                                                                                             asr.l d7,d0
    33b4:	|                    |  |                                                                                             movea.l d0,a1
    33b6:	|                    |  |                                                                                             lea 160(a1),a1
    33ba:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    33be:	|                    |  |                                                                                             move.w 62(sp),d7
    33c2:	|                    |  |                                                                                             muls.w 86(sp),d7
    33c6:	|                    |  |                                                                                             moveq #15,d0
    33c8:	|                    |  |                                                                                             asr.l d0,d7
    33ca:	|                    |  |                                                                                             addi.w #128,d7
    33ce:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    33d2:	|                    |  |                                                                                             movea.w 10(a2),a1
    33d6:	|                    |  |                                                                                             subq.l #1,a1
    33d8:	|                    |  |                                                                                             adda.l a1,a1
    33da:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    33e0:	|                    |  |                                                                                             move.w 70(sp),d7
    33e4:	|                    |  |                                                                                             muls.w 6(a2),d7
    33e8:	|                    |  |                                                                                             asr.l d0,d7
    33ea:	|                    |  |                                                                                             movea.l d7,a1
    33ec:	|                    |  |                                                                                             lea 160(a1),a1
    33f0:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    33f4:	|                    |  |                                                                                             move.w 70(sp),d7
    33f8:	|                    |  |                                                                                             muls.w 8(a2),d7
    33fc:	|                    |  |                                                                                             asr.l d0,d7
    33fe:	|                    |  |                                                                                             addi.w #128,d7
    3402:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3406:	|                    |  |                                                                                             movea.w a4,a1
    3408:	|                    |  |                                                                                             move.l a1,d7
    340a:	|                    |  |                                                                                             subq.l #1,d7
    340c:	|                    |  |                                                                                             add.l d7,d7
    340e:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    3414:	|                    |  |                                                                                             move.w 76(sp),d0
    3418:	|                    |  |                                                                                             muls.w d4,d0
    341a:	|                    |  |                                                                                             moveq #15,d7
    341c:	|                    |  |                                                                                             asr.l d7,d0
    341e:	|                    |  |                                                                                             movea.l d0,a5
    3420:	|                    |  |                                                                                             lea 160(a5),a5
    3424:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3428:	|                    |  |                                                                                             move.w 76(sp),d7
    342c:	|                    |  |                                                                                             muls.w d3,d7
    342e:	|                    |  |                                                                                             moveq #15,d0
    3430:	|                    |  |                                                                                             asr.l d0,d7
    3432:	|                    |  |                                                                                             addi.w #128,d7
    3436:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    343a:	|                    |  |                                                                                             cmpa.w #0,a6
    343e:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 344a <DrawCube3d+0x15e>
    3440:	|                    |  |  |                                                                                          tst.w 75e44 <DoNotClearDirty>
    3446:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 3c1e <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    344a:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    344e:	|                    |  |  |  |                                                                                       move.l a5,d7
    3450:	|                    |  |  |  |                                                                                       subq.l #1,d7
    3452:	|                    |  |  |  |                                                                                       add.l d7,d7
    3454:	|                    |  |  |  |                                                                                       lea 41bae <zMult>,a5
    345a:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    3460:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    3464:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3466:	|                    |  |  |  |                                                                                       moveq #15,d7
    3468:	|                    |  |  |  |                                                                                       asr.l d7,d0
    346a:	|                    |  |  |  |                                                                                       movea.l d0,a5
    346c:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    3470:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    3474:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    3478:	|                    |  |  |  |                                                                                       muls.w d6,d7
    347a:	|                    |  |  |  |                                                                                       moveq #15,d0
    347c:	|                    |  |  |  |                                                                                       asr.l d0,d7
    347e:	|                    |  |  |  |                                                                                       addi.w #128,d7
    3482:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3486:	|                    |  |  |  |                                                                                       move.l a1,d7
    3488:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    348e:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3490:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    3492:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    3496:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3498:	|                    |  |  |  |                                                                                       muls.w d3,d0
    349a:	|                    |  |  |  |                                                                                       movea.l d1,a5
    349c:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    349e:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    34a0:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    34a2:	|                    |  |  |  |                                                                                       movea.w a0,a0
    34a4:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    34a6:	|                    |  |  |  |                                                                                       jsr 55ac <__mulsi3>
    34ac:	|                    |  |  |  |                                                                                       addq.l #8,sp
    34ae:	|                    |  |  |  |                                                                                       add.l a5,d0
    34b0:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    34b4:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    34b8:	|                    |  |  |  |                                                                                       neg.l d0
    34ba:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    34be:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    34c2:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    34c6:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 34d2 <DrawCube3d+0x1e6>
    34c8:	|                    |  |  |  |  |                                                                                    tst.w 75e44 <DoNotClearDirty>
    34ce:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3bde <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    34d2:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    34d6:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    34d8:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    34da:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    34dc:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    34e0:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    34e4:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    34e6:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    34e8:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    34ea:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    34ec:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    34ee:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    34f2:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    34f4:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    34f6:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    34f8:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    34fa:	|                    |  |  |  |  |  |                                                                                 jsr 55ac <__mulsi3>
    3500:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    3502:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    3504:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    3508:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    350a:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    350c:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    3510:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3514:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3518:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 352c <DrawCube3d+0x240>
    351a:	|  |                 |  |  |  |  |  |                                                                                 tst.w 75e44 <DoNotClearDirty>
    3520:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 352c <DrawCube3d+0x240>
    3522:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3528:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 410e <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    352c:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    3530:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3536:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    353c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    3542:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3548:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    354e:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    3554:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    355a:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    355e:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    3562:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3566:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3568:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    356a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    356c:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    356e:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3570:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    3572:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    3574:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    3576:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3578:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    357a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    357c:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    357e:	|  |  |              |  |  |  |  |  |                                                                                 jsr 55ac <__mulsi3>
    3584:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    3586:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    3588:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    358c:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    358e:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    3592:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    3596:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    3598:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    359a:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    359c:	|  |  |              |  |  |  |  |  |                                                                                 lea 41bae <zMult>,a4
    35a2:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    35a6:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    35a8:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    35ac:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    35ae:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    35b0:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    35b4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    35b8:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    35ba:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    35bc:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    35c0:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    35c4:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    35c6:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    35c8:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    35ca:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    35ce:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    35d0:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    35d4:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    35d6:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    35da:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    35de:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    35e0:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    35e4:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    35e6:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    35e8:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    35ea:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    35ec:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    35f0:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    35f2:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    35f4:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    35f8:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    35fa:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    35fc:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    35fe:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    3602:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    3606:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    3608:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    360a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    360e:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    3610:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    3614:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3616:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3618:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    361a:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    361e:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    3620:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    3624:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3626:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3628:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    362a:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    362e:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3632:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3646 <DrawCube3d+0x35a>
    3634:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 75e44 <DoNotClearDirty>
    363a:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3646 <DrawCube3d+0x35a>
    363c:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3642:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 40b6 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3646:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    364c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    3652:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3656:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    365a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    365e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    3662:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3666:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    366a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    366e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    3672:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    3678:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    367e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    3684:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    368a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    3690:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    3696:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    369a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    369e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    36a2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    36a6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    36ac:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    36b2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    36b6:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 36ca <DrawCube3d+0x3de>
    36b8:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 75e44 <DoNotClearDirty>
    36be:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 36ca <DrawCube3d+0x3de>
    36c0:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    36c6:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 414e <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    36ca:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    36d0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    36d6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    36da:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    36de:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    36e2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    36e6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    36ec:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    36f2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    36f8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    36fe:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    3702:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3706:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    370a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    370e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    3714:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    371a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    3720:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3726:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    372a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    3730:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    3734:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3738:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    373e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    3744:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    374a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    3750:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    3754:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3758:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    375e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    3764:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3768:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    376c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    3770:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    3774:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 331c <DrawCube3d+0x30>
    3778:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 75bfc <Cubes+0xc0>,a6
    377e:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    3782:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    3786:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    378a:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    3790:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    3794:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    3798:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    379c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    379e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    37a0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    37a2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    37a8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    37ae:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    37b2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    37b6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    37ba:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 391c <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    37be:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    37c2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    37c6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 37b6 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    37c8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    37cc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    37d0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 75e48 <CubeNrReversePtr>,a0
    37d6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    37da:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    37dc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 3b00 <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    37e0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    37e2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 3a66 <DrawCube3d+0x77a>
    37e6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    37e8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    37ea:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    37ee:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3a76 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    37f2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    37f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 3cd2 <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    37fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    3802:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 380a <DrawCube3d+0x51e>
    3804:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    380a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    380e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    3810:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 75e4c <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3816:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    381a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    381c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3820:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3822:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3824:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3826:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    382a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    382e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3832:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3836:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    383a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    383c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    383e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3840:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3842:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3844:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3848:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    384c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    384e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3850:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3852:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3854:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3856:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    385a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    385e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3870 <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3860:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3864:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3870 <DrawCube3d+0x584>
    3866:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    386c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 3b92 <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3870:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3874:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3886 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3876:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    387a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3886 <DrawCube3d+0x59a>
    387c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 3ba0 <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3886:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    388a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 389c <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    388c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3890:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 389c <DrawCube3d+0x5b0>
    3892:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3898:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 3b42 <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    389c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    38a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 38b2 <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    38a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    38a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 38b2 <DrawCube3d+0x5c6>
    38a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    38ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 3b50 <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    38b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    38b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 38c8 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    38b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    38bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 38c8 <DrawCube3d+0x5dc>
    38be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    38c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 3b5e <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    38c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    38cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 38de <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    38ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    38d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 38de <DrawCube3d+0x5f2>
    38d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    38da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 3b6c <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    38de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    38e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    38e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    38ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    38ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    38f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 3790 <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    38f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 75e4c <DrawBuffer>,a2
  if( mirroring == 1) {
    38fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3902:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 3d34 <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3906:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    390c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3912:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3916:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    391a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    391c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3920:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3922:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3926:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3928:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    392a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3930:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3934:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3938:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    393a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    393e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3940:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3944:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3948:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    394a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    394e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3952:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3954:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3958:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    395a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    395e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3962:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3964:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3966:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3968:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    396a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    396c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3970:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3974:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3978:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    397a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    397c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    397e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3980:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3984:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3986:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3988:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    398a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    398c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    398e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3992:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3996:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    399a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    399c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    399e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    39a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    39a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    39a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    39a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    39aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39ae <DrawCube3d+0x6c2>
    39ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    39ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    39b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39b4 <DrawCube3d+0x6c8>
    39b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    39b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    39b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39ba <DrawCube3d+0x6ce>
    39b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    39ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    39be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    39c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39c4 <DrawCube3d+0x6d8>
    39c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    39c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    39c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39ca <DrawCube3d+0x6de>
    39c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    39ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    39cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    39ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 39d2 <DrawCube3d+0x6e6>
    39d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    39d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    39d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39d8 <DrawCube3d+0x6ec>
    39d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    39d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    39da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39de <DrawCube3d+0x6f2>
    39dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    39de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    39e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39e4 <DrawCube3d+0x6f8>
    39e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    39e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    39e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    39ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39ee <DrawCube3d+0x702>
    39ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    39ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    39f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39f4 <DrawCube3d+0x708>
    39f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    39f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    39f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    39f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 39fc <DrawCube3d+0x710>
    39fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    39fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3a00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3a06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3a08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3a12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3a16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3a1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3a22 <DrawCube3d+0x736>
    3a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3a22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3a2c <DrawCube3d+0x740>
    3a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3a2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3a32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3a38 <DrawCube3d+0x74c>
    3a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3a42 <DrawCube3d+0x756>
    3a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3a42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 37b6 <DrawCube3d+0x4ca>
    3a62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 37c8 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    3a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    3a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    3a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    3a6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    3a72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 37f2 <DrawCube3d+0x506>
      if(maxycube < 0) {
    3a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3a7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3cc8 <DrawCube3d+0x9dc>
      minycube = 0;
    3a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    3a84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3a88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3a92 <DrawCube3d+0x7a6>
    3a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    3a92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3a98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3a9e <DrawCube3d+0x7b2>
    3a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3a9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 75e4c <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3aa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3aae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    3ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3816 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3ab8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 3c84 <DrawCube3d+0x998>
    3ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    3ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    3ac4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3ac6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3aca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3ace:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    3ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    3ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3ada:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3ade:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    3ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    3ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3aea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3aee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    3af2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    3af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3832 <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    3b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3bae <DrawCube3d+0x8c2>
    3b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    3b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    3b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    3b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    3b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    3b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    3b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    3b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    3b28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    3b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    3b30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    3b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    3b34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    3b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    3b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 37e6 <DrawCube3d+0x4fa>
    3b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 3a66 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    3b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    3b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    3b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 389c <DrawCube3d+0x5b0>
    3b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    3b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    3b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 38b2 <DrawCube3d+0x5c6>
    3b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    3b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    3b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 38c8 <DrawCube3d+0x5dc>
    3b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    3b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    3b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 3790 <DrawCube3d+0x4a4>
    3b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 38f6 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    3b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3870 <DrawCube3d+0x584>
    3ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    3ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 23c4 <DrawRect>(pc)
    3ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3886 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    3bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    3bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    3bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    3bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    3bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    3bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    3bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 3b38 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3bde:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    3be2:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3be4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3be8:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3bea:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3bec:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    3bf0:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3bf4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd8903e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3bfa:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd8903e>,d0
    3c00:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    3c04:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3bfa <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3c06:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    3c0c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    3c14:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd89094>
}
    3c1a:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 34d2 <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3c1e:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    3c22:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3c24:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    3c28:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3c2a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3c2c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    3c30:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3c36:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd8903e>,d7
    3c3c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    3c40:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3c44:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd8903e>,d7
    3c4a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    3c4e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 3c44 <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    3c50:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    3c54:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    3c5a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    3c62:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd89094>
      clearpos += 64*BPLHEIGHT;
    3c68:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    3c6c:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 344a <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3c70:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 75e44 <DoNotClearDirty>
    3c76:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 3cf0 <DrawCube3d+0xa04>
    3c78:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3c7a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3c7c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    3c80:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 3372 <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3c84:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3c88:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3c8a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3c8c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3c8e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    3c92:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    3c94:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3c96:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3c98:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3c9c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3c9e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    3ca2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    3ca4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ca6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ca8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3caa:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3cac:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3cae:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3cb2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3cb6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3cb8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3cba:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3cbc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3cbe:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    3cc0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    3cc4:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3832 <DrawCube3d+0x546>
      if(maxycube < 0) {
    3cc8:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3cca:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3cce:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 3a84 <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    3cd2:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3cd6:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3cd8:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 3ce0 <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3cda:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3cdc:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 3a84 <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    3ce0:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    3ce4:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3ce8:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3cec:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 3a84 <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3cf0:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    3cf2:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    3cf4:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3cf8:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3cfa:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3cfc:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3cfe:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3d00:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3d02:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3d06:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd8903e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3d0c:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd8903e>,d0
    3d12:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    3d16:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3d0c <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    3d18:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    3d1e:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    3d26:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd89094>
      clearpos += 64*BPLHEIGHT;
    3d2c:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    3d30:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 3372 <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3d34:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    3d38:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    3d3c:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    3d3e:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3d40:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3d42:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    3d46:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    3d4a:	|  |  |  |  |  |  |                                                                                                   movea.l 75f9c <PrepareBuffer>,a6
    3d50:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    3d54:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    3d58:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    3d5a:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3d5e:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3d64:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    3d6a:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3d6e:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3d64 <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    3d70:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd89080>
  custom->bltalwm = 0xffff; //Show All
    3d78:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd89082>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    3d80:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd890ac>
  custom->bltamod = 60;
    3d88:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd890a0>
  custom->bltbmod = 60;
    3d90:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd8909e>
  custom->bltdmod = 60;    
    3d98:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd890a2>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    3da0:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x8002; //Ascending
    3da8:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd8907e>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3db0:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    3db2:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    3db4:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3db6:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3db8:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3dba:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3dbe:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    3dc0:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    3dc2:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    3dc4:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3dc6:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3dca:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3dcc:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3dce:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    3dd2:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    3dd6:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    3dda:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3ddc:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3dde:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    3de0:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3de4:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    3de8:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    3dec:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    3dee:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    3df0:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    3df4:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    3df6:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    3dfa:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 3e30 <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    3dfc:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd8908c>
      custom->bltbpt = bltbpos;
    3e02:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd89088>
      custom->bltdpt = bltdpos;
    3e08:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd89090>
      custom->bltsize = 2 + height * 64;
    3e0e:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd89094>
      bltapos -= 2;
    3e14:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    3e16:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    3e18:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e1a:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd8903e>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3e20:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd8903e>,d0
    3e26:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    3e2a:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 3e20 <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    3e2c:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    3e2e:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 3dfc <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    3e30:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    3e36:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    3e38:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 3e56 <DrawCube3d+0xb6a>
    3e3a:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3e3c:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    3e40:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    3e44:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    3e46:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    3e48:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    3e4c:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    3e4e:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    3e52:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 3dfc <DrawCube3d+0xb10>
    3e54:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 3e30 <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    3e56:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    3e5e:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd8907e>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    3e66:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd890ac>
  UWORD mod=64 - length*2-2;
    3e6e:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    3e70:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    3e72:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    3e74:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd890a0>
  custom->bltbmod = mod;
    3e7a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd8909e>
  custom->bltdmod = mod;
    3e80:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd890a2>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3e86:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3e88:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3e8a:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    3e8e:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    3e92:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    3e94:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3e96:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    3e98:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    3e9a:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3e9c:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    3e9e:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    3ea0:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    3ea2:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3ea8:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3eae:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3eb4:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3eba:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd8903e>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3ec0:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d4
    3ec6:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    3eca:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3ec0 <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3ecc:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    3ece:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    3ed2:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    3ed6:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    3ed8:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    3ede:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    3ee0:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    3ee2:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3ee8:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3eee:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3ef4:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3efa:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3f00:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    3f06:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f0a:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f00 <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    3f0c:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0xe002;
    3f14:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd8907e>
  custom->bltcdat = 0x3333;
    3f1c:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd890ac>
  custom->bltamod = mod;
    3f24:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd890a0>
  custom->bltbmod = mod;
    3f2a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd8909e>
  custom->bltdmod = mod;
    3f30:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd890a2>
    custom->bltapt = bltapos;
    3f36:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3f3c:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3f42:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3f48:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f4e:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3f54:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    3f5a:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f5e:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f54 <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    3f60:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3f66:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3f6c:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3f72:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f78:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3f7e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    3f84:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f88:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f7e <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    3f8a:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0xf002;
    3f92:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd8907e>
  custom->bltcdat = 0x5555;
    3f9a:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd890ac>
  custom->bltamod = mod;
    3fa2:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd890a0>
  custom->bltbmod = mod;
    3fa8:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd8909e>
  custom->bltdmod = mod;
    3fae:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd890a2>
    custom->bltapt = bltapos;
    3fb4:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3fba:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3fc0:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3fc6:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3fcc:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3fd2:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    3fd8:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3fdc:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3fd2 <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    3fde:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd8908c>
    custom->bltbpt = bltbpos;
    3fe4:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89088>
    custom->bltdpt = bltdpos;
    3fea:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89090>
    custom->bltsize = length+1 + height * 64;
    3ff0:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3ff6:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3ffc:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    4002:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4006:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3ffc <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    4008:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd8907c>
  custom->bltcon1 = 0x0002;
    4010:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd8907e>
  custom->bltcdat = 0x0;
    4018:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd890ac>
  mod=64 -length*2;
    4020:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    4022:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    4024:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    4026:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd890a0>
  custom->bltdmod = mod;
    402c:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd890a2>
  custom->bltafwm = bltfmask;
    4032:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd89080>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    403a:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    403e:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    4040:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4044:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd8908c>
    custom->bltdpt = bltdpos;
    404a:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd89090>
    custom->bltsize = length + height * 64;
    4050:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4056:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    405c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    4062:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4066:	|  |  |  |  |  |  |                                                                                               \-- bne.s 405c <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4068:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    406a:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    406e:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    4070:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4074:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd8908c>
    custom->bltdpt = bltdpos;
    407a:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd89090>
    custom->bltsize = length + height * 64;
    4080:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd89094>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4086:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd8903e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    408c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd8903e>,d0
    4092:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4096:	|  |  |  |  |  |  |                                                                                               \-- bne.s 408c <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    4098:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd89080>
  DrawBuffer->minytotal = minytotal;
    40a0:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    40a6:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    40ac:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    40b0:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    40b4:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    40b6:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    40ba:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    40bc:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    40c0:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    40c2:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    40c4:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    40c8:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40ce:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd8903e>,d6
    40d4:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    40d8:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    40dc:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd8903e>,d6
    40e2:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    40e6:	|  |  |  |  |  |                                                                                                  \-- bne.s 40dc <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    40e8:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    40ec:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    40f0:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    40f6:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    40fe:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd89094>
      clearpos += 64*BPLHEIGHT;
    4106:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    410a:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3646 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    410e:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4112:	|  |        |  |                                                                                                      add.l d0,d0
    4114:	|  |        |  |                                                                                                      add.l 94(sp),d0
    4118:	|  |        |  |                                                                                                      add.l d0,d0
    411a:	|  |        |  |                                                                                                      add.l d0,d0
    411c:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4120:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd8903e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4126:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd8903e>,d0
    412c:	|  |        |  |                                                                                                  |   btst #14,d0
    4130:	|  |        |  |                                                                                                  \-- bne.s 4126 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    4132:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    4138:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    4140:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd89094>
      clearpos += 64*BPLHEIGHT;
    4146:	|  |        |  |                                                                                                      lea 16384(a5),a5
    414a:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 352c <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    414e:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4152:	|           |                                                                                                         add.l d0,d0
    4154:	|           |                                                                                                         add.l 94(sp),d0
    4158:	|           |                                                                                                         add.l d0,d0
    415a:	|           |                                                                                                         add.l d0,d0
    415c:	|           |                                                                                                         movea.l 54(sp),a4
    4160:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4164:	|           |                                                                                                         move.w dff002 <_end+0xd8903e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    416a:	|           |                                                                                                     /-> move.w dff002 <_end+0xd8903e>,d0
    4170:	|           |                                                                                                     |   btst #14,d0
    4174:	|           |                                                                                                     \-- bne.s 416a <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    4176:	|           |                                                                                                         move.l a5,dff054 <_end+0xd89090>
    custom->bltadat = 0x0;
    417c:	|           |                                                                                                         move.w #0,dff074 <_end+0xd890b0>
    custom->bltsize = bltsize;    
    4184:	|           |                                                                                                         move.w d6,dff058 <_end+0xd89094>
    squares[3].Vertices[0].X = xs0;
    418a:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    4190:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    4196:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    419a:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    419e:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    41a2:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    41a6:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    41ac:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    41b2:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    41b8:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    41be:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    41c2:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    41c6:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    41ca:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    41ce:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    41d4:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    41da:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    41e0:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    41e6:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    41ea:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    41f0:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    41f4:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    41f8:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    41fe:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    4204:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    420a:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    4210:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    4214:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    4218:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    421e:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    4224:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    4228:	|           |                                                                                                         move.l 94(sp),d5
    422c:	|           |                                                                                                         lea 192(a3),a3
    4230:	|           |                                                                                                         cmp.w 106(sp),d5
    4234:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 331c <DrawCube3d+0x30>
    4238:	            \-------------------------------------------------------------------------------------------------------- bra.w 3778 <DrawCube3d+0x48c>

0000423c <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    423c:	       link.w a5,#-52
    4240:	       move.l a2,-(sp)
    4242:	       move.l d2,-(sp)
    4244:	       movea.l 12(a5),a1
    4248:	       move.l 16(a5),d2
    424c:	       move.l 20(a5),d1
	struct debug_resource resource = {
    4250:	       clr.l -42(a5)
    4254:	       clr.l -38(a5)
    4258:	       clr.l -34(a5)
    425c:	       clr.l -30(a5)
    4260:	       clr.l -26(a5)
    4264:	       clr.l -22(a5)
    4268:	       clr.l -18(a5)
    426c:	       clr.l -14(a5)
    4270:	       clr.w -10(a5)
    4274:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    427a:	       move.w d2,d0
    427c:	       muls.w d1,d0
    427e:	       lsl.l #6,d0
	struct debug_resource resource = {
    4280:	       move.l d0,-46(a5)
    4284:	       clr.w -8(a5)
    4288:	       move.w #512,-6(a5)
    428e:	       move.w d2,-4(a5)
    4292:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    4296:	       move.b (a1),d0
    4298:	       lea -42(a5),a0
    429c:	/----- beq.s 42ae <debug_register_bitmap.constprop.0+0x72>
    429e:	|      lea -11(a5),a2
		*destination++ = *source++;
    42a2:	|  /-> addq.l #1,a1
    42a4:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    42a6:	|  |   move.b (a1),d0
    42a8:	+--|-- beq.s 42ae <debug_register_bitmap.constprop.0+0x72>
    42aa:	|  |   cmpa.l a0,a2
    42ac:	|  \-- bne.s 42a2 <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    42ae:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    42b0:	       move.w f0ff60 <_end+0xe99f9c>,d0
    42b6:	       cmpi.w #20153,d0
    42ba:	   /-- beq.s 42ce <debug_register_bitmap.constprop.0+0x92>
    42bc:	   |   cmpi.w #-24562,d0
    42c0:	   +-- beq.s 42ce <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    42c2:	   |   move.l -60(a5),d2
    42c6:	   |   movea.l -56(a5),a2
    42ca:	   |   unlk a5
    42cc:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    42ce:	   \-> clr.l -(sp)
    42d0:	       clr.l -(sp)
    42d2:	       pea -50(a5)
    42d6:	       pea 4 <_start+0x4>
    42da:	       pea 58 <_start+0x58>
    42de:	       jsr f0ff60 <_end+0xe99f9c>
}
    42e4:	       lea 20(sp),sp
}
    42e8:	       move.l -60(a5),d2
    42ec:	       movea.l -56(a5),a2
    42f0:	       unlk a5
    42f2:	       rts

000042f4 <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    42f4:	                            lea -52(sp),sp
    42f8:	                            movem.l d2-d7/a2-a6,-(sp)
    42fc:	                            movea.l 100(sp),a2
    4300:	                            movea.l 104(sp),a5
    4304:	                            move.l 108(sp),d0
    4308:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    430c:	                            moveq #0,d2
    430e:	                            move.w d0,d2
    4310:	                            move.l d2,56(sp)
    4314:	                            tst.w d0
    4316:	/-------------------------- beq.s 4386 <DrawLetters.isra.0+0x92>
    4318:	|                           clr.l 44(sp)
    431c:	|                           move.l #482108,60(sp)
    4324:	|                           lea 41bae <zMult>,a4
    432a:	|                           cmpi.w #1,d1
    432e:	|  /----------------------- beq.w 4510 <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4332:	|  |  /-------------------> moveq #0,d0
    4334:	|  |  |                     move.w (a5),d0
    4336:	|  |  |                     moveq #0,d3
    4338:	|  |  |                     move.w 2(a5),d3
    433c:	|  |  |                     movea.l d3,a0
    433e:	|  |  |                     move.l d0,d1
    4340:	|  |  |                     add.l d0,d1
    4342:	|  |  |                     add.l d1,d0
    4344:	|  |  |                     add.l d0,d0
    4346:	|  |  |                     adda.l d0,a0
    4348:	|  |  |                     move.l a0,d4
    434a:	|  |  |                     lsl.l #5,d4
    434c:	|  |  |                     movea.l d4,a0
    434e:	|  |  |                     adda.l 60(sp),a0
    4352:	|  |  |                     move.l 16(a0),d0
    4356:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    435a:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    435e:	|  |  |                     moveq #1,d2
    4360:	|  |  |                     cmp.l d0,d2
    4362:	|  |  |     /-------------- blt.w 4568 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4366:	|  |  |     |               movea.w d1,a0
    4368:	|  |  |     |               move.l a0,d0
    436a:	|  |  |     |               add.l a0,d0
    436c:	|  |  |     |               add.l a0,d0
    436e:	|  |  |     |               lsl.l #3,d0
    4370:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4372:	|  |  |     |               addq.l #3,a0
    4374:	|  |  |     |               adda.l a0,a0
    4376:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4378:	|  |  |     |               addq.l #1,44(sp)
    437c:	|  |  |     |               move.l 56(sp),d0
    4380:	|  |  |     |               cmp.l 44(sp),d0
    4384:	|  |  +-----|-------------- bne.s 4332 <DrawLetters.isra.0+0x3e>
}
    4386:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    438a:	|  |  |     |               lea 52(sp),sp
    438e:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    4390:	|  |  |     |  /----------> tst.w d1
    4392:	|  |  |  /--|--|----------- ble.w 4708 <DrawLetters.isra.0+0x414>
    4396:	|  |  |  |  |  |            lea 6(a5),a6
    439a:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    439c:	|  |  |  |  |  |            lea 20(a0),a0
    43a0:	|  |  |  |  |  |            move.l a0,52(sp)
    43a4:	|  |  |  |  |  |            move.l a5,48(sp)
    43a8:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    43aa:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    43ae:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    43b2:	|  |  |  |  |  |  |         move.l a0,d0
    43b4:	|  |  |  |  |  |  |         subq.l #1,d0
    43b6:	|  |  |  |  |  |  |         add.l d0,d0
    43b8:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    43bc:	|  |  |  |  |  |  |         move.w d0,d1
    43be:	|  |  |  |  |  |  |         muls.w (a2),d1
    43c0:	|  |  |  |  |  |  |         moveq #15,d4
    43c2:	|  |  |  |  |  |  |         asr.l d4,d1
    43c4:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    43c8:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    43cc:	|  |  |  |  |  |  |         asr.l d4,d0
    43ce:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    43d2:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    43d6:	|  |  |  |  |  |  |         subq.l #1,a0
    43d8:	|  |  |  |  |  |  |         adda.l a0,a0
    43da:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    43de:	|  |  |  |  |  |  |         move.w d2,d7
    43e0:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    43e4:	|  |  |  |  |  |  |         asr.l d4,d7
    43e6:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    43ea:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    43ee:	|  |  |  |  |  |  |         asr.l d4,d2
    43f0:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    43f4:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    43f8:	|  |  |  |  |  |  |         subq.l #1,a0
    43fa:	|  |  |  |  |  |  |         adda.l a0,a0
    43fc:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    4400:	|  |  |  |  |  |  |         move.w d3,d6
    4402:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    4406:	|  |  |  |  |  |  |         asr.l d4,d6
    4408:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    440c:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    4410:	|  |  |  |  |  |  |         asr.l d4,d3
    4412:	|  |  |  |  |  |  |         movea.w d3,a1
    4414:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4418:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    441c:	|  |  |  |  |  |  |         subq.l #1,a0
    441e:	|  |  |  |  |  |  |         adda.l a0,a0
    4420:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    4424:	|  |  |  |  |  |  |         move.w d3,d5
    4426:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    442a:	|  |  |  |  |  |  |         asr.l d4,d5
    442c:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    4430:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    4434:	|  |  |  |  |  |  |         asr.l d4,d3
    4436:	|  |  |  |  |  |  |         movea.w d3,a0
    4438:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    443c:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    4440:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    4444:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    4448:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    444c:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    4450:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4454:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4458:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    445c:	|  |  |  |  |  |  |         move.w d1,d4
    445e:	|  |  |  |  |  |  |         cmp.w d1,d7
    4460:	|  |  |  |  |  |  |     /-- bge.s 4464 <DrawLetters.isra.0+0x170>
    4462:	|  |  |  |  |  |  |     |   move.w d7,d4
    4464:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4466:	|  |  |  |  |  |  |     /-- bge.s 446a <DrawLetters.isra.0+0x176>
    4468:	|  |  |  |  |  |  |     |   move.w d6,d4
    446a:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    446c:	|  |  |  |  |  |  |     /-- bge.s 4470 <DrawLetters.isra.0+0x17c>
    446e:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    4470:	|  |  |  |  |  |  |     \-> move.w d0,d3
    4472:	|  |  |  |  |  |  |         cmp.w d0,d2
    4474:	|  |  |  |  |  |  |     /-- bge.s 4478 <DrawLetters.isra.0+0x184>
    4476:	|  |  |  |  |  |  |     |   move.w d2,d3
    4478:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    447a:	|  |  |  |  |  |  |     /-- ble.s 447e <DrawLetters.isra.0+0x18a>
    447c:	|  |  |  |  |  |  |     |   move.w a1,d3
    447e:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    4480:	|  |  |  |  |  |  |     /-- ble.s 4484 <DrawLetters.isra.0+0x190>
    4482:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4484:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4488:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    448c:	|  |  |  |  |  |  |         cmp.w d0,d2
    448e:	|  |  |  |  |  |  |     /-- ble.s 4492 <DrawLetters.isra.0+0x19e>
    4490:	|  |  |  |  |  |  |     |   move.w d2,d0
    4492:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    4494:	|  |  |  |  |  |  |     /-- bge.s 4498 <DrawLetters.isra.0+0x1a4>
    4496:	|  |  |  |  |  |  |     |   move.w a1,d0
    4498:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    449a:	|  |  |  |  |  |  |     /-- bge.s 449e <DrawLetters.isra.0+0x1aa>
    449c:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    449e:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    44a0:	|  |  |  |  |  |  |         sub.w d3,d0
    44a2:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    44a6:	|  |  |  |  |  |  |         cmpi.w #1,d0
    44aa:	|  |  |  |  |  |  |  /----- ble.s 44e8 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    44ac:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    44ae:	|  |  |  |  |  |  |  |  /-- ble.s 44b2 <DrawLetters.isra.0+0x1be>
    44b0:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    44b2:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    44b4:	|  |  |  |  |  |  |  |  /-- ble.s 44b8 <DrawLetters.isra.0+0x1c4>
    44b6:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    44b8:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    44ba:	|  |  |  |  |  |  |  |  /-- ble.s 44be <DrawLetters.isra.0+0x1ca>
    44bc:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    44be:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    44c0:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    44c4:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    44c8:	|  |  |  |  |  |  |  +----- ble.s 44e8 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    44ca:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    44ce:	|  |  |  |  |  |  |  |      move.w (a0),d0
    44d0:	|  |  |  |  |  |  |  |      neg.w d0
    44d2:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    44d6:	|  |  |  |  |  |  |  |      pea 64(sp)
    44da:	|  |  |  |  |  |  |  |      jsr 23c4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    44de:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    44e2:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    44e6:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    44e8:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    44ec:	|  |  |  |  |  |  |         addq.l #1,a3
    44ee:	|  |  |  |  |  |  |         movea.w a5,a0
    44f0:	|  |  |  |  |  |  |         cmpa.l a3,a0
    44f2:	|  |  |  |  |  |  \-------- bgt.w 43aa <DrawLetters.isra.0+0xb6>
    44f6:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    44fa:	|  |  |  |  |  |            addq.l #3,a0
    44fc:	|  |  |  |  |  |            adda.l a0,a0
    44fe:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4500:	|  |  |  |  |  |            addq.l #1,44(sp)
    4504:	|  |  |  |  |  |            move.l 56(sp),d0
    4508:	|  |  |  |  |  |            cmp.l 44(sp),d0
    450c:	+--|--|--|--|--|----------- beq.w 4386 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4510:	|  >--|--|--|--|----------> moveq #0,d0
    4512:	|  |  |  |  |  |            move.w (a5),d0
    4514:	|  |  |  |  |  |            moveq #0,d1
    4516:	|  |  |  |  |  |            move.w 2(a5),d1
    451a:	|  |  |  |  |  |            movea.l d1,a0
    451c:	|  |  |  |  |  |            move.l d0,d1
    451e:	|  |  |  |  |  |            add.l d0,d1
    4520:	|  |  |  |  |  |            add.l d1,d0
    4522:	|  |  |  |  |  |            add.l d0,d0
    4524:	|  |  |  |  |  |            adda.l d0,a0
    4526:	|  |  |  |  |  |            move.l a0,d2
    4528:	|  |  |  |  |  |            lsl.l #5,d2
    452a:	|  |  |  |  |  |            movea.l d2,a0
    452c:	|  |  |  |  |  |            adda.l 60(sp),a0
    4530:	|  |  |  |  |  |            move.l 16(a0),d0
    4534:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4538:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    453c:	|  |  |  |  |  |            moveq #1,d3
    453e:	|  |  |  |  |  |            cmp.l d0,d3
    4540:	|  |  |  |  |  \----------- blt.w 4390 <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    4544:	|  |  |  |  |               movea.w d1,a0
    4546:	|  |  |  |  |               move.l a0,d0
    4548:	|  |  |  |  |               add.l a0,d0
    454a:	|  |  |  |  |               add.l a0,d0
    454c:	|  |  |  |  |               lsl.l #3,d0
    454e:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4550:	|  |  |  |  |               addq.l #3,a0
    4552:	|  |  |  |  |               adda.l a0,a0
    4554:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4556:	|  |  |  |  |               addq.l #1,44(sp)
    455a:	|  |  |  |  |               move.l 56(sp),d0
    455e:	|  |  |  |  |               cmp.l 44(sp),d0
    4562:	|  +--|--|--|-------------- bne.s 4510 <DrawLetters.isra.0+0x21c>
    4564:	+--|--|--|--|-------------- bra.w 4386 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4568:	|  |  |  |  \-------------> tst.w d1
    456a:	|  |  |  |     /----------- ble.w 46ec <DrawLetters.isra.0+0x3f8>
    456e:	|  |  |  |     |            lea 6(a5),a6
    4572:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4574:	|  |  |  |     |            lea 20(a0),a0
    4578:	|  |  |  |     |            move.l a0,52(sp)
    457c:	|  |  |  |     |            move.l a5,48(sp)
    4580:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    4582:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4586:	|  |  |  |     |  |         movea.w 4(a2),a0
    458a:	|  |  |  |     |  |         move.l a0,d0
    458c:	|  |  |  |     |  |         subq.l #1,d0
    458e:	|  |  |  |     |  |         add.l d0,d0
    4590:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    4594:	|  |  |  |     |  |         move.w d2,d7
    4596:	|  |  |  |     |  |         muls.w (a2),d7
    4598:	|  |  |  |     |  |         moveq #15,d3
    459a:	|  |  |  |     |  |         asr.l d3,d7
    459c:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    45a0:	|  |  |  |     |  |         muls.w 2(a2),d2
    45a4:	|  |  |  |     |  |         asr.l d3,d2
    45a6:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    45aa:	|  |  |  |     |  |         movea.w 10(a2),a0
    45ae:	|  |  |  |     |  |         move.l a0,d0
    45b0:	|  |  |  |     |  |         subq.l #1,d0
    45b2:	|  |  |  |     |  |         add.l d0,d0
    45b4:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    45b8:	|  |  |  |     |  |         move.w d0,d1
    45ba:	|  |  |  |     |  |         muls.w 6(a2),d1
    45be:	|  |  |  |     |  |         asr.l d3,d1
    45c0:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    45c4:	|  |  |  |     |  |         muls.w 8(a2),d0
    45c8:	|  |  |  |     |  |         asr.l d3,d0
    45ca:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    45ce:	|  |  |  |     |  |         movea.w 16(a2),a0
    45d2:	|  |  |  |     |  |         subq.l #1,a0
    45d4:	|  |  |  |     |  |         adda.l a0,a0
    45d6:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    45da:	|  |  |  |     |  |         move.w d3,d6
    45dc:	|  |  |  |     |  |         muls.w 12(a2),d6
    45e0:	|  |  |  |     |  |         moveq #15,d4
    45e2:	|  |  |  |     |  |         asr.l d4,d6
    45e4:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    45e8:	|  |  |  |     |  |         muls.w 14(a2),d3
    45ec:	|  |  |  |     |  |         asr.l d4,d3
    45ee:	|  |  |  |     |  |         movea.w d3,a1
    45f0:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    45f4:	|  |  |  |     |  |         movea.w 22(a2),a0
    45f8:	|  |  |  |     |  |         subq.l #1,a0
    45fa:	|  |  |  |     |  |         adda.l a0,a0
    45fc:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    4600:	|  |  |  |     |  |         move.w d3,d5
    4602:	|  |  |  |     |  |         muls.w 18(a2),d5
    4606:	|  |  |  |     |  |         asr.l d4,d5
    4608:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    460c:	|  |  |  |     |  |         muls.w 20(a2),d3
    4610:	|  |  |  |     |  |         asr.l d4,d3
    4612:	|  |  |  |     |  |         movea.w d3,a0
    4614:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4618:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    461c:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    4620:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    4624:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4628:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    462c:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4630:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4634:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4638:	|  |  |  |     |  |         move.w d1,d4
    463a:	|  |  |  |     |  |         cmp.w d1,d7
    463c:	|  |  |  |     |  |     /-- bge.s 4640 <DrawLetters.isra.0+0x34c>
    463e:	|  |  |  |     |  |     |   move.w d7,d4
    4640:	|  |  |  |     |  |     \-> cmp.w d4,d6
    4642:	|  |  |  |     |  |     /-- bge.s 4646 <DrawLetters.isra.0+0x352>
    4644:	|  |  |  |     |  |     |   move.w d6,d4
    4646:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4648:	|  |  |  |     |  |     /-- bge.s 464c <DrawLetters.isra.0+0x358>
    464a:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    464c:	|  |  |  |     |  |     \-> move.w d0,d3
    464e:	|  |  |  |     |  |         cmp.w d0,d2
    4650:	|  |  |  |     |  |     /-- bge.s 4654 <DrawLetters.isra.0+0x360>
    4652:	|  |  |  |     |  |     |   move.w d2,d3
    4654:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4656:	|  |  |  |     |  |     /-- ble.s 465a <DrawLetters.isra.0+0x366>
    4658:	|  |  |  |     |  |     |   move.w a1,d3
    465a:	|  |  |  |     |  |     \-> cmp.w a0,d3
    465c:	|  |  |  |     |  |     /-- ble.s 4660 <DrawLetters.isra.0+0x36c>
    465e:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4660:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4664:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4668:	|  |  |  |     |  |         cmp.w d0,d2
    466a:	|  |  |  |     |  |     /-- ble.s 466e <DrawLetters.isra.0+0x37a>
    466c:	|  |  |  |     |  |     |   move.w d2,d0
    466e:	|  |  |  |     |  |     \-> cmp.w a1,d0
    4670:	|  |  |  |     |  |     /-- bge.s 4674 <DrawLetters.isra.0+0x380>
    4672:	|  |  |  |     |  |     |   move.w a1,d0
    4674:	|  |  |  |     |  |     \-> cmp.w a0,d0
    4676:	|  |  |  |     |  |     /-- bge.s 467a <DrawLetters.isra.0+0x386>
    4678:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    467a:	|  |  |  |     |  |     \-> addq.w #1,d0
    467c:	|  |  |  |     |  |         sub.w d3,d0
    467e:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    4682:	|  |  |  |     |  |         cmpi.w #1,d0
    4686:	|  |  |  |     |  |  /----- ble.s 46c0 <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4688:	|  |  |  |     |  |  |      cmp.w d1,d7
    468a:	|  |  |  |     |  |  |  /-- ble.s 468e <DrawLetters.isra.0+0x39a>
    468c:	|  |  |  |     |  |  |  |   move.w d7,d1
    468e:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    4690:	|  |  |  |     |  |  |  /-- ble.s 4694 <DrawLetters.isra.0+0x3a0>
    4692:	|  |  |  |     |  |  |  |   move.w d6,d1
    4694:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    4696:	|  |  |  |     |  |  |  /-- ble.s 469a <DrawLetters.isra.0+0x3a6>
    4698:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    469a:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    469c:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    46a0:	|  |  |  |     |  |  |      cmpi.w #1,d1
    46a4:	|  |  |  |     |  |  +----- ble.s 46c0 <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    46a6:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    46aa:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    46ae:	|  |  |  |     |  |  |      pea 64(sp)
    46b2:	|  |  |  |     |  |  |      jsr 23c4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    46b6:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    46ba:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    46be:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    46c0:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    46c4:	|  |  |  |     |  |         addq.l #1,a3
    46c6:	|  |  |  |     |  |         movea.w a5,a0
    46c8:	|  |  |  |     |  |         cmpa.l a0,a3
    46ca:	|  |  |  |     |  \-------- blt.w 4582 <DrawLetters.isra.0+0x28e>
    46ce:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    46d2:	|  |  |  |     |            addq.l #3,a0
    46d4:	|  |  |  |     |            adda.l a0,a0
    46d6:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    46d8:	|  |  |  |     |            addq.l #1,44(sp)
    46dc:	|  |  |  |     |            move.l 56(sp),d0
    46e0:	|  |  |  |     |            cmp.l 44(sp),d0
    46e4:	|  |  +--|-----|----------- bne.w 4332 <DrawLetters.isra.0+0x3e>
    46e8:	+--|--|--|-----|----------- bra.w 4386 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    46ec:	|  |  |  |     \----------> movea.w d1,a0
    46ee:	|  |  |  |                  addq.l #3,a0
    46f0:	|  |  |  |                  adda.l a0,a0
    46f2:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    46f4:	|  |  |  |                  addq.l #1,44(sp)
    46f8:	|  |  |  |                  move.l 56(sp),d0
    46fc:	|  |  |  |                  cmp.l 44(sp),d0
    4700:	|  |  \--|----------------- bne.w 4332 <DrawLetters.isra.0+0x3e>
    4704:	+--|-----|----------------- bra.w 4386 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4708:	|  |     \----------------> movea.w d1,a0
    470a:	|  |                        addq.l #3,a0
    470c:	|  |                        adda.l a0,a0
    470e:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4710:	|  |                        addq.l #1,44(sp)
    4714:	|  |                        move.l 56(sp),d0
    4718:	|  |                        cmp.l 44(sp),d0
    471c:	|  \----------------------- bne.w 4510 <DrawLetters.isra.0+0x21c>
    4720:	\-------------------------- bra.w 4386 <DrawLetters.isra.0+0x92>

00004724 <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    4724:	          movem.l d2-d3/a2,-(sp)
    4728:	          move.l 36(sp),d3
    472c:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    4730:	          moveq #0,d1
    4732:	          move.w 75e56 <vectorpos>,d1
    4738:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    473a:	          moveq #0,d0
    473c:	          move.w 75e54 <VectorPosLetters>,d0
    4742:	          add.l d0,d0
    4744:	          addi.l #325028,d0
    474a:	          move.l d0,75e50 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4750:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    4752:	          tst.l d2
    4754:	          sne d0
    4756:	          ext.w d0
    4758:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    475a:	          neg.l d0
    475c:	          move.l d0,-(sp)
    475e:	          addi.l #376262,d1
    4764:	          move.l d1,-(sp)
    4766:	          jsr 32ec <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    476a:	          clr.l -(sp)
    476c:	          move.l d3,-(sp)
    476e:	          move.l 40(sp),-(sp)
    4772:	          move.l 75e50 <ptrvectorletters>,-(sp)
    4778:	          lea 42f4 <DrawLetters.isra.0>(pc),a2
    477c:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    477e:	          lea 28(sp),sp
    4782:	          tst.l d2
    4784:	   /----- bne.w 481e <DrawDices+0xfa>
  CubeNrReversePos++;
    4788:	/--|----> addq.w #1,44f0c <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    478e:	|  |      move.w d3,d2
    4790:	|  |      add.w d3,d2
    4792:	|  |      add.w d3,d2
    4794:	|  |      lsl.w #3,d2
    4796:	|  |      add.w 75e56 <vectorpos>,d2
    479c:	|  |      move.w d2,75e56 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    47a2:	|  |      move.w 30(sp),d0
    47a6:	|  |      add.w d0,d0
    47a8:	|  |      add.w 30(sp),d0
    47ac:	|  |      add.w d0,d0
    47ae:	|  |      add.w d0,d0
    47b0:	|  |      add.w d0,75e54 <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    47b6:	|  |      move.w 34(sp),d0
    47ba:	|  |      add.w d0,d0
    47bc:	|  |      add.w 34(sp),d0
    47c0:	|  |      add.w d0,d0
    47c2:	|  |      add.w d0,d0
    47c4:	|  |      add.w d0,75e46 <VectorPosLettersReversed>
  SetCl( clminendpos);
    47ca:	|  |      move.l 44(sp),-(sp)
    47ce:	|  |      jsr 139e <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    47d2:	|  |      andi.l #65535,d2
    47d8:	|  |      move.l 52(sp),-(sp)
    47dc:	|  |      move.l d3,-(sp)
    47de:	|  |      jsr 55ac <__mulsi3>
    47e4:	|  |      move.l d0,d1
    47e6:	|  |      add.l d1,d1
    47e8:	|  |      add.l d0,d1
    47ea:	|  |      lsl.l #3,d1
    47ec:	|  |      lea 12(sp),sp
    47f0:	|  |      cmp.l d2,d1
    47f2:	|  |  /-- bgt.s 4816 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    47f4:	|  |  |   move.w #1,44f0c <CubeNrReversePos>
    vectorpos = 0;
    47fc:	|  |  |   clr.w 75e56 <vectorpos>
    VectorPosLetters = 0;
    4802:	|  |  |   clr.w 75e54 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4808:	|  |  |   clr.w 75e46 <VectorPosLettersReversed>
    return 1;
    480e:	|  |  |   moveq #1,d0
}
    4810:	|  |  |   movem.l (sp)+,d2-d3/a2
    4814:	|  |  |   rts
    return 0;  
    4816:	|  |  \-> clr.w d0
}
    4818:	|  |      movem.l (sp)+,d2-d3/a2
    481c:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    481e:	|  \----> moveq #0,d0
    4820:	|         move.w 44f0c <CubeNrReversePos>,d0
    4826:	|         add.l d0,d0
    4828:	|         add.l 16(sp),d0
    482c:	|         move.l d0,75e48 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4832:	|         pea 1 <_start+0x1>
    4836:	|         move.l d2,-(sp)
    4838:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    483c:	|         moveq #0,d0
    483e:	|         move.w 75e46 <VectorPosLettersReversed>,d0
    4844:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4846:	|         addi.l #285092,d0
    484c:	|         move.l d0,-(sp)
    484e:	|         jsr (a2)
    4850:	|         lea 16(sp),sp
    4854:	\-------- bra.w 4788 <DrawDices+0x64>

00004858 <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    4858:	                         link.w a5,#-52
    485c:	                         movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    4860:	                         clr.w 75fb2 <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    4866:	                         clr.l -42(a5)
    486a:	                         clr.l -38(a5)
    486e:	                         clr.l -34(a5)
    4872:	                         clr.l -30(a5)
    4876:	                         clr.l -26(a5)
    487a:	                         clr.l -22(a5)
    487e:	                         clr.l -18(a5)
    4882:	                         clr.l -14(a5)
    4886:	                         clr.l -10(a5)
    488a:	                         clr.l -6(a5)
    488e:	                         clr.w -2(a5)
    4892:	                         move.l #282152,-50(a5)
    489a:	                         moveq #4,d0
    489c:	                         move.l d0,-46(a5)
    48a0:	                         move.w #1,-10(a5)
    48a6:	                         move.w #2,-6(a5)
	while(*source && --num > 0)
    48ac:	                         moveq #100,d0
	struct debug_resource resource = {
    48ae:	                         lea -42(a5),a0
    48b2:	                         lea 3cbd2 <incbin_MercuryLetterData2Lz4_end+0x6e>,a1
	while(*source && --num > 0)
    48b8:	                         lea -11(a5),a2
		*destination++ = *source++;
    48bc:	                  /----> addq.l #1,a1
    48be:	                  |      move.b d0,(a0)+
	while(*source && --num > 0)
    48c0:	                  |      move.b (a1),d0
    48c2:	                  |  /-- beq.s 48c8 <Sw_PrepareDisplay.isra.0+0x70>
    48c4:	                  |  |   cmpa.l a0,a2
    48c6:	                  \--|-- bne.s 48bc <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    48c8:	                     \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    48ca:	                         move.w f0ff60 <_end+0xe99f9c>,d0
    48d0:	                         cmpi.w #20153,d0
    48d4:	                  /----- beq.w 4a5c <Sw_PrepareDisplay.isra.0+0x204>
    48d8:	                  |      cmpi.w #-24562,d0
    48dc:	                  +----- beq.w 4a5c <Sw_PrepareDisplay.isra.0+0x204>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    48e0:	                  |      movea.l 75fc0 <SysBase>,a6
    48e6:	                  |      move.l #4000,d0
    48ec:	                  |      moveq #2,d1
    48ee:	                  |      jsr -198(a6)
    48f2:	                  |      move.l d0,75eb4 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    48f8:	                  |      pea 1 <_start+0x1>
    48fc:	                  |      pea 32 <_start+0x32>
    4900:	                  |      pea 3cbdc <incbin_MercuryLetterData2Lz4_end+0x78>
    4906:	                  |      move.l d0,-(sp)
    4908:	                  |      lea 423c <debug_register_bitmap.constprop.0>(pc),a2
    490c:	                  |      jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    490e:	                  |      movea.l 75fc0 <SysBase>,a6
    4914:	                  |      move.l #20560,d0
    491a:	                  |      moveq #2,d1
    491c:	                  |      jsr -198(a6)
    4920:	                  |      move.l d0,75eb8 <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4926:	                  |      lea 16(sp),sp
    492a:	      /-----------|----- beq.w 4b72 <Sw_PrepareDisplay.isra.0+0x31a>
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 256, 1, 0);
    492e:	      |        /--|----> pea 1 <_start+0x1>
    4932:	      |        |  |      pea 100 <main+0x9a>
    4936:	      |        |  |      pea 3cc12 <incbin_MercuryLetterData2Lz4_end+0xae>
    493c:	      |        |  |      move.l d0,-(sp)
    493e:	      |        |  |      jsr (a2)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 257, 20,0);   
    4940:	      |        |  |      pea 14 <_start+0x14>
    4944:	      |        |  |      pea 101 <main+0x9b>
    4948:	      |        |  |      move.l 75eb8 <Sw_ScreenBuffer3>,-(sp)
    494e:	      |        |  |      lea a96 <Utils_FillLong.constprop.0>(pc),a3
    4952:	      |        |  |      jsr (a3)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4954:	      |        |  |      movea.l 75fc0 <SysBase>,a6
    495a:	      |        |  |      move.l #20560,d0
    4960:	      |        |  |      moveq #2,d1
    4962:	      |        |  |      jsr -198(a6)
    4966:	      |        |  |      move.l d0,75ebc <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    496c:	      |        |  |      lea 28(sp),sp
    4970:	/-----|--------|--|----- beq.w 4afc <Sw_PrepareDisplay.isra.0+0x2a4>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 256, 1, 0);
    4974:	|  /--|--------|--|----> pea 1 <_start+0x1>
    4978:	|  |  |        |  |      pea 100 <main+0x9a>
    497c:	|  |  |        |  |      pea 3cc4b <incbin_MercuryLetterData2Lz4_end+0xe7>
    4982:	|  |  |        |  |      move.l d0,-(sp)
    4984:	|  |  |        |  |      jsr (a2)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 257, 20,0);  
    4986:	|  |  |        |  |      pea 14 <_start+0x14>
    498a:	|  |  |        |  |      pea 101 <main+0x9b>
    498e:	|  |  |        |  |      move.l 75ebc <Sw_ScreenBuffer2>,-(sp)
    4994:	|  |  |        |  |      jsr (a3)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4996:	|  |  |        |  |      movea.l 75fc0 <SysBase>,a6
    499c:	|  |  |        |  |      move.l #20560,d0
    49a2:	|  |  |        |  |      moveq #2,d1
    49a4:	|  |  |        |  |      jsr -198(a6)
    49a8:	|  |  |        |  |      move.l d0,75ec0 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    49ae:	|  |  |        |  |      lea 28(sp),sp
    49b2:	|  |  |  /-----|--|----- beq.w 4ac8 <Sw_PrepareDisplay.isra.0+0x270>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 256, 1, 0);
    49b6:	|  |  |  |  /--|--|----> pea 1 <_start+0x1>
    49ba:	|  |  |  |  |  |  |      pea 100 <main+0x9a>
    49be:	|  |  |  |  |  |  |      pea 3cc5d <incbin_MercuryLetterData2Lz4_end+0xf9>
    49c4:	|  |  |  |  |  |  |      move.l d0,-(sp)
    49c6:	|  |  |  |  |  |  |      jsr (a2)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 257, 20,0);  
    49c8:	|  |  |  |  |  |  |      movea.l 75ec0 <Sw_ScreenBuffer1>,a2
    49ce:	|  |  |  |  |  |  |      pea 14 <_start+0x14>
    49d2:	|  |  |  |  |  |  |      pea 101 <main+0x9b>
    49d6:	|  |  |  |  |  |  |      move.l a2,-(sp)
    49d8:	|  |  |  |  |  |  |      jsr (a3)
  Sw_ViewCopper = Sw_ClBuild( );
    49da:	|  |  |  |  |  |  |      lea f20 <Sw_ClBuild>(pc),a3
    49de:	|  |  |  |  |  |  |      jsr (a3)
  Sw_DrawCopper = Sw_ClBuild( );
    49e0:	|  |  |  |  |  |  |      jsr (a3)
    49e2:	|  |  |  |  |  |  |      move.l d0,75e5c <Sw_DrawCopper>
void Sw_SwapCl() {

  /*ULONG tmp = (ULONG) Sw_DrawCopper;
  Sw_DrawCopper = Sw_ViewCopper;
  Sw_ViewCopper = (UWORD *)tmp;*/
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    49e8:	|  |  |  |  |  |  |      movea.l 75fbc <custom>,a0
    49ee:	|  |  |  |  |  |  |      move.l d0,128(a0)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    49f2:	|  |  |  |  |  |  |      move.l a2,75e60 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    49f8:	|  |  |  |  |  |  |      move.l 75ebc <Sw_ScreenBuffer2>,d0
    49fe:	|  |  |  |  |  |  |      move.l d0,75e64 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    4a04:	|  |  |  |  |  |  |      move.l d0,75e68 <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;  
    4a0a:	|  |  |  |  |  |  |      move.l a2,75e6c <Sw_ScreenBufferList+0xc>
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    4a10:	|  |  |  |  |  |  |      movea.l 75fc0 <SysBase>,a6
    4a16:	|  |  |  |  |  |  |      moveq #22,d0
    4a18:	|  |  |  |  |  |  |      move.l #65537,d1
    4a1e:	|  |  |  |  |  |  |      jsr -198(a6)
    4a22:	|  |  |  |  |  |  |      movea.l d0,a1
    4a24:	|  |  |  |  |  |  |      lea 28(sp),sp
    4a28:	|  |  |  |  |  |  |      tst.l d0
    4a2a:	|  |  |  |  |  |  |  /-- beq.s 4a46 <Sw_PrepareDisplay.isra.0+0x1ee>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4a2c:	|  |  |  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    4a32:	|  |  |  |  |  |  |  |   move.l #248943,10(a1)
    Sw_Vbint->is_Data = NULL;
    4a3a:	|  |  |  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    4a3e:	|  |  |  |  |  |  |  |   move.l #4922,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    4a46:	|  |  |  |  |  |  |  \-> movea.l 75fc0 <SysBase>,a6
    4a4c:	|  |  |  |  |  |  |      moveq #4,d0
    4a4e:	|  |  |  |  |  |  |      jsr -168(a6)
}
    4a52:	|  |  |  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    4a58:	|  |  |  |  |  |  |      unlk a5
    4a5a:	|  |  |  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    4a5c:	|  |  |  |  |  |  \----> clr.l -(sp)
    4a5e:	|  |  |  |  |  |         clr.l -(sp)
    4a60:	|  |  |  |  |  |         pea -50(a5)
    4a64:	|  |  |  |  |  |         pea 4 <_start+0x4>
    4a68:	|  |  |  |  |  |         pea 58 <_start+0x58>
    4a6c:	|  |  |  |  |  |         jsr f0ff60 <_end+0xe99f9c>
}
    4a72:	|  |  |  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4a76:	|  |  |  |  |  |         movea.l 75fc0 <SysBase>,a6
    4a7c:	|  |  |  |  |  |         move.l #4000,d0
    4a82:	|  |  |  |  |  |         moveq #2,d1
    4a84:	|  |  |  |  |  |         jsr -198(a6)
    4a88:	|  |  |  |  |  |         move.l d0,75eb4 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4a8e:	|  |  |  |  |  |         pea 1 <_start+0x1>
    4a92:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4a96:	|  |  |  |  |  |         pea 3cbdc <incbin_MercuryLetterData2Lz4_end+0x78>
    4a9c:	|  |  |  |  |  |         move.l d0,-(sp)
    4a9e:	|  |  |  |  |  |         lea 423c <debug_register_bitmap.constprop.0>(pc),a2
    4aa2:	|  |  |  |  |  |         jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4aa4:	|  |  |  |  |  |         movea.l 75fc0 <SysBase>,a6
    4aaa:	|  |  |  |  |  |         move.l #20560,d0
    4ab0:	|  |  |  |  |  |         moveq #2,d1
    4ab2:	|  |  |  |  |  |         jsr -198(a6)
    4ab6:	|  |  |  |  |  |         move.l d0,75eb8 <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4abc:	|  |  |  |  |  |         lea 16(sp),sp
    4ac0:	|  |  |  |  |  \-------- bne.w 492e <Sw_PrepareDisplay.isra.0+0xd6>
    4ac4:	|  |  +--|--|----------- bra.w 4b72 <Sw_PrepareDisplay.isra.0+0x31a>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4ac8:	|  |  |  >--|----------> movea.l 75fb4 <DOSBase>,a6
    4ace:	|  |  |  |  |            jsr -60(a6)
    4ad2:	|  |  |  |  |            movea.l 75fb4 <DOSBase>,a6
    4ad8:	|  |  |  |  |            move.l d0,d1
    4ada:	|  |  |  |  |            move.l #248868,d2
    4ae0:	|  |  |  |  |            moveq #38,d3
    4ae2:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4ae6:	|  |  |  |  |            movea.l 75fb4 <DOSBase>,a6
    4aec:	|  |  |  |  |            moveq #1,d1
    4aee:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 256, 1, 0);
    4af2:	|  |  |  |  |            move.l 75ec0 <Sw_ScreenBuffer1>,d0
    4af8:	|  |  |  |  +----------- bra.w 49b6 <Sw_PrepareDisplay.isra.0+0x15e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4afc:	>--|--|--|--|----------> movea.l 75fb4 <DOSBase>,a6
    4b02:	|  |  |  |  |            jsr -60(a6)
    4b06:	|  |  |  |  |            movea.l 75fb4 <DOSBase>,a6
    4b0c:	|  |  |  |  |            move.l d0,d1
    4b0e:	|  |  |  |  |            move.l #248868,d2
    4b14:	|  |  |  |  |            moveq #38,d3
    4b16:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4b1a:	|  |  |  |  |            movea.l 75fb4 <DOSBase>,a6
    4b20:	|  |  |  |  |            moveq #1,d1
    4b22:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 256, 1, 0);
    4b26:	|  |  |  |  |            move.l 75ebc <Sw_ScreenBuffer2>,d0
    4b2c:	|  |  |  |  |            pea 1 <_start+0x1>
    4b30:	|  |  |  |  |            pea 100 <main+0x9a>
    4b34:	|  |  |  |  |            pea 3cc4b <incbin_MercuryLetterData2Lz4_end+0xe7>
    4b3a:	|  |  |  |  |            move.l d0,-(sp)
    4b3c:	|  |  |  |  |            jsr (a2)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 257, 20,0);  
    4b3e:	|  |  |  |  |            pea 14 <_start+0x14>
    4b42:	|  |  |  |  |            pea 101 <main+0x9b>
    4b46:	|  |  |  |  |            move.l 75ebc <Sw_ScreenBuffer2>,-(sp)
    4b4c:	|  |  |  |  |            jsr (a3)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4b4e:	|  |  |  |  |            movea.l 75fc0 <SysBase>,a6
    4b54:	|  |  |  |  |            move.l #20560,d0
    4b5a:	|  |  |  |  |            moveq #2,d1
    4b5c:	|  |  |  |  |            jsr -198(a6)
    4b60:	|  |  |  |  |            move.l d0,75ec0 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4b66:	|  |  |  |  |            lea 28(sp),sp
    4b6a:	|  |  |  |  \----------- bne.w 49b6 <Sw_PrepareDisplay.isra.0+0x15e>
    4b6e:	|  |  |  \-------------- bra.w 4ac8 <Sw_PrepareDisplay.isra.0+0x270>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    4b72:	|  |  \----------------> movea.l 75fb4 <DOSBase>,a6
    4b78:	|  |                     jsr -60(a6)
    4b7c:	|  |                     movea.l 75fb4 <DOSBase>,a6
    4b82:	|  |                     move.l d0,d1
    4b84:	|  |                     move.l #248811,d2
    4b8a:	|  |                     moveq #38,d3
    4b8c:	|  |                     jsr -48(a6)
    Exit(1);
    4b90:	|  |                     movea.l 75fb4 <DOSBase>,a6
    4b96:	|  |                     moveq #1,d1
    4b98:	|  |                     jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 256, 1, 0);
    4b9c:	|  |                     move.l 75eb8 <Sw_ScreenBuffer3>,d0
    4ba2:	|  |                     pea 1 <_start+0x1>
    4ba6:	|  |                     pea 100 <main+0x9a>
    4baa:	|  |                     pea 3cc12 <incbin_MercuryLetterData2Lz4_end+0xae>
    4bb0:	|  |                     move.l d0,-(sp)
    4bb2:	|  |                     jsr (a2)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 257, 20,0);   
    4bb4:	|  |                     pea 14 <_start+0x14>
    4bb8:	|  |                     pea 101 <main+0x9b>
    4bbc:	|  |                     move.l 75eb8 <Sw_ScreenBuffer3>,-(sp)
    4bc2:	|  |                     lea a96 <Utils_FillLong.constprop.0>(pc),a3
    4bc6:	|  |                     jsr (a3)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4bc8:	|  |                     movea.l 75fc0 <SysBase>,a6
    4bce:	|  |                     move.l #20560,d0
    4bd4:	|  |                     moveq #2,d1
    4bd6:	|  |                     jsr -198(a6)
    4bda:	|  |                     move.l d0,75ebc <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4be0:	|  |                     lea 28(sp),sp
    4be4:	|  \-------------------- bne.w 4974 <Sw_PrepareDisplay.isra.0+0x11c>
    4be8:	\----------------------- bra.w 4afc <Sw_PrepareDisplay.isra.0+0x2a4>

00004bec <DrawScreen>:
{    
    4bec:	                   lea -44(sp),sp
    4bf0:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    4bf4:	                   movea.l 75fb8 <GfxBase>,a6
    4bfa:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    4bfe:	                   move.w #-1,dff044 <_end+0xd89080>
  custom->bltalwm = 0xffff; //Static
    4c06:	                   move.w #-1,dff046 <_end+0xd89082>
  switch(Scene) {
    4c0e:	                   cmpi.w #17,65c8e <Scene>
    4c16:	         /-------- bhi.s 4c84 <DrawScreen+0x98>
    4c18:	         |         moveq #0,d0
    4c1a:	         |         move.w 65c8e <Scene>,d0
    4c20:	         |         add.l d0,d0
    4c22:	         |         move.w (4c2a <DrawScreen+0x3e>,pc,d0.l),d0
    4c26:	         |         jmp (4c2a <DrawScreen+0x3e>,pc,d0.w)
    4c2a:	         |         ori.w #156,(a2)+
    4c2e:	         |         andi.w #742,(a6)
    4c32:	         |         btst d1,-(a4)
    4c34:	         |         bclr d1,(a0)
    4c36:	         |         movep.l d1,1078(a2)
    4c3a:	         |         ([,1594)subi.w #1280,([2360746,a0],d0.w:4,1594)
    4c46:	         |         addi.w #216,6e4 <main+0x67e>
    4c4c:	         |         ori.w #18552,-(a4)
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    4c50:	         |         .short 0x00c8
    4c52:	         |         pea 1 <_start+0x1>
    4c56:	         |         clr.l -(sp)
    4c58:	         |         pea 3 <_start+0x3>
    4c5c:	         |         clr.l -(sp)
    4c5e:	         |         pea 8 <_start+0x8>
    4c62:	         |         pea 4514c <LetterMetaDataReversedAtw>
    4c68:	         |         pea 4516e <LetterMetaDataAtw>
    4c6e:	         |         pea 45190 <CubeNrReverseAtw>
    4c74:	         |         jsr 4724 <DrawDices>(pc)
      break;
    4c78:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    4c7c:	         |         cmpi.w #1,d0
    4c80:	         |  /----- beq.w 4e70 <DrawScreen+0x284>
}
    4c84:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    4c88:	         |  |      lea 44(sp),sp
    4c8c:	         |  |      rts
      DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);
    4c8e:	         |  |      pea 84 <main+0x1e>
    4c92:	         |  |      pea 6e <main+0x8>
    4c96:	         |  |      clr.l -(sp)
    4c98:	         |  |      pea 4 <_start+0x4>
    4c9c:	         |  |      clr.l -(sp)
    4c9e:	         |  |      pea b <_start+0xb>
    4ca2:	         |  |      pea 44f0e <LetterMetaDataMercury2>
    4ca8:	         |  |      pea 44f0e <LetterMetaDataMercury2>
    4cae:	         |  |      pea 45190 <CubeNrReverseAtw>
    4cb4:	         |  |      jsr 4724 <DrawDices>(pc)
    4cb8:	         |  |      lea 36(sp),sp
}
    4cbc:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    4cc0:	         |  |      lea 44(sp),sp
    4cc4:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    4cc6:	         |  |      pea c3 <main+0x5d>
    4cca:	         |  |      pea 1 <_start+0x1>
    4cce:	         |  |      pea 3 <_start+0x3>
    4cd2:	         |  |      pea 3 <_start+0x3>
    4cd6:	         |  |      pea 8 <_start+0x8>
    4cda:	         |  |      pea a <_start+0xa>
    4cde:	         |  |      pea 65aa4 <LetterMetaDataReversedSpread>
    4ce4:	         |  |      pea 65ac6 <LetterMetaDataSpread1>
    4cea:	         |  |      pea 65aec <CubeNrReverseSizeSpread>
    4cf0:	         |  |      jsr 4724 <DrawDices>(pc)
      break;
    4cf4:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    4cf8:	         |  |      cmpi.w #1,d0
    4cfc:	         +--|----- bne.s 4c84 <DrawScreen+0x98>
    4cfe:	         |  +----- bra.w 4e70 <DrawScreen+0x284>
  ptrvector = VectorBuffer +  vectorpos;    
    4d02:	         |  |      moveq #0,d0
    4d04:	         |  |      move.w 75e56 <vectorpos>,d0
    4d0a:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4d0c:	         |  |      moveq #0,d1
    4d0e:	         |  |      move.w 75e54 <VectorPosLetters>,d1
    4d14:	         |  |      add.l d1,d1
    4d16:	         |  |      addi.l #325028,d1
    4d1c:	         |  |      move.l d1,75e50 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4d22:	         |  |      pea 4 <_start+0x4>
    4d26:	         |  |      clr.l -(sp)
    4d28:	         |  |      addi.l #376262,d0
    4d2e:	         |  |      move.l d0,-(sp)
    4d30:	         |  |      jsr 32ec <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    4d34:	         |  |      movea.l 75e50 <ptrvectorletters>,a2
    4d3a:	         |  |      lea 12(sp),sp
    4d3e:	         |  |      moveq #4,d0
    4d40:	         |  |      move.l d0,44(sp)
    4d44:	         |  |      lea 44f3c <LetterMetaDataMercury1>,a5
    4d4a:	         |  |      lea 41bae <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4d50:	/--------|--|----> moveq #0,d0
    4d52:	|        |  |      move.w (a5),d0
    4d54:	|        |  |      moveq #0,d1
    4d56:	|        |  |      move.w 2(a5),d1
    4d5a:	|        |  |      movea.l d1,a0
    4d5c:	|        |  |      move.l d0,d1
    4d5e:	|        |  |      add.l d0,d1
    4d60:	|        |  |      add.l d1,d0
    4d62:	|        |  |      add.l d0,d0
    4d64:	|        |  |      adda.l d0,a0
    4d66:	|        |  |      move.l a0,d2
    4d68:	|        |  |      lsl.l #5,d2
    4d6a:	|        |  |      movea.l d2,a0
    4d6c:	|        |  |      adda.l #482108,a0
    4d72:	|        |  |      move.l 16(a0),d0
    4d76:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    4d7a:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4d7e:	|        |  |      moveq #1,d3
    4d80:	|        |  |      cmp.l d0,d3
    4d82:	|        |  |  /-- blt.w 537a <DrawScreen+0x78e>
      vectors += 12*metadata[2];
    4d86:	|        |  |  |   movea.w d1,a0
    4d88:	|        |  |  |   move.l a0,d0
    4d8a:	|        |  |  |   add.l a0,d0
    4d8c:	|        |  |  |   add.l a0,d0
    4d8e:	|        |  |  |   lsl.l #3,d0
    4d90:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    4d92:	|        |  |  |   addq.l #3,a0
    4d94:	|        |  |  |   adda.l a0,a0
    4d96:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4d98:	|        |  |  |   subq.l #1,44(sp)
    4d9c:	+--------|--|--|-- bne.s 4d50 <DrawScreen+0x164>
  CubeNrReversePos++;
    4d9e:	|  /-----|--|--|-> addq.w #1,44f0c <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    4da4:	|  |     |  |  |   move.w 75e56 <vectorpos>,d2
    4daa:	|  |     |  |  |   addi.w #96,d2
    4dae:	|  |     |  |  |   move.w d2,75e56 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    4db4:	|  |     |  |  |   addi.w #156,75e54 <VectorPosLetters>
  SetCl( clminendpos);
    4dbc:	|  |     |  |  |   pea 1 <_start+0x1>
    4dc0:	|  |     |  |  |   jsr 139e <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    4dc4:	|  |     |  |  |   addq.l #4,sp
    4dc6:	|  |     |  |  |   cmpi.w #12767,d2
    4dca:	|  |     +--|--|-- bls.w 4c84 <DrawScreen+0x98>
    DoNotClearDirty = 1;
    4dce:	|  |     |  |  |   move.w #1,75e44 <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    4dd6:	|  |     |  |  |   cmpi.w #12959,d2
    4dda:	|  |     +--|--|-- bls.w 4c84 <DrawScreen+0x98>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    4dde:	|  |     |  |  |   movea.l 75e40 <ClearBuffer>,a2
    4de4:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    4de8:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    4dec:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    4df0:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    4df4:	|  |     |  |  |   movea.l 75e4c <DrawBuffer>,a1
    4dfa:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    4dfe:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    4e02:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    4e06:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    4e0a:	|  |     |  |  |   movea.l 75e3c <ViewBuffer>,a0
    4e10:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    4e14:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    4e18:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    4e1c:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    4e20:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    4e24:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    4e28:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    4e2c:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    4e30:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    4e34:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    4e38:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    4e3c:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    4e40:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    4e44:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    4e48:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    4e4c:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    4e50:	|  |     |  |  |   clr.w 75e44 <DoNotClearDirty>
    CubeNrReversePos = 1;
    4e56:	|  |     |  |  |   move.w #1,44f0c <CubeNrReversePos>
    vectorpos = 0;
    4e5e:	|  |     |  |  |   clr.w 75e56 <vectorpos>
    VectorPosLetters = 0;
    4e64:	|  |     |  |  |   clr.w 75e54 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4e6a:	|  |     |  |  |   clr.w 75e46 <VectorPosLettersReversed>
  if(result == 1) Scene++;
    4e70:	|  |     |  >--|-> addq.w #1,65c8e <Scene>
}
    4e76:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4e7a:	|  |     |  |  |   lea 44(sp),sp
    4e7e:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    4e80:	|  |     |  |  |   pea 2bd8 <DrawRect+0x814>
    4e84:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    4e8a:	|  |     |  |  |   pea 1fb94 <incbin_PointCubeDataLz4_start>
    4e90:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    4e94:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    4e96:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    4e9c:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    4ea2:	|  |     |  |  |   move.l d2,-(sp)
    4ea4:	|  |     |  |  |   pea 1fb00 <incbin_PointCubeData_start>
    4eaa:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    4eae:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    4eb0:	|  |     |  |  |   pea 251e <DrawRect+0x15a>
    4eb4:	|  |     |  |  |   move.l d2,-(sp)
    4eb6:	|  |     |  |  |   pea 22814 <incbin_PointLetterDataLz4_start>
    4ebc:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    4ebe:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    4ec4:	|  |     |  |  |   lea 32(sp),sp
    4ec8:	|  |     |  |  |   move.l #325028,(sp)
    4ece:	|  |     |  |  |   move.l d2,-(sp)
    4ed0:	|  |     |  |  |   pea 22780 <incbin_PointLetterData_start>
    4ed6:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    4ed8:	|  |     |  |  |   pea 20d8 <Clbuild+0x182>
    4edc:	|  |     |  |  |   move.l d2,-(sp)
    4ede:	|  |     |  |  |   pea 24dc2 <incbin_PointReversedLetterDataLz4_start>
    4ee4:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    4ee6:	|  |     |  |  |   pea 459a4 <LetterBuffer2>
    4eec:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    4ef2:	|  |     |  |  |   pea 24d46 <incbin_PointReversedLetterData_start>
    4ef8:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    4efa:	|  |     |  |  |   move.w #3,65c8e <Scene>
    4f02:	|  |     |  |  |   lea 36(sp),sp
}
    4f06:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4f0a:	|  |     |  |  |   lea 44(sp),sp
    4f0e:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    4f10:	|  |     |  |  |   pea d4 <main+0x6e>
    4f14:	|  |     |  |  |   pea 1 <_start+0x1>
    4f18:	|  |     |  |  |   pea 2 <_start+0x2>
    4f1c:	|  |     |  |  |   pea 3 <_start+0x3>
    4f20:	|  |     |  |  |   pea 5 <_start+0x5>
    4f24:	|  |     |  |  |   pea 6 <_start+0x6>
    4f28:	|  |     |  |  |   pea 4576e <LetterMetaDataReversedPoint>
    4f2e:	|  |     |  |  |   pea 45784 <LetterMetaDataPoint>
    4f34:	|  |     |  |  |   pea 457a2 <CubeNrReverseSizePoint>
    4f3a:	|  |     |  |  |   jsr 4724 <DrawDices>(pc)
      break;
    4f3e:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    4f42:	|  |     |  |  |   cmpi.w #1,d0
    4f46:	|  |     +--|--|-- bne.w 4c84 <DrawScreen+0x98>
    4f4a:	|  |     |  +--|-- bra.w 4e70 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    4f4e:	|  |     |  |  |   pea 24cd <DrawRect+0x109>
    4f52:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    4f58:	|  |     |  |  |   pea 1aab6 <incbin_TekCubeDataLz4_start>
    4f5e:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    4f62:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    4f64:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    4f6a:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    4f70:	|  |     |  |  |   move.l d2,-(sp)
    4f72:	|  |     |  |  |   pea 1aa22 <incbin_TekCubeData_start>
    4f78:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    4f7c:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    4f7e:	|  |     |  |  |   pea 2a8f <DrawRect+0x6cb>
    4f82:	|  |     |  |  |   move.l d2,-(sp)
    4f84:	|  |     |  |  |   pea 1d05c <incbin_TekLetterDataLz4_start>
    4f8a:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    4f8c:	|  |     |  |  |   lea 32(sp),sp
    4f90:	|  |     |  |  |   move.l #325028,(sp)
    4f96:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    4f9c:	|  |     |  |  |   pea 1cf98 <incbin_TekLetterData_start>
    4fa2:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    4fa4:	|  |     |  |  |   move.w #5,65c8e <Scene>
    4fac:	|  |     |  |  |   lea 12(sp),sp
}
    4fb0:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4fb4:	|  |     |  |  |   lea 44(sp),sp
    4fb8:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    4fba:	|  |     |  |  |   pea 98 <main+0x32>
    4fbe:	|  |     |  |  |   pea 1 <_start+0x1>
    4fc2:	|  |     |  |  |   clr.l -(sp)
    4fc4:	|  |     |  |  |   pea 3 <_start+0x3>
    4fc8:	|  |     |  |  |   clr.l -(sp)
    4fca:	|  |     |  |  |   pea 8 <_start+0x8>
    4fce:	|  |     |  |  |   pea 45544 <LetterMetaDataTek>
    4fd4:	|  |     |  |  |   pea 45544 <LetterMetaDataTek>
    4fda:	|  |     |  |  |   pea 45566 <CubeNrReverseSizeTek>
    4fe0:	|  |     |  |  |   jsr 4724 <DrawDices>(pc)
      break;
    4fe4:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    4fe8:	|  |     |  |  |   cmpi.w #1,d0
    4fec:	|  |     +--|--|-- bne.w 4c84 <DrawScreen+0x98>
    4ff0:	|  |     |  +--|-- bra.w 4e70 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    4ff4:	|  |     |  |  |   pea 2be6 <DrawRect+0x822>
    4ff8:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    4ffe:	|  |     |  |  |   pea 26f72 <incbin_FlexCubeDataLz4_start>
    5004:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    5008:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    500a:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    5010:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    5016:	|  |     |  |  |   move.l d2,-(sp)
    5018:	|  |     |  |  |   pea 26eae <incbin_FlexCubeData_start>
    501e:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    5022:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    5024:	|  |     |  |  |   pea 30a1 <DrawRect+0xcdd>
    5028:	|  |     |  |  |   move.l d2,-(sp)
    502a:	|  |     |  |  |   pea 29c60 <incbin_FlexLetterDataLz4_start>
    5030:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    5032:	|  |     |  |  |   lea 32(sp),sp
    5036:	|  |     |  |  |   move.l #325028,(sp)
    503c:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    5042:	|  |     |  |  |   pea 29b6c <incbin_FlexLetterData_start>
    5048:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    504a:	|  |     |  |  |   move.w #7,65c8e <Scene>
    5052:	|  |     |  |  |   lea 12(sp),sp
}
    5056:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    505a:	|  |     |  |  |   lea 44(sp),sp
    505e:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    5060:	|  |     |  |  |   pea af <main+0x49>
    5064:	|  |     |  |  |   pea 1 <_start+0x1>
    5068:	|  |     |  |  |   clr.l -(sp)
    506a:	|  |     |  |  |   pea 4 <_start+0x4>
    506e:	|  |     |  |  |   clr.l -(sp)
    5070:	|  |     |  |  |   pea a <_start+0xa>
    5074:	|  |     |  |  |   pea 45518 <LetterMetaDataFlex>
    507a:	|  |     |  |  |   pea 45518 <LetterMetaDataFlex>
    5080:	|  |     |  |  |   pea 65aec <CubeNrReverseSizeSpread>
    5086:	|  |     |  |  |   jsr 4724 <DrawDices>(pc)
      break;
    508a:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    508e:	|  |     |  |  |   cmpi.w #1,d0
    5092:	|  |     +--|--|-- bne.w 4c84 <DrawScreen+0x98>
    5096:	|  |     |  +--|-- bra.w 4e70 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    509a:	|  |     |  |  |   pea 23ad <KPrintF+0x5b>
    509e:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    50a4:	|  |     |  |  |   pea 2cdaa <incbin_DesireCubeDataLz4_start>
    50aa:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    50ae:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    50b0:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    50b6:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    50bc:	|  |     |  |  |   move.l d2,-(sp)
    50be:	|  |     |  |  |   pea 2cd16 <incbin_DesireCubeData_start>
    50c4:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    50c8:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    50ca:	|  |     |  |  |   pea 286a <DrawRect+0x4a6>
    50ce:	|  |     |  |  |   move.l d2,-(sp)
    50d0:	|  |     |  |  |   pea 2f230 <incbin_DesireLetterDataLz4_start>
    50d6:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    50d8:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    50de:	|  |     |  |  |   lea 32(sp),sp
    50e2:	|  |     |  |  |   move.l #325028,(sp)
    50e8:	|  |     |  |  |   move.l d2,-(sp)
    50ea:	|  |     |  |  |   pea 2f16c <incbin_DesireLetterData_start>
    50f0:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    50f2:	|  |     |  |  |   pea 27ff <DrawRect+0x43b>
    50f6:	|  |     |  |  |   move.l d2,-(sp)
    50f8:	|  |     |  |  |   pea 31b72 <incbin_DesireReversedLetterDataLz4_start>
    50fe:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    5100:	|  |     |  |  |   pea 459a4 <LetterBuffer2>
    5106:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    510c:	|  |     |  |  |   pea 31aae <incbin_DesireReversedLetterData_start>
    5112:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    5114:	|  |     |  |  |   move.w #9,65c8e <Scene>
    511c:	|  |     |  |  |   lea 36(sp),sp
}
    5120:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5124:	|  |     |  |  |   lea 44(sp),sp
    5128:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    512a:	|  |     |  |  |   pea af <main+0x49>
    512e:	|  |     |  |  |   pea 1 <_start+0x1>
    5132:	|  |     |  |  |   pea 3 <_start+0x3>
    5136:	|  |     |  |  |   pea 3 <_start+0x3>
    513a:	|  |     |  |  |   pea 8 <_start+0x8>
    513e:	|  |     |  |  |   pea 8 <_start+0x8>
    5142:	|  |     |  |  |   pea 45332 <LetterMetaDataReversedDesire>
    5148:	|  |     |  |  |   pea 45354 <LetterMetaDataDesire>
    514e:	|  |     |  |  |   pea 45376 <CubeNrReverseSizeDesire>
    5154:	|  |     |  |  |   jsr 4724 <DrawDices>(pc)
      break;
    5158:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    515c:	|  |     |  |  |   cmpi.w #1,d0
    5160:	|  |     +--|--|-- bne.w 4c84 <DrawScreen+0x98>
    5164:	|  |     |  +--|-- bra.w 4e70 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    5168:	|  |     |  |  |   pea 24f2 <DrawRect+0x12e>
    516c:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    5172:	|  |     |  |  |   pea 157e8 <incbin_AtwCubeDataLz4_start>
    5178:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    517c:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    517e:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    5184:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    518a:	|  |     |  |  |   move.l d2,-(sp)
    518c:	|  |     |  |  |   pea 15754 <incbin_AtwCubeData_start>
    5192:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    5196:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    5198:	|  |     |  |  |   pea 2c5b <DrawRect+0x897>
    519c:	|  |     |  |  |   move.l d2,-(sp)
    519e:	|  |     |  |  |   pea 17db2 <incbin_AtwLetterDataLz4_start>
    51a4:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    51a6:	|  |     |  |  |   lea 32(sp),sp
    51aa:	|  |     |  |  |   move.l #325028,(sp)
    51b0:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    51b6:	|  |     |  |  |   pea 17cee <incbin_AtwLetterData_start>
    51bc:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    51be:	|  |     |  |  |   move.w #11,65c8e <Scene>
    51c6:	|  |     |  |  |   lea 12(sp),sp
}
    51ca:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    51ce:	|  |     |  |  |   lea 44(sp),sp
    51d2:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    51d4:	|  |     |  |  |   pea 28fa <DrawRect+0x536>
    51d8:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    51de:	|  |     |  |  |   pea d910 <incbin_AbyssCubeDataLz4_start>
    51e4:	|  |     |  |  |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    51e8:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    51ea:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    51f0:	|  |     |  |  |   pea 5bdc6 <VectorBuffer>
    51f6:	|  |     |  |  |   move.l d2,-(sp)
    51f8:	|  |     |  |  |   pea d87c <incbin_AbyssCubeData_start>
    51fe:	|  |     |  |  |   lea 1e22 <LoadVectors>(pc),a2
    5202:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    5204:	|  |     |  |  |   pea 30ff <DrawRect+0xd3b>
    5208:	|  |     |  |  |   move.l d2,-(sp)
    520a:	|  |     |  |  |   pea 102fa <incbin_AbyssLetterDataLz4_start>
    5210:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    5212:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,d2
    5218:	|  |     |  |  |   lea 32(sp),sp
    521c:	|  |     |  |  |   move.l #325028,(sp)
    5222:	|  |     |  |  |   move.l d2,-(sp)
    5224:	|  |     |  |  |   pea 1021e <incbin_AbyssLetterData_start>
    522a:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    522c:	|  |     |  |  |   pea 229d <Clbuild+0x347>
    5230:	|  |     |  |  |   move.l d2,-(sp)
    5232:	|  |     |  |  |   pea 134a2 <incbin_AbyssReversedLetterDataLz4_start>
    5238:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    523a:	|  |     |  |  |   pea 459a4 <LetterBuffer2>
    5240:	|  |     |  |  |   move.l 75fa4 <WorkingMem>,-(sp)
    5246:	|  |     |  |  |   pea 1340e <incbin_AbyssReversedLetterData_start>
    524c:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    524e:	|  |     |  |  |   move.w #13,65c8e <Scene>
    5256:	|  |     |  |  |   lea 36(sp),sp
}
    525a:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    525e:	|  |     |  |  |   lea 44(sp),sp
    5262:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    5264:	|  |     |  |  |   pea d0 <main+0x6a>
    5268:	|  |     |  |  |   pea 1 <_start+0x1>
    526c:	|  |     |  |  |   pea 2 <_start+0x2>
    5270:	|  |     |  |  |   pea 3 <_start+0x3>
    5274:	|  |     |  |  |   pea 6 <_start+0x6>
    5278:	|  |     |  |  |   pea 9 <_start+0x9>
    527c:	|  |     |  |  |   pea 44f6e <LetterMetaDataReversedAbyss>
    5282:	|  |     |  |  |   pea 44f86 <LetterMetaDataAbyss>
    5288:	|  |     |  |  |   pea 44faa <CubeNrReverseSizeAbyss>
    528e:	|  |     |  |  |   jsr 4724 <DrawDices>(pc)
      break;  
    5292:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5296:	|  |     |  |  |   cmpi.w #1,d0
    529a:	|  |     \--|--|-- bne.w 4c84 <DrawScreen+0x98>
    529e:	|  |        \--|-- bra.w 4e70 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    52a2:	|  |           |   pea 2003 <Clbuild+0xad>
    52a6:	|  |           |   move.l 75fa4 <WorkingMem>,-(sp)
    52ac:	|  |           |   pea 3444a <incbin_MercuryCubeData1Lz4_start>
    52b2:	|  |           |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    52b6:	|  |           |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    52b8:	|  |           |   move.l 75fa4 <WorkingMem>,d2
    52be:	|  |           |   pea 5bdc6 <VectorBuffer>
    52c4:	|  |           |   move.l d2,-(sp)
    52c6:	|  |           |   pea 34386 <incbin_MercuryCubeData1_start>
    52cc:	|  |           |   lea 1e22 <LoadVectors>(pc),a2
    52d0:	|  |           |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    52d2:	|  |           |   pea 2b27 <DrawRect+0x763>
    52d6:	|  |           |   move.l d2,-(sp)
    52d8:	|  |           |   pea 3659e <incbin_MercuryLetterData1Lz4_start>
    52de:	|  |           |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    52e0:	|  |           |   lea 32(sp),sp
    52e4:	|  |           |   move.l #325028,(sp)
    52ea:	|  |           |   move.l 75fa4 <WorkingMem>,-(sp)
    52f0:	|  |           |   pea 36462 <incbin_MercuryLetterData1_start>
    52f6:	|  |           |   jsr (a2)
      Scene = 15;
    52f8:	|  |           |   move.w #15,65c8e <Scene>
    5300:	|  |           |   lea 12(sp),sp
}
    5304:	|  |           |   movem.l (sp)+,d2-d7/a2-a6
    5308:	|  |           |   lea 44(sp),sp
    530c:	|  |           |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    530e:	|  |           |   pea 1928 <SetCl+0x58a>
    5312:	|  |           |   move.l 75fa4 <WorkingMem>,-(sp)
    5318:	|  |           |   pea 3919e <incbin_MercuryCubeData2Lz4_start>
    531e:	|  |           |   lea 9d8 <Utils_Lz4DepackAsm>(pc),a3
    5322:	|  |           |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    5324:	|  |           |   move.l 75fa4 <WorkingMem>,d2
    532a:	|  |           |   pea 5bdc6 <VectorBuffer>
    5330:	|  |           |   move.l d2,-(sp)
    5332:	|  |           |   pea 390da <incbin_MercuryCubeData2_start>
    5338:	|  |           |   lea 1e22 <LoadVectors>(pc),a2
    533c:	|  |           |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    533e:	|  |           |   pea 1f6b <Clbuild+0x15>
    5342:	|  |           |   move.l d2,-(sp)
    5344:	|  |           |   pea 3abe6 <incbin_MercuryLetterData2Lz4_start>
    534a:	|  |           |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    534c:	|  |           |   lea 32(sp),sp
    5350:	|  |           |   move.l #325028,(sp)
    5356:	|  |           |   move.l 75fa4 <WorkingMem>,-(sp)
    535c:	|  |           |   pea 3aada <incbin_MercuryLetterData2_start>
    5362:	|  |           |   jsr (a2)
      Scene = 17;
    5364:	|  |           |   move.w #17,65c8e <Scene>
    536c:	|  |           |   lea 12(sp),sp
}
    5370:	|  |           |   movem.l (sp)+,d2-d7/a2-a6
    5374:	|  |           |   lea 44(sp),sp
    5378:	|  |           |   rts
      for(int i=0;i<metadata[2];i++)
    537a:	|  |           \-> tst.w d1
    537c:	|  |  /----------- ble.w 54f2 <DrawScreen+0x906>
    5380:	|  |  |            lea 6(a5),a6
    5384:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    5386:	|  |  |            lea 20(a0),a0
    538a:	|  |  |            move.l a0,52(sp)
    538e:	|  |  |            move.l a5,48(sp)
    5392:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    5394:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    5398:	|  |  |  |         movea.w 4(a2),a0
    539c:	|  |  |  |         move.l a0,d0
    539e:	|  |  |  |         subq.l #1,d0
    53a0:	|  |  |  |         add.l d0,d0
    53a2:	|  |  |  |         move.w (0,a4,d0.l),d0
    53a6:	|  |  |  |         move.w d0,d1
    53a8:	|  |  |  |         muls.w (a2),d1
    53aa:	|  |  |  |         moveq #15,d4
    53ac:	|  |  |  |         asr.l d4,d1
    53ae:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    53b2:	|  |  |  |         muls.w 2(a2),d0
    53b6:	|  |  |  |         asr.l d4,d0
    53b8:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    53bc:	|  |  |  |         movea.w 10(a2),a0
    53c0:	|  |  |  |         subq.l #1,a0
    53c2:	|  |  |  |         adda.l a0,a0
    53c4:	|  |  |  |         move.w (0,a4,a0.l),d2
    53c8:	|  |  |  |         move.w d2,d7
    53ca:	|  |  |  |         muls.w 6(a2),d7
    53ce:	|  |  |  |         asr.l d4,d7
    53d0:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    53d4:	|  |  |  |         muls.w 8(a2),d2
    53d8:	|  |  |  |         asr.l d4,d2
    53da:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    53de:	|  |  |  |         movea.w 16(a2),a0
    53e2:	|  |  |  |         subq.l #1,a0
    53e4:	|  |  |  |         adda.l a0,a0
    53e6:	|  |  |  |         move.w (0,a4,a0.l),d3
    53ea:	|  |  |  |         move.w d3,d6
    53ec:	|  |  |  |         muls.w 12(a2),d6
    53f0:	|  |  |  |         asr.l d4,d6
    53f2:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    53f6:	|  |  |  |         muls.w 14(a2),d3
    53fa:	|  |  |  |         asr.l d4,d3
    53fc:	|  |  |  |         movea.w d3,a1
    53fe:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    5402:	|  |  |  |         movea.w 22(a2),a0
    5406:	|  |  |  |         subq.l #1,a0
    5408:	|  |  |  |         adda.l a0,a0
    540a:	|  |  |  |         move.w (0,a4,a0.l),d3
    540e:	|  |  |  |         move.w d3,d5
    5410:	|  |  |  |         muls.w 18(a2),d5
    5414:	|  |  |  |         asr.l d4,d5
    5416:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    541a:	|  |  |  |         muls.w 20(a2),d3
    541e:	|  |  |  |         asr.l d4,d3
    5420:	|  |  |  |         movea.w d3,a0
    5422:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    5426:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    542a:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    542e:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    5432:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    5436:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    543a:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    543e:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    5442:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    5446:	|  |  |  |         move.w d1,d4
    5448:	|  |  |  |         cmp.w d1,d7
    544a:	|  |  |  |     /-- bge.s 544e <DrawScreen+0x862>
    544c:	|  |  |  |     |   move.w d7,d4
    544e:	|  |  |  |     \-> cmp.w d4,d6
    5450:	|  |  |  |     /-- bge.s 5454 <DrawScreen+0x868>
    5452:	|  |  |  |     |   move.w d6,d4
    5454:	|  |  |  |     \-> cmp.w d4,d5
    5456:	|  |  |  |     /-- bge.s 545a <DrawScreen+0x86e>
    5458:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    545a:	|  |  |  |     \-> move.w d0,d3
    545c:	|  |  |  |         cmp.w d0,d2
    545e:	|  |  |  |     /-- bge.s 5462 <DrawScreen+0x876>
    5460:	|  |  |  |     |   move.w d2,d3
    5462:	|  |  |  |     \-> cmp.w a1,d3
    5464:	|  |  |  |     /-- ble.s 5468 <DrawScreen+0x87c>
    5466:	|  |  |  |     |   move.w a1,d3
    5468:	|  |  |  |     \-> cmp.w a0,d3
    546a:	|  |  |  |     /-- ble.s 546e <DrawScreen+0x882>
    546c:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    546e:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    5472:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    5476:	|  |  |  |         cmp.w d0,d2
    5478:	|  |  |  |     /-- ble.s 547c <DrawScreen+0x890>
    547a:	|  |  |  |     |   move.w d2,d0
    547c:	|  |  |  |     \-> cmp.w a1,d0
    547e:	|  |  |  |     /-- bge.s 5482 <DrawScreen+0x896>
    5480:	|  |  |  |     |   move.w a1,d0
    5482:	|  |  |  |     \-> cmp.w a0,d0
    5484:	|  |  |  |     /-- bge.s 5488 <DrawScreen+0x89c>
    5486:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    5488:	|  |  |  |     \-> addq.w #1,d0
    548a:	|  |  |  |         sub.w d3,d0
    548c:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5490:	|  |  |  |         cmpi.w #1,d0
    5494:	|  |  |  |  /----- ble.s 54ce <DrawScreen+0x8e2>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    5496:	|  |  |  |  |      cmp.w d1,d7
    5498:	|  |  |  |  |  /-- ble.s 549c <DrawScreen+0x8b0>
    549a:	|  |  |  |  |  |   move.w d7,d1
    549c:	|  |  |  |  |  \-> cmp.w d1,d6
    549e:	|  |  |  |  |  /-- ble.s 54a2 <DrawScreen+0x8b6>
    54a0:	|  |  |  |  |  |   move.w d6,d1
    54a2:	|  |  |  |  |  \-> cmp.w d1,d5
    54a4:	|  |  |  |  |  /-- ble.s 54a8 <DrawScreen+0x8bc>
    54a6:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    54a8:	|  |  |  |  |  \-> sub.w d4,d1
    54aa:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    54ae:	|  |  |  |  |      cmpi.w #1,d1
    54b2:	|  |  |  |  +----- ble.s 54ce <DrawScreen+0x8e2>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    54b4:	|  |  |  |  |      movea.l 52(sp),a0
    54b8:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    54bc:	|  |  |  |  |      pea 56(sp)
    54c0:	|  |  |  |  |      jsr 23c4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    54c4:	|  |  |  |  |      movea.l 52(sp),a0
    54c8:	|  |  |  |  |      movea.w 4(a0),a5
    54cc:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    54ce:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    54d2:	|  |  |  |         addq.l #1,a3
    54d4:	|  |  |  |         movea.w a5,a0
    54d6:	|  |  |  |         cmpa.l a3,a0
    54d8:	|  |  |  \-------- bgt.w 5394 <DrawScreen+0x7a8>
    54dc:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    54e0:	|  |  |            addq.l #3,a0
    54e2:	|  |  |            adda.l a0,a0
    54e4:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    54e6:	|  |  |            subq.l #1,44(sp)
    54ea:	+--|--|----------- bne.w 4d50 <DrawScreen+0x164>
    54ee:	|  +--|----------- bra.w 4d9e <DrawScreen+0x1b2>
    metadata += 3 + metadata[2];    
    54f2:	|  |  \----------> movea.w d1,a0
    54f4:	|  |               addq.l #3,a0
    54f6:	|  |               adda.l a0,a0
    54f8:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    54fa:	|  |               subq.l #1,44(sp)
    54fe:	\--|-------------- bne.w 4d50 <DrawScreen+0x164>
    5502:	   \-------------- bra.w 4d9e <DrawScreen+0x1b2>

00005506 <strlen>:
	while(*s++)
    5506:	   /-> movea.l 4(sp),a0
    550a:	   |   tst.b (a0)+
    550c:	/--|-- beq.s 551a <strlen+0x14>
    550e:	|  |   move.l a0,-(sp)
    5510:	|  \-- jsr 5506 <strlen>(pc)
    5514:	|      addq.l #4,sp
    5516:	|      addq.l #1,d0
}
    5518:	|      rts
	unsigned long t=0;
    551a:	\----> moveq #0,d0
}
    551c:	       rts

0000551e <memset>:
void* memset(void *dest, int val, unsigned long len) {
    551e:	       move.l d2,-(sp)
    5520:	       move.l 8(sp),d0
	while(len-- > 0)
    5524:	       tst.l 16(sp)
    5528:	/----- beq.s 553c <memset+0x1e>
		*ptr++ = val;
    552a:	|      move.b 15(sp),d2
    552e:	|      move.l 16(sp),d1
    5532:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    5534:	|      movea.l d0,a0
		*ptr++ = val;
    5536:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    5538:	|  |   cmpa.l d1,a0
    553a:	|  \-- bne.s 5536 <memset+0x18>
}
    553c:	\----> move.l (sp)+,d2
    553e:	       rts

00005540 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5540:	       move.l 4(sp),d0
    5544:	       movea.l 8(sp),a0
	while(len--)
    5548:	       tst.l 12(sp)
    554c:	/----- beq.s 555c <memcpy+0x1c>
    554e:	|      movea.l d0,a1
    5550:	|      move.l 12(sp),d1
    5554:	|      add.l a0,d1
		*d++ = *s++;
    5556:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    5558:	|  |   cmp.l a0,d1
    555a:	|  \-- bne.s 5556 <memcpy+0x16>
}
    555c:	\----> rts

0000555e <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    555e:	          move.l d2,-(sp)
    5560:	          move.l 8(sp),d0
    5564:	          movea.l 12(sp),a0
    5568:	          move.l 16(sp),d2
	if (d < s) {
    556c:	          cmpa.l d0,a0
    556e:	   /----- bls.s 5584 <memmove+0x26>
		while (len--)
    5570:	   |      tst.l d2
    5572:	/--|----- beq.s 5580 <memmove+0x22>
    5574:	|  |      movea.l d0,a1
    5576:	|  |      move.l a0,d1
    5578:	|  |      add.l d2,d1
			*d++ = *s++;
    557a:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    557c:	|  |  |   cmp.l a0,d1
    557e:	|  |  \-- bne.s 557a <memmove+0x1c>
}
    5580:	>--|----> move.l (sp)+,d2
    5582:	|  |      rts
		while (len--)
    5584:	|  \----> movea.l d2,a1
    5586:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5588:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    558a:	|         adda.l d0,a1
		while (len--)
    558c:	|         tst.l d2
    558e:	+-------- beq.s 5580 <memmove+0x22>
    5590:	|         move.l a0,d1
    5592:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    5594:	|     /-> move.b (a0),(a1)
		while (len--)
    5596:	|     |   subq.l #1,a0
    5598:	|     |   subq.l #1,a1
    559a:	|     |   cmpa.l d1,a0
    559c:	+-----|-- beq.s 5580 <memmove+0x22>
			*lastd-- = *lasts--;
    559e:	|     |   move.b (a0),(a1)
		while (len--)
    55a0:	|     |   subq.l #1,a0
    55a2:	|     |   subq.l #1,a1
    55a4:	|     |   cmpa.l d1,a0
    55a6:	|     \-- bne.s 5594 <memmove+0x36>
    55a8:	\-------- bra.s 5580 <memmove+0x22>
    55aa:	          nop

000055ac <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    55ac:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    55b0:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    55b4:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    55b8:	mulu.w 8(sp),d1
	addw	d1, d0
    55bc:	add.w d1,d0
	swap	d0
    55be:	swap d0
	clrw	d0
    55c0:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    55c2:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    55c6:	mulu.w 10(sp),d1
	addl	d1, d0
    55ca:	add.l d1,d0
	rts
    55cc:	rts

000055ce <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    55ce:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    55d0:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    55d4:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    55d8:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    55de:	   /-- bcc.s 55f6 <__udivsi3+0x28>
	movel	d0, d2
    55e0:	   |   move.l d0,d2
	clrw	d2
    55e2:	   |   clr.w d2
	swap	d2
    55e4:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    55e6:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    55e8:	   |   move.w d2,d0
	swap	d0
    55ea:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    55ec:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    55f0:	   |   divu.w d1,d2
	movew	d2, d0
    55f2:	   |   move.w d2,d0
	jra	6f
    55f4:	/--|-- bra.s 5626 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    55f6:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    55f8:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    55fa:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    55fc:	|  |   cmpi.l #65536,d1
	jcc	4b
    5602:	|  \-- bcc.s 55f8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    5604:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    5606:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    560c:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    560e:	|      mulu.w d0,d1
	swap	d2
    5610:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    5612:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    5614:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    5616:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    5618:	|  /-- bne.s 5624 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    561a:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    561c:	|  +-- bcs.s 5624 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    561e:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    5622:	+--|-- bls.s 5626 <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    5624:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    5626:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5628:	       rts

0000562a <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    562a:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    562c:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    562e:	    move.l 12(sp),d1
	jpl	1f
    5632:	/-- bpl.s 5638 <__divsi3+0xe>
	negl	d1
    5634:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5636:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5638:	\-> move.l 8(sp),d0
	jpl	2f
    563c:	/-- bpl.s 5642 <__divsi3+0x18>
	negl	d0
    563e:	|   neg.l d0
	negb	d2
    5640:	|   neg.b d2

2:	movel	d1, sp@-
    5642:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5644:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5646:	    bsr.s 55ce <__udivsi3>
	addql	#8, sp
    5648:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    564a:	    tst.b d2
	jpl	3f
    564c:	/-- bpl.s 5650 <__divsi3+0x26>
	negl	d0
    564e:	|   neg.l d0

3:	movel	sp@+, d2
    5650:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5652:	    rts

00005654 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5654:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5658:	move.l 4(sp),d0
	movel	d1, sp@-
    565c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    565e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5660:	bsr.s 562a <__divsi3>
	addql	#8, sp
    5662:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5664:	move.l 8(sp),d1
	movel	d1, sp@-
    5668:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    566a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    566c:	bsr.w 55ac <__mulsi3>
	addql	#8, sp
    5670:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5672:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5676:	sub.l d0,d1
	movel	d1, d0
    5678:	move.l d1,d0
	rts
    567a:	rts

0000567c <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    567c:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5680:	move.l 4(sp),d0
	movel	d1, sp@-
    5684:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5686:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5688:	bsr.w 55ce <__udivsi3>
	addql	#8, sp
    568c:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    568e:	move.l 8(sp),d1
	movel	d1, sp@-
    5692:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5694:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5696:	bsr.w 55ac <__mulsi3>
	addql	#8, sp
    569a:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    569c:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    56a0:	sub.l d0,d1
	movel	d1, d0
    56a2:	move.l d1,d0
	rts
    56a4:	rts

000056a6 <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    56a6:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    56a8:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    56ac:	jsr -516(a6)
    move.l (sp)+, a6
    56b0:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    56b2:	rts

000056b4 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    56b4:	move.b d0,(a3)+
	rts
    56b6:	rts

000056b8 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    56b8:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    56ba:	                         adda.l a0,a2
	move.l	a2,a3
    56bc:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    56be:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    56c0:	                         moveq #56,d4
	moveq	#8,d5
    56c2:	                         moveq #8,d5
	bra.s	.Lliteral
    56c4:	   /-------------------- bra.s 572e <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    56c6:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    56c8:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    56ca:	+--|-------------------- dbf d1,56c6 <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    56ce:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    56d0:	|  |     /-------------- bcc.s 56d4 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    56d2:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    56d4:	|  |  |  >-------------> tst.w d0
    56d6:	|  |  |  |           /-- bne.s 56e0 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    56d8:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    56da:	|  |  |  |           |   bls.s 5752 <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    56dc:	|  |  |  |           |   move.w (a0)+,d0
    56de:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    56e0:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    56e2:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    56e4:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    56e6:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    56e8:	|  |  |  |               movem.w (574c <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    56ee:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    56f0:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    56f2:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    56f4:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    56f6:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    56f8:	|  |  |  |               tst.w d0
    56fa:	|  |  |  |           /-- bne.s 5700 <_doynaxdepack_asm+0x48>
    56fc:	|  |  |  |           |   move.w (a0)+,d0
    56fe:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5700:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5702:	|  |  |  |  /----------- beq.s 571a <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5704:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5706:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5708:	|  |  |  |  |  /-------- bpl.s 5716 <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    570a:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    570c:	|  |  |  |  |  |  /----- bpl.s 5714 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    570e:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5710:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5712:	|  |  |  |  |  |  |  \-- bmi.s 570e <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5714:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5716:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5718:	|  |  |  |  |        /-- bcc.s 571c <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    571a:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    571c:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    571e:	|  |  |  |  \----------- dbf d1,571a <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5722:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5724:	|  |  |  \-------------- bcc.s 56d4 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5726:	|  |  |                  tst.w d0
    5728:	|  +--|----------------- bne.s 572e <_doynaxdepack_asm+0x76>
    572a:	|  |  |                  move.w (a0)+,d0
    572c:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    572e:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5730:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5732:	|     \----------------- bcc.s 56d2 <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5734:	|                 /----- bpl.s 573c <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5736:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5738:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    573a:	|                 |  \-- bmi.s 5736 <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    573c:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    573e:	\--------------------/-X dbv.s d1,56c6 <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5742:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5744:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5746:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5748:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    574a:	                     \-- bra.s 573e <_doynaxdepack_asm+0x86>

0000574c <doy_table>:
    574c:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    575c:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    576c:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    577c:	.............oNq

0000578c <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    578c:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    5790:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    5792:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    5796:	cmpi.w #0,d2
    bgt.s br1
    579a:	bgt.s 57a6 <br1>
    |{
    |direction = -64;  
    neg.w d7    
    579c:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    579e:	addq.w #1,d2
    lsl.l   #6,d2
    57a0:	lsl.l #6,d2
    sub.w   d2,d1
    57a2:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    57a4:	neg.w d2

000057a6 <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    57a6:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    57a8:	lsl.w #3,d6
    sub.w d6,d0
    57aa:	sub.w d6,d0
    mulu.w #1200,d6
    57ac:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    57b0:	move.w d2,d0
    subq.w #1,d0
    57b2:	subq.w #1,d0
    mulu.w #100,d0
    57b4:	mulu.w #100,d0
    subq.w #1,d3
    57b8:	subq.w #1,d3
    add.w d3,d0
    57ba:	add.w d3,d0
    add.w d0,a0
    57bc:	adda.w d0,a0
    move.w (a0),d0
    57be:	move.w (a0),d0
    sub.w  d5,d0
    57c0:	sub.w d5,d0
    sub.w  d5,d0
    57c2:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    57c4:	sub.w d5,d7
    sub.w d5,d7
    57c6:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    57c8:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    57ca:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    57cc:	lsl.w #6,d2
    add.w d5,d2
    57ce:	add.w d5,d2
    lea   0xdff000,a3
    57d0:	lea dff000 <_end+0xd8903c>,a3
    tst.w 0x2(a3)
    57d6:	tst.w 2(a3)

000057da <waitblit>:
waitblit:
    btst #6,2(a3)
    57da:	/-> btst #6,2(a3)
    bne.s waitblit
    57e0:	\-- bne.s 57da <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    57e2:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    57e6:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    57ea:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    57ee:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    57f2:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    57f6:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    57fa:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    57fe:	    movem.l (sp)+,d0-a3
    rts
    5802:	    rts

00005804 <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    5804:	lea 5804 <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    5808:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    580c:	adda.l a1,a1
    add.l #zmult,a1
    580e:	adda.l #22532,a1

00005814 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5814:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5818:	moveq #0,d1
			moveq	#0,d2
    581a:	moveq #0,d2
			moveq	#0,d3
    581c:	moveq #0,d3
			moveq	#16,d7
    581e:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5820:	lea 649e <lz4jmp>(pc),a3
		moveq	#0,d0
    5824:	moveq #0,d0
		move.b	(a0)+,d0
    5826:	move.b (a0)+,d0
		add.w	d0,d0
    5828:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    582a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    582e:	jmp (0,a3,d0.w)

00005832 <lz4Rts0>:
lz4Rts0:	rts
    5832:	rts

00005834 <sl_sm0>:

sl_sm0:
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
		move.b	(a0)+,(a1)+
    5844:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5846:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5848:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    584a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    584c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    584e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5850:	cmpa.l a0,a4
		beq.s	lz4Rts1
    5852:	beq.s 5876 <lz4Rts1>
		move.b	(a0)+,d0
    5854:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5856:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5858:	move.w (sp)+,d3
		move.b	d0,d3
    585a:	move.b d0,d3
		move.l	a1,a2
    585c:	movea.l a1,a2
		sub.l	d3,a2
    585e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5860:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5862:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5864:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5866:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5868:	moveq #0,d0
		move.b	(a0)+,d0
    586a:	move.b (a0)+,d0
		add.w	d0,d0
    586c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    586e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5872:	jmp (0,a3,d0.w)

00005876 <lz4Rts1>:
lz4Rts1:	rts
    5876:	rts

00005878 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    5878:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    587a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    587c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    587e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5880:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5882:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5884:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5886:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5888:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    588a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    588c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    588e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5890:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5892:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5894:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5896:	beq.s 58bc <lz4Rts2>
		move.b	(a0)+,d0
    5898:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    589a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    589c:	move.w (sp)+,d3
		move.b	d0,d3
    589e:	move.b d0,d3
		move.l	a1,a2
    58a0:	movea.l a1,a2
		sub.l	d3,a2
    58a2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    58a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58ac:	move.b (a2)+,(a1)+
		moveq	#0,d0
    58ae:	moveq #0,d0
		move.b	(a0)+,d0
    58b0:	move.b (a0)+,d0
		add.w	d0,d0
    58b2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    58b4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    58b8:	jmp (0,a3,d0.w)

000058bc <lz4Rts2>:
lz4Rts2:	rts
    58bc:	rts

000058be <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    58be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58d8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    58da:	cmpa.l a0,a4
		beq.s	lz4Rts3
    58dc:	beq.s 5904 <lz4Rts3>
		move.b	(a0)+,d0
    58de:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    58e0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    58e2:	move.w (sp)+,d3
		move.b	d0,d3
    58e4:	move.b d0,d3
		move.l	a1,a2
    58e6:	movea.l a1,a2
		sub.l	d3,a2
    58e8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    58ea:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    58f6:	moveq #0,d0
		move.b	(a0)+,d0
    58f8:	move.b (a0)+,d0
		add.w	d0,d0
    58fa:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    58fc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5900:	jmp (0,a3,d0.w)

00005904 <lz4Rts3>:
lz4Rts3:	rts
    5904:	rts

00005906 <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    5906:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5908:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    590a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    590c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    590e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5910:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5912:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5914:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5916:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5918:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    591a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    591c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    591e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5920:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5922:	cmpa.l a0,a4
		beq.s	lz4Rts4
    5924:	beq.s 594e <lz4Rts4>
		move.b	(a0)+,d0
    5926:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5928:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    592a:	move.w (sp)+,d3
		move.b	d0,d3
    592c:	move.b d0,d3
		move.l	a1,a2
    592e:	movea.l a1,a2
		sub.l	d3,a2
    5930:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5932:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5934:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5936:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5938:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    593a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    593c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    593e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5940:	moveq #0,d0
		move.b	(a0)+,d0
    5942:	move.b (a0)+,d0
		add.w	d0,d0
    5944:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5946:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    594a:	jmp (0,a3,d0.w)

0000594e <lz4Rts4>:
lz4Rts4:	rts
    594e:	rts

00005950 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    5950:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5952:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5954:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5956:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5958:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    595a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    595c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    595e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5960:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5962:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5964:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5966:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5968:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    596a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    596c:	cmpa.l a0,a4
		beq.s	lz4Rts5
    596e:	beq.s 599a <lz4Rts5>
		move.b	(a0)+,d0
    5970:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5972:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5974:	move.w (sp)+,d3
		move.b	d0,d3
    5976:	move.b d0,d3
		move.l	a1,a2
    5978:	movea.l a1,a2
		sub.l	d3,a2
    597a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    597c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    597e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5980:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5982:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5984:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5986:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5988:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    598a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    598c:	moveq #0,d0
		move.b	(a0)+,d0
    598e:	move.b (a0)+,d0
		add.w	d0,d0
    5990:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5992:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5996:	jmp (0,a3,d0.w)

0000599a <lz4Rts5>:
lz4Rts5:	rts
    599a:	rts

0000599c <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    599c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    599e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59b6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    59b8:	cmpa.l a0,a4
		beq.s	lz4Rts6
    59ba:	beq.s 59e8 <lz4Rts6>
		move.b	(a0)+,d0
    59bc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    59be:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    59c0:	move.w (sp)+,d3
		move.b	d0,d3
    59c2:	move.b d0,d3
		move.l	a1,a2
    59c4:	movea.l a1,a2
		sub.l	d3,a2
    59c6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    59c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    59d8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    59da:	moveq #0,d0
		move.b	(a0)+,d0
    59dc:	move.b (a0)+,d0
		add.w	d0,d0
    59de:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    59e0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    59e4:	jmp (0,a3,d0.w)

000059e8 <lz4Rts6>:
lz4Rts6:	rts
    59e8:	rts

000059ea <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    59ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    59fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a04:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5a06:	cmpa.l a0,a4
		beq.s	lz4Rts7
    5a08:	beq.s 5a38 <lz4Rts7>
		move.b	(a0)+,d0
    5a0a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5a0c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5a0e:	move.w (sp)+,d3
		move.b	d0,d3
    5a10:	move.b d0,d3
		move.l	a1,a2
    5a12:	movea.l a1,a2
		sub.l	d3,a2
    5a14:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5a16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a28:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5a2a:	moveq #0,d0
		move.b	(a0)+,d0
    5a2c:	move.b (a0)+,d0
		add.w	d0,d0
    5a2e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5a30:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5a34:	jmp (0,a3,d0.w)

00005a38 <lz4Rts7>:
lz4Rts7:	rts
    5a38:	rts

00005a3a <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    5a3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a54:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5a56:	cmpa.l a0,a4
		beq.s	lz4Rts8
    5a58:	beq.s 5a8a <lz4Rts8>
		move.b	(a0)+,d0
    5a5a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5a5c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5a5e:	move.w (sp)+,d3
		move.b	d0,d3
    5a60:	move.b d0,d3
		move.l	a1,a2
    5a62:	movea.l a1,a2
		sub.l	d3,a2
    5a64:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5a66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5a7a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5a7c:	moveq #0,d0
		move.b	(a0)+,d0
    5a7e:	move.b (a0)+,d0
		add.w	d0,d0
    5a80:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5a82:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5a86:	jmp (0,a3,d0.w)

00005a8a <lz4Rts8>:
lz4Rts8:	rts
    5a8a:	rts

00005a8c <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    5a8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5a9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aa0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aa2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aa4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aa6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5aa8:	cmpa.l a0,a4
		beq.s	lz4Rts9
    5aaa:	beq.s 5ade <lz4Rts9>
		move.b	(a0)+,d0
    5aac:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5aae:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5ab0:	move.w (sp)+,d3
		move.b	d0,d3
    5ab2:	move.b d0,d3
		move.l	a1,a2
    5ab4:	movea.l a1,a2
		sub.l	d3,a2
    5ab6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5ab8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5aba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5abc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5abe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ac0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ac2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ac4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ac6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ac8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5aca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5acc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ace:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5ad0:	moveq #0,d0
		move.b	(a0)+,d0
    5ad2:	move.b (a0)+,d0
		add.w	d0,d0
    5ad4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5ad6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ada:	jmp (0,a3,d0.w)

00005ade <lz4Rts9>:
lz4Rts9:	rts
    5ade:	rts

00005ae0 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    5ae0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ae2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ae4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ae6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ae8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5aee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5af0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5af2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5af4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5af6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5af8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5afa:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5afc:	cmpa.l a0,a4
		beq.s	lz4Rts10
    5afe:	beq.s 5b34 <lz4Rts10>
		move.b	(a0)+,d0
    5b00:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5b02:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5b04:	move.w (sp)+,d3
		move.b	d0,d3
    5b06:	move.b d0,d3
		move.l	a1,a2
    5b08:	movea.l a1,a2
		sub.l	d3,a2
    5b0a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5b0c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b0e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b10:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b12:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b24:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5b26:	moveq #0,d0
		move.b	(a0)+,d0
    5b28:	move.b (a0)+,d0
		add.w	d0,d0
    5b2a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5b2c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5b30:	jmp (0,a3,d0.w)

00005b34 <lz4Rts10>:
lz4Rts10:	rts
    5b34:	rts

00005b36 <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    5b36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b50:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5b52:	cmpa.l a0,a4
		beq.s	lz4Rts11
    5b54:	beq.s 5b8c <lz4Rts11>
		move.b	(a0)+,d0
    5b56:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5b58:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5b5a:	move.w (sp)+,d3
		move.b	d0,d3
    5b5c:	move.b d0,d3
		move.l	a1,a2
    5b5e:	movea.l a1,a2
		sub.l	d3,a2
    5b60:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5b62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5b7c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5b7e:	moveq #0,d0
		move.b	(a0)+,d0
    5b80:	move.b (a0)+,d0
		add.w	d0,d0
    5b82:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5b84:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5b88:	jmp (0,a3,d0.w)

00005b8c <lz4Rts11>:
lz4Rts11:	rts
    5b8c:	rts

00005b8e <sl_sm11>:

sl_sm11:
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
		move.b	(a0)+,(a1)+
    5ba0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ba2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ba4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ba6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ba8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5baa:	cmpa.l a0,a4
		beq.s	lz4Rts12
    5bac:	beq.s 5be6 <lz4Rts12>
		move.b	(a0)+,d0
    5bae:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5bb0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5bb2:	move.w (sp)+,d3
		move.b	d0,d3
    5bb4:	move.b d0,d3
		move.l	a1,a2
    5bb6:	movea.l a1,a2
		sub.l	d3,a2
    5bb8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5bba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bc8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bcc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bd6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5bd8:	moveq #0,d0
		move.b	(a0)+,d0
    5bda:	move.b (a0)+,d0
		add.w	d0,d0
    5bdc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5bde:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5be2:	jmp (0,a3,d0.w)

00005be6 <lz4Rts12>:
lz4Rts12:	rts
    5be6:	rts

00005be8 <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    5be8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bf0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bf2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bf4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bf6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bf8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bfa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c02:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5c04:	cmpa.l a0,a4
		beq.s	lz4Rts13
    5c06:	beq.s 5c42 <lz4Rts13>
		move.b	(a0)+,d0
    5c08:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5c0a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5c0c:	move.w (sp)+,d3
		move.b	d0,d3
    5c0e:	move.b d0,d3
		move.l	a1,a2
    5c10:	movea.l a1,a2
		sub.l	d3,a2
    5c12:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5c14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c30:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c32:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5c34:	moveq #0,d0
		move.b	(a0)+,d0
    5c36:	move.b (a0)+,d0
		add.w	d0,d0
    5c38:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5c3a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5c3e:	jmp (0,a3,d0.w)

00005c42 <lz4Rts13>:
lz4Rts13:	rts
    5c42:	rts

00005c44 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    5c44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c54:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    5c60:	cmpa.l a0,a4
		beq.s	lz4Rts14
    5c62:	beq.s 5ca0 <lz4Rts14>
		move.b	(a0)+,d0
    5c64:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5c66:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5c68:	move.w (sp)+,d3
		move.b	d0,d3
    5c6a:	move.b d0,d3
		move.l	a1,a2
    5c6c:	movea.l a1,a2
		sub.l	d3,a2
    5c6e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5c70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c80:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    5c90:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5c92:	moveq #0,d0
		move.b	(a0)+,d0
    5c94:	move.b (a0)+,d0
		add.w	d0,d0
    5c96:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5c98:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5c9c:	jmp (0,a3,d0.w)

00005ca0 <lz4Rts14>:
lz4Rts14:	rts
    5ca0:	rts

00005ca2 <sl_sm14>:

sl_sm14:
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
		move.b	(a0)+,(a1)+
    5cbc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5cbe:	cmpa.l a0,a4
		beq.s	lz4Rts15
    5cc0:	beq.s 5d00 <lz4Rts15>
		move.b	(a0)+,d0
    5cc2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5cc4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5cc6:	move.w (sp)+,d3
		move.b	d0,d3
    5cc8:	move.b d0,d3
		move.l	a1,a2
    5cca:	movea.l a1,a2
		sub.l	d3,a2
    5ccc:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    5cdc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cde:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ce0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ce2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ce4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ce6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ce8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cf0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5cf2:	moveq #0,d0
		move.b	(a0)+,d0
    5cf4:	move.b (a0)+,d0
		add.w	d0,d0
    5cf6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5cf8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5cfc:	jmp (0,a3,d0.w)

00005d00 <lz4Rts15>:
lz4Rts15:	rts
    5d00:	rts

00005d02 <sl_lm>:

sl_lm:
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
		cmpa.l	a0,a4
    5d1e:	cmpa.l a0,a4
		beq.s	lz4Rts16
    5d20:	beq.s 5d76 <lz4Rts16>
		move.b	(a0)+,d0
    5d22:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d24:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d26:	move.w (sp)+,d3
		move.b	d0,d3
    5d28:	move.b d0,d3
		move.l	a1,a2
    5d2a:	movea.l a1,a2
		sub.l	d3,a2
    5d2c:	suba.l d3,a2
		moveq	#15+4,d1
    5d2e:	moveq #19,d1

00005d30 <.cl0>:
.cl0:	move.b	(a0)+,d2
    5d30:	/-> move.b (a0)+,d2
		add.l d2,d1
    5d32:	|   add.l d2,d1
		not.b	d2
    5d34:	|   not.b d2
		beq.s	.cl0
    5d36:	\-- beq.s 5d30 <.cl0>
		moveq	#15,d5
    5d38:	    moveq #15,d5
		and.w	d1,d5
    5d3a:	    and.w d1,d5
		add.w	d5,d5
    5d3c:	    add.w d5,d5
		neg.w	d5
    5d3e:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    5d40:	    jmp (5d64 <.eloop1>,pc,d5.w)

00005d44 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    5d44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d46:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    5d52:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d54:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d5a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d62:	move.b (a2)+,(a1)+

00005d64 <.eloop1>:
.eloop1:	sub.l	d7,d1
    5d64:	sub.l d7,d1
		bpl.s	.tloop1
    5d66:	bpl.s 5d44 <.tloop1>
		moveq	#0,d0
    5d68:	moveq #0,d0
		move.b	(a0)+,d0
    5d6a:	move.b (a0)+,d0
		add.w	d0,d0
    5d6c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d6e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d72:	jmp (0,a3,d0.w)

00005d76 <lz4Rts16>:
lz4Rts16:	rts
    5d76:	rts

00005d78 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    5d78:	moveq #15,d1

00005d7a <.cl2>:
.cl2:	move.b	(a0)+,d2
    5d7a:	/-> move.b (a0)+,d2
		add.l d2,d1
    5d7c:	|   add.l d2,d1
		not.b	d2
    5d7e:	|   not.b d2
		beq.s	.cl2
    5d80:	\-- beq.s 5d7a <.cl2>
		moveq	#15,d5
    5d82:	    moveq #15,d5
		and.w	d1,d5
    5d84:	    and.w d1,d5
		add.w	d5,d5
    5d86:	    add.w d5,d5
		neg.w	d5
    5d88:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    5d8a:	    jmp (5dae <.eloop3>,pc,d5.w)

00005d8e <.tloop3>:
.tloop3:
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
		move.b	(a0)+,(a1)+
    5da6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5daa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dac:	move.b (a0)+,(a1)+

00005dae <.eloop3>:
.eloop3:	sub.l	d7,d1
    5dae:	sub.l d7,d1
		bpl.s	.tloop3
    5db0:	bpl.s 5d8e <.tloop3>
		cmpa.l	a0,a4
    5db2:	cmpa.l a0,a4
		beq.s	lz4Rts17
    5db4:	beq.s 5dd8 <lz4Rts17>
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
		moveq	#0,d0
    5dca:	moveq #0,d0
		move.b	(a0)+,d0
    5dcc:	move.b (a0)+,d0
		add.w	d0,d0
    5dce:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5dd0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5dd4:	jmp (0,a3,d0.w)

00005dd8 <lz4Rts17>:
lz4Rts17:	rts
    5dd8:	rts

00005dda <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    5dda:	moveq #15,d1

00005ddc <.cl4>:
.cl4:	move.b	(a0)+,d2
    5ddc:	/-> move.b (a0)+,d2
		add.l d2,d1
    5dde:	|   add.l d2,d1
		not.b	d2
    5de0:	|   not.b d2
		beq.s	.cl4
    5de2:	\-- beq.s 5ddc <.cl4>
		moveq	#15,d5
    5de4:	    moveq #15,d5
		and.w	d1,d5
    5de6:	    and.w d1,d5
		add.w	d5,d5
    5de8:	    add.w d5,d5
		neg.w	d5
    5dea:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    5dec:	    jmp (5e10 <.eloop5>,pc,d5.w)

00005df0 <.tloop5>:
.tloop5:
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

00005e10 <.eloop5>:
.eloop5:	sub.l	d7,d1
    5e10:	sub.l d7,d1
		bpl.s	.tloop5
    5e12:	bpl.s 5df0 <.tloop5>
		cmpa.l	a0,a4
    5e14:	cmpa.l a0,a4
		beq.s	lz4Rts18
    5e16:	beq.s 5e3c <lz4Rts18>
		move.b	(a0)+,d0
    5e18:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e1a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e1c:	move.w (sp)+,d3
		move.b	d0,d3
    5e1e:	move.b d0,d3
		move.l	a1,a2
    5e20:	movea.l a1,a2
		sub.l	d3,a2
    5e22:	suba.l d3,a2
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
		moveq	#0,d0
    5e2e:	moveq #0,d0
		move.b	(a0)+,d0
    5e30:	move.b (a0)+,d0
		add.w	d0,d0
    5e32:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e34:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e38:	jmp (0,a3,d0.w)

00005e3c <lz4Rts18>:
lz4Rts18:	rts
    5e3c:	rts

00005e3e <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    5e3e:	moveq #15,d1

00005e40 <.cl6>:
.cl6:	move.b	(a0)+,d2
    5e40:	/-> move.b (a0)+,d2
		add.l d2,d1
    5e42:	|   add.l d2,d1
		not.b	d2
    5e44:	|   not.b d2
		beq.s	.cl6
    5e46:	\-- beq.s 5e40 <.cl6>
		moveq	#15,d5
    5e48:	    moveq #15,d5
		and.w	d1,d5
    5e4a:	    and.w d1,d5
		add.w	d5,d5
    5e4c:	    add.w d5,d5
		neg.w	d5
    5e4e:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    5e50:	    jmp (5e74 <.eloop7>,pc,d5.w)

00005e54 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    5e54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e5a:	move.b (a0)+,(a1)+
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

00005e74 <.eloop7>:
.eloop7:	sub.l	d7,d1
    5e74:	sub.l d7,d1
		bpl.s	.tloop7
    5e76:	bpl.s 5e54 <.tloop7>
		cmpa.l	a0,a4
    5e78:	cmpa.l a0,a4
		beq.s	lz4Rts19
    5e7a:	beq.s 5ea2 <lz4Rts19>
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
		moveq	#0,d0
    5e94:	moveq #0,d0
		move.b	(a0)+,d0
    5e96:	move.b (a0)+,d0
		add.w	d0,d0
    5e98:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e9a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e9e:	jmp (0,a3,d0.w)

00005ea2 <lz4Rts19>:
lz4Rts19:	rts
    5ea2:	rts

00005ea4 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    5ea4:	moveq #15,d1

00005ea6 <.cl8>:
.cl8:	move.b	(a0)+,d2
    5ea6:	/-> move.b (a0)+,d2
		add.l d2,d1
    5ea8:	|   add.l d2,d1
		not.b	d2
    5eaa:	|   not.b d2
		beq.s	.cl8
    5eac:	\-- beq.s 5ea6 <.cl8>
		moveq	#15,d5
    5eae:	    moveq #15,d5
		and.w	d1,d5
    5eb0:	    and.w d1,d5
		add.w	d5,d5
    5eb2:	    add.w d5,d5
		neg.w	d5
    5eb4:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    5eb6:	    jmp (5eda <.eloop9>,pc,d5.w)

00005eba <.tloop9>:
.tloop9:
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

00005eda <.eloop9>:
.eloop9:	sub.l	d7,d1
    5eda:	sub.l d7,d1
		bpl.s	.tloop9
    5edc:	bpl.s 5eba <.tloop9>
		cmpa.l	a0,a4
    5ede:	cmpa.l a0,a4
		beq.s	lz4Rts20
    5ee0:	beq.s 5f0a <lz4Rts20>
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
		moveq	#0,d0
    5efc:	moveq #0,d0
		move.b	(a0)+,d0
    5efe:	move.b (a0)+,d0
		add.w	d0,d0
    5f00:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f02:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f06:	jmp (0,a3,d0.w)

00005f0a <lz4Rts20>:
lz4Rts20:	rts
    5f0a:	rts

00005f0c <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    5f0c:	moveq #15,d1

00005f0e <.cl10>:
.cl10:	move.b	(a0)+,d2
    5f0e:	/-> move.b (a0)+,d2
		add.l d2,d1
    5f10:	|   add.l d2,d1
		not.b	d2
    5f12:	|   not.b d2
		beq.s	.cl10
    5f14:	\-- beq.s 5f0e <.cl10>
		moveq	#15,d5
    5f16:	    moveq #15,d5
		and.w	d1,d5
    5f18:	    and.w d1,d5
		add.w	d5,d5
    5f1a:	    add.w d5,d5
		neg.w	d5
    5f1c:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    5f1e:	    jmp (5f42 <.eloop11>,pc,d5.w)

00005f22 <.tloop11>:
.tloop11:
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
		move.b	(a0)+,(a1)+
    5f2e:	move.b (a0)+,(a1)+
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

00005f42 <.eloop11>:
.eloop11:	sub.l	d7,d1
    5f42:	sub.l d7,d1
		bpl.s	.tloop11
    5f44:	bpl.s 5f22 <.tloop11>
		cmpa.l	a0,a4
    5f46:	cmpa.l a0,a4
		beq.s	lz4Rts21
    5f48:	beq.s 5f74 <lz4Rts21>
		move.b	(a0)+,d0
    5f4a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f4c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f4e:	move.w (sp)+,d3
		move.b	d0,d3
    5f50:	move.b d0,d3
		move.l	a1,a2
    5f52:	movea.l a1,a2
		sub.l	d3,a2
    5f54:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f5a:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    5f66:	moveq #0,d0
		move.b	(a0)+,d0
    5f68:	move.b (a0)+,d0
		add.w	d0,d0
    5f6a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f6c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f70:	jmp (0,a3,d0.w)

00005f74 <lz4Rts21>:
lz4Rts21:	rts
    5f74:	rts

00005f76 <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    5f76:	moveq #15,d1

00005f78 <.cl12>:
.cl12:	move.b	(a0)+,d2
    5f78:	/-> move.b (a0)+,d2
		add.l d2,d1
    5f7a:	|   add.l d2,d1
		not.b	d2
    5f7c:	|   not.b d2
		beq.s	.cl12
    5f7e:	\-- beq.s 5f78 <.cl12>
		moveq	#15,d5
    5f80:	    moveq #15,d5
		and.w	d1,d5
    5f82:	    and.w d1,d5
		add.w	d5,d5
    5f84:	    add.w d5,d5
		neg.w	d5
    5f86:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    5f88:	    jmp (5fac <.eloop13>,pc,d5.w)

00005f8c <.tloop13>:
.tloop13:
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

00005fac <.eloop13>:
.eloop13:	sub.l	d7,d1
    5fac:	sub.l d7,d1
		bpl.s	.tloop13
    5fae:	bpl.s 5f8c <.tloop13>
		cmpa.l	a0,a4
    5fb0:	cmpa.l a0,a4
		beq.s	lz4Rts22
    5fb2:	beq.s 5fe0 <lz4Rts22>
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
		moveq	#0,d0
    5fd2:	moveq #0,d0
		move.b	(a0)+,d0
    5fd4:	move.b (a0)+,d0
		add.w	d0,d0
    5fd6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fd8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5fdc:	jmp (0,a3,d0.w)

00005fe0 <lz4Rts22>:
lz4Rts22:	rts
    5fe0:	rts

00005fe2 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    5fe2:	moveq #15,d1

00005fe4 <.cl14>:
.cl14:	move.b	(a0)+,d2
    5fe4:	/-> move.b (a0)+,d2
		add.l d2,d1
    5fe6:	|   add.l d2,d1
		not.b	d2
    5fe8:	|   not.b d2
		beq.s	.cl14
    5fea:	\-- beq.s 5fe4 <.cl14>
		moveq	#15,d5
    5fec:	    moveq #15,d5
		and.w	d1,d5
    5fee:	    and.w d1,d5
		add.w	d5,d5
    5ff0:	    add.w d5,d5
		neg.w	d5
    5ff2:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    5ff4:	    jmp (6018 <.eloop15>,pc,d5.w)

00005ff8 <.tloop15>:
.tloop15:
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
		move.b	(a0)+,(a1)+
    6012:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6014:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6016:	move.b (a0)+,(a1)+

00006018 <.eloop15>:
.eloop15:	sub.l	d7,d1
    6018:	sub.l d7,d1
		bpl.s	.tloop15
    601a:	bpl.s 5ff8 <.tloop15>
		cmpa.l	a0,a4
    601c:	cmpa.l a0,a4
		beq.s	lz4Rts23
    601e:	beq.s 604e <lz4Rts23>
		move.b	(a0)+,d0
    6020:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6022:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6024:	move.w (sp)+,d3
		move.b	d0,d3
    6026:	move.b d0,d3
		move.l	a1,a2
    6028:	movea.l a1,a2
		sub.l	d3,a2
    602a:	suba.l d3,a2
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
		moveq	#0,d0
    6040:	moveq #0,d0
		move.b	(a0)+,d0
    6042:	move.b (a0)+,d0
		add.w	d0,d0
    6044:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6046:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    604a:	jmp (0,a3,d0.w)

0000604e <lz4Rts23>:
lz4Rts23:	rts
    604e:	rts

00006050 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    6050:	moveq #15,d1

00006052 <.cl16>:
.cl16:	move.b	(a0)+,d2
    6052:	/-> move.b (a0)+,d2
		add.l d2,d1
    6054:	|   add.l d2,d1
		not.b	d2
    6056:	|   not.b d2
		beq.s	.cl16
    6058:	\-- beq.s 6052 <.cl16>
		moveq	#15,d5
    605a:	    moveq #15,d5
		and.w	d1,d5
    605c:	    and.w d1,d5
		add.w	d5,d5
    605e:	    add.w d5,d5
		neg.w	d5
    6060:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    6062:	    jmp (6086 <.eloop17>,pc,d5.w)

00006066 <.tloop17>:
.tloop17:
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
		move.b	(a0)+,(a1)+
    6082:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6084:	move.b (a0)+,(a1)+

00006086 <.eloop17>:
.eloop17:	sub.l	d7,d1
    6086:	sub.l d7,d1
		bpl.s	.tloop17
    6088:	bpl.s 6066 <.tloop17>
		cmpa.l	a0,a4
    608a:	cmpa.l a0,a4
		beq.s	lz4Rts24
    608c:	beq.s 60be <lz4Rts24>
		move.b	(a0)+,d0
    608e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6090:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6092:	move.w (sp)+,d3
		move.b	d0,d3
    6094:	move.b d0,d3
		move.l	a1,a2
    6096:	movea.l a1,a2
		sub.l	d3,a2
    6098:	suba.l d3,a2
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

000060be <lz4Rts24>:
lz4Rts24:	rts
    60be:	rts

000060c0 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    60c0:	moveq #15,d1

000060c2 <.cl18>:
.cl18:	move.b	(a0)+,d2
    60c2:	/-> move.b (a0)+,d2
		add.l d2,d1
    60c4:	|   add.l d2,d1
		not.b	d2
    60c6:	|   not.b d2
		beq.s	.cl18
    60c8:	\-- beq.s 60c2 <.cl18>
		moveq	#15,d5
    60ca:	    moveq #15,d5
		and.w	d1,d5
    60cc:	    and.w d1,d5
		add.w	d5,d5
    60ce:	    add.w d5,d5
		neg.w	d5
    60d0:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    60d2:	    jmp (60f6 <.eloop19>,pc,d5.w)

000060d6 <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    60d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60dc:	move.b (a0)+,(a1)+
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

000060f6 <.eloop19>:
.eloop19:	sub.l	d7,d1
    60f6:	sub.l d7,d1
		bpl.s	.tloop19
    60f8:	bpl.s 60d6 <.tloop19>
		cmpa.l	a0,a4
    60fa:	cmpa.l a0,a4
		beq.s	lz4Rts25
    60fc:	beq.s 6130 <lz4Rts25>
		move.b	(a0)+,d0
    60fe:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6100:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6102:	move.w (sp)+,d3
		move.b	d0,d3
    6104:	move.b d0,d3
		move.l	a1,a2
    6106:	movea.l a1,a2
		sub.l	d3,a2
    6108:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    610a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    610c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    610e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6110:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6112:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    6122:	moveq #0,d0
		move.b	(a0)+,d0
    6124:	move.b (a0)+,d0
		add.w	d0,d0
    6126:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6128:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    612c:	jmp (0,a3,d0.w)

00006130 <lz4Rts25>:
lz4Rts25:	rts
    6130:	rts

00006132 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    6132:	moveq #15,d1

00006134 <.cl20>:
.cl20:	move.b	(a0)+,d2
    6134:	/-> move.b (a0)+,d2
		add.l d2,d1
    6136:	|   add.l d2,d1
		not.b	d2
    6138:	|   not.b d2
		beq.s	.cl20
    613a:	\-- beq.s 6134 <.cl20>
		moveq	#15,d5
    613c:	    moveq #15,d5
		and.w	d1,d5
    613e:	    and.w d1,d5
		add.w	d5,d5
    6140:	    add.w d5,d5
		neg.w	d5
    6142:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    6144:	    jmp (6168 <.eloop21>,pc,d5.w)

00006148 <.tloop21>:
.tloop21:
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
		move.b	(a0)+,(a1)+
    6162:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6164:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6166:	move.b (a0)+,(a1)+

00006168 <.eloop21>:
.eloop21:	sub.l	d7,d1
    6168:	sub.l d7,d1
		bpl.s	.tloop21
    616a:	bpl.s 6148 <.tloop21>
		cmpa.l	a0,a4
    616c:	cmpa.l a0,a4
		beq.s	lz4Rts26
    616e:	beq.s 61a4 <lz4Rts26>
		move.b	(a0)+,d0
    6170:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6172:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6174:	move.w (sp)+,d3
		move.b	d0,d3
    6176:	move.b d0,d3
		move.l	a1,a2
    6178:	movea.l a1,a2
		sub.l	d3,a2
    617a:	suba.l d3,a2
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

000061a4 <lz4Rts26>:
lz4Rts26:	rts
    61a4:	rts

000061a6 <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    61a6:	moveq #15,d1

000061a8 <.cl22>:
.cl22:	move.b	(a0)+,d2
    61a8:	/-> move.b (a0)+,d2
		add.l d2,d1
    61aa:	|   add.l d2,d1
		not.b	d2
    61ac:	|   not.b d2
		beq.s	.cl22
    61ae:	\-- beq.s 61a8 <.cl22>
		moveq	#15,d5
    61b0:	    moveq #15,d5
		and.w	d1,d5
    61b2:	    and.w d1,d5
		add.w	d5,d5
    61b4:	    add.w d5,d5
		neg.w	d5
    61b6:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    61b8:	    jmp (61dc <.eloop23>,pc,d5.w)

000061bc <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    61bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61c0:	move.b (a0)+,(a1)+
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

000061dc <.eloop23>:
.eloop23:	sub.l	d7,d1
    61dc:	sub.l d7,d1
		bpl.s	.tloop23
    61de:	bpl.s 61bc <.tloop23>
		cmpa.l	a0,a4
    61e0:	cmpa.l a0,a4
		beq.s	lz4Rts27
    61e2:	beq.s 621a <lz4Rts27>
		move.b	(a0)+,d0
    61e4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61e6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61e8:	move.w (sp)+,d3
		move.b	d0,d3
    61ea:	move.b d0,d3
		move.l	a1,a2
    61ec:	movea.l a1,a2
		sub.l	d3,a2
    61ee:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    6208:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    620a:	move.b (a2)+,(a1)+
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

0000621a <lz4Rts27>:
lz4Rts27:	rts
    621a:	rts

0000621c <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    621c:	moveq #15,d1

0000621e <.cl24>:
.cl24:	move.b	(a0)+,d2
    621e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6220:	|   add.l d2,d1
		not.b	d2
    6222:	|   not.b d2
		beq.s	.cl24
    6224:	\-- beq.s 621e <.cl24>
		moveq	#15,d5
    6226:	    moveq #15,d5
		and.w	d1,d5
    6228:	    and.w d1,d5
		add.w	d5,d5
    622a:	    add.w d5,d5
		neg.w	d5
    622c:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    622e:	    jmp (6252 <.eloop25>,pc,d5.w)

00006232 <.tloop25>:
.tloop25:
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

00006252 <.eloop25>:
.eloop25:	sub.l	d7,d1
    6252:	sub.l d7,d1
		bpl.s	.tloop25
    6254:	bpl.s 6232 <.tloop25>
		cmpa.l	a0,a4
    6256:	cmpa.l a0,a4
		beq.s	lz4Rts28
    6258:	beq.s 6292 <lz4Rts28>
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
		move.b	(a2)+,(a1)+
    6282:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6284:	moveq #0,d0
		move.b	(a0)+,d0
    6286:	move.b (a0)+,d0
		add.w	d0,d0
    6288:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    628a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    628e:	jmp (0,a3,d0.w)

00006292 <lz4Rts28>:
lz4Rts28:	rts
    6292:	rts

00006294 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    6294:	moveq #15,d1

00006296 <.cl26>:
.cl26:	move.b	(a0)+,d2
    6296:	/-> move.b (a0)+,d2
		add.l d2,d1
    6298:	|   add.l d2,d1
		not.b	d2
    629a:	|   not.b d2
		beq.s	.cl26
    629c:	\-- beq.s 6296 <.cl26>
		moveq	#15,d5
    629e:	    moveq #15,d5
		and.w	d1,d5
    62a0:	    and.w d1,d5
		add.w	d5,d5
    62a2:	    add.w d5,d5
		neg.w	d5
    62a4:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    62a6:	    jmp (62ca <.eloop27>,pc,d5.w)

000062aa <.tloop27>:
.tloop27:
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

000062ca <.eloop27>:
.eloop27:	sub.l	d7,d1
    62ca:	sub.l d7,d1
		bpl.s	.tloop27
    62cc:	bpl.s 62aa <.tloop27>
		cmpa.l	a0,a4
    62ce:	cmpa.l a0,a4
		beq.s	lz4Rts29
    62d0:	beq.s 630c <lz4Rts29>
		move.b	(a0)+,d0
    62d2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    62d4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    62d6:	move.w (sp)+,d3
		move.b	d0,d3
    62d8:	move.b d0,d3
		move.l	a1,a2
    62da:	movea.l a1,a2
		sub.l	d3,a2
    62dc:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62e2:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    62ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62fc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62fe:	moveq #0,d0
		move.b	(a0)+,d0
    6300:	move.b (a0)+,d0
		add.w	d0,d0
    6302:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6304:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6308:	jmp (0,a3,d0.w)

0000630c <lz4Rts29>:
lz4Rts29:	rts
    630c:	rts

0000630e <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    630e:	moveq #15,d1

00006310 <.cl28>:
.cl28:	move.b	(a0)+,d2
    6310:	/-> move.b (a0)+,d2
		add.l d2,d1
    6312:	|   add.l d2,d1
		not.b	d2
    6314:	|   not.b d2
		beq.s	.cl28
    6316:	\-- beq.s 6310 <.cl28>
		moveq	#15,d5
    6318:	    moveq #15,d5
		and.w	d1,d5
    631a:	    and.w d1,d5
		add.w	d5,d5
    631c:	    add.w d5,d5
		neg.w	d5
    631e:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    6320:	    jmp (6344 <.eloop29>,pc,d5.w)

00006324 <.tloop29>:
.tloop29:
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

00006344 <.eloop29>:
.eloop29:	sub.l	d7,d1
    6344:	sub.l d7,d1
		bpl.s	.tloop29
    6346:	bpl.s 6324 <.tloop29>
		cmpa.l	a0,a4
    6348:	cmpa.l a0,a4
		beq.s	lz4Rts30
    634a:	beq.s 6388 <lz4Rts30>
		move.b	(a0)+,d0
    634c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    634e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6350:	move.w (sp)+,d3
		move.b	d0,d3
    6352:	move.b d0,d3
		move.l	a1,a2
    6354:	movea.l a1,a2
		sub.l	d3,a2
    6356:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6358:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    635a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    635c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    635e:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    636c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    636e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6370:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6372:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6374:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6376:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6378:	move.b (a2)+,(a1)+
		moveq	#0,d0
    637a:	moveq #0,d0
		move.b	(a0)+,d0
    637c:	move.b (a0)+,d0
		add.w	d0,d0
    637e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6380:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6384:	jmp (0,a3,d0.w)

00006388 <lz4Rts30>:
lz4Rts30:	rts
    6388:	rts

0000638a <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    638a:	moveq #15,d1

0000638c <.cl30>:
.cl30:	move.b	(a0)+,d2
    638c:	/-> move.b (a0)+,d2
		add.l d2,d1
    638e:	|   add.l d2,d1
		not.b	d2
    6390:	|   not.b d2
		beq.s	.cl30
    6392:	\-- beq.s 638c <.cl30>
		moveq	#15,d5
    6394:	    moveq #15,d5
		and.w	d1,d5
    6396:	    and.w d1,d5
		add.w	d5,d5
    6398:	    add.w d5,d5
		neg.w	d5
    639a:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    639c:	    jmp (63c0 <.eloop31>,pc,d5.w)

000063a0 <.tloop31>:
.tloop31:
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

000063c0 <.eloop31>:
.eloop31:	sub.l	d7,d1
    63c0:	sub.l d7,d1
		bpl.s	.tloop31
    63c2:	bpl.s 63a0 <.tloop31>
		cmpa.l	a0,a4
    63c4:	cmpa.l a0,a4
		beq.s	lz4Rts31
    63c6:	beq.s 6406 <lz4Rts31>
		move.b	(a0)+,d0
    63c8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63ca:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63cc:	move.w (sp)+,d3
		move.b	d0,d3
    63ce:	move.b d0,d3
		move.l	a1,a2
    63d0:	movea.l a1,a2
		sub.l	d3,a2
    63d2:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    63f6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    63f8:	moveq #0,d0
		move.b	(a0)+,d0
    63fa:	move.b (a0)+,d0
		add.w	d0,d0
    63fc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    63fe:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6402:	jmp (0,a3,d0.w)

00006406 <lz4Rts31>:
lz4Rts31:	rts
    6406:	rts

00006408 <ll_lm>:

ll_lm:
		moveq	#15,d1
    6408:	moveq #15,d1

0000640a <.cl32>:
.cl32:	move.b	(a0)+,d2
    640a:	/-> move.b (a0)+,d2
		add.l d2,d1
    640c:	|   add.l d2,d1
		not.b	d2
    640e:	|   not.b d2
		beq.s	.cl32
    6410:	\-- beq.s 640a <.cl32>
		moveq	#15,d5
    6412:	    moveq #15,d5
		and.w	d1,d5
    6414:	    and.w d1,d5
		add.w	d5,d5
    6416:	    add.w d5,d5
		neg.w	d5
    6418:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    641a:	    jmp (643e <.eloop33>,pc,d5.w)

0000641e <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    641e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6420:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6422:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6424:	move.b (a0)+,(a1)+
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

0000643e <.eloop33>:
.eloop33:	sub.l	d7,d1
    643e:	sub.l d7,d1
		bpl.s	.tloop33
    6440:	bpl.s 641e <.tloop33>
		cmpa.l	a0,a4
    6442:	cmpa.l a0,a4
		beq.s	lz4Rts32
    6444:	beq.s 649a <lz4Rts32>
		move.b	(a0)+,d0
    6446:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6448:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    644a:	move.w (sp)+,d3
		move.b	d0,d3
    644c:	move.b d0,d3
		move.l	a1,a2
    644e:	movea.l a1,a2
		sub.l	d3,a2
    6450:	suba.l d3,a2
		moveq	#15+4,d1
    6452:	moveq #19,d1

00006454 <.cl34>:
.cl34:	move.b	(a0)+,d2
    6454:	/-> move.b (a0)+,d2
		add.l d2,d1
    6456:	|   add.l d2,d1
		not.b	d2
    6458:	|   not.b d2
		beq.s	.cl34
    645a:	\-- beq.s 6454 <.cl34>
		moveq	#15,d5
    645c:	    moveq #15,d5
		and.w	d1,d5
    645e:	    and.w d1,d5
		add.w	d5,d5
    6460:	    add.w d5,d5
		neg.w	d5
    6462:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    6464:	    jmp (6488 <.eloop35>,pc,d5.w)

00006468 <.tloop35>:
.tloop35:
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
		move.b	(a2)+,(a1)+
    6476:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6478:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    647a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    647c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    647e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6480:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6482:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6484:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6486:	move.b (a2)+,(a1)+

00006488 <.eloop35>:
.eloop35:	sub.l	d7,d1
    6488:	sub.l d7,d1
		bpl.s	.tloop35
    648a:	bpl.s 6468 <.tloop35>
		moveq	#0,d0
    648c:	moveq #0,d0
		move.b	(a0)+,d0
    648e:	move.b (a0)+,d0
		add.w	d0,d0
    6490:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6492:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6496:	jmp (0,a3,d0.w)

0000649a <lz4Rts32>:
lz4Rts32:				
			rts
    649a:	rts

0000649c <lz4Over>:

lz4Over:	rts
    649c:	rts

0000649e <lz4jmp>:
    649e:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    64a0:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    64a2:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    64a4:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    64a6:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    64a8:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    64aa:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    64ac:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    64ae:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    64b0:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    64b2:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    64b4:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    64b6:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    64b8:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    64ba:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    64bc:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    64be:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    64c0:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    64c2:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    64c4:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    64c6:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    64c8:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    64ca:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    64cc:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    64ce:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    64d0:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    64d2:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    64d4:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    64d6:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    64d8:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    64da:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    64dc:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    64de:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    64e0:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    64e2:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    64e4:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    64e6:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    64e8:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    64ea:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    64ec:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    64ee:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    64f0:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    64f2:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    64f4:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    64f6:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    64f8:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    64fa:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    64fc:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    64fe:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    6500:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    6502:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    6504:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    6506:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    6508:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    650a:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    650c:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    650e:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    6510:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    6512:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    6514:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    6516:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    6518:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    651a:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    651c:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    651e:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    6520:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    6522:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    6524:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    6526:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    6528:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    652a:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    652c:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    652e:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    6530:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    6532:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    6534:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    6536:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    6538:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    653a:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    653c:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    653e:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    6540:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    6542:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    6544:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    6546:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    6548:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    654a:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    654c:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    654e:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    6550:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    6552:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    6554:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    6556:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    6558:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    655a:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    655c:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    655e:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    6560:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    6562:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    6564:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    6566:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    6568:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    656a:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    656c:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    656e:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    6570:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    6572:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    6574:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    6576:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    6578:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    657a:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    657c:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    657e:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    6580:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    6582:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    6584:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    6586:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    6588:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    658a:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    658c:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    658e:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    6590:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    6592:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    6594:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    6596:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    6598:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    659a:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    659c:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    659e:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    65a0:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    65a2:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    65a4:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    65a6:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    65a8:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    65aa:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    65ac:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    65ae:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    65b0:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    65b2:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    65b4:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    65b6:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    65b8:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    65ba:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    65bc:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    65be:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    65c0:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    65c2:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    65c4:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    65c6:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    65c8:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    65ca:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    65cc:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    65ce:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    65d0:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    65d2:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    65d4:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    65d6:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    65d8:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    65da:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    65dc:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    65de:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    65e0:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    65e2:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    65e4:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    65e6:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    65e8:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    65ea:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    65ec:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    65ee:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    65f0:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    65f2:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    65f4:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    65f6:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    65f8:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    65fa:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    65fc:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    65fe:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6600:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6602:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6604:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6606:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6608:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    660a:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    660c:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    660e:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6610:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6612:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6614:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6616:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6618:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    661a:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    661c:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    661e:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6620:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6622:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6624:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6626:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6628:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    662a:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    662c:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    662e:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6630:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6632:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6634:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6636:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6638:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    663a:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    663c:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    663e:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6640:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6642:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6644:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6646:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6648:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    664a:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    664c:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    664e:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    6650:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    6652:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    6654:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    6656:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    6658:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    665a:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    665c:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    665e:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    6660:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    6662:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    6664:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    6666:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    6668:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    666a:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    666c:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    666e:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    6670:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    6672:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    6674:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    6676:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    6678:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    667a:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    667c:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    667e:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    6680:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    6682:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    6684:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    6686:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    6688:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    668a:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    668c:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    668e:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    6690:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    6692:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    6694:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    6696:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    6698:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    669a:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    669c:	.short 0xff6a
