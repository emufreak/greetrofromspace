#include <proto/dos.h>

extern volatile struct Custom *custom;
int Sw_PrepareDisplay() __attribute__((optimize("-O3")));
void Sw_Run() __attribute__((optimize("-O3")));
void Sw_SetBplPointers() __attribute__((optimize("-O3")));
void Sw_SwapCl() __attribute__((optimize("-O3")));
void Sw_WritePlainText() __attribute__((optimize("-O3")));
void Sw_DrawScreen3() __attribute__((optimize("-O3")));
void Sw_SetColors() __attribute__((optimize("-O3")));
UWORD *Sw_ClBuild() __attribute__((optimize("-O3")));