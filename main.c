#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <graphics/gfxmacros.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>
#include <hardware/intbits.h>
#include "3dframework.h"

//config
#define MUSIC

struct ExecBase *SysBase;
volatile struct Custom *custom;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;

//backup
static UWORD SystemInts;
static UWORD SystemDMA;
static UWORD SystemADKCON;
static volatile APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
	APTR vbr = 0;
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE

	if (SysBase->AttnFlags & AFF_68010) 
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);

	return vbr;
}

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
}

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
}

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {

	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos!=(311<<8))
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos==(311<<8))
			break;
	}
}

void WaitLine(USHORT line) {
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		if(((vpos >> 8) & 511) == line)
			break;
	}
}

__attribute__((always_inline)) inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}

void TakeSystem() {
	Forbid();
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
	SystemInts=custom->intenar;
	SystemDMA=custom->dmaconr;
	ActiView=GfxBase->ActiView; //store current view

	LoadView(0);
	WaitTOF();
	WaitTOF();

	WaitVbl();
	WaitVbl();

	OwnBlitter();
	WaitBlit();	
	//Disable();
	
	custom->intena=0x7fff;//disable all interrupts
	custom->intreq=0x7fff;//Clear any interrupts that were pending
	
	custom->dmacon=0x3fff;//Clear all DMA channels

	//set all colors black
	for(int a=0;a<32;a++)
		custom->color[a]=0;



	WaitVbl();
	WaitVbl();

	VBR=GetVBR();
	SystemIrq=GetInterruptHandler(); //store interrupt register
}

void FreeSystem() { 
	WaitVbl();
	WaitBlit();
	custom->intena=0x7fff;//disable all interrupts
	custom->intreq=0x7fff;//Clear any interrupts that were pending
	custom->dmacon=0x7fff;//Clear all DMA channels

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
	custom->copjmp1=0x7fff; //start coppper

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
	custom->dmacon=SystemDMA|0x8000;
	custom->adkcon=SystemADKCON|0x8000;

	WaitBlit();	
	DisownBlitter();
	Enable();

	LoadView(ActiView);
	WaitTOF();
	WaitTOF();

	Permit();
}

__attribute__((always_inline)) inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
__attribute__((always_inline)) inline short MouseRight(){return !((*(volatile UWORD*)0xdff016)&(1<<10));}

// DEMO - INCBIN
//volatile short frameCounter = 0;
//INCBIN(colors, "image.pal")
//INCBIN_CHIP(image, "image.bpl") // load image into chipmem so we can use it without copying
//INCBIN_CHIP(bob, "bob.bpl")

// put copperlist into chip mem so we can use it without copying
const UWORD copper2[] __attribute__((section (".MEMF_CHIP"))) = {
	                offsetof(struct Custom, color[0]), 0x0000,
	0x4101, 0xff00, offsetof(struct Custom, color[0]), 0x0111, // line 0x41
	0x4201, 0xff00, offsetof(struct Custom, color[0]), 0x0222, // line 0x42
	0x4301, 0xff00, offsetof(struct Custom, color[0]), 0x0333, // line 0x43
	0x4401, 0xff00, offsetof(struct Custom, color[0]), 0x0444, // line 0x44
	0x4501, 0xff00, offsetof(struct Custom, color[0]), 0x0555, // line 0x45
	0x4601, 0xff00, offsetof(struct Custom, color[0]), 0x0666, // line 0x46
	0x4701, 0xff00, offsetof(struct Custom, color[0]), 0x0777, // line 0x47
	0x4801, 0xff00, offsetof(struct Custom, color[0]), 0x0888, // line 0x48
	0x4901, 0xff00, offsetof(struct Custom, color[0]), 0x0999, // line 0x49
	0x4a01, 0xff00, offsetof(struct Custom, color[0]), 0x0aaa, // line 0x4a
	0x4b01, 0xff00, offsetof(struct Custom, color[0]), 0x0bbb, // line 0x4b
	0x4c01, 0xff00, offsetof(struct Custom, color[0]), 0x0ccc, // line 0x4c
	0x4d01, 0xff00, offsetof(struct Custom, color[0]), 0x0ddd, // line 0x4d
	0x4e01, 0xff00, offsetof(struct Custom, color[0]), 0x0eee, // line 0x4e
	0x4f01, 0xff00, offsetof(struct Custom, color[0]), 0x0fff, // line 0x4e
	0xffff, 0xfffe // end copper list
};

void* doynaxdepack(const void* input, void* output) { // returns end of output data, input needs to be 16-bit aligned!
	register volatile const void* _a0 ASM("a0") = input;
	register volatile       void* _a1 ASM("a1") = output;
	__asm volatile (
		"movem.l %%d0-%%d7/%%a2-%%a6,-(%%sp)\n"
		"jsr _doynaxdepack_asm\n"
		"movem.l (%%sp)+,%%d0-%%d7/%%a2-%%a6"
	: "+rf"(_a0), "+rf"(_a1)
	:
	: "cc", "memory");
	return (void*)_a1;
}

#ifdef MUSIC
	// Demo - Module Player - ThePlayer 6.1a: https://www.pouet.net/prod.php?which=19922
	// The Player® 6.1A: Copyright © 1992-95 Jarno Paananen
	// P61.testmod - Module by Skylord/Sector 7 
	INCBIN(player, "player610.6.no_cia.bin")
	INCBIN_CHIP(module, "testmod.p61")

	int p61Init(const void* module) { // returns 0 if success, non-zero otherwise
		register volatile const void* _a0 ASM("a0") = module;
		register volatile const void* _a1 ASM("a1") = NULL;
		register volatile const void* _a2 ASM("a2") = NULL;
		register volatile const void* _a3 ASM("a3") = player;
		register                int   _d0 ASM("d0"); // return value
		__asm volatile (
			"movem.l %%d1-%%d7/%%a4-%%a6,-(%%sp)\n"
			"jsr 0(%%a3)\n"
			"movem.l (%%sp)+,%%d1-%%d7/%%a4-%%a6"
		: "=r" (_d0), "+rf"(_a0), "+rf"(_a1), "+rf"(_a2), "+rf"(_a3)
		:
		: "cc", "memory");
		return _d0;
	}

	void p61Music() {
		register volatile const void* _a3 ASM("a3") = player;
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
		__asm volatile (
			"movem.l %%d0-%%d7/%%a0-%%a2/%%a4-%%a5,-(%%sp)\n"
			"jsr 4(%%a3)\n"
			"movem.l (%%sp)+,%%d0-%%d7/%%a0-%%a2/%%a4-%%a5"
		: "+rf"(_a3), "+rf"(_a6)
		:
		: "cc", "memory");
	}

	void p61End() {
		register volatile const void* _a3 ASM("a3") = player;
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
		__asm volatile (
			"movem.l %%d0-%%d1/%%a0-%%a1,-(%%sp)\n"
			"jsr 8(%%a3)\n"
			"movem.l (%%sp)+,%%d0-%%d1/%%a0-%%a1"
		: "+rf"(_a3), "+rf"(_a6)
		:
		: "cc", "memory");
	}
#endif //MUSIC

__attribute__((always_inline)) inline USHORT* copSetPlanes(UBYTE bplPtrStart,USHORT* copListEnd,const UBYTE **planes,int numPlanes) {
	for (USHORT i=0;i<numPlanes;i++) {
		ULONG addr=(ULONG)planes[i];
		*copListEnd++=offsetof(struct Custom, bplpt[0]) + (i + bplPtrStart) * sizeof(APTR);
		*copListEnd++=(UWORD)(addr>>16);
		*copListEnd++=offsetof(struct Custom, bplpt[0]) + (i + bplPtrStart) * sizeof(APTR) + 2;
		*copListEnd++=(UWORD)addr;
	}
	return copListEnd;
}

__attribute__((always_inline)) inline USHORT* copWaitXY(USHORT *copListEnd,USHORT x,USHORT i) {
	*copListEnd++=(i<<8)|(x<<1)|1;	//bit 1 means wait. waits for vertical position x<<8, first raster stop position outside the left 
	*copListEnd++=0xfffe;
	return copListEnd;
}

__attribute__((always_inline)) inline USHORT* copWaitY(USHORT* copListEnd,USHORT i) {
	*copListEnd++=(i<<8)|4|1;	//bit 1 means wait. waits for vertical position x<<8, first raster stop position outside the left 
	*copListEnd++=0xfffe;
	return copListEnd;
}

__attribute__((always_inline)) inline USHORT* copSetColor(USHORT* copListCurrent,USHORT index,USHORT color) {
	*copListCurrent++=offsetof(struct Custom, color[index]);
	*copListCurrent++=color;
	return copListCurrent;
}

UWORD* scroll = NULL;

static const UBYTE sinus15[] = { 
	8,8,9,10,10,11,12,12,
	13,13,14,14,14,15,15,15,
	15,15,15,15,14,14,14,13,
	13,12,12,11,10,10,9,8,
	8,7,6,5,5,4,3,3,
	2,2,1,1,1,0,0,0,
	0,0,0,0,1,1,1,2,
	2,3,3,4,5,5,6,7, 
};

static const UBYTE sinus40[] = {
	20,22,24,26,28,30,31,33,
	34,36,37,38,39,39,40,40,
	40,40,39,39,38,37,36,35,
	34,32,30,29,27,25,23,21,
	19,17,15,13,11,10,8,6,
	5,4,3,2,1,1,0,0,
	0,0,1,1,2,3,4,6,
	7,9,10,12,14,16,18,20,
};

static const UBYTE sinus32[] = {
	16,18,20,22,24,25,27,28,
	30,30,31,32,32,32,32,31,
	30,30,28,27,25,24,22,20,
	18,16,14,12,10,8,7,5,
	4,2,2,1,0,0,0,0,
	1,2,2,4,5,7,8,10,
	12,14,16,
};

static __attribute__((interrupt)) void interruptHandler() {
}

#ifdef __cplusplus
	class TestClass {
	public:
		TestClass(int y) {
			static int x = 7;
			i = y + x;
		}
		~TestClass() {
			KPrintF("~TestClass()");
		}

		int i;
	};

	TestClass staticClass(4);
#endif

// set up a 320x256 lowres display
__attribute__((always_inline)) inline USHORT* screenScanDefault(USHORT* copListEnd) {
	const USHORT x=129;
	const USHORT width=320;
	const USHORT height=256;
	const USHORT y=44;
	const USHORT RES=8; //8=lowres,4=hires
	USHORT xstop = x+width;
	USHORT ystop = y+height;
	USHORT fw=(x>>1)-RES;

	*copListEnd++ = offsetof(struct Custom, ddfstrt);
	*copListEnd++ = fw;
	*copListEnd++ = offsetof(struct Custom, ddfstop);
	*copListEnd++ = fw+(((width>>4)-1)<<3);
	*copListEnd++ = offsetof(struct Custom, diwstrt);
	*copListEnd++ = x+(y<<8);
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

static void Wait10() { WaitLine(0x10); }
static void Wait11() { WaitLine(0x11); }
static void Wait12() { WaitLine(0x12); }
static void Wait13() { WaitLine(0x13); }

int main() {
	SysBase = *((struct ExecBase**)4UL);
	custom = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
	if (!GfxBase)
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
	if (!DOSBase)
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
	Delay(50);

	warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
		KPrintF("p61Init failed!\n");
#endif
	warpmode(0);

	TakeSystem();
	WaitVbl();

		
	custom->dmacon = 0x87ff;
	PrepareDisplay();	
	custom->intena=0xc010;//Enable vblank

	//WarmUp
	SetBplPointers();
	//LoadVectors();
	SwapCl();
	WaitVbl();

	

	while(1 == 1) {		
		DrawScreen();
		SetBplPointers();
		debug_start_idle();
		while(FrameCounter<2);
		if(FrameCounter >= 3) {
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
		WaitVbl();
		debug_stop_idle();
		SwapCl();
	}

#ifdef MUSIC  
	p61End();
#endif

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);
}
