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
.text
	.even
.globl _main
_main:
	subqw #8,sp
	moveml #0x3e02,sp@-
	jbsr ___main
	movel _SAGAMODER,a0
	movew a0@,_oldmode
	movel _SAGAPTRR,a0
	movel a0@,_oldbuffer
	movel #921616,_memsize
	movel _SysBase,a6
	movel #921616,d0
	moveq #1,d1
	swap d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,d1
	movel d0,_rawbuffer
	jeq L15
	moveq #16,d0
	addl d1,d0
	moveq #-16,d1
	andl d0,d1
	movel d1,_newbuffer
	movel _SAGAMODEW,a0
	movew #2561,_newmode
	movew #2561,a0@
	movel _SAGAPTRW,a0
	movel _newbuffer,a0@
	movew #1280,_resx
	movew #720,_resy
	movel _newbuffer,d0
L15:
	movel d0,_newbuffer
	jne L13
	moveq #1,d0
	jra L43
	.even
L13:
	movel _SAGACOLORW,a0
	clrl a0@
	moveq #1,d4
	moveq #0,d5
	lea _rand,a6
	.even
L20:
	movew d4,d5
	jbsr a6@
	movel d0,d1
	jge L21
	addl #255,d1
L21:
	moveq #-1,d2
	notb d2
	andl d2,d1
	movel d0,d3
	subl d1,d3
	jbsr a6@
	movel d0,d1
	jge L22
	addl #255,d1
L22:
	moveq #-1,d6
	notb d6
	andl d6,d1
	movel d0,d2
	subl d1,d2
	jbsr a6@
	movel d0,d1
	jge L23
	addl #255,d0
L23:
	moveq #-1,d6
	notb d6
	andl d6,d0
	subl d0,d1
	movel d5,d0
	lslw #8,d0
	swap d0
	clrw d0
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
	jls L20
	clrw _y
	tstw _resy
	jeq L27
	clrw d3
	.even
L29:
	clrw _x
	movew _resx,d1
	cmpw d3,d1
	jls L28
	moveq #0,d2
	.even
L33:
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
	jhi L33
L28:
	movew _y,d0
	movew d0,d2
	addqw #1,d2
	movew d2,_y
	addqw #1,d0
	cmpw _resy:l,d0
	jcs L29
L27:
	movel #12574721,a0
	moveb a0@,d0
	andb #64,d0
	moveb d0,sp@(27)
	.even
L38:
	moveb a0@,d0
	andb #64,d0
	moveb sp@(27),d1
	cmpb d1,d0
	jeq L38
	movel _SAGAMODEW,a0
	movew _oldmode,a0@
	movel _SAGAPTRW,a0
	movel _oldbuffer,a0@
	movel _rawbuffer,d0
	jeq L42
	movel _SysBase,a6
	movel d0,a1
	movel _memsize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L42:
	moveq #0,d0
L43:
	moveml sp@+,#0x407c
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
.globl _Set8BitMode
_Set8BitMode:
	moveml #0x3802,sp@-
	movel sp@(20),d2
	movel sp@(24),d3
	movel sp@(28),d4
	movel _SAGAMODER,a0
	movew a0@,_oldmode
	movel _SAGAPTRR,a0
	movel a0@,_oldbuffer
	movew d3,d0
	mulu d4,d0
	moveq #16,d1
	addl d1,d0
	movel d0,_memsize
	movel _SysBase,a6
	moveq #1,d1
	swap d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_rawbuffer
	jeq L3
	moveq #16,d1
	addl d1,d0
	moveq #-16,d1
	andl d0,d1
	movel d1,_newbuffer
	movel _SAGAMODEW,a0
	movew d2,_newmode
	movew d2,a0@
	movel _SAGAPTRW,a0
	movel _newbuffer,a0@
	movew d3,_resx
	movew d4,_resy
	movel _newbuffer,d0
	jra L44
	.even
L3:
	moveq #0,d0
L44:
	moveml sp@+,#0x401c
	rts
	.even
.globl _RestoreMode
_RestoreMode:
	movel a6,sp@-
	movel _SAGAMODEW,a0
	movew _oldmode,a0@
	movel _SAGAPTRW,a0
	movel _oldbuffer,a0@
	movel _rawbuffer,d0
	jeq L5
	movel _SysBase,a6
	movel d0,a1
	movel _memsize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L5:
	movel sp@+,a6
	rts
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
	movel d2,sp@-
	movel sp@(8),d0
	movel sp@(12),d1
	movel sp@(16),d2
	lslw #8,d0
	swap d0
	clrw d0
	swap d1
	clrw d1
	orl d1,d0
	lsll #8,d2
	orl d2,d0
	movel _SAGACOLORW,a0
	orl sp@(20),d0
	movel d0,a0@
	movel sp@+,d2
	rts
	.even
.globl _WaitMouse
_WaitMouse:
	subqw #8,sp
	movel #12574721,a0
	moveb a0@,d0
	andb #64,d0
	moveb d0,sp@(3)
	.even
L11:
	moveb a0@,d0
	andb #64,d0
	moveb sp@(3),d1
	cmpb d1,d0
	jeq L11
	addqw #8,sp
	rts
