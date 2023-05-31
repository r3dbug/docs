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
	subqw #8,sp
	moveml #0x3e20,sp@-
	jbsr ___main
	movel #720,d2
	movel #1280,d1
	movel #2561,d0
	jbsr _Set8BitMode
	movel d0,_newbuffer
	jne L9
	moveq #1,d0
	jra L35
	.even
L9:
	movel _SAGACOLORW,a0
	clrl a0@
	moveq #1,d4
	clrl d5
	lea _rand,a2
	.even
L14:
	movew d4,d5
	jbsr a2@
	movel d0,d1
	jge L15
	addl #255,d1
L15:
	moveq #-1,d2
	notb d2
	andl d2,d1
	movel d0,d3
	subl d1,d3
	jbsr a2@
	movel d0,d1
	jge L16
	addl #255,d1
L16:
	moveq #-1,d6
	notb d6
	andl d6,d1
	movel d0,d2
	subl d1,d2
	jbsr a2@
	movel d0,d1
	jge L17
	addl #255,d0
L17:
	moveq #-1,d6
	notb d6
	andl d6,d0
	subl d0,d1
	movel d5,d0
	moveq #24,d6
	lsll d6,d0
	swap d3
	clrw d3
	orl d3,d0
	lsll #8,d2
	orl d2,d0
	movel _SAGACOLORW,a0
	orl d1,d0
	movel d0,a0@
	addqw #1,d4
	cmpw #255,d4
	jls L14
	clrw _y
	tstw _resy
	jeq L21
	clrw d3
	.even
L23:
	clrw _x
	movew _resx,d1
	cmpw d3,d1
	jls L22
	clrl d2
	.even
L27:
	movew _y,d0
	mulu d0,d1
	movew _x,d2
	movel _newbuffer,a0
	addl d1,a0
	moveb d0,a0@(d2:l)
	movew _x,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_x
	addqw #1,d0
	movew _resx,d1
	cmpw d0,d1
	jhi L27
L22:
	movew _y,d0
	movew d0,d2
	addqw #1,d2
	movew d2,_y
	addqw #1,d0
	cmpw _resy,d0
	jcs L23
L21:
	movel _CIAAPRA,a0
	moveb a0@,d0
	andb #64,d0
	moveb d0,sp@(27)
	.even
L32:
	moveb a0@,d0
	andb #64,d0
	moveb sp@(27),d1
	cmpb d1,d0
	jeq L32
	jbsr _RestoreMode
	clrl d0
L35:
	moveml sp@+,#0x47c
	addqw #8,sp
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
	.even
.globl _Put8BitPixel
_Put8BitPixel:
	movew sp@(10),d0
	mulu _resx,d0
	clrl d1
	movew sp@(6),d1
	movel _newbuffer,a0
	addl d0,a0
	moveb sp@(15),a0@(d1:l)
	rts
	nop
	.even
.globl _SetColor
_SetColor:
	movel d3,sp@-
	movel d2,sp@-
	movel sp@(12),d0
	movel sp@(16),d1
	movel sp@(20),d2
	moveq #24,d3
	lsll d3,d0
	swap d1
	clrw d1
	orl d1,d0
	lsll #8,d2
	orl d2,d0
	movel _SAGACOLORW,a0
	orl sp@(24),d0
	movel d0,a0@
	movel sp@+,d2
	movel sp@+,d3
	rts
	.even
.globl _WaitMouse
_WaitMouse:
	subqw #8,sp
	movel _CIAAPRA,a0
	moveb a0@,d0
	andb #64,d0
	moveb d0,sp@(3)
	.even
L7:
	moveb a0@,d0
	andb #64,d0
	moveb sp@(3),d1
	cmpb d1,d0
	jeq L7
	addqw #8,sp
	rts
