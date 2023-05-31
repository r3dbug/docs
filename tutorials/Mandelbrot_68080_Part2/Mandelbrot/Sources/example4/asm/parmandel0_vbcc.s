	idnt	"parmandel0.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_GetTime
	cnop	0,4
_GetTime
	fmovem.x	l60,-(a7)
	movem.l	l59,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	fmove.l	d0,fp0
	fmul.d	#$401c600a7c5ac472,fp0
	fmul.d	#$412e848000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l62
	fintrz	fp0
	fmove.l	fp0,d4
	bra	l63
l62:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d4
	bchg	#31,d4
l63:
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
	bge.s	l64
	fadd.d	#4294967296,fp1
l64:
	fmove.l	d4,fp0
	tst.l	d4
	bge.s	l65
	fadd.d	#4294967296,fp0
l65:
	fmove.x	fp0,fp2
	fmove.x	fp1,fp0
	fdiv.x	fp2,fp0
l59	reg	d2/d3/d4
	movem.l	(a7)+,d2/d3/d4
l60	freg	fp2
	fmovem.x	(a7)+,l60
l61	equ	24
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_main
	cnop	0,4
_main
	subq.w	#8,a7
	fmovem.x	l67,-(a7)
	movem.l	l66,-(a7)
	move.l	#2561,d0
	move.l	#1280,d1
	move.l	#720,d2
	jsr	_Set8BitMode
	move.l	d0,_newbuffer
	bne	l9
	moveq	#1,d0
	bra	l6
l9
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
l38
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	fmove.x	fp0,-(a7)
	fmove.x	fp1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	fmove.x	(a7)+,fp1
	fmove.x	(a7)+,fp0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	cmp.w	d4,d5
	bcc	l38
	jsr	_SetStart
	move.w	#0,_y
	move.w	_y,d7
	cmp.w	_resy,d7
	bcc	l45
l42
	move.w	#0,_x
	move.w	_x,d7
	cmp.w	_resx,d7
	bcc	l46
l43
	moveq	#0,d0
	move.w	_y,d0
	fmove.l	d0,fp1
	fmul.d	_stepi,fp1
	fadd.d	_mini,fp1
	fmove.d	fp1,_y1
	moveq	#0,d0
	move.w	_x,d0
	fmove.l	d0,fp0
	fmul.d	_stepr,fp0
	fadd.d	_minr,fp0
	fmove.d	fp0,_x1
	moveq	#0,d0
	move.w	_MaxIter,d0
	jsr	_SingleIterateAsm
	moveq	#0,d2
	move.w	d0,d2
	moveq	#0,d1
	move.w	_y,d1
	moveq	#0,d0
	move.w	_x,d0
	jsr	_Put8BitPixel
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	cmp.w	_resx,d0
	bcs	l43
l46
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l42
l45
	jsr	_SetStop
	jsr	_WaitMouseUp
	jsr	_MouseOn
	jsr	_MultiTaskOn
	jsr	_RestoreMode
	moveq	#0,d7
	move.b	14676989,d7
	fmove.l	d7,fp0
	fmul.d	#$401c600a7c5ac472,fp0
	fmul.d	#$412e848000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l69
	fintrz	fp0
	fmove.l	fp0,d7
	bra	l70
l69:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d7
	bchg	#31,d7
l70:
	move.l	d7,(0+l68,a7)
	jsr	_GetStart
	move.l	d0,d6
	jsr	_GetStop
	move.l	d0,d5
	cmp.l	d5,d6
	bcc	l33
	move.l	d5,d7
	sub.l	d6,d7
	move.l	d7,(4+l68,a7)
	bra	l34
l33
	move.l	d6,d0
	sub.l	d5,d0
	move.l	#4294967295,d7
	sub.l	d0,d7
	move.l	d7,(4+l68,a7)
l34
	fmove.l	(4+l68,a7),fp0
	tst.l	(4+l68,a7)
	bge.s	l71
	fadd.d	#4294967296,fp0
l71:
	fmove.l	(0+l68,a7),fp1
	tst.l	(0+l68,a7)
	bge.s	l72
	fadd.d	#4294967296,fp1
l72:
	fmove.x	fp1,fp2
	fmove.x	fp0,fp1
	fdiv.x	fp2,fp1
	fmove.x	fp1,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l73
	fintrz	fp0
	fmove.l	fp0,d0
	bra	l74
l73:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d0
	bchg	#31,d0
l74:
	fmove.l	d0,fp0
	tst.l	d0
	bge.s	l75
	fadd.d	#4294967296,fp0
l75:
	fneg.x	fp0
	fadd.x	fp1,fp0
	fmul.d	#$40c3880000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l76
	fintrz	fp0
	fmove.l	fp0,d1
	bra	l77
l76:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d1
	bchg	#31,d1
l77:
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	move.l	d0,-(a7)
	pea	l22
	jsr	_printf
	moveq	#0,d0
	add.w	#16,a7
l6
l66	reg	d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,d2/d3/d4/d5/d6/d7
l67	freg	fp2
	fmovem.x	(a7)+,l67
l68	equ	36
	addq.w	#8,a7
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
	public	_printf
	public	_rand
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
	public	_resx
	cnop	0,4
_resx
	ds.b	2
	public	_resy
	cnop	0,4
_resy
	ds.b	2
	public	_i
	cnop	0,4
_i
	ds.b	2
	public	_MaxIter
	cnop	0,4
_MaxIter
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
	public	_x1
	cnop	0,4
_x1
	ds.b	8
	public	_y1
	cnop	0,4
_y1
	ds.b	8
	public	_x2
	cnop	0,4
_x2
	ds.b	8
	public	_y2
	cnop	0,4
_y2
	ds.b	8
	public	_x3
	cnop	0,4
_x3
	ds.b	8
	public	_y3
	cnop	0,4
_y3
	ds.b	8
	public	_x4
	cnop	0,4
_x4
	ds.b	8
	public	_y4
	cnop	0,4
_y4
	ds.b	8
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
	public	_Set8BitMode
	public	_RestoreMode
	public	_SetColor
	public	_Put8BitPixel
	public	_WaitMouseUp
	public	_SetStart
	public	_SetStop
	public	_GetStart
	public	_GetStop
	public	_MultiTaskOff
	public	_MultiTaskOn
	public	_MouseOff
	public	_MouseOn
	public	_SingleIterateAsm
	section	"CODE",code
	cnop	0,4
l22
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
