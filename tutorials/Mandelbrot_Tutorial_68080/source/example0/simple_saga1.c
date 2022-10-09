
/* example0/simple_saga1.c
 *
 * Like example0/simple_saga0.c but:
 *
 * - waits for mouse click at the end: WaitMouse()
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
UBYTE* Set8BitMode(UWORD mode, UWORD width, UWORD height) {
	/* save actual mode */
	oldmode=*SAGAMODER;
	oldbuffer=(ULONG)*SAGAPTRR;
	/* prepare new buffer */
	memsize=width*height+16;
	if ((rawbuffer=(ULONG)AllocMem(memsize, MEMF_ANY|MEMF_CLEAR))==NULL) return NULL;
	newbuffer=(rawbuffer+16) & 0xfffffff0;
	/* set new mode */
	*SAGAMODEW=newmode=mode;
	*SAGAPTRW=(ULONG)newbuffer;
	/* store resolution in global variables */
	resx=width;
	resy=height;
	return (BYTE*)newbuffer;
}

void RestoreMode(void) {
	/* restore old mode, pixel format and screen buffer */
	*SAGAMODEW=oldmode;
	*SAGAPTRW=(ULONG)oldbuffer;
	/* free screen buffer */
	if (rawbuffer) FreeMem((void*)rawbuffer, memsize);
}

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
	UWORD old_value=(*CIAAPRA);
	while (old_value==(*CIAAPRA));
}

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
	WaitMouse();
	
	/* restore the original graphics mode */
    RestoreMode();
}
