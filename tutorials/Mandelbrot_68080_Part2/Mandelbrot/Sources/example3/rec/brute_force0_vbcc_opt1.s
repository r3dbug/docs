	idnt	"brute_force0.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_GetTime
	cnop	0,4
_GetTime
	fmovem.x	l73,-(a7)
	movem.l	l72,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	fmove.l	d0,fp0
	fmul.d	#$401c600a7c5ac472,fp0
	fmul.d	#$412e848000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l75
	fintrz	fp0
	fmove.l	fp0,d4
	bra	l76
l75:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d4
	bchg	#31,d4
l76:
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
	bge.s	l77
	fadd.d	#4294967296,fp1
l77:
	fmove.l	d4,fp0
	tst.l	d4
	bge.s	l78
	fadd.d	#4294967296,fp0
l78:
	fmove.x	fp0,fp2
	fmove.x	fp1,fp0
	fdiv.x	fp2,fp0
l72	reg	d2/d3/d4
	movem.l	(a7)+,d2/d3/d4
l73	freg	fp2
	fmovem.x	(a7)+,l73
l74	equ	24
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_main
	cnop	0,4
_main
	sub.w	#16,a7
	fmovem.x	l80,-(a7)
	movem.l	l79,-(a7)
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
l48
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d3
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	jsr	_rand
	move.l	d0,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	jsr	_SetColor
	addq.w	#1,d4
	cmp.w	d4,d5
	bcc	l48
	jsr	_SetStart
	move.w	#0,_y
	move.w	_y,d7
	cmp.w	_resy,d7
	bcc	l57
l53
	move.w	#0,_x
	move.w	_x,d7
	cmp.w	_resx,d7
	bcc	l58
l54
	move.l	#$00000000,_xn
	move.l	#$00000000,4+_xn
	move.l	4+_xn,4+_xn1
	move.l	_xn,_xn1
	move.l	#$00000000,_yn
	move.l	#$00000000,4+_yn
	move.l	4+_yn,4+_yn1
	move.l	_yn,_yn1
	moveq	#0,d7
	move.w	_y,d7
	fmove.l	d7,fp0
	fmul.d	_stepi,fp0
	fadd.d	_mini,fp0
	fmove.d	fp0,(0+l81,a7)
	move.l	(4+l81,a7),4+_cy
	move.l	(0+l81,a7),_cy
	moveq	#0,d7
	move.w	_x,d7
	fmove.l	d7,fp0
	fmul.d	_stepr,fp0
	fmove.d	_minr,fp6
	fadd.x	fp0,fp6
	fmove.d	fp6,_cx
	move.w	_MaxIter,_i
	beq	l24
	fmove.d	_xn1,fp4
	fmove.d	_yn1,fp3
	fmove.x	fp3,fp0
	fadd.x	fp4,fp0
	fmove.d	fp6,(8+l81,a7)
	fcmp.d	#$4010000000000000,fp0
	fbgt	l24
	fmove.d	_xn,fp6
	move.w	_i,d4
l51
	fmove.x	fp6,fp0
	fmul.d	#$4000000000000000,fp0
	fmul.d	_yn,fp0
	fadd.d	(0+l81,a7),fp0
	fmove.d	fp0,_yn
	fmove.x	fp4,fp1
	fsub.x	fp3,fp1
	fadd.d	(8+l81,a7),fp1
	fmove.x	fp1,fp6
	fmove.x	fp1,fp2
	fmul.x	fp1,fp2
	fmove.d	fp2,_xn1
	fmove.x	fp0,fp5
	fmul.x	fp0,fp5
	fmove.d	fp5,_yn1
	move.w	d4,d0
	subq.w	#1,d0
	move.w	d0,d4
	tst.w	d0
	beq	l59
	fmove.x	fp2,fp4
	fmove.x	fp5,fp3
	fmove.x	fp5,fp0
	fadd.x	fp2,fp0
	fcmp.d	#$4010000000000000,fp0
	fble	l51
l59
	move.w	d4,_i
	fmove.d	fp6,_xn
l24
;	moveq	#0,d2
;	move.w	_i,d2
;	move.l	#256,-(a7)
;	move.l	d2,-(a7)
;	public	__ldivs
;	jsr	__ldivs
;	addq.w	#8,a7
;	move.l	d1,d0
;	move.l	d0,d2

;   optimize modulo function call

	clr.l   d2
	move.b  _i+1,d2
	
;   end of optimization

	moveq	#0,d1
	move.w	_y,d1
	moveq	#0,d0
	move.w	_x,d0
	jsr	_Put8BitPixel
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	cmp.w	_resx,d0
	bcs	l54
l58
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l53
l57
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
	fbge	l82
	fintrz	fp0
	fmove.l	fp0,d7
	bra	l83
l82:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d7
	bchg	#31,d7
l83:
	move.l	d7,(0+l81,a7)
	jsr	_GetStart
	move.l	d0,d6
	jsr	_GetStop
	move.l	d0,d5
	cmp.l	d5,d6
	bcc	l38
	move.l	d5,d7
	sub.l	d6,d7
	move.l	d7,(8+l81,a7)
	bra	l39
l38
	move.l	d6,d0
	sub.l	d5,d0
	move.l	#4294967295,d7
	sub.l	d0,d7
	move.l	d7,(8+l81,a7)
l39
	fmove.l	(8+l81,a7),fp0
	tst.l	(8+l81,a7)
	bge.s	l84
	fadd.d	#4294967296,fp0
l84:
	fmove.l	(0+l81,a7),fp1
	tst.l	(0+l81,a7)
	bge.s	l85
	fadd.d	#4294967296,fp1
l85:
	fmove.x	fp1,fp7
	fmove.x	fp0,fp1
	fdiv.x	fp7,fp1
	fmove.x	fp1,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l86
	fintrz	fp0
	fmove.l	fp0,d0
	bra	l87
l86:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d0
	bchg	#31,d0
l87:
	fmove.l	d0,fp0
	tst.l	d0
	bge.s	l88
	fadd.d	#4294967296,fp0
l88:
	fneg.x	fp0
	fadd.x	fp1,fp0
	fmul.d	#$40c3880000000000,fp0
	fcmp.d	#$41e0000000000000,fp0
	fbge	l89
	fintrz	fp0
	fmove.l	fp0,d1
	bra	l90
l89:
	fsub.d	#$41e0000000000000,fp0
	fintrz	fp0
	fmove.l	fp0,d1
	bchg	#31,d1
l90:
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	moveq	#0,d0
	move.b	14676989,d0
	move.l	d0,-(a7)
	pea	l27
	jsr	_printf
	moveq	#0,d0
	add.w	#16,a7
l6
l79	reg	d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,d2/d3/d4/d5/d6/d7
l80	freg	fp2/fp3/fp4/fp5/fp6/fp7
	fmovem.x	(a7)+,l80
l81	equ	96
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
	section	"CODE",code
	cnop	0,4
l27
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
