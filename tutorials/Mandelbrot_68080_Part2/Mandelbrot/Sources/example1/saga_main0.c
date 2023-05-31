
/* example1/saga_main0.c
 * 
 * Like example0/simple_saga1.c but with the following additions:
 *
 * - uses assembly to open / close SAGA screen
 * - functions: Set8BitMode() / RestoreMode()
 *
 */
 
#include <stdlib.h>						/* needed for rand() function */
#include <exec/types.h>					/* needed for UWORD, ULONG, UBYTE etc. */
#include <proto/exec.h>					/* needed for AllocMem() */
#include <exec/exec.h>
#include <exec/memory.h>
#include "asm_call.h"					/* macros to include asm functions */

/* define custom registers (SAGA: read = 0xdff... / write = 0xdfe...) */
UWORD* SAGAMODEW=(UWORD*)0xdff1f4;		/* SAGA mode and pixel format - write */
UWORD* SAGAMODER=(UWORD*)0xdfe1f4;		/*  "     "   "    "      "   - read  */
ULONG* SAGAPTRW=(ULONG*)0xdff1ec;		/* SAGA screen buffer - write */
ULONG* SAGAPTRR=(ULONG*)0xdfe1ec;		/*  "     "      "    - read  */
ULONG* SAGACOLORW=(ULONG*)0xdff388;		/* chunky port color register */
UWORD* CIAAPRA=(UWORD*)0xbfe001;		/* Complex Interface Adapter => for mouse click */

/* define SAGA variables */
UWORD oldmode;
ULONG oldbuffer;	
UWORD newmode;
ULONG rawbuffer;
ULONG newbuffer;
ULONG memsize;

/* define our variables */
UWORD x, y, resx, resy;

/* SAGA functions */
/* prototypes */
/* syntax for macros:
- ASM at the beginning of the function (replaces SASC __asm directive)
- REG(x,y) replaces SASC directive
*/
ASM UBYTE* Set8BitMode( REG(d0, UWORD mode), 
	REG(d1, UWORD resx), 
	REG(d2, UWORD resy));
ASM void RestoreMode(void);

void Put8BitPixel(UWORD x, UWORD y, UBYTE color) {
	*((UBYTE*)newbuffer+y*resx+x)=color;
}

void SetColor(ULONG color, ULONG red, ULONG green, ULONG blue) {
	ULONG value;
	value = (color<<24)|(red<<16)|(green<<8)|(blue);
	*(SAGACOLORW)=value;
}

/* wait for mouse click */
void WaitMouse(void) {
	/* Code rewritten - BUG in the 1st tutorial: read only a UBYTE (not WORD)  */
	/* Use volatile keyword to be sure the compiler makes no optimizations */
	volatile UBYTE old_value=(*(volatile UBYTE*)CIAAPRA) & 64;
	while (old_value==((*((volatile UBYTE*)CIAAPRA) & 64)));
}

/* main program */
int main(void) {

	/* color variable must be declared local because of gcc */
	UWORD color; 

	/* set 1280x726 mode with 256 color (= 8 bit, CLUT) */
	if (!(newbuffer=(ULONG)Set8BitMode(0x0a01,1280,720))) return 1;
	
	/* define some random colors */
	SetColor(0,0,0,0);
	for (color=1; color<=255; color++) {
		SetColor(color, rand()%256, rand()%256, rand()%256);
	}
		
	for (y=0; y<resy; y++) {
		for (x=0; x<resx; x++) {
			Put8BitPixel(x,y,y%256);
		}
	}
    /* wait for mouse click */
	WaitMouse();
	
	/* restore the original graphics mode */
    RestoreMode();
}
