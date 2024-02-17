struct Vertice2d {
    WORD X;
    WORD Y;
};

struct Square {
  struct Vertice2d Vertices[4];
  int DotProduct;
  WORD Clockwise;
  WORD XPosMin;
  WORD YPosMin;
  WORD XLength;
  WORD Height;
  UWORD Color;
};

struct DirtyArea {
  ULONG Address;
  ULONG AddressRev;
  UWORD BltSize;
  UWORD BltMod;
};

struct ScreenBuffer {
  UBYTE *BitPlane;
  struct DirtyArea MyDirtyArea[4];
  WORD maxytotal;
  WORD minytotal;
};

struct Cube {
  struct Square Squares[6];
};


static UWORD MintermMatrix[] = {
  0xee,
  0xbb,
  0xee,
  0xbb
};

static WORD ModSignMatrix[] = {
  1,
  -1,
  -1,
  1
};

extern volatile UWORD FrameCounter; 


UBYTE *Clbuild() __attribute__((optimize("-O3")));
void ClearDirtyArea( ULONG target, WORD bltsize) __attribute__((optimize("-O3")));
void ClearDirtyAreaPrepare( WORD bltmod) __attribute__((optimize("-O3")));
void SetCl( UWORD minlastdrawline)  __attribute__((optimize("-O3")));
void DrawCube3d( WORD *vectors, UWORD mirroring, UWORD cubecount) __attribute__((optimize("-O3")));
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcubes, UWORD reversed) __attribute__((optimize("-O3")));
void DrawRect(struct Square *square) __attribute__((optimize("-O3")));
void DrawScreen()  __attribute__((optimize("-O3")));
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) __attribute__((optimize("-O3")));
UWORD DrawDicesSpecial( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) __attribute__((optimize("-O3")));
void DrawSceneMercury1();
void DrawSceneMercury2();
void LoadVectors( WORD *source, BYTE *source2, WORD *target) __attribute__((optimize("-O3")));
int PrepareDisplay();
void PrepareLineBuffer( UBYTE *buffer);
void SetBplPointers();
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size)  __attribute__((optimize("-O0")));
void SwapCl();
void CleanUp();
extern UWORD CubeFinished;

 