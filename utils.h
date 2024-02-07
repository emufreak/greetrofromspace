void Utils_BlitClear( UBYTE *Target, int lines, int linelength, UWORD mod, UWORD data);
void Utils_BlitterPrepare();
void Utils_CopyBlit(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer) __attribute__((optimize("-O3")));
void Utils_CopyPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, UWORD minterms, UWORD color) __attribute__((optimize("-O3")));
void Utils_CopyBlitReverse( UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *preparebuffer, UBYTE *targetbuffer, UWORD bltfmask) __attribute__((optimize("-O3")));
void Utils_DrawPoint(UWORD x1, UWORD y1, UBYTE *buffer);
void Utils_DrawLine(int x1, int y1, int x2, int y2, UBYTE *Buffer, UWORD minterms);
void Utils_DrawLinePrepare();
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod );
void Utils_FillPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, WORD startfill);
void Utils_ReadFile( char *filename, UWORD *target);
void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text);
void Utils_WriteLetter( UWORD *font, ULONG targetbuffer, int x, char letter);
//void Utils_Lz4DepackAsm( UBYTE *, UBYTE *, UWORD);

