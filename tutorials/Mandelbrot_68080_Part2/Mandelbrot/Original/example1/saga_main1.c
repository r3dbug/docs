
/* example1/saga_main1.c
 *
 * Like example1/saga_main0.c but with the following additions:
 * - all graphics routines implemented in assembly: SetColor(), Put8BitPixel()
 * - two mouse routines in assembly: WaitMouse(), WaitMouseUp()
 *
 */
 
#include <stdlib.h>						/* needed for rand() function */
#include <exec/types.h>					/* needed for UWORD, ULONG, UBYTE etc. */
#include <proto/exec.h>					/* needed for AllocMem() */
#include <exec/exec.h>
#include <exec/memory.h>

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
UWORD color;

/* SAGA functions */
/* prototypes */
UBYTE* __asm Set8BitMode(register __d0 UWORD mode, 
	register __d1 UWORD resx, 
	register __d2 UWORD resy);
void __asm RestoreMode(void);
void __asm SetColor(register __d0 ULONG color,
	register __d1 ULONG red,
	register __d2 ULONG green,
	register __d3 ULONG blue);
void __asm Put8BitPixel(register __d0 ULONG x,
	register __d1 ULONG y,
	register __d2 ULONG color);
void __asm WaitMouse(void);
void __asm WaitMouseUp(void);

/* main program */
int main(void) {

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
	/* in this example WaitMouse() or WaitMouseUp() can be used */
	WaitMouseUp();
	
	/* restore the original graphics mode */
    RestoreMode();
}
