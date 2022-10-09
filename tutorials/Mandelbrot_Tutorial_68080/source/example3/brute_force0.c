/*
 * example3/brute_force0.c
 *
 * Like example2/saga_time.c but drawing loops have been replaced with classic brute force
 * Mandelbrot algorithm.
 *
 * Pretty slow ... :)
 *
 * Execution time: 41.74 seconds
 *
 */

#include <stdio.h>
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
double exectime;

/* Mandelbrot */
/* define our variables */
UWORD i, MaxIter;
double xn, yn, xn1, yn1, cx, cy, d, stepr, stepi, maxr, minr, maxi, mini;

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
void __asm SetStart(void);
void __asm SetStop(void);
ULONG __asm GetStart(void);
ULONG __asm GetStop(void);
void __asm MultiTaskOff(void);
void __asm MultiTaskOn(void);
void __asm MouseOff(void);
void __asm MouseOn(void);

double GetTime(void) {
    ULONG start, stop, difference;
	ULONG frequency=12*7.09379*1000000; 		 /* 12x core */
    start=GetStart();
    stop=GetStop();
    difference=(stop>start) ? (stop-start) : (0xffffffff-(start-stop));
	return (double)difference/frequency;
}

/* main program */
int main(void) {

	/* set 1280x726 mode with 256 color (= 8 bit, CLUT) */
	if (!(newbuffer=(ULONG)Set8BitMode(0x0a01,1280,720))) return 1;
	MultiTaskOff();
	MouseOff();
	
	/* set our variables */
    MaxIter = 256;

    minr=-2.25; maxr=1.25;
    mini=-1.25; maxi=1.25;
       
    stepr = (double)(maxr-minr) / resx;
    stepi = (double)(maxi-mini) / resy;

	/* define some random colors */
	SetColor(0,0,0,0);
	for (color=1; color<=255; color++) {
		SetColor(color, rand()%256, rand()%256, rand()%256);
	}
		
	SetStart();
	/* Mandelbrot brute force algorithm */
	for (y=0; y<resy; y++) {
		for (x=0; x<resx; x++) {
			/* "optimized escape time" for inner loop */
			xn1=xn=0;
			yn1=yn=0;
			cy = y*stepi+mini;
			cx = x*stepr+minr;	
			i=MaxIter;
			while ((i) && (xn1+yn1<=4)) {
				yn=2*xn*yn+cy;
				xn=xn1-yn1+cx;
				xn1=xn*xn;
				yn1=yn*yn;
				i--;
			}
			Put8BitPixel(x,y,i%256);
		}
	}
	SetStop();
	
	/* wait for mouse click */
	/* in this example WaitMouse() or WaitMouseUp() can be used */
	WaitMouseUp();
	
	MouseOn();
	MultiTaskOn();
	
	/* restore the original graphics mode */
    RestoreMode();
	
	/* get and print execution time */
	exectime=GetTime();
	printf("Execution time: %lf seconds\n", exectime);
}
