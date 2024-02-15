#include <proto/dos.h>

extern volatile struct Custom *custom;
extern UWORD SwScrollerFinished;

void End_Cleanup();
int End_PrepareDisplay() __attribute__((optimize("-O3")));
void End_Run() __attribute__((optimize("-O3")));
void End_SetpCl() __attribute__((optimize("-O3")));
void End_DrawScreen() __attribute__((optimize("-O3")));
UWORD *End_ClBuild() __attribute__((optimize("-O3")));