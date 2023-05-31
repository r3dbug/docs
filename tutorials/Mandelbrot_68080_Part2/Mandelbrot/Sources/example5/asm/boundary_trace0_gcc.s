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
.globl _QueueHead
	.even
_QueueHead:
	.long 0
.globl _QueueTail
	.even
_QueueTail:
	.long 0
.text
	.even
.globl _Scan
_Scan:
	addw #-20,sp
	moveml #0x3f3e,sp@-
	movel sp@(68),a3
	clrl d0
	movew _resx,d0
	movel a3,d7
	divull d0,d6:d7
	movel _Done,a0
	btst #0,a3@(a0:l)
	jeq L33
	movel _Data,a0
	clrl d0
	moveb a3@(a0:l),d0
	movel d0,a4
	jra L34
	.even
L33:
	clrl d5
	movew d7,d5
	fdmoved _stepi,fp1
	fdmull d5,fp1
	movel d6,d4
	fdmoved _stepr,fp0
	fdmull d4,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d3
	clrl d2
	movew d3,d2
	movel d5,d1
	movel d4,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a3@(a0:l)
	movel _Data,a0
	moveb d3,a3@(a0:l)
	andl #0xFF,d3
	movel d3,a4
L34:
	tstl d6
	sne d0
	extbl d0
	movel d0,a5
	negl d0
	movel d0,a5
	clrl d1
	movew _resx,d1
	movel d1,d0
	subql #1,d0
	cmpl d6,d0
	shi d0
	extbl d0
	movel d0,a6
	negl d0
	movel d0,a6
	tstl d7
	sne d0
	moveb d0,d6
	extbl d6
	negl d6
	clrl d0
	movew _resy,d0
	subql #1,d0
	cmpl d7,d0
	shi d0
	moveb d0,d7
	extbl d7
	negl d7
	clrl sp@(56)
	tstl a5
	jeq L35
	lea a3@(-1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L36
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L37
	.even
L36:
	movel a2,d3
	divull d1,d5:d3
	andl #0xFFFF,d3
	fdmoved _stepi,fp1
	fdmull d3,fp1
	fdmoved _stepr,fp0
	fdmull d5,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d4
	clrl d2
	movew d4,d2
	movel d3,d1
	movel d5,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a2@(a0:l)
	movel _Data,a0
	moveb d4,a2@(a0:l)
	clrl d3
	moveb d4,d3
L37:
	cmpl d3,a4
	jeq L35
	moveq #1,d0
	movel d0,sp@(56)
L35:
	clrl sp@(52)
	tstl a6
	jeq L38
	lea a3@(1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L39
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L40
	.even
L39:
	clrl d0
	movew _resx,d0
	movel a2,d3
	divull d0,d5:d3
	andl #0xFFFF,d3
	fdmoved _stepi,fp1
	fdmull d3,fp1
	fdmoved _stepr,fp0
	fdmull d5,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d4
	clrl d2
	movew d4,d2
	movel d3,d1
	movel d5,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a2@(a0:l)
	movel _Data,a0
	moveb d4,a2@(a0:l)
	clrl d3
	moveb d4,d3
L40:
	cmpl d3,a4
	jeq L38
	moveq #1,d0
	movel d0,sp@(52)
L38:
	clrl sp@(48)
	tstl d6
	jeq L41
	clrl d0
	movew _resx,d0
	movel a3,a2
	subl d0,a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L42
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L43
	.even
L42:
	movel a2,d3
	divull d0,d5:d3
	andl #0xFFFF,d3
	fdmoved _stepi,fp1
	fdmull d3,fp1
	fdmoved _stepr,fp0
	fdmull d5,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d4
	clrl d2
	movew d4,d2
	movel d3,d1
	movel d5,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a2@(a0:l)
	movel _Data,a0
	moveb d4,a2@(a0:l)
	clrl d3
	moveb d4,d3
L43:
	cmpl d3,a4
	jeq L41
	moveq #1,d0
	movel d0,sp@(48)
L41:
	clrl sp@(44)
	tstl d7
	jeq L44
	clrl d0
	movew _resx,d0
	lea a3@(0,d0:l),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L45
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L46
	.even
L45:
	movel a2,d3
	divull d0,d5:d3
	andl #0xFFFF,d3
	fdmoved _stepi,fp1
	fdmull d3,fp1
	fdmoved _stepr,fp0
	fdmull d5,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d4
	clrl d2
	movew d4,d2
	movel d3,d1
	movel d5,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a2@(a0:l)
	movel _Data,a0
	moveb d4,a2@(a0:l)
	clrl d3
	moveb d4,d3
L46:
	cmpl d3,a4
	jeq L44
	moveq #1,d0
	movel d0,sp@(44)
L44:
	tstl sp@(56)
	jeq L47
	lea a3@(-1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L47
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L47
	clrl _QueueHead
L47:
	tstl sp@(52)
	jeq L51
	lea a3@(1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L51
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L51
	clrl _QueueHead
L51:
	tstl sp@(48)
	jeq L55
	clrl d0
	movew _resx,d0
	movel a3,a1
	subl d0,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L55
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L55
	clrl _QueueHead
L55:
	tstl sp@(44)
	jeq L59
	clrl d0
	movew _resx,d0
	lea a3@(0,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L59
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L59
	clrl _QueueHead
L59:
	tstl d6
	jeq L68
	tstl a5
	jeq L63
	tstl sp@(56)
	jne L64
	tstl sp@(48)
	jeq L63
L64:
	clrl d1
	movew _resx,d1
	movel a3,d0
	subl d1,d0
	movel d0,a1
	subql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L63
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L63
	clrl _QueueHead
L63:
	tstl d6
	jeq L68
	tstl a6
	jeq L68
	tstl sp@(52)
	jne L69
	tstl sp@(48)
	jeq L68
L69:
	clrl d1
	movew _resx,d1
	movel a3,d0
	subl d1,d0
	movel d0,a1
	addql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L68
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L68
	clrl _QueueHead
L68:
	tstl d7
	jeq L78
	tstl a5
	jeq L73
	tstl sp@(56)
	jne L74
	tstl sp@(44)
	jeq L73
L74:
	clrl d0
	movew _resx,d0
	lea a3@(-1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L73
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L73
	clrl _QueueHead
L73:
	tstl d7
	jeq L78
	tstl a6
	jeq L78
	tstl sp@(52)
	jne L79
	tstl sp@(44)
	jeq L78
L79:
	clrl d0
	movew _resx,d0
	lea a3@(1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L78
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L78
	clrl _QueueHead
L78:
	moveml sp@+,#0x7cfc
	addw #20,sp
	rts
LC0:
	.ascii "Execution time (%dx core): %u.%04u seconds\12\0"
	.even
.globl _main
_main:
	moveml #0x3e22,sp@-
	jbsr ___main
	movel #720,d2
	movel #1280,d1
	movel #2561,d0
	jbsr _Set8BitMode
	movel d0,_newbuffer
	jeq L152
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
	lea _rand,a6
	clrl d5
	.even
L88:
	jbsr a6@
	movel d0,d3
	jge L89
	addl #255,d3
L89:
	moveq #-1,d1
	notb d1
	andl d1,d3
	subl d3,d0
	movel d0,d3
	jbsr a6@
	movel d0,d2
	jge L90
	addl #255,d2
L90:
	moveq #-1,d6
	notb d6
	andl d6,d2
	subl d2,d0
	movel d0,d2
	jbsr a6@
	movel d0,d1
	jge L91
	addl #255,d1
L91:
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
	jls L88
	movew _resx,d0
	mulu _resy,d0
	movel d0,_DataSize
	movel d0,_DoneSize
	movel d0,d1
	lsll #4,d1
	movel d1,_QueueSize
	movel _SysBase,a6
	movel #65537,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Data
	movel _SysBase,a6
	movel _DoneSize,d0
	movel #65537,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Done
	movel _SysBase,a6
	movel _QueueSize,d0
	movel #65537,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Queue
	tstl _Data
	jeq L152
	tstl _Done
	jeq L152
	tstl d0
	jne L93
L152:
	moveq #1,d0
	jra L83
	.even
L93:
	jbsr _SetStart
	clrw _y
	tstw _resy
	jeq L99
	clrl d2
	.even
L101:
	movew _y,d1
	mulu _resx,d1
	movel _Done,a0
	moveb a0@(d1:l),d0
	btst #1,d0
	jne L103
	orb #2,d0
	moveb d0,a0@(d1:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel d1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a0
	cmpl _QueueSize,a0
	jne L103
	clrl _QueueHead
L103:
	movew _resx,d0
	movew _y,d1
	mulu d0,d1
	movew d0,d2
	movel d1,a0
	lea a0@(-1,d2:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L100
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L100
	clrl _QueueHead
L100:
	movew _y,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_y
	addqw #1,d0
	cmpw _resy,d0
	jcs L101
L99:
	movew #1,_x
	clrl d0
	movew _resx,d0
	subql #1,d0
	moveq #1,d2
	cmpl d0,d2
	jge L110
	clrl d2
	clrl d4
	clrl d3
	.even
L112:
	movew _x,d2
	movel _Done,a0
	moveb a0@(d2:l),d0
	btst #1,d0
	jne L114
	orb #2,d0
	moveb d0,a0@(d2:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel d2,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d6
	cmpl _QueueSize,d6
	jne L114
	clrl _QueueHead
L114:
	movew _resy,d3
	movel d3,d0
	subql #1,d0
	clrl d1
	movew _resx,d1
	mulsl d1,d0
	clrl d1
	movew _x,d1
	movel d0,a1
	addl d1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L111
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a0
	cmpl _QueueSize,a0
	jne L111
	clrl _QueueHead
L111:
	addqw #1,_x
	clrl d1
	movew _x,d1
	movew _resx,d4
	movel d4,d0
	subql #1,d0
	cmpl d1,d0
	jgt L112
L110:
	clrw _flag
	jra L153
	.even
L122:
	movel _QueueHead,d1
	movel _QueueTail,d2
	cmpl d1,d2
	jcc L124
	movew _flag,d0
	movew d0,d3
	addqw #1,d3
	movew d3,_flag
	addqw #1,d0
	bftst d0{#30:#2}
	jeq L123
L124:
	movel _Queue,a0
	movel a0@(d2:l:4),_p
	addql #1,_QueueTail
	movel _QueueTail,d6
	cmpl _QueueSize,d6
	jne L126
	clrl _QueueTail
	jra L126
	.even
L123:
	movel d1,a0
	subql #1,a0
	movel a0,_QueueHead
	movel _Queue,a0
	movel a0@(-4,d1:l:4),_p
L126:
	movel _p,sp@-
	jbsr _Scan
	addql #4,sp
L153:
	movel _QueueTail,d0
	cmpl _QueueHead,d0
	jne L122
	clrl _p
	movew _resx,d0
	mulu _resy,d0
	moveq #1,d1
	cmpl d0,d1
	jeq L129
	.even
L131:
	movel _Done,a0
	movel _p,a1
	btst #0,a1@(a0:l)
	jeq L130
	btst #0,a0@(1,a1:l)
	jne L130
	movel _Data,a0
	moveb a1@(a0:l),a0@(1,a1:l)
	movel _newbuffer,a2
	movel _p,a1
	movel _Data,a0
	moveb a1@(a0:l),a1@(1,a2:l)
	movel _p,a1
	movel _Done,a0
	orb #1,a0@(1,a1:l)
L130:
	movel _p,d1
	movel d1,d2
	addql #1,d2
	movel d2,_p
	movew _resx,d0
	mulu _resy,d0
	subql #1,d0
	addql #1,d1
	cmpl d1,d0
	jhi L131
L129:
	jbsr _SetStop
	movel _Queue,d0
	jeq L135
	movel _SysBase,a6
	movel d0,a1
	movel _QueueSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L135:
	movel _Done,d0
	jeq L136
	movel _SysBase,a6
	movel d0,a1
	movel _DoneSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L136:
	movel _Data,d0
	jeq L138
	movel _SysBase,a6
	movel d0,a1
	movel _DataSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L138:
	jbsr _WaitMouse
	jbsr _MouseOn
	jbsr _MultiTaskOn
	jbsr _RestoreMode
	clrl d0
	moveb 14676989,d0
	fmoved #0r7.093790000000000262,fp0
	fdmull d0,fp0
	fdmuld #0r1000000,fp0
	fcmpd #0r2147483648,fp0
	fjge L139
	fmoveml fpcr,d6
	moveq #16,d0
	orl d6,d0
	andw #-33,d0
	fmoveml d0,fpcr
	fmovel fp0,d3
	fmoveml d6,fpcr
	jra L140
	.even
L139:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d1
	moveq #16,d2
	orl d1,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp0,d3
	fmoveml d1,fpcr
	bchg #31,d3
L140:
	jbsr _GetStart
	movel d0,d2
	jbsr _GetStop
	cmpl d0,d2
	jcc L141
	subl d2,d0
	jra L142
	.even
L141:
	subl d0,d2
	movel d2,d0
	notl d0
L142:
	fdmovel d0,fp1
	tstl d0
	jge L143
	fdaddd #0r4294967296,fp1
L143:
	fdmovel d3,fp0
	tstl d3
	jge L144
	fdaddd #0r4294967296,fp0
L144:
	fddivx fp0,fp1
	fcmpd #0r2147483648,fp1
	fjge L146
	fmoveml fpcr,d3
	moveq #16,d6
	orl d3,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp1,d1
	fmoveml d3,fpcr
	jra L147
	.even
L146:
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
L147:
	fdmovel d1,fp0
	tstl d1
	jge L148
	fdaddd #0r4294967296,fp0
L148:
	fdsubx fp0,fp1
	fdmovex fp1,fp0
	fdmuld #0r10000,fp0
	fcmpd #0r2147483648,fp0
	fjge L149
	fmoveml fpcr,d3
	moveq #16,d6
	orl d3,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp0,d0
	fmoveml d3,fpcr
	jra L150
	.even
L149:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d2
	moveq #16,d3
	orl d2,d3
	andw #-33,d3
	fmoveml d3,fpcr
	fmovel fp0,d0
	fmoveml d2,fpcr
	bchg #31,d0
L150:
	movel d0,sp@-
	movel d1,sp@-
	clrl d0
	moveb 14676989,d0
	movel d0,sp@-
	pea LC0
	jbsr _printf
	clrl d0
	addw #16,sp
L83:
	moveml sp@+,#0x447c
	rts
.comm _oldmode,2
.comm _oldbuffer,4
.comm _newmode,2
.comm _rawbuffer,4
.comm _newbuffer,4
.comm _memsize,4
.comm _x,2
.comm _y,2
.comm _i,2
.comm _MaxIter,2
.comm _resx,2
.comm _resy,2
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
.comm _Data,4
.comm _Done,4
.comm _Queue,4
.comm _DataSize,4
.comm _DoneSize,4
.comm _QueueSize,4
.comm _p,4
.comm _flag,2
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
	.even
.globl _Iterate
_Iterate:
	fmovem #0x7c,sp@-
	fdmoved sp@(64),fp6
	fdmoved sp@(72),fp5
	movel sp@(80),d0
	fmoved #0r0,fp2
	fdmovex fp2,fp1
	fdmovex fp2,fp4
	fdmovex fp2,fp3
	movew d0,d1
	jeq L15
	.even
L16:
	fdaddx fp1,fp1
	fdmulx fp1,fp4
	fdaddx fp5,fp4
	fdmovex fp2,fp1
	fdsubx fp3,fp1
	fdaddx fp6,fp1
	fdmovex fp1,fp2
	fdmulx fp2,fp2
	fdmovex fp4,fp3
	fdmulx fp3,fp3
	subqw #1,d1
	jeq L15
	fdmovex fp2,fp0
	fdaddx fp3,fp0
	fcmpd #0r4,fp0
	fjle L16
L15:
	clrl d0
	movew d1,d0
	fmovem sp@+,#0x3e
	rts
	.even
.globl _AddQueue
_AddQueue:
	movel sp@(4),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L19
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L19
	clrl _QueueHead
L19:
	rts
	nop
	.even
.globl _AllocateBoundary
_AllocateBoundary:
	movel a6,sp@-
	movel d2,sp@-
	movew _resx,d0
	mulu _resy,d0
	movel d0,_DataSize
	movel d0,_DoneSize
	movel d0,d1
	lsll #4,d1
	movel d1,_QueueSize
	movel #65537,d2
	movel _SysBase,a6
	movel d2,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Data
	movel _SysBase,a6
	movel _DoneSize,d0
	movel d2,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Done
	movel _SysBase,a6
	movel _QueueSize,d0
	movel d2,d1
#APP
	jsr a6@(-0xc6:W)
#NO_APP
	movel d0,_Queue
	tstl _Data
	jeq L24
	tstl _Done
	jeq L24
	tstl d0
	jne L23
L24:
	clrl d0
	jra L154
	.even
L23:
	moveq #1,d0
L154:
	movel sp@+,d2
	movel sp@+,a6
	rts
	.even
.globl _DeallocateBoundary
_DeallocateBoundary:
	movel a6,sp@-
	movel _Queue,d0
	jeq L27
	movel _SysBase,a6
	movel d0,a1
	movel _QueueSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L27:
	movel _Done,d0
	jeq L28
	movel _SysBase,a6
	movel d0,a1
	movel _DoneSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L28:
	movel _Data,d0
	jeq L29
	movel _SysBase,a6
	movel d0,a1
	movel _DataSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L29:
	movel sp@+,a6
	rts
	.even
.globl _Load
_Load:
	moveml #0x3c20,sp@-
	movel sp@(24),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jne L31
	clrl d0
	movew _resx,d0
	movel a2,d3
	divull d0,d5:d3
	andl #0xFFFF,d3
	fdmoved _stepi,fp1
	fdmull d3,fp1
	fdmoved _stepr,fp0
	fdmull d5,fp0
	clrl d0
	movew _MaxIter,d0
	fdaddd _mini,fp1
	fdaddd _minr,fp0
	jbsr _SingleIterateAsm
	movew d0,d4
	clrl d2
	movew d4,d2
	movel d3,d1
	movel d5,d0
	jbsr _Put8BitPixel
	movel _Done,a0
	orb #1,a2@(a0:l)
	movel _Data,a0
	moveb d4,a2@(a0:l)
	clrl d0
	moveb d4,d0
	jra L155
	.even
L31:
	movel _Data,a0
	clrl d0
	moveb a2@(a0:l),d0
L155:
	moveml sp@+,#0x43c
	rts
