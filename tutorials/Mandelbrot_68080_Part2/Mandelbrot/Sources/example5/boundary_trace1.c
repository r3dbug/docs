
/*
 * Same as example5/boundary_trace0.c but:
 * - use just 1 buffer (Data = newbuffer)
 * - optimized fill routine (write longwords, words instead of bytes)
 *
 * Original algorithm by Joel Yliluoma:
 * 
 * - https://www.youtube.com/watch?v=rVQMaiz0ydk
 * - https://bisqwit.iki.fi/jutut/kuvat/ptoramming_examples/mandelbrottrace.pdf
 *
 * Unmodified algorithm adapted for Vampire.
 *
 * Execution times:
 * - boundary_trace0: 3.34 seconds
 * - boundary_trace1: 3.14 seconds
 * - boundary_trace2: 3.04 seconds
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
#include "asm_call.h"					/* macros to include asm functions */

/* define SAGA variables */
UWORD oldmode;
ULONG oldbuffer;	
UWORD newmode;
ULONG rawbuffer;
ULONG newbuffer;
ULONG memsize;

/* define our variables */
UWORD x, y, i, MaxIter, resx, resy;
double xn, yn, xn1, yn1, cx, cy, d, stepr, stepi, maxr, minr, maxi, mini;

/* boundary trace variables */
UBYTE *Data;
UBYTE *Done;
ULONG *Queue;
ULONG DataSize;
ULONG DoneSize;
ULONG QueueSize;
ULONG QueueHead=0, QueueTail=0;
ULONG p;
UWORD flag;

/* parallelized */
UWORD IterP1, IterP2, IterP3, IterP4;

enum { Loaded=1, Queued=2 };

/* fill optimization */
UWORD WordLoaded;
ULONG LongLoaded;
ULONG colorl;
UWORD colorw;
UBYTE colorb;
ULONG nbytes,nwords,nlong,rbytes,rwords;
ULONG p1;

/* assembly functions (prototypes) */
/* syntax for macros:
- ASM at the beginning of the function (replaces SASC  directive)
- REG(x,y) replaces SASC directive
*/
ASM UBYTE* Set8BitMode( REG(d0, UWORD mode), 
	REG(d1, UWORD resx), 
	REG(d2, UWORD resy));
ASM void RestoreMode(void);
ASM void SetColor(REG(d0, ULONG color),
	REG(d1, ULONG red),
	REG(d2, ULONG green),
	REG(d3, ULONG blue));
ASM void Put8BitPixel(REG(d0, ULONG x),
	REG (d1, ULONG y),
	REG (d2, ULONG color));
ASM void WaitMouse(void);
ASM void WaitMouseUp(void);
ASM void SetStart(void);
ASM void SetStop(void);
ASM ULONG GetStart(void);
ASM ULONG GetStop(void);
ASM void MultiTaskOff(void);
ASM void MultiTaskOn(void);
ASM void MouseOff(void);
ASM void MouseOn(void);
ASM UWORD IterateAsmClassic(REG(fp0, double x), 
	REG(fp1, double y),
	REG(d0, UWORD maxit));
ASM UWORD IterateAsmVampire0(REG(fp0, double x), 
	REG(fp1, double y),
	REG(d0, UWORD maxit));
ASM UWORD IterateAsmVampire1(REG(fp0, double x), 
	REG(fp1, double y),
	REG(d0, UWORD maxit));
/* parmandel*/
ASM UWORD SingleIterateAsm(REG(fp0, double x),
                    REG(fp1, double y),
                    REG(d0, UWORD MaxIter));
                    
ASM void Par2IterateAsm(REG(fp0, double x1),
                    REG(fp1, double y1),
                    REG(fp2, double x2),
                    REG(fp3, double y2),
                    REG(d1, UWORD MaxIter));

ASM void Par4IterateAsm(REG(fp0, double x1),
                    REG(fp1, double y1),
                    REG(fp2, double x2),
                    REG(fp3, double y2),
                    REG(fp4, double x3),
                    REG(fp5, double y3),
                    REG(fp6, double x4),
                    REG(fp7, double y4),
                    REG(d1, unsigned long MaxIter)
                   );
				   
double GetTime(void) {
    ULONG start, stop, difference;
	ULONG frequency=(*((UBYTE*)(0xDFF3FC+1)))*7.09379*1000000; 		 /* read clock multiplyer */
    start=GetStart();
    stop=GetStop();
    difference=(stop>start) ? (stop-start) : (0xffffffff-(start-stop));
	return (double)difference/frequency;
}

/* boundary trace */
/* separate Mandelbrot iteration */
UWORD Iterate(double x, double y, UWORD maxit) {
	double xn1, yn1, xn, yn, cx, cy;
	UWORD i;
	
	xn1=xn=0;
	yn1=yn=0;
	cy = y;
	cx = x;	
	i=maxit;
	while ((i) && (xn1+yn1<=4)) {
		yn=2*xn*yn+cy;
		xn=xn1-yn1+cx;
		xn1=xn*xn;
		yn1=yn*yn;
		i--;
	}
	return i;
}

/* memory allocation for boundary trace */
void AddQueue(unsigned p) {
    if(Done[p] & Queued) return;
    Done[p] |= Queued;
    Queue[QueueHead++] = p;
    if(QueueHead == QueueSize) QueueHead = 0;
}

/* added allocation check for these functions */
int AllocateBoundary(void) {
    /* DataSize=sizeof(UBYTE)*resx*resy; */
    DoneSize=sizeof(UBYTE)*resx*resy;
    QueueSize=sizeof(ULONG)*((resx*resy)*4); 
	/* set Data to newbuffer => use only 1 buffer!
    /* Data=AllocMem(DataSize, MEMF_PUBLIC | MEMF_CLEAR); */
    Data=(UBYTE*)newbuffer;
	Done=AllocMem(DoneSize, MEMF_PUBLIC | MEMF_CLEAR);
    Queue=AllocMem(QueueSize, MEMF_PUBLIC | MEMF_CLEAR);
    if ((Data==NULL) || (Done==NULL) || (Queue==NULL)) return 0;
    else return 1;
}

void DeallocateBoundary(void) {
    if (Queue) FreeMem(Queue,QueueSize);
    if (Done) FreeMem(Done,DoneSize);
    /* if (Data) FreeMem(Data,DataSize); */
}

/* boundary trace functions */
int Load(unsigned p) {
    UWORD x,y;
    UWORD result;
    if(Done[p] & Loaded) return Data[p];
    x = p % resx;
    y = p / resx;
    
	/* Iterate() function in C (slower) - uncomment it to compare */
    /* result=Iterate(minr+x*stepr,mini+y*stepi,MaxIter); */
    
	/* optimized asm routine (= fast) - comment it out if you want to compare with Iterate() */
	result=SingleIterateAsm(minr+x*stepr,mini+y*stepi,MaxIter);
    
    Put8BitPixel(x,y, result);
    
    Done[p] |= Loaded;
    return Data[p] = result;
}

void Scan(unsigned p) {
    unsigned x = p % resx, y = p / resx;
    int center = Load(p);
    int ll = x >= 1, rr = x < resx-1;
    int uu = y >= 1, dd = y < resy-1;
    int l, r, u, d; 
	/* booleans */
   	l=ll && Load(p-1) != center;
    r=rr && Load(p+1) != center;
    u=uu && Load(p-resx) != center;
    d=dd && Load(p+resx) != center;
    /* process the queue (which is actually a ring buffer) */
    if (l) AddQueue(p-1);
    if (r) AddQueue(p+1);
    if (u) AddQueue(p-resx);
    if (d) AddQueue(p+resx);
    /* the corner pixels (nw,ne,sw,se) are also neighbors */
    if((uu&&ll)&&(l||u)) AddQueue(p-resx-1);
    if((uu&&rr)&&(r||u)) AddQueue(p-resx+1);
    if((dd&&ll)&&(l||d)) AddQueue(p+resx-1);
    if((dd&&rr)&&(r||d)) AddQueue(p+resx+1);
}

/* main program */
int main(void) {
	double time;
    /* new int variables for exectime conversion (to avoid ixemul / libnix problems on gcc */
    ULONG intpart, floatpart;

	/* color variable must be declared local because of gcc */
	UWORD color; 
	
	/* set our 1280x720 SAGA mode with 256 colors */    
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

	/* added allocation check */
	if (!AllocateBoundary()) return 1;
	SetStart();		
    /* (1) begin by adding the screen edges into the queue */
    for(y=0; y<resy; ++y) {
        AddQueue(y*resx /*+ 0*/);
        AddQueue(y*resx + (resx-1));
    }
    for(x=1; x<resx-1; ++x) {
        AddQueue(/*0*Width* +*/ x);
        AddQueue((resy-1)*resx + x);
    }
	
	/* (2) process the queue (which is actually a ring buffer) */
    flag=0;
    while(QueueTail != QueueHead) {
        if(QueueHead <= QueueTail || ++flag & 3) {
            p = Queue[QueueTail++];
            if(QueueTail == QueueSize) QueueTail=0;
        } else p = Queue[--QueueHead];
        Scan(p);
    }
	
    /* (3) lastly, fill uncalculated areas with neighbor color */
    WordLoaded = Loaded + (Loaded<<8);
    LongLoaded = WordLoaded + (WordLoaded<<16);
  
	for(p=0; p<resx*resy-1; ++p) {
        if(Done[p] & Loaded) {
            p1=p+1;
            while (!(*((ULONG*)(Done+p1)) & LongLoaded)) p1+=4;
            while (!(*((UWORD*)(Done+p1)) & WordLoaded)) p1+=2;
            while (!(Done[p1] & Loaded)) p1++;
            nbytes=(p1-p)-1;
            if (nbytes>0) {
                nwords=nbytes>>1;
                rbytes=nbytes-(nwords<<1);
                nlong=nwords>>1;
                rwords=nwords-(nlong<<1);
                colorb=Data[p];
                colorw=colorb+(colorb<<8);
                colorl=colorw+(colorw<<16);
                p+=1;
                for (x=0;x<nlong;x++) {
                    *((ULONG*)(Data+p))=colorl;
                    *((ULONG*)(Done+p))|=LongLoaded;
                    p+=4;
                }
                for (x=0;x<rwords;x++) {
					*((UWORD*)(Data+p))=colorw;
                    *((UWORD*)(Done+p))|=WordLoaded;
                    p+=2;
                }
                for (x=0;x<rbytes;x++) {
                    *((UBYTE*)Data+p)=colorb;
                    Done[p] |= Loaded;
                    p++;
                }
            }
        }   
    }
	SetStop();
	DeallocateBoundary();
		
    /* wait for mouse click */
	WaitMouse();
	
	/* restore the original graphics mode */
    MouseOn();
	MultiTaskOn();
    RestoreMode();
	
	/* show time */
	time=GetTime();
    /* print exectime as integer (for gcc) */
    intpart=(ULONG)time;
    floatpart=(ULONG)((time-(double)intpart)*10000);
	printf("Execution time (%dx core): %u.%04u seconds\n", (*((UBYTE*)(0xDFF3FC+1))), intpart, floatpart);
	
}
