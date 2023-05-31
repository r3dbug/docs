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
	.even
.globl _main
_main:
	moveml #0x3e30,sp@-
	jbsr ___main
	movel #720,d2
	movel #1280,d1
	movel #2561,d0
	jbsr _Set8BitMode
	movel d0,_newbuffer
	jne L3
	moveq #1,d0
	jra L22
	.even
L3:
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
L7:
	jbsr a2@
	movel d0,d3
	jge L8
	addl #255,d3
L8:
	moveq #-1,d1
	notb d1
	andl d1,d3
	subl d3,d0
	movel d0,d3
	jbsr a2@
	movel d0,d2
	jge L9
	addl #255,d2
L9:
	moveq #-1,d6
	notb d6
	andl d6,d2
	subl d2,d0
	movel d0,d2
	jbsr a2@
	movel d0,d1
	jge L10
	addl #255,d1
L10:
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
	jls L7
	clrw _y
	tstw _resy
	jeq L13
	clrw d6
	.even
L15:
	clrw _x
	cmpw _resx,d6
	jcc L14
	clrl d5
	clrl d4
	clrl d3
	.even
L19:
	movew _y,d0
	movew d0,d1
	andw #255,d1
	movew d1,d5
	movew d0,d4
	movew _x,d3
	movel d5,d2
	movel d4,d1
	movel d3,d0
	jbsr _Put8BitPixel
	movew _x,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_x
	addqw #1,d0
	cmpw _resx,d0
	jcs L19
L14:
	movew _y,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_y
	addqw #1,d0
	cmpw _resy,d0
	jcs L15
L13:
	jbsr _WaitMouseUp
	jbsr _RestoreMode
	clrl d0
L22:
	moveml sp@+,#0xc7c
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
