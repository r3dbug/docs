/*
 * example4/parmandel0.c
 * example4/parmandel1.c
 * example4/parmandel2.c
 *
 * Like example2/brute_force3.c but with parallelized calculation and a slightly modified
 * (= even more optimized) iteration subroutine
 *
 * The three files are basically the same, they just set the corresponding #ifdef value:
 * #define NOOPT		= single point iteration
 * #define PAR2OPT		= two points calculated in same loop
 * #define PAR4OPT		= four points calculated in same loop
 *
 * The files have just been separated for convenience (so that different executables can 
 * be compiled).
 *
 * Nice speed increase ... :)
 *
 * Execution times: 
 * - 20.88 seconds (NOOPT)
 * - 15.27 seconds (PAR2OPT)
 * - 13.21 seconds (PAR4OPT)
 *
 */

#define PAR4OPT
//#define PAR2OPT
//#define NOOPT

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
double x1, y1, x2, y2, x3, y3, x4, y4;  /* y2, y3, y4 not really used */

/* parallelized calculation */
UWORD IterP1;
UWORD IterP2;
UWORD IterP3;
UWORD IterP4;

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
UWORD __asm IterateAsmClassic(register __fp0 double x, 
	register __fp1 double y,
	register __d0 UWORD maxit);
UWORD __asm IterateAsmVampire0(register __fp0 double x, 
	register __fp1 double y,
	register __d0 UWORD maxit);
UWORD __asm IterateAsmVampire1(register __fp0 double x, 
	register __fp1 double y,
	register __d0 UWORD maxit);
/* parmandel*/
UWORD __asm SingleIterateAsm(register __fp0 double x,
                    register __fp1 double y,
                    register __d0 UWORD MaxIter);
                    
void __asm Par2IterateAsm(register __fp0 double x1,
                    register __fp1 double y1,
                    register __fp2 double x2,
                    register __fp3 double y2,
                    register __d1 UWORD MaxIter);

void __asm Par4IterateAsm(register __fp0 double x1,
                    register __fp1 double y1,
                    register __fp2 double x2,
                    register __fp3 double y2,
                    register __fp4 double x3,
                    register __fp5 double y3,
                    register __fp6 double x4,
                    register __fp7 double y4,
                    register __d1 unsigned long MaxIter
                   );
				   	
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
	/* Mandelbrot brute force algorithm parallelized */

/* classic = unoptimized => runs in: 20.88 secs */
#ifdef NOOPT
    for (y=0;y<resy;y++) {    
        for (x=0;x<resx;x++) {
        	y1=y*stepi+mini;
            x1=x*stepr+minr;
            color=SingleIterateAsm(x1,y1,MaxIter);
            Put8BitPixel(x,y,color);    
        }
    }
#endif
#ifdef PAR2OPT
/* optimized: calculated points in parallel => runs in: 15.27 secs */
    for (y=0;y<resy;y++) {    
        for (x=0;x<resx;x+=2) {        // step 2
        	y1=y*stepi+mini;
            x1=x*stepr+minr;
            Par2IterateAsm(x1,y1,x1+stepr,y1,MaxIter);
            Put8BitPixel(x,y,IterP1);    
            Put8BitPixel(x+1,y,IterP2);
        }
    }
#endif
#ifdef PAR4OPT
/* optimized: calculated points in parallel => runs in: 13.21 */
    for (y=0;y<resy;y++) {    
        for (x=0;x<resx;x+=4) {        // step 4
            y1=(double)y*stepi+mini; 
            x1=x*stepr+minr;
            x2=x1+stepr;
            x3=x2+stepr;
            x4=x3+stepr;
            Par4IterateAsm(x1,y1,x2,y1,x3,y1,x4,y1,MaxIter);
            Put8BitPixel(x,y,IterP1);    
            Put8BitPixel(x+1,y,IterP2);
            Put8BitPixel(x+2,y,IterP3);    
            Put8BitPixel(x+3,y,IterP4);
        }
    }

#endif

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
