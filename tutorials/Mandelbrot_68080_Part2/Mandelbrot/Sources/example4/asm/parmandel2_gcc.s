#NO_APP
gcc2_compiled.:
___gnu_compiled_c:
.globl _SAGAMODEW
.data
	.even
_SAGAMODEW:
	.long 14676468
.globl _SAGAMODER
	.even
_SAGAMODER:
	.long 14672372
.globl _SAGAPTRW
	.even
_SAGAPTRW:
	.long 14676460
.globl _SAGAPTRR
	.even
_SAGAPTRR:
	.long 14672364
.globl _SAGACOLORW
	.even
_SAGACOLORW:
	.long 14676872
.globl _CIAAPRA
	.even
_CIAAPRA:
	.long 12574721
.text
LC0:
	.ascii "Execution time (%dx core): %u.%04u seconds\12\0"
	.even
.globl _main
_main:
	addw #-16,sp
	fmovem #0xfc,sp@-
	moveml #0x3f3e,sp@-
	jbsr ___main
	movel #720,d2
	movel #1280,d1
	movel #2561,d0
	jbsr _Set8BitMode
	movel d0,_newbuffer
	jne L14
	moveq #1,d0
	jra L13
	.even
L14:
	jbsr _MultiTaskOff
	jbsr _MouseOff
	movew #256,_MaxIter
	movel #-1073610752,_minr
	clrl _minr+4
	movel #1072955392,_maxr
	clrl _maxr+4
	movel #-1074528256,_mini
	clrl _mini+4
	movel #1072955392,_maxi
	clrl _maxi+4
	clrl d0
	movew _resx,d0
	fmoved #0r3.5,fp0
	fddivl d0,fp0
	fmoved fp0,_stepr
	clrl d0
	movew _resy,d0
	fmoved #0r2.5,fp0
	fddivl d0,fp0
	fmoved fp0,_stepi
	lea _SetColor,a2
	clrl d3
	clrl d2
	clrl d1
	clrl d0
	jbsr a2@
	moveq #1,d4
	lea _rand,a3
	clrl d5
	.even
L18:
	jbsr a3@
	movel d0,d3
	jge L19
	addl #255,d3
L19:
	moveq #-1,d1
	notb d1
	andl d1,d3
	subl d3,d0
	movel d0,d3
	jbsr a3@
	movel d0,d2
	jge L20
	addl #255,d2
L20:
	moveq #-1,d6
	notb d6
	andl d6,d2
	subl d2,d0
	movel d0,d2
	jbsr a3@
	movel d0,d1
	jge L21
	addl #255,d1
L21:
	moveq #-1,d6
	notb d6
	andl d6,d1
	movew d4,d5
	subl d1,d0
	movel d0,d1
	movel d5,d0
	jbsr a2@
	addqw #1,d4
	cmpw #255,d4
	jls L18
	jbsr _SetStart
	clrw _y
	tstw _resy
	jeq L24
	clrl sp@(124)
	clrl sp@(120)
	clrl sp@(116)
	lea 0:w,a6
	lea 0:w,a5
	.even
L26:
	clrw _x
	tstw _resx
	jeq L25
	lea 0:w,a4
	lea 0:w,a3
	clrl d7
	lea _Put8BitPixel,a2
	clrl d6
	clrl d5
	clrl d4
	clrl d3
	.even
L30:
	movel a4,d0
	movew _y,d0
	movel d0,a4
	fdmoved _stepi,fp7
	fdmull d0,fp7
	fdaddd _mini,fp7
	fmoved fp7,_y1
	movew _x,d6
	fdmoved _stepr,fp1
	fdmovex fp1,fp0
	fdmull d6,fp0
	fdaddd _minr,fp0
	fmoved fp0,_x1
	fdmovex fp0,fp2
	fdaddx fp1,fp2
	fmoved fp2,_x2
	fdmovex fp2,fp4
	fdaddx fp1,fp4
	fmoved fp4,_x3
	fdmovex fp4,fp6
	fdaddx fp1,fp6
	fmoved fp6,_x4
	movew _MaxIter,sp@(126)
	movel sp@(124),d1
	fdmovex fp7,fp5
	fdmovex fp7,fp3
	fdmovex fp7,fp1
	jbsr _Par4IterateAsm
	movel a5,d1
	movew _IterP1,d1
	movel d1,a5
	movel a3,d2
	movew _y,d2
	movel d2,a3
	movew _x,d7
	movel a5,d2
	movel a3,d1
	movel d7,d0
	jbsr a2@
	movew _y,sp@(122)
	movew _x,d5
	clrl d2
	movew _IterP2,d2
	movel sp@(120),d1
	movel d5,d0
	addql #1,d0
	jbsr a2@
	movew _y,sp@(118)
	movew _x,d4
	clrl d2
	movew _IterP3,d2
	movel sp@(116),d1
	movel d4,d0
	addql #2,d0
	jbsr a2@
	movel a6,d0
	movew _y,d0
	movel d0,a6
	movew _x,d3
	clrl d2
	movew _IterP4,d2
	movel a6,d1
	movel d3,d0
	addql #3,d0
	jbsr a2@
	movew _x,d0
	addqw #4,d0
	movew d0,_x
	cmpw _resx,d0
	jcs L30
L25:
	movew _y,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_y
	addqw #1,d0
	cmpw _resy,d0
	jcs L26
L24:
	jbsr _SetStop
	jbsr _WaitMouseUp
	jbsr _MouseOn
	jbsr _MultiTaskOn
	jbsr _RestoreMode
	clrl d0
	moveb 14676989,d0
	fmoved #0r7.093790000000000262,fp0
	fdmull d0,fp0
	fdmuld #0r1000000,fp0
	fcmpd #0r2147483648,fp0
	fjge L33
	fmoveml fpcr,d2
	moveq #16,d6
	orl d2,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp0,d3
	fmoveml d2,fpcr
	jra L34
	.even
L33:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d0
	moveq #16,d1
	orl d0,d1
	andw #-33,d1
	fmoveml d1,fpcr
	fmovel fp0,d3
	fmoveml d0,fpcr
	bchg #31,d3
L34:
	jbsr _GetStart
	movel d0,d2
	jbsr _GetStop
	cmpl d0,d2
	jcc L35
	subl d2,d0
	jra L36
	.even
L35:
	subl d0,d2
	movel d2,d0
	notl d0
L36:
	fdmovel d0,fp1
	tstl d0
	jge L37
	fdaddd #0r4294967296,fp1
L37:
	fdmovel d3,fp0
	tstl d3
	jge L38
	fdaddd #0r4294967296,fp0
L38:
	fddivx fp0,fp1
	fcmpd #0r2147483648,fp1
	fjge L40
	fmoveml fpcr,d2
	moveq #16,d3
	orl d2,d3
	andw #-33,d3
	fmoveml d3,fpcr
	fmovel fp1,d1
	fmoveml d2,fpcr
	jra L41
	.even
L40:
	fdmovex fp1,fp0
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d6
	moveq #16,d0
	orl d6,d0
	andw #-33,d0
	fmoveml d0,fpcr
	fmovel fp0,d1
	fmoveml d6,fpcr
	bchg #31,d1
L41:
	fdmovel d1,fp0
	tstl d1
	jge L42
	fdaddd #0r4294967296,fp0
L42:
	fdsubx fp0,fp1
	fdmovex fp1,fp0
	fdmuld #0r10000,fp0
	fcmpd #0r2147483648,fp0
	fjge L43
	fmoveml fpcr,d2
	moveq #16,d3
	orl d2,d3
	andw #-33,d3
	fmoveml d3,fpcr
	fmovel fp0,d0
	fmoveml d2,fpcr
	jra L44
	.even
L43:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d6
	moveq #16,d2
	orl d6,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp0,d0
	fmoveml d6,fpcr
	bchg #31,d0
L44:
	movel d0,sp@-
	movel d1,sp@-
	clrl d0
	moveb 14676989,d0
	movel d0,sp@-
	pea LC0
	jbsr _printf
	clrl d0
	addw #16,sp
L13:
	moveml sp@+,#0x7cfc
	fmovem sp@+,#0x3f
	addw #16,sp
	rts
.comm _oldmode,2
.comm _oldbuffer,4
.comm _newmode,2
.comm _rawbuffer,4
.comm _newbuffer,4
.comm _memsize,4
.comm _x,2
.comm _y,2
.comm _resx,2
.comm _resy,2
.comm _i,2
.comm _MaxIter,2
.comm _xn,8
.comm _yn,8
.comm _xn1,8
.comm _yn1,8
.comm _cx,8
.comm _cy,8
.comm _d,8
.comm _stepr,8
.comm _stepi,8
.comm _maxr,8
.comm _minr,8
.comm _maxi,8
.comm _mini,8
.comm _x1,8
.comm _y1,8
.comm _x2,8
.comm _y2,8
.comm _x3,8
.comm _y3,8
.comm _x4,8
.comm _y4,8
.comm _IterP1,2
.comm _IterP2,2
.comm _IterP3,2
.comm _IterP4,2
	.even
.globl _GetTime
_GetTime:
	movel d3,sp@-
	movel d2,sp@-
	clrl d0
	moveb 14676989,d0
	fmoved #0r7.093790000000000262,fp0
	fdmull d0,fp0
	fdmuld #0r1000000,fp0
	fcmpd #0r2147483648,fp0
	fjge L7
	fmoveml fpcr,d0
	moveq #16,d1
	orl d0,d1
	andw #-33,d1
	fmoveml d1,fpcr
	fmovel fp0,d3
	fmoveml d0,fpcr
	jra L8
	.even
L7:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d0
	moveq #16,d1
	orl d0,d1
	andw #-33,d1
	fmoveml d1,fpcr
	fmovel fp0,d3
	fmoveml d0,fpcr
	bchg #31,d3
L8:
	jbsr _GetStart
	movel d0,d2
	jbsr _GetStop
	cmpl d0,d2
	jcc L9
	subl d2,d0
	jra L10
	.even
L9:
	subl d0,d2
	movel d2,d0
	notl d0
L10:
	fdmovel d0,fp1
	tstl d0
	jge L11
	fdaddd #0r4294967296,fp1
L11:
	fdmovel d3,fp0
	tstl d3
	jge L12
	fdaddd #0r4294967296,fp0
L12:
	fddivx fp0,fp1
	fmoved fp1,sp@-
	movel sp@+,d0
	movel sp@+,d1
	movel sp@+,d2
	movel sp@+,d3
	rts
