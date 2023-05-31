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
	moveml #0x3f30,sp@-
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
	movel a2,a3
	lea _rand,a2
	clrl d5
	.even
L18:
	jbsr a2@
	movel d0,d3
	jge L19
	addl #255,d3
L19:
	moveq #-1,d1
	notb d1
	andl d1,d3
	subl d3,d0
	movel d0,d3
	jbsr a2@
	movel d0,d2
	jge L20
	addl #255,d2
L20:
	moveq #-1,d6
	notb d6
	andl d6,d2
	subl d2,d0
	movel d0,d2
	jbsr a2@
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
	jbsr a3@
	addqw #1,d4
	cmpw #255,d4
	jls L18
	jbsr _SetStart
	clrw _y
	tstw _resy
	jeq L24
	subl a3,a3
	lea 0:w,a2
	clrl d7
	.even
L26:
	clrw _x
	movew _resx,d0
	cmpw a3,d0
	jls L25
	clrl d6
	clrl d5
	clrl d4
	clrl d3
	.even
L30:
	movew _y,d6
	fdmoved _stepi,fp1
	fdmull d6,fp1
	fdaddd _mini,fp1
	fmoved fp1,_y1
	movew _x,d3
	fdmoved _stepr,fp0
	fdmull d3,fp0
	fdaddd _minr,fp0
	fmoved fp0,_x1
	movel a2,d1
	movew _MaxIter,d1
	movel d1,a2
	movel a2,d0
	jbsr _SingleIterateAsm
	movew d0,d7
	movew _y,d5
	movew _x,d4
	movel d7,d2
	movel d5,d1
	movel d4,d0
	jbsr _Put8BitPixel
	movew _x,d0
	movew d0,d2
	addqw #1,d2
	movew d2,_x
	addqw #1,d0
	cmpw _resx,d0
	jcs L30
L25:
	movew _y,d0
	movew d0,d3
	addqw #1,d3
	movew d3,_y
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
	fmoveml fpcr,d6
	moveq #16,d0
	orl d6,d0
	andw #-33,d0
	fmoveml d0,fpcr
	fmovel fp0,d3
	fmoveml d6,fpcr
	jra L34
	.even
L33:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d1
	moveq #16,d2
	orl d1,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp0,d3
	fmoveml d1,fpcr
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
	fmoveml fpcr,d3
	moveq #16,d6
	orl d3,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp1,d1
	fmoveml d3,fpcr
	jra L41
	.even
L40:
	fdmovex fp1,fp0
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d0
	moveq #16,d2
	orl d0,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp0,d1
	fmoveml d0,fpcr
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
	fmoveml fpcr,d3
	moveq #16,d6
	orl d3,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp0,d0
	fmoveml d3,fpcr
	jra L44
	.even
L43:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d2
	moveq #16,d3
	orl d2,d3
	andw #-33,d3
	fmoveml d3,fpcr
	fmovel fp0,d0
	fmoveml d2,fpcr
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
	moveml sp@+,#0xcfc
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
