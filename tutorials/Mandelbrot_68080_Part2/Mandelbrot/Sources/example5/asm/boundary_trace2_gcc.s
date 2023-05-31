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
LC0:
	.ascii "Execution time (%dx core): %u.%04u seconds\12\0"
	.even
.globl _main
_main:
	addw #-32,sp
	moveml #0x3f3e,sp@-
	jbsr ___main
	movel #720,d2
	movel #1280,d1
	movel #2561,d0
	jbsr _Set8BitMode
	movel d0,_newbuffer
	jeq L228
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
L87:
	jbsr a6@
	movel d0,d3
	jge L88
	addl #255,d3
L88:
	moveq #-1,d1
	notb d1
	andl d1,d3
	subl d3,d0
	movel d0,d3
	jbsr a6@
	movel d0,d2
	jge L89
	addl #255,d2
L89:
	moveq #-1,d6
	notb d6
	andl d6,d2
	subl d2,d0
	movel d0,d2
	jbsr a6@
	movel d0,d1
	jge L90
	addl #255,d1
L90:
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
	jls L87
	movew _resx,d0
	mulu _resy,d0
	movel d0,_DoneSize
	movel d0,d1
	lsll #4,d1
	movel d1,_QueueSize
	movel _newbuffer,_Data
	movel _SysBase,a6
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
	jeq L228
	tstl _Done
	jeq L228
	tstl d0
	jne L92
L228:
	moveq #1,d0
	jra L82
	.even
L92:
	jbsr _SetStart
	clrw _y
	tstw _resy
	jeq L98
	clrl d2
	.even
L100:
	movew _y,d1
	mulu _resx,d1
	movel _Done,a0
	moveb a0@(d1:l),d0
	btst #1,d0
	jne L102
	orb #2,d0
	moveb d0,a0@(d1:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel d1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a0
	cmpl _QueueSize,a0
	jne L102
	clrl _QueueHead
L102:
	movew _resx,d0
	movew _y,d1
	mulu d0,d1
	movew d0,d2
	movel d1,a2
	lea a2@(-1,d2:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L99
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L99
	clrl _QueueHead
L99:
	movew _y,d0
	movew d0,d1
	addqw #1,d1
	movew d1,_y
	addqw #1,d0
	cmpw _resy,d0
	jcs L100
L98:
	movew #1,_x
	clrl d0
	movew _resx,d0
	subql #1,d0
	moveq #1,d2
	cmpl d0,d2
	jge L109
	clrl d2
	clrl d4
	clrl d3
	.even
L111:
	movew _x,d2
	movel _Done,a0
	moveb a0@(d2:l),d0
	btst #1,d0
	jne L113
	orb #2,d0
	moveb d0,a0@(d2:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel d2,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d6
	cmpl _QueueSize,d6
	jne L113
	clrl _QueueHead
L113:
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
	jne L110
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a0
	cmpl _QueueSize,a0
	jne L110
	clrl _QueueHead
L110:
	addqw #1,_x
	clrl d1
	movew _x,d1
	movew _resx,d4
	movel d4,d0
	subql #1,d0
	cmpl d1,d0
	jgt L111
L109:
	clrw _flag
	movel _QueueTail,a2
	cmpl _QueueHead,a2
	jeq L120
	clrl sp@(68)
	clrl sp@(64)
	clrl sp@(60)
	.even
L121:
	movel _QueueHead,d1
	movel _QueueTail,d2
	cmpl d1,d2
	jcc L123
	movew _flag,d0
	movew d0,d3
	addqw #1,d3
	movew d3,_flag
	addqw #1,d0
	bftst d0{#30:#2}
	jeq L122
L123:
	movel _Queue,a0
	movel a0@(d2:l:4),_p
	addql #1,_QueueTail
	movel _QueueTail,d6
	cmpl _QueueSize,d6
	jne L125
	clrl _QueueTail
	jra L125
	.even
L122:
	movel d1,a0
	subql #1,a0
	movel a0,_QueueHead
	movel _Queue,a0
	movel a0@(-4,d1:l:4),_p
L125:
	movel _p,a6
	movew _resx,sp@(70)
	movel a6,d7
	divull sp@(68),d6:d7
	movel _Done,a0
	btst #0,a6@(a0:l)
	jeq L126
	movel _Data,a0
	moveb a6@(a0:l),sp@(67)
	movel sp@(64),a3
	jra L127
	.even
L126:
	clrl d5
	movew d7,d5
	fdmoved _stepi,fp1
	fdmull d5,fp1
	clrl d4
	movew d6,d4
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
	orb #1,a6@(a0:l)
	movel _Data,a0
	moveb d3,a6@(a0:l)
	moveb d3,sp@(63)
	movel sp@(60),a3
L127:
	tstl d6
	sne d0
	extbl d0
	movel d0,a4
	negl d0
	movel d0,a4
	clrl d1
	movew _resx,d1
	movel d1,d0
	subql #1,d0
	cmpl d6,d0
	shi d0
	extbl d0
	movel d0,a5
	movel a5,d2
	negl d2
	movel d2,a5
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
	tstl a4
	jeq L128
	lea a6@(-1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L129
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L130
	.even
L129:
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
L130:
	cmpl d3,a3
	jeq L128
	moveq #1,d3
	movel d3,sp@(56)
L128:
	clrl sp@(52)
	tstl a5
	jeq L131
	lea a6@(1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L132
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L133
	.even
L132:
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
L133:
	cmpl d3,a3
	jeq L131
	movew #1,a0
	movel a0,sp@(52)
L131:
	clrl sp@(48)
	tstl d6
	jeq L134
	clrl d0
	movew _resx,d0
	movel a6,a2
	subl d0,a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L135
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L136
	.even
L135:
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
L136:
	cmpl d3,a3
	jeq L134
	movew #1,a2
	movel a2,sp@(48)
L134:
	clrl sp@(44)
	tstl d7
	jeq L137
	clrl d0
	movew _resx,d0
	lea a6@(0,d0:l),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L138
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L139
	.even
L138:
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
L139:
	cmpl d3,a3
	jeq L137
	moveq #1,d0
	movel d0,sp@(44)
L137:
	tstl sp@(56)
	jeq L140
	lea a6@(-1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L140
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d1
	cmpl _QueueSize,d1
	jne L140
	clrl _QueueHead
L140:
	tstl sp@(52)
	jeq L144
	lea a6@(1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L144
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d2
	cmpl _QueueSize,d2
	jne L144
	clrl _QueueHead
L144:
	tstl sp@(48)
	jeq L148
	clrl d0
	movew _resx,d0
	movel a6,a1
	subl d0,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L148
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d3
	cmpl _QueueSize,d3
	jne L148
	clrl _QueueHead
L148:
	tstl sp@(44)
	jeq L152
	clrl d0
	movew _resx,d0
	lea a6@(0,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L152
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a0
	cmpl _QueueSize,a0
	jne L152
	clrl _QueueHead
L152:
	tstl d6
	jeq L161
	tstl a4
	jeq L156
	tstl sp@(56)
	jne L157
	tstl sp@(48)
	jeq L156
L157:
	clrl d1
	movew _resx,d1
	movel a6,d0
	subl d1,d0
	movel d0,a1
	subql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L156
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,a2
	cmpl _QueueSize,a2
	jne L156
	clrl _QueueHead
L156:
	tstl d6
	jeq L161
	tstl a5
	jeq L161
	tstl sp@(52)
	jne L162
	tstl sp@(48)
	jeq L161
L162:
	clrl d1
	movew _resx,d1
	movel a6,d0
	subl d1,d0
	movel d0,a1
	addql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L161
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L161
	clrl _QueueHead
L161:
	tstl d7
	jeq L119
	tstl a4
	jeq L166
	tstl sp@(56)
	jne L167
	tstl sp@(44)
	jeq L166
L167:
	clrl d0
	movew _resx,d0
	lea a6@(-1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L166
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d1
	cmpl _QueueSize,d1
	jne L166
	clrl _QueueHead
L166:
	tstl d7
	jeq L119
	tstl a5
	jeq L119
	tstl sp@(52)
	jne L172
	tstl sp@(44)
	jeq L119
L172:
	clrl d0
	movew _resx,d0
	lea a6@(1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L119
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d2
	cmpl _QueueSize,d2
	jne L119
	clrl _QueueHead
L119:
	movel _QueueTail,d3
	cmpl _QueueHead,d3
	jne L121
L120:
	movew #257,_WordLoaded
	movel #16843009,_LongLoaded
	clrl _p
	movew _resx,d0
	mulu _resy,d0
	moveq #1,d6
	cmpl d0,d6
	jeq L179
	clrw d4
	clrl d3
	.even
L181:
	movel _Done,a1
	movel _p,a0
	btst #0,a0@(a1:l)
	jeq L180
	addql #1,a0
	movel a0,_p1
	movel _LongLoaded,d1
	jra L231
	.even
L185:
	movel _p1,a0
	addql #4,a0
	movel a0,_p1
L231:
	movel a0@(a1:l),d0
	andl d1,d0
	jeq L185
	movel _Done,a1
	movel _p1,a0
	movew _WordLoaded,d1
	jra L232
	.even
L189:
	movel a0,d0
	addql #2,d0
	movel d0,_p1
	movel d0,a0
L232:
	movew a0@(a1:l),d0
	andw d1,d0
	jeq L189
	movel _Done,a1
	movel _p1,a0
	btst #0,a0@(a1:l)
	jne L230
	.even
L193:
	lea a0@(1),a2
	movel a2,_p1
	movel a2,a0
	btst #0,a0@(a1:l)
	jeq L193
L230:
	movel _p,a1
	movel _p1,d0
	subl a1,d0
	movel d0,d2
	subql #1,d2
	movel d2,_nbytes
	jeq L180
	movel d2,d1
	lsrl #1,d1
	movel d1,_nwords
	movel d1,d0
	addl d0,d0
	movel d2,d6
	subl d0,d6
	movel d6,_rbytes
	lsrl #2,d2
	movel d2,_nlong
	movel d2,d0
	addl d0,d0
	subl d0,d1
	movel d1,_rwords
	movel _Data,a0
	moveb a1@(a0:l),_colorb
	moveb _colorb,d4
	movew d4,d1
	lslw #8,d1
	movew d4,d0
	addw d1,d0
	movew d0,_colorw
	movew d0,d3
	movel d3,d0
	swap d0
	clrw d0
	addl d3,d0
	movel d0,_colorl
	addql #1,a1
	movel a1,_p
	clrw _x
	tstl d2
	jeq L197
	clrl d0
	.even
L199:
	movel _Data,a1
	movel _p,a0
	movel _colorl,a0@(a1:l)
	movel _Done,a1
	movel _p,a0
	movel _LongLoaded,d1
	orl d1,a0@(a1:l)
	addql #4,_p
	addqw #1,_x
	movew _x,d0
	cmpl _nlong,d0
	jcs L199
L197:
	clrw _x
	tstl _rwords
	jeq L202
	clrl d0
	.even
L204:
	movel _Data,a1
	movel _p,a0
	movew _colorw,a0@(a1:l)
	movel _Done,a1
	movel _p,a0
	movew _WordLoaded,d2
	orw d2,a0@(a1:l)
	addql #2,_p
	addqw #1,_x
	movew _x,d0
	cmpl _rwords,d0
	jcs L204
L202:
	clrw _x
	tstl _rbytes
	jeq L180
	clrl d0
	.even
L209:
	movel _Data,a1
	movel _p,a0
	moveb _colorb,a0@(a1:l)
	movel _Done,a1
	movel _p,a0
	orb #1,a0@(a1:l)
	addql #1,_p
	addqw #1,_x
	movew _x,d0
	cmpl _rbytes,d0
	jcs L209
L180:
	movel _p,d1
	movel d1,d6
	addql #1,d6
	movel d6,_p
	movew _resx,d0
	mulu _resy,d0
	subql #1,d0
	addql #1,d1
	cmpl d1,d0
	jhi L181
L179:
	jbsr _SetStop
	movel _Queue,d0
	jeq L212
	movel _SysBase,a6
	movel d0,a1
	movel _QueueSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L212:
	movel _Done,d0
	jeq L214
	movel _SysBase,a6
	movel d0,a1
	movel _DoneSize,d0
#APP
	jsr a6@(-0xd2:W)
#NO_APP
L214:
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
	fjge L215
	fmoveml fpcr,d0
	moveq #16,d1
	orl d0,d1
	andw #-33,d1
	fmoveml d1,fpcr
	fmovel fp0,d3
	fmoveml d0,fpcr
	jra L216
	.even
L215:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d2
	moveq #16,d6
	orl d2,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp0,d3
	fmoveml d2,fpcr
	bchg #31,d3
L216:
	jbsr _GetStart
	movel d0,d2
	jbsr _GetStop
	cmpl d0,d2
	jcc L217
	subl d2,d0
	jra L218
	.even
L217:
	subl d0,d2
	movel d2,d0
	notl d0
L218:
	fdmovel d0,fp1
	tstl d0
	jge L219
	fdaddd #0r4294967296,fp1
L219:
	fdmovel d3,fp0
	tstl d3
	jge L220
	fdaddd #0r4294967296,fp0
L220:
	fddivx fp0,fp1
	fcmpd #0r2147483648,fp1
	fjge L222
	fmoveml fpcr,d0
	moveq #16,d2
	orl d0,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp1,d1
	fmoveml d0,fpcr
	jra L223
	.even
L222:
	fdmovex fp1,fp0
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d3
	moveq #16,d6
	orl d3,d6
	andw #-33,d6
	fmoveml d6,fpcr
	fmovel fp0,d1
	fmoveml d3,fpcr
	bchg #31,d1
L223:
	fdmovel d1,fp0
	tstl d1
	jge L224
	fdaddd #0r4294967296,fp0
L224:
	fdsubx fp0,fp1
	fdmovex fp1,fp0
	fdmuld #0r10000,fp0
	fcmpd #0r2147483648,fp0
	fjge L225
	fmoveml fpcr,d2
	moveq #16,d3
	orl d2,d3
	andw #-33,d3
	fmoveml d3,fpcr
	fmovel fp0,d0
	fmoveml d2,fpcr
	jra L226
	.even
L225:
	fdsubd #0r2147483648,fp0
	fmoveml fpcr,d6
	moveq #16,d2
	orl d6,d2
	andw #-33,d2
	fmoveml d2,fpcr
	fmovel fp0,d0
	fmoveml d6,fpcr
	bchg #31,d0
L226:
	movel d0,sp@-
	movel d1,sp@-
	clrl d0
	moveb 14676989,d0
	movel d0,sp@-
	pea LC0
	jbsr _printf
	clrl d0
	addw #16,sp
L82:
	moveml sp@+,#0x7cfc
	addw #32,sp
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
.comm _WordLoaded,2
.comm _LongLoaded,4
.comm _colorl,4
.comm _colorw,2
.comm _colorb,2
.comm _nbytes,4
.comm _nwords,4
.comm _nlong,4
.comm _rbytes,4
.comm _rwords,4
.comm _p1,4
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
	movel d0,_DoneSize
	movel d0,d1
	lsll #4,d1
	movel d1,_QueueSize
	movel _newbuffer,_Data
	movel #65537,d2
	movel _SysBase,a6
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
	jra L233
	.even
L23:
	moveq #1,d0
L233:
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
	movel sp@+,a6
	rts
	.even
.globl _Load
_Load:
	moveml #0x3c20,sp@-
	movel sp@(24),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jne L30
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
	jra L234
	.even
L30:
	movel _Data,a0
	clrl d0
	moveb a2@(a0:l),d0
L234:
	moveml sp@+,#0x43c
	rts
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
	jeq L32
	movel _Data,a0
	clrl d0
	moveb a3@(a0:l),d0
	movel d0,a4
	jra L33
	.even
L32:
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
L33:
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
	jeq L34
	lea a3@(-1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L35
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L36
	.even
L35:
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
L36:
	cmpl d3,a4
	jeq L34
	moveq #1,d0
	movel d0,sp@(56)
L34:
	clrl sp@(52)
	tstl a6
	jeq L37
	lea a3@(1),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L38
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L39
	.even
L38:
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
L39:
	cmpl d3,a4
	jeq L37
	moveq #1,d0
	movel d0,sp@(52)
L37:
	clrl sp@(48)
	tstl d6
	jeq L40
	clrl d0
	movew _resx,d0
	movel a3,a2
	subl d0,a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L41
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L42
	.even
L41:
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
L42:
	cmpl d3,a4
	jeq L40
	moveq #1,d0
	movel d0,sp@(48)
L40:
	clrl sp@(44)
	tstl d7
	jeq L43
	clrl d0
	movew _resx,d0
	lea a3@(0,d0:l),a2
	movel _Done,a0
	btst #0,a2@(a0:l)
	jeq L44
	movel _Data,a0
	clrl d3
	moveb a2@(a0:l),d3
	jra L45
	.even
L44:
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
L45:
	cmpl d3,a4
	jeq L43
	moveq #1,d0
	movel d0,sp@(44)
L43:
	tstl sp@(56)
	jeq L46
	lea a3@(-1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L46
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L46
	clrl _QueueHead
L46:
	tstl sp@(52)
	jeq L50
	lea a3@(1),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L50
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L50
	clrl _QueueHead
L50:
	tstl sp@(48)
	jeq L54
	clrl d0
	movew _resx,d0
	movel a3,a1
	subl d0,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L54
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L54
	clrl _QueueHead
L54:
	tstl sp@(44)
	jeq L58
	clrl d0
	movew _resx,d0
	lea a3@(0,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L58
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L58
	clrl _QueueHead
L58:
	tstl d6
	jeq L67
	tstl a5
	jeq L62
	tstl sp@(56)
	jne L63
	tstl sp@(48)
	jeq L62
L63:
	clrl d1
	movew _resx,d1
	movel a3,d0
	subl d1,d0
	movel d0,a1
	subql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L62
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L62
	clrl _QueueHead
L62:
	tstl d6
	jeq L67
	tstl a6
	jeq L67
	tstl sp@(52)
	jne L68
	tstl sp@(48)
	jeq L67
L68:
	clrl d1
	movew _resx,d1
	movel a3,d0
	subl d1,d0
	movel d0,a1
	addql #1,a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L67
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L67
	clrl _QueueHead
L67:
	tstl d7
	jeq L77
	tstl a5
	jeq L72
	tstl sp@(56)
	jne L73
	tstl sp@(44)
	jeq L72
L73:
	clrl d0
	movew _resx,d0
	lea a3@(-1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L72
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L72
	clrl _QueueHead
L72:
	tstl d7
	jeq L77
	tstl a6
	jeq L77
	tstl sp@(52)
	jne L78
	tstl sp@(44)
	jeq L77
L78:
	clrl d0
	movew _resx,d0
	lea a3@(1,d0:l),a1
	movel _Done,a0
	moveb a1@(a0:l),d0
	btst #1,d0
	jne L77
	orb #2,d0
	moveb d0,a1@(a0:l)
	movel _QueueHead,d0
	movel _Queue,a0
	movel a1,a0@(d0:l:4)
	addql #1,_QueueHead
	movel _QueueHead,d0
	cmpl _QueueSize,d0
	jne L77
	clrl _QueueHead
L77:
	moveml sp@+,#0x7cfc
	addw #20,sp
	rts
