	idnt	"boundary_trace2.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_GetTime
	cnop	0,4
_GetTime
	fmovem.x	l479,-(a7)
	movem.l	l478,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	fmove.l	d0,fp0
	fmul.d	#$401c600a7c5ac472,fp0
	fmul.d	#$412e848000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l481
	fintrz	fp0
	fmove.l	fp0,d4
	bra	l482
l481:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d4
	bchg	#31,d4
l482:
	jsr	_GetStart
	move.l	d0,d3
	jsr	_GetStop
	move.l	d0,d1
	cmp.l	d1,d3
	bcc	l4
	move.l	d1,d2
	sub.l	d3,d2
	bra	l5
l4
	move.l	d3,d0
	sub.l	d1,d0
	move.l	#4294967295,d2
	sub.l	d0,d2
l5
	fmove.l	d2,fp1
	tst.l	d2
	bge.s	l483
	fadd.d	#4294967296,fp1
l483:
	fmove.l	d4,fp0
	tst.l	d4
	bge.s	l484
	fadd.d	#4294967296,fp0
l484:
	fmove.x	fp0,fp2
	fmove.x	fp1,fp0
	fdiv.x	fp2,fp0
l478	reg	d2/d3/d4
	movem.l	(a7)+,d2/d3/d4
l479	freg	fp2
	fmovem.x	(a7)+,l479
l480	equ	24
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_Iterate
	cnop	0,4
_Iterate
	fmovem.x	l486,-(a7)
	movem.l	l485,-(a7)
	fmove.d	(12+l487,a7),fp6
	fmove.d	#$4000000000000000,fp5
	move.w	(22+l487,a7),d1
	fmove.d	#$0000000000000000,fp2
	fmove.d	#$0000000000000000,fp3
	fmove.d	#$0000000000000000,fp1
	fmove.d	#$0000000000000000,fp4
	move.w	d1,d0
	tst.w	d1
	beq	l161
l160
	fmove.x	fp2,fp0
	fmul.x	fp5,fp0
	fmul.x	fp1,fp0
	fmove.x	fp6,fp1
	fadd.x	fp0,fp1
	fmove.x	fp3,fp0
	fsub.x	fp4,fp0
	fmove.d	(4+l487,a7),fp2
	fadd.x	fp0,fp2
	fmove.x	fp2,fp3
	fmul.x	fp2,fp3
	fmove.x	fp1,fp4
	fmul.x	fp1,fp4
	subq.w	#1,d0
	beq	l161
	fmove.x	fp4,fp0
	fadd.x	fp3,fp0
	fcmp.d	#$4010000000000000,fp0
	fble	l160
l161
l485	reg
l486	freg	fp2/fp3/fp4/fp5/fp6
	fmovem.x	(a7)+,l486
l487	equ	60
	rts
; stacksize=60
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_AddQueue
	cnop	0,4
_AddQueue
	fmovem.x	l489,-(a7)
	movem.l	l488,-(a7)
	move.l	(4+l490,a7),d1
	move.l	_Done,a1
	add.l	d1,a1
	moveq	#0,d0
	move.b	(a1),d0
	and.l	#2,d0
	bne	l18
	or.b	#2,(a1)
	move.l	_QueueHead,d0
	moveq	#1,d2
	add.l	d0,d2
	move.l	d2,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	d1,(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l18
	move.l	#0,_QueueHead
l18
l488	reg	d2
	movem.l	(a7)+,d2
l489	freg
l490	equ	4
	rts
; stacksize=4
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_AllocateBoundary
	cnop	0,4
_AllocateBoundary
	fmovem.x	l492,-(a7)
	movem.l	l491,-(a7)
	moveq	#0,d0
	move.w	_resx,d0
	moveq	#0,d1
	move.w	_resy,d1
	move.l	d0,d2
	move.l	d1,d3
	swap	d2
	swap	d3
	mulu.w	d1,d2
	mulu.w	d0,d3
	mulu.w	d1,d0
	add.w	d3,d2
	swap	d2
	clr.w	d2
	add.l	d2,d0
	move.l	d0,_DoneSize
	lsl.l	#4,d0
	move.l	d0,_QueueSize
	move.l	_newbuffer,_Data
	move.l	_DoneSize,d0
	move.l	_SysBase,a6
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,_Done
	move.l	_QueueSize,d0
	move.l	_SysBase,a6
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,_Queue
	tst.l	_Data
	beq	l21
	tst.l	_Done
	beq	l21
	tst.l	_Queue
	bne	l22
l21
	moveq	#0,d0
	bra	l25
l22
	moveq	#1,d0
l25
l491	reg	a6/d2/d3
	movem.l	(a7)+,a6/d2/d3
l492	freg
l493	equ	12
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_DeallocateBoundary
	cnop	0,4
_DeallocateBoundary
	fmovem.x	l495,-(a7)
	movem.l	l494,-(a7)
	tst.l	_Queue
	beq	l29
	move.l	_QueueSize,d0
	move.l	_Queue,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l29
	tst.l	_Done
	beq	l31
	move.l	_DoneSize,d0
	move.l	_Done,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l31
l494	reg	a6
	movem.l	(a7)+,a6
l495	freg
l496	equ	4
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_Load
	cnop	0,4
_Load
	fmovem.x	l498,-(a7)
	movem.l	l497,-(a7)
	move.l	(4+l499,a7),d6
	move.l	_Done,a0
	moveq	#0,d0
	move.b	(0,a0,d6.l),d0
	and.l	#1,d0
	beq	l35
	move.l	_Data,a0
	moveq	#0,d0
	move.b	(0,a0,d6.l),d0
	bra	l32
l35
	moveq	#0,d5
	move.w	_resx,d5
	move.l	d5,-(a7)
	move.l	d6,-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d4
	move.l	d5,-(a7)
	move.l	d6,-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d0,d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	d6,a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	d6,a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
l32
l497	reg	d2/d3/d4/d5/d6
	movem.l	(a7)+,d2/d3/d4/d5/d6
l498	freg	fp2
	fmovem.x	(a7)+,l498
l499	equ	32
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_Scan
	cnop	0,4
_Scan
	sub.w	#44,a7
	fmovem.x	l501,-(a7)
	movem.l	l500,-(a7)
	move.l	(48+l502,a7),d6
	moveq	#0,d0
	move.w	_resx,d0
	move.l	d0,-(a7)
	move.l	d1,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	a1,-(a7)
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	d0,(32+l502,a7)
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d1
	opt	om+
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	move.l	d0,-(a7)
	move.l	d1,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	a1,-(a7)
	move.l	d0,-(a7)
	move.l	d6,-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	(a7)+,a1
	move.l	d0,(36+l502,a7)
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d1
	opt	om+
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	move.l	_Done,a0
	moveq	#0,d0
	move.b	(0,a0,d6.l),d0
	and.l	#1,d0
	beq	l180
	move.l	_Data,a0
	moveq	#0,d7
	move.b	(0,a0,d6.l),d7
	move.l	d7,(8+l502,a7)
	bra	l177
l180
	move.w	(2+l502,a7),d4
	move.w	(6+l502,a7),d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	d6,a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	d6,a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(8+l502,a7)
l177
	tst.l	(0+l502,a7)
	bhi	l38
	move.l	#0,(12+l502,a7)
	bra	l39
l38
	moveq	#1,d7
	move.l	d7,(12+l502,a7)
l39
	moveq	#0,d0
	move.w	_resx,d0
	subq.l	#1,d0
	cmp.l	(0+l502,a7),d0
	bhi	l41
	move.l	#0,(0+l502,a7)
	bra	l42
l41
	moveq	#1,d7
	move.l	d7,(0+l502,a7)
l42
	tst.l	(4+l502,a7)
	bhi	l44
	move.l	#0,(16+l502,a7)
	bra	l45
l44
	moveq	#1,d7
	move.l	d7,(16+l502,a7)
l45
	moveq	#0,d0
	move.w	_resy,d0
	subq.l	#1,d0
	cmp.l	(4+l502,a7),d0
	bhi	l47
	move.l	#0,(4+l502,a7)
	bra	l48
l47
	moveq	#1,d7
	move.l	d7,(4+l502,a7)
l48
	tst.l	(12+l502,a7)
	beq	l52
	move.l	d6,d0
	subq.l	#1,d0
	move.l	d0,(20+l502,a7)
	move.l	_Done,a0
	add.l	(20+l502,a7),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l184
	move.l	_Data,a0
	add.l	(20+l502,a7),a0
	moveq	#0,d7
	move.b	(a0),d7
	move.l	d7,(24+l502,a7)
	bra	l181
l184
	moveq	#0,d5
	move.w	_resx,d5
	move.l	a1,-(a7)
	move.l	d5,-(a7)
	move.l	(28+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	d0,d4
	move.l	a1,-(a7)
	move.l	d5,-(a7)
	move.l	(28+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	(a7)+,a1
	move.l	d0,d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	(20+l502,a7),a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	(20+l502,a7),a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(24+l502,a7)
l181
	move.l	(24+l502,a7),d7
	cmp.l	(8+l502,a7),d7
	beq	l52
	moveq	#1,d7
	move.l	d7,(20+l502,a7)
	bra	l53
l52
	move.l	#0,(20+l502,a7)
l53
	tst.l	(0+l502,a7)
	beq	l56
	moveq	#1,d0
	add.l	d6,d0
	move.l	d0,(24+l502,a7)
	move.l	_Done,a0
	add.l	(24+l502,a7),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l188
	move.l	_Data,a0
	add.l	(24+l502,a7),a0
	moveq	#0,d7
	move.b	(a0),d7
	move.l	d7,(28+l502,a7)
	bra	l185
l188
	moveq	#0,d5
	move.w	_resx,d5
	move.l	a1,-(a7)
	move.l	d5,-(a7)
	move.l	(32+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	d0,d4
	move.l	a1,-(a7)
	move.l	d5,-(a7)
	move.l	(32+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	(a7)+,a1
	move.l	d0,d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	(24+l502,a7),a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	(24+l502,a7),a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(28+l502,a7)
l185
	move.l	(28+l502,a7),d7
	cmp.l	(8+l502,a7),d7
	beq	l56
	moveq	#1,d7
	move.l	d7,(24+l502,a7)
	bra	l57
l56
	move.l	#0,(24+l502,a7)
l57
	tst.l	(16+l502,a7)
	beq	l60
	moveq	#0,d0
	move.w	_resx,d0
	move.l	d0,(28+l502,a7)
	move.l	d6,d0
	sub.l	(28+l502,a7),d0
	move.l	d0,(32+l502,a7)
	move.l	_Done,a0
	add.l	(32+l502,a7),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l192
	move.l	_Data,a0
	add.l	(32+l502,a7),a0
	moveq	#0,d7
	move.b	(a0),d7
	move.l	d7,(36+l502,a7)
	bra	l189
l192
	move.l	a1,-(a7)
	move.l	(32+l502,a7),-(a7)
	move.l	(40+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	d0,d4
	move.l	a1,-(a7)
	move.l	(32+l502,a7),-(a7)
	move.l	(40+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	(a7)+,a1
	move.l	d0,d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	(32+l502,a7),a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	(32+l502,a7),a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(36+l502,a7)
l189
	move.l	(36+l502,a7),d7
	cmp.l	(8+l502,a7),d7
	beq	l60
	moveq	#1,d7
	move.l	d7,(28+l502,a7)
	bra	l61
l60
	move.l	#0,(28+l502,a7)
l61
	tst.l	(4+l502,a7)
	beq	l64
	moveq	#0,d0
	move.w	_resx,d0
	move.l	d0,(32+l502,a7)
	move.l	d6,d0
	add.l	(32+l502,a7),d0
	move.l	d0,(36+l502,a7)
	move.l	_Done,a0
	add.l	(36+l502,a7),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l196
	move.l	_Data,a0
	add.l	(36+l502,a7),a0
	moveq	#0,d7
	move.b	(a0),d7
	move.l	d7,(40+l502,a7)
	bra	l193
l196
	move.l	a1,-(a7)
	move.l	(36+l502,a7),-(a7)
	move.l	(44+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	d0,d4
	move.l	a1,-(a7)
	move.l	(36+l502,a7),-(a7)
	move.l	(44+l502,a7),-(a7)
	public	__ldivu
	jsr	__ldivu
	addq.w	#8,a7
	move.l	(a7)+,a1
	move.l	d0,d5
	moveq	#0,d0
	move.w	_MaxIter,d0
	moveq	#0,d1
	move.w	d5,d1
	fmove.l	d1,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	moveq	#0,d1
	move.w	d4,d1
	fmove.l	d1,fp2
	fmul.d	_stepr,fp2
	fmove.d	_minr,fp0
	fadd.x	fp2,fp0
	jsr	_SingleIterateAsm
	move.w	d0,d3
	moveq	#0,d2
	move.w	d3,d2
	moveq	#0,d1
	move.w	d5,d1
	moveq	#0,d0
	move.w	d4,d0
	jsr	_Put8BitPixel
	move.l	_Done,a0
	add.l	(36+l502,a7),a0
	or.b	#1,(a0)
	move.l	_Data,a0
	add.l	(36+l502,a7),a0
	move.b	d3,(a0)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(40+l502,a7)
l193
	move.l	(40+l502,a7),d7
	cmp.l	(8+l502,a7),d7
	beq	l64
	moveq	#1,d7
	move.l	d7,(8+l502,a7)
	bra	l65
l64
	move.l	#0,(8+l502,a7)
l65
	tst.l	(20+l502,a7)
	beq	l202
	move.l	d6,d0
	subq.l	#1,d0
	move.l	d0,(32+l502,a7)
	move.l	_Done,d4
	add.l	(32+l502,a7),d4
	move.l	d4,a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#2,d0
	bne	l202
	move.l	d4,a0
	or.b	#2,(a0)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(32+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l202
	move.l	#0,_QueueHead
l202
	tst.l	(24+l502,a7)
	beq	l208
	moveq	#1,d0
	add.l	d6,d0
	move.l	d0,(32+l502,a7)
	move.l	_Done,d3
	add.l	(32+l502,a7),d3
	move.l	d3,a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#2,d0
	bne	l208
	move.l	d3,a0
	or.b	#2,(a0)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(32+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l208
	move.l	#0,_QueueHead
l208
	tst.l	(28+l502,a7)
	beq	l214
	moveq	#0,d0
	move.w	_resx,d0
	move.l	d6,d7
	sub.l	d0,d7
	move.l	d7,(32+l502,a7)
	move.l	_Done,d5
	add.l	(32+l502,a7),d5
	move.l	d5,a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#2,d0
	bne	l214
	move.l	d5,a0
	or.b	#2,(a0)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(32+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l214
	move.l	#0,_QueueHead
l214
	tst.l	(8+l502,a7)
	beq	l220
	moveq	#0,d0
	move.w	_resx,d0
	add.l	d6,d0
	move.l	d0,(32+l502,a7)
	move.l	_Done,a2
	add.l	(32+l502,a7),a2
	moveq	#0,d0
	move.b	(a2),d0
	and.l	#2,d0
	bne	l220
	or.b	#2,(a2)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(32+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l220
	move.l	#0,_QueueHead
l220
	tst.l	(16+l502,a7)
	beq	l226
	tst.l	(12+l502,a7)
	beq	l226
	tst.l	(20+l502,a7)
	bne	l74
	tst.l	(28+l502,a7)
	beq	l226
l74
	moveq	#0,d0
	move.w	_resx,d0
	neg.l	d0
	add.l	d6,d0
	subq.l	#1,d0
	move.l	d0,(32+l502,a7)
	move.l	_Done,a4
	add.l	(32+l502,a7),a4
	moveq	#0,d0
	move.b	(a4),d0
	and.l	#2,d0
	bne	l226
	or.b	#2,(a4)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(32+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l226
	move.l	#0,_QueueHead
l226
	tst.l	(16+l502,a7)
	beq	l232
	tst.l	(0+l502,a7)
	beq	l232
	tst.l	(24+l502,a7)
	bne	l79
	tst.l	(28+l502,a7)
	beq	l232
l79
	moveq	#0,d0
	move.w	_resx,d0
	neg.l	d0
	add.l	d6,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,(16+l502,a7)
	move.l	_Done,a1
	add.l	(16+l502,a7),a1
	moveq	#0,d0
	move.b	(a1),d0
	and.l	#2,d0
	bne	l232
	or.b	#2,(a1)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(16+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l232
	move.l	#0,_QueueHead
l232
	tst.l	(4+l502,a7)
	beq	l238
	tst.l	(12+l502,a7)
	beq	l238
	tst.l	(20+l502,a7)
	bne	l84
	tst.l	(8+l502,a7)
	beq	l238
l84
	moveq	#0,d0
	move.w	_resx,d0
	add.l	d6,d0
	subq.l	#1,d0
	move.l	d0,(12+l502,a7)
	move.l	_Done,a5
	add.l	(12+l502,a7),a5
	moveq	#0,d0
	move.b	(a5),d0
	and.l	#2,d0
	bne	l238
	or.b	#2,(a5)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(12+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l238
	move.l	#0,_QueueHead
l238
	tst.l	(4+l502,a7)
	beq	l244
	tst.l	(0+l502,a7)
	beq	l244
	tst.l	(24+l502,a7)
	bne	l89
	tst.l	(8+l502,a7)
	beq	l244
l89
	moveq	#0,d0
	move.w	_resx,d0
	add.l	d6,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,(0+l502,a7)
	move.l	_Done,a3
	add.l	(0+l502,a7),a3
	moveq	#0,d0
	move.b	(a3),d0
	and.l	#2,d0
	bne	l244
	or.b	#2,(a3)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(0+l502,a7),(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l244
	move.l	#0,_QueueHead
l244
l500	reg	a2/a3/a4/a5/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a4/a5/d2/d3/d4/d5/d6/d7
l501	freg	fp2
	fmovem.x	(a7)+,l501
l502	equ	52
	add.w	#44,a7
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_main
	cnop	0,4
_main
	sub.w	#16,a7
	fmovem.x	l504,-(a7)
	movem.l	l503,-(a7)
	move.l	#2561,d0
	move.l	#1280,d1
	move.l	#720,d2
	jsr	_Set8BitMode
	move.l	d0,_newbuffer
	bne	l97
	moveq	#1,d0
	bra	l94
l97
	jsr	_MultiTaskOff
	jsr	_MouseOff
	move.w	#256,_MaxIter
	move.l	#$c0020000,_minr
	move.l	#$00000000,4+_minr
	move.l	#$3ff40000,_maxr
	move.l	#$00000000,4+_maxr
	move.l	#$bff40000,_mini
	move.l	#$00000000,4+_mini
	move.l	#$3ff40000,_maxi
	move.l	#$00000000,4+_maxi
	fmove.d	_maxr,fp1
	fsub.d	_minr,fp1
	moveq	#0,d0
	move.w	_resx,d0
	fmove.l	d0,fp0
	fdiv.x	fp0,fp1
	fmove.d	fp1,_stepr
	fmove.d	_maxi,fp1
	fsub.d	_mini,fp1
	moveq	#0,d0
	move.w	_resy,d0
	fmove.l	d0,fp0
	fdiv.x	fp0,fp1
	fmove.d	fp1,_stepi
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	moveq	#0,d3
	jsr	_SetColor
	moveq	#1,d4
	move.w	#255,d5
l433
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	a0,-(a7)
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.l	(a7)+,a0
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	cmp.w	d4,d5
	bcc	l433
	moveq	#0,d0
	move.w	_resx,d0
	moveq	#0,d1
	move.w	_resy,d1
	move.l	d2,-(a7)
	move.l	d0,d7
	move.l	d1,d2
	swap	d7
	swap	d2
	mulu.w	d1,d7
	mulu.w	d0,d2
	mulu.w	d1,d0
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d0
	move.l	(a7)+,d2
	move.l	d0,_DoneSize
	lsl.l	#4,d0
	move.l	d0,_QueueSize
	move.l	_newbuffer,_Data
	move.l	_DoneSize,d0
	move.l	_SysBase,a6
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,_Done
	move.l	_QueueSize,d0
	move.l	_SysBase,a6
	move.l	#65537,d1
	jsr	-198(a6)
	move.l	d0,_Queue
	tst.l	_Data
	beq	l250
	tst.l	_Done
	beq	l250
	tst.l	_Queue
	bne	l251
l250
	move.l	#0,a0
	bra	l254
l251
	move.l	#1,a0
l254
	move.l	a0,d7
	bne	l103
	moveq	#1,d0
	bra	l94
l103
	jsr	_SetStart
	move.w	#0,_y
	move.w	_y,d7
	cmp.w	_resy,d7
	bcc	l456
l445
	moveq	#0,d0
	move.w	_y,d0
	moveq	#0,d1
	move.w	_resx,d1
	move.l	d1,d4
	move.l	d2,-(a7)
	move.l	d4,d7
	move.l	d0,d2
	swap	d7
	swap	d2
	mulu.w	d0,d7
	mulu.w	d4,d2
	mulu.w	d0,d4
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d4
	move.l	(a7)+,d2
	move.l	_Done,a2
	add.l	d4,a2
	moveq	#0,d0
	move.b	(a2),d0
	and.l	#2,d0
	bne	l260
	or.b	#2,(a2)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	d4,(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l260
	move.l	#0,_QueueHead
l260
	moveq	#0,d0
	move.w	_y,d0
	moveq	#0,d1
	move.w	_resx,d1
	move.l	d2,-(a7)
	move.l	d0,d7
	move.l	d1,d2
	swap	d7
	swap	d2
	mulu.w	d1,d7
	mulu.w	d0,d2
	mulu.w	d1,d0
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d0
	move.l	(a7)+,d2
	subq.l	#1,d1
	move.l	d1,d5
	add.l	d0,d5
	move.l	_Done,a3
	add.l	d5,a3
	moveq	#0,d0
	move.b	(a3),d0
	and.l	#2,d0
	bne	l266
	or.b	#2,(a3)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	d5,(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l266
	move.l	#0,_QueueHead
l266
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l445
l456
	move.w	#1,_x
	moveq	#0,d0
	move.w	_x,d0
	move.l	d0,a0
	moveq	#0,d0
	move.w	_resx,d0
	subq.l	#1,d0
	cmp.l	a0,d0
	ble	l457
l446
	moveq	#0,d4
	move.w	_x,d4
	move.l	_Done,a2
	add.l	d4,a2
	moveq	#0,d0
	move.b	(a2),d0
	and.l	#2,d0
	bne	l272
	or.b	#2,(a2)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	d4,(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l272
	move.l	#0,_QueueHead
l272
	moveq	#0,d0
	move.w	_resy,d0
	subq.l	#1,d0
	moveq	#0,d1
	move.w	_resx,d1
	move.l	d2,-(a7)
	move.l	d0,d7
	move.l	d1,d2
	swap	d7
	swap	d2
	mulu.w	d1,d7
	mulu.w	d0,d2
	mulu.w	d1,d0
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d0
	move.l	(a7)+,d2
	moveq	#0,d1
	move.w	_x,d1
	move.l	d1,d5
	add.l	d0,d5
	move.l	_Done,a3
	add.l	d5,a3
	moveq	#0,d0
	move.b	(a3),d0
	and.l	#2,d0
	bne	l278
	or.b	#2,(a3)
	move.l	_QueueHead,d0
	moveq	#1,d7
	add.l	d0,d7
	move.l	d7,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	d5,(0,a0,d0.l)
	move.l	_QueueHead,d0
	cmp.l	_QueueSize,d0
	bne	l278
	move.l	#0,_QueueHead
l278
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	moveq	#0,d7
	move.w	d0,d7
	move.l	d7,a0
	moveq	#0,d0
	move.w	_resx,d0
	subq.l	#1,d0
	cmp.l	a0,d0
	bgt	l446
l457
	move.w	#0,_flag
	move.l	_QueueTail,(0+l505,a7)
	move.l	_QueueHead,(4+l505,a7)
	move.l	(0+l505,a7),d7
	cmp.l	(4+l505,a7),d7
	beq	l458
	move.l	(4+l505,a7),d5
	move.l	(0+l505,a7),d4
l436
	cmp.l	d5,d4
	bcc	l115
	moveq	#1,d0
	add.w	_flag,d0
	move.w	d0,_flag
	and.l	#65535,d0
	and.l	#3,d0
	beq	l116
l115
	moveq	#1,d0
	add.l	d4,d0
	move.l	d0,_QueueTail
	move.l	d4,d1
	lsl.l	#2,d1
	move.l	_Queue,a0
	move.l	(0,a0,d1.l),_p
	cmp.l	_QueueSize,d0
	bne	l120
	move.l	#0,_QueueTail
	bra	l120
l116
	move.l	d5,d0
	subq.l	#1,d0
	move.l	d0,_QueueHead
	lsl.l	#2,d0
	move.l	_Queue,a0
	move.l	(0,a0,d0.l),_p
l120
	move.l	_p,a0
	move.l	a0,-(a7)
	jsr	_Scan
	move.l	_QueueTail,d4
	move.l	_QueueHead,d5
	addq.w	#4,a7
	cmp.l	d4,d5
	bne	l436
l458
	move.w	#257,_WordLoaded
	moveq	#0,d0
	move.w	_WordLoaded,d0
	moveq	#16,d7
	move.l	d0,d1
	lsl.l	d7,d1
	add.l	d1,d0
	move.l	d0,_LongLoaded
	move.l	#0,_p
	moveq	#0,d0
	move.w	_resx,d0
	moveq	#0,d1
	move.w	_resy,d1
	move.l	d2,-(a7)
	move.l	d0,d7
	move.l	d1,d2
	swap	d7
	swap	d2
	mulu.w	d1,d7
	mulu.w	d0,d2
	mulu.w	d1,d0
	add.w	d2,d7
	swap	d7
	clr.w	d7
	add.l	d7,d0
	move.l	(a7)+,d2
	subq.l	#1,d0
	move.l	d0,a0
	cmp.l	_p,a0
	bls	l459
l448
	move.l	_Done,a2
	move.l	_p,d6
	lea	(a2,d6.l),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l465
	moveq	#1,d4
	add.l	d6,d4
	move.l	d4,_p1
	lea	(a2,d4.l),a0
	move.l	(a0),d0
	move.l	_LongLoaded,(0+l505,a7)
	and.l	(0+l505,a7),d0
	bne	l460
	move.l	(0+l505,a7),d5
l438
	moveq	#4,d0
	add.l	_p1,d0
	move.l	d0,_p1
	lea	(a2,d0.l),a0
	move.l	d5,d0
	and.l	(a0),d0
	beq	l438
l460
	move.l	a2,a0
	add.l	_p1,a0
	moveq	#0,d0
	move.w	(a0),d0
	moveq	#0,d7
	move.w	_WordLoaded,d7
	move.l	d7,(4+l505,a7)
	and.l	(4+l505,a7),d0
	move.l	d4,(0+l505,a7)
	tst.l	d0
	bne	l132
	move.l	_p1,d5
	move.l	(4+l505,a7),d4
l439
	moveq	#2,d0
	add.l	d5,d0
	move.l	d0,d5
	lea	(a2,d0.l),a0
	moveq	#0,d0
	move.w	(a0),d0
	and.l	d4,d0
	beq	l439
	move.l	d5,_p1
l132
	move.l	(0+l505,a7),d4
	move.l	a2,a0
	add.l	_p1,a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	bne	l462
l451
	moveq	#1,d0
	add.l	_p1,d0
	move.l	d0,_p1
	lea	(a2,d0.l),a0
	moveq	#0,d0
	move.b	(a0),d0
	and.l	#1,d0
	beq	l451
l462
	move.l	_p1,d0
	sub.l	d6,d0
	move.l	d0,d5
	subq.l	#1,d5
	move.l	d5,_nbytes
	move.l	d4,(0+l505,a7)
	tst.l	d5
	beq	l465
	move.l	d5,d4
	lsr.l	#1,d4
	move.l	d4,_nwords
	move.l	d4,d0
	lsl.l	#1,d0
	move.l	d5,d1
	sub.l	d0,d1
	move.l	d1,_rbytes
	move.l	d4,d0
	lsr.l	#1,d0
	move.l	d0,_nlong
	move.l	d0,d1
	lsl.l	#1,d1
	sub.l	d1,d4
	move.l	d4,_rwords
	move.l	_Data,a3
	move.b	(0,a3,d6.l),_colorb
	moveq	#0,d1
	move.b	_colorb,d1
	move.w	d1,d4
	lsl.w	#8,d4
	add.w	d4,d1
	move.w	d1,_colorw
	and.l	#65535,d1
	moveq	#16,d7
	move.l	d1,d4
	lsl.l	d7,d4
	add.l	d4,d1
	move.l	d1,_colorl
	move.l	(0+l505,a7),_p
	move.w	#0,_x
	moveq	#0,d1
	move.w	_x,d1
	move.l	d1,a0
	cmp.l	a0,d0
	bls	l463
	move.w	_x,d4
l441
	move.l	a3,a0
	add.l	_p,a0
	move.l	_colorl,(a0)
	move.l	a2,a0
	add.l	_p,a0
	move.l	_LongLoaded,d0
	or.l	d0,(a0)
	addq.l	#4,_p
	moveq	#1,d0
	add.w	d4,d0
	move.w	d0,d4
	moveq	#0,d7
	move.w	d0,d7
	move.l	d7,a0
	cmp.l	_nlong,a0
	bcs	l441
l463
	move.w	#0,_x
	moveq	#0,d7
	move.w	_x,d7
	move.l	d7,a0
	move.l	_rwords,a4
	cmp.l	a0,a4
	bls	l144
	move.l	_p,d4
l442
	move.l	d4,d0
	move.w	_colorw,(0,a3,d0.l)
	lea	(a2,d0.l),a0
	move.w	_WordLoaded,d7
	or.w	d7,(a0)
	moveq	#2,d4
	add.l	d0,d4
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	moveq	#0,d7
	move.w	d0,d7
	move.l	d7,a0
	cmp.l	a0,a4
	bhi	l442
	move.l	d4,_p
l144
	move.w	#0,_x
	moveq	#0,d7
	move.w	_x,d7
	move.l	d7,a0
	cmp.l	_rbytes,a0
	bcc	l465
l454
	move.l	_Data,a0
	add.l	_p,a0
	move.b	_colorb,(a0)
	move.l	_Done,a0
	add.l	_p,a0
	or.b	#1,(a0)
	addq.l	#1,_p
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	moveq	#0,d7
	move.w	d0,d7
	move.l	d7,a0
	cmp.l	_rbytes,a0
	bcs	l454
l465
	moveq	#1,d0
	add.l	_p,d0
	move.l	d0,_p
	moveq	#0,d1
	move.w	_resx,d1
	moveq	#0,d4
	move.w	_resy,d4
	move.l	d0,-(a7)
	move.l	d1,d7
	move.l	d4,d0
	swap	d7
	swap	d0
	mulu.w	d4,d7
	mulu.w	d1,d0
	mulu.w	d4,d1
	add.w	d0,d7
	swap	d7
	clr.w	d7
	add.l	d7,d1
	move.l	(a7)+,d0
	subq.l	#1,d1
	move.l	d1,a0
	cmp.l	d0,a0
	bhi	l448
l459
	jsr	_SetStop
	tst.l	_Queue
	beq	l282
	move.l	_QueueSize,d0
	move.l	_Queue,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l282
	tst.l	_Done
	beq	l284
	move.l	_DoneSize,d0
	move.l	_Done,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l284
	jsr	_WaitMouse
	jsr	_MouseOn
	jsr	_MultiTaskOn
	jsr	_RestoreMode
	moveq	#0,d7
	move.b	14676989,d7
	fmove.l	d7,fp0
	fmul.d	#$401c600a7c5ac472,fp0
	fmul.d	#$412e848000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l506
	fintrz	fp0
	fmove.l	fp0,d7
	bra	l507
l506:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d7
	bchg	#31,d7
l507:
	move.l	d7,(0+l505,a7)
	jsr	_GetStart
	move.l	d0,(4+l505,a7)
	jsr	_GetStop
	move.l	d0,(8+l505,a7)
	move.l	(8+l505,a7),d7
	cmp.l	(4+l505,a7),d7
	bls	l288
	move.l	(8+l505,a7),d7
	sub.l	(4+l505,a7),d7
	move.l	d7,(12+l505,a7)
	bra	l289
l288
	move.l	(4+l505,a7),d0
	sub.l	(8+l505,a7),d0
	move.l	#4294967295,d7
	sub.l	d0,d7
	move.l	d7,(12+l505,a7)
l289
	fmove.l	(12+l505,a7),fp0
	tst.l	(12+l505,a7)
	bge.s	l508
	fadd.d	#4294967296,fp0
l508:
	fmove.l	(0+l505,a7),fp1
	tst.l	(0+l505,a7)
	bge.s	l509
	fadd.d	#4294967296,fp1
l509:
	fmove.x	fp1,fp2
	fmove.x	fp0,fp1
	fdiv.x	fp2,fp1
	fmove.x	fp1,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l510
	fintrz	fp0
	fmove.l	fp0,d0
	bra	l511
l510:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d0
	bchg	#31,d0
l511:
	fmove.l	d0,fp0
	tst.l	d0
	bge.s	l512
	fadd.d	#4294967296,fp0
l512:
	fneg.x	fp0
	fadd.x	fp1,fp0
	fmul.d	#$40c3880000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l513
	fintrz	fp0
	fmove.l	fp0,d1
	bra	l514
l513:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d1
	bchg	#31,d1
l514:
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	move.l	d0,-(a7)
	pea	l150
	jsr	_printf
	moveq	#0,d0
	add.w	#16,a7
l94
l503	reg	a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a4/a5/a6/d2/d3/d4/d5/d6/d7
l504	freg	fp2
	fmovem.x	(a7)+,l504
l505	equ	56
	add.w	#16,a7
	rts
	public	_SAGAMODEW
	section	"DATA",data
	cnop	0,4
_SAGAMODEW
	dc.l	14676468
	public	_SAGAMODER
	cnop	0,4
_SAGAMODER
	dc.l	14672372
	public	_SAGAPTRW
	cnop	0,4
_SAGAPTRW
	dc.l	14676460
	public	_SAGAPTRR
	cnop	0,4
_SAGAPTRR
	dc.l	14672364
	public	_SAGACOLORW
	cnop	0,4
_SAGACOLORW
	dc.l	14676872
	public	_CIAAPRA
	cnop	0,4
_CIAAPRA
	dc.l	12574721
	public	_QueueHead
	cnop	0,4
_QueueHead
	dc.l	0
	public	_QueueTail
	cnop	0,4
_QueueTail
	dc.l	0
	public	_printf
	public	_rand
	public	_SysBase
	public	_oldmode
	section	"BSS",bss
	cnop	0,4
_oldmode
	ds.b	2
	public	_oldbuffer
	cnop	0,4
_oldbuffer
	ds.b	4
	public	_newmode
	cnop	0,4
_newmode
	ds.b	2
	public	_rawbuffer
	cnop	0,4
_rawbuffer
	ds.b	4
	public	_newbuffer
	cnop	0,4
_newbuffer
	ds.b	4
	public	_memsize
	cnop	0,4
_memsize
	ds.b	4
	public	_x
	cnop	0,4
_x
	ds.b	2
	public	_y
	cnop	0,4
_y
	ds.b	2
	public	_i
	cnop	0,4
_i
	ds.b	2
	public	_MaxIter
	cnop	0,4
_MaxIter
	ds.b	2
	public	_resx
	cnop	0,4
_resx
	ds.b	2
	public	_resy
	cnop	0,4
_resy
	ds.b	2
	public	_xn
	cnop	0,4
_xn
	ds.b	8
	public	_yn
	cnop	0,4
_yn
	ds.b	8
	public	_xn1
	cnop	0,4
_xn1
	ds.b	8
	public	_yn1
	cnop	0,4
_yn1
	ds.b	8
	public	_cx
	cnop	0,4
_cx
	ds.b	8
	public	_cy
	cnop	0,4
_cy
	ds.b	8
	public	_d
	cnop	0,4
_d
	ds.b	8
	public	_stepr
	cnop	0,4
_stepr
	ds.b	8
	public	_stepi
	cnop	0,4
_stepi
	ds.b	8
	public	_maxr
	cnop	0,4
_maxr
	ds.b	8
	public	_minr
	cnop	0,4
_minr
	ds.b	8
	public	_maxi
	cnop	0,4
_maxi
	ds.b	8
	public	_mini
	cnop	0,4
_mini
	ds.b	8
	public	_Data
	cnop	0,4
_Data
	ds.b	4
	public	_Done
	cnop	0,4
_Done
	ds.b	4
	public	_Queue
	cnop	0,4
_Queue
	ds.b	4
	public	_DataSize
	cnop	0,4
_DataSize
	ds.b	4
	public	_DoneSize
	cnop	0,4
_DoneSize
	ds.b	4
	public	_QueueSize
	cnop	0,4
_QueueSize
	ds.b	4
	public	_p
	cnop	0,4
_p
	ds.b	4
	public	_flag
	cnop	0,4
_flag
	ds.b	2
	public	_IterP1
	cnop	0,4
_IterP1
	ds.b	2
	public	_IterP2
	cnop	0,4
_IterP2
	ds.b	2
	public	_IterP3
	cnop	0,4
_IterP3
	ds.b	2
	public	_IterP4
	cnop	0,4
_IterP4
	ds.b	2
	public	_WordLoaded
	cnop	0,4
_WordLoaded
	ds.b	2
	public	_LongLoaded
	cnop	0,4
_LongLoaded
	ds.b	4
	public	_colorl
	cnop	0,4
_colorl
	ds.b	4
	public	_colorw
	cnop	0,4
_colorw
	ds.b	2
	public	_colorb
	cnop	0,4
_colorb
	ds.b	1
	public	_nbytes
	cnop	0,4
_nbytes
	ds.b	4
	public	_nwords
	cnop	0,4
_nwords
	ds.b	4
	public	_nlong
	cnop	0,4
_nlong
	ds.b	4
	public	_rbytes
	cnop	0,4
_rbytes
	ds.b	4
	public	_rwords
	cnop	0,4
_rwords
	ds.b	4
	public	_p1
	cnop	0,4
_p1
	ds.b	4
	public	_Set8BitMode
	public	_RestoreMode
	public	_SetColor
	public	_Put8BitPixel
	public	_WaitMouse
	public	_SetStart
	public	_SetStop
	public	_GetStart
	public	_GetStop
	public	_MultiTaskOff
	public	_MultiTaskOn
	public	_MouseOff
	public	_MouseOn
	public	_SingleIterateAsm
	public	___inline
	cnop	0,4
___inline
	ds.b	4
	section	"CODE",code
	cnop	0,4
l150
	dc.b	69
	dc.b	120
	dc.b	101
	dc.b	99
	dc.b	117
	dc.b	116
	dc.b	105
	dc.b	111
	dc.b	110
	dc.b	32
	dc.b	116
	dc.b	105
	dc.b	109
	dc.b	101
	dc.b	32
	dc.b	40
	dc.b	37
	dc.b	100
	dc.b	120
	dc.b	32
	dc.b	99
	dc.b	111
	dc.b	114
	dc.b	101
	dc.b	41
	dc.b	58
	dc.b	32
	dc.b	37
	dc.b	117
	dc.b	46
	dc.b	37
	dc.b	48
	dc.b	52
	dc.b	117
	dc.b	32
	dc.b	115
	dc.b	101
	dc.b	99
	dc.b	111
	dc.b	110
	dc.b	100
	dc.b	115
	dc.b	10
	dc.b	0
