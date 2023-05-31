	idnt	"simple_saga0.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_Set8BitMode
	cnop	0,4
_Set8BitMode
	movem.l	l67,-(a7)
	move.l	_SAGAMODER,a0
	move.w	(a0),_oldmode
	move.l	_SAGAPTRR,a0
	move.l	(a0),_oldbuffer
	moveq	#0,d0
	move.w	(10+l69,a7),d0
	moveq	#0,d1
	move.w	(14+l69,a7),d1
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
	add.l	#16,d0
	move.l	d0,_memsize
	move.l	_memsize,d0
	move.l	_SysBase,a6
	move.l	#65536,d1
	jsr	-198(a6)
	move.l	d0,_rawbuffer
	bne	l4
	moveq	#0,d0
	bra	l1
l4
	moveq	#16,d0
	add.l	_rawbuffer,d0
	and.l	#4294967280,d0
	move.l	d0,_newbuffer
	move.w	(6+l69,a7),_newmode
	move.l	_SAGAMODEW,a0
	move.w	(6+l69,a7),(a0)
	move.l	_SAGAPTRW,a0
	move.l	d0,(a0)
	move.w	(10+l69,a7),_resx
	move.w	(14+l69,a7),_resy
	move.l	_newbuffer,d0
l1
l67	reg	a6/d2/d3
	movem.l	(a7)+,a6/d2/d3
l69	equ	12
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_RestoreMode
	cnop	0,4
_RestoreMode
	movem.l	l70,-(a7)
	move.l	_SAGAMODEW,a0
	move.w	_oldmode,(a0)
	move.l	_SAGAPTRW,a0
	move.l	_oldbuffer,(a0)
	tst.l	_rawbuffer
	beq	l8
	move.l	_memsize,d0
	move.l	_rawbuffer,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l8
l70	reg	a6
	movem.l	(a7)+,a6
l72	equ	4
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_Put8BitPixel
	cnop	0,4
_Put8BitPixel
	movem.l	l73,-(a7)
	move.l	_newbuffer,a0
	moveq	#0,d0
	move.w	(10+l75,a7),d0
	moveq	#0,d1
	move.w	_resx,d1
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
	add.l	d0,a0
	moveq	#0,d0
	move.w	(6+l75,a7),d0
	move.b	(15+l75,a7),(0,a0,d0.l)
l73	reg	d2/d3
	movem.l	(a7)+,d2/d3
l75	equ	8
	rts
; stacksize=8
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SetColor
	cnop	0,4
_SetColor
	movem.l	l76,-(a7)
	moveq	#24,d1
	move.l	(4+l78,a7),d0
	lsl.l	d1,d0
	moveq	#16,d2
	move.l	(8+l78,a7),d1
	lsl.l	d2,d1
	or.l	d1,d0
	move.l	(12+l78,a7),d1
	lsl.l	#8,d1
	or.l	d1,d0
	move.l	_SAGACOLORW,a0
	or.l	(16+l78,a7),d0
	move.l	d0,(a0)
l76	reg	d2
	movem.l	(a7)+,d2
l78	equ	4
	rts
; stacksize=4
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_main
	cnop	0,4
_main
	movem.l	l79,-(a7)
	move.w	#255,d5
	move.l	_SAGAMODER,a2
	move.w	(a2),_oldmode
	move.l	_SAGAPTRR,a2
	move.l	(a2),_oldbuffer
	move.l	#921616,_memsize
	move.l	_SysBase,a6
	move.l	#921616,d0
	move.l	#65536,d1
	jsr	-198(a6)
	move.l	d0,_rawbuffer
	bne	l44
	move.l	#0,a0
	bra	l41
l44
	moveq	#16,d0
	add.l	_rawbuffer,d0
	and.l	#4294967280,d0
	move.l	d0,_newbuffer
	move.w	#2561,_newmode
	move.l	_SAGAMODEW,a2
	move.w	_newmode,(a2)
	move.l	_SAGAPTRW,a2
	move.l	d0,(a2)
	move.w	#1280,_resx
	move.w	#720,_resy
	move.l	_newbuffer,a0
l41
	move.l	a0,_newbuffer
	bne	l16
	moveq	#1,d0
	bra	l13
l16
	move.l	_SAGACOLORW,a2
	move.l	#0,(a2)
	moveq	#1,d4
l58
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
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	moveq	#24,d6
	lsl.l	d6,d0
	moveq	#16,d6
	lsl.l	d6,d1
	or.l	d1,d0
	move.l	d3,d1
	lsl.l	#8,d1
	or.l	d1,d0
	move.l	_SAGACOLORW,a2
	or.l	d2,d0
	move.l	d0,(a2)
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
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	moveq	#24,d6
	lsl.l	d6,d0
	moveq	#16,d6
	lsl.l	d6,d1
	or.l	d1,d0
	move.l	d3,d1
	lsl.l	#8,d1
	or.l	d1,d0
	move.l	_SAGACOLORW,a2
	or.l	d2,d0
	move.l	d0,(a2)
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
	move.l	d0,d1
	opt	om-
	movem.l	(a7)+,d0
	opt	om+
	moveq	#0,d0
	move.w	d4,d0
	moveq	#24,d6
	lsl.l	d6,d0
	moveq	#16,d6
	lsl.l	d6,d1
	or.l	d1,d0
	move.l	d3,d1
	lsl.l	#8,d1
	or.l	d1,d0
	move.l	_SAGACOLORW,a2
	or.l	d2,d0
	move.l	d0,(a2)
	addq.w	#1,d4
	cmp.w	d4,d5
	bcc	l58
	move.w	#0,_y
	move.w	_y,d2
	cmp.w	_resy,d2
	bcc	l62
l59
	move.w	#0,_x
	move.w	_x,d2
	cmp.w	_resx,d2
	bcc	l63
l60
	moveq	#0,d0
	move.w	_y,d0
	move.l	a1,-(a7)
	move.l	#256,-(a7)
	move.l	d0,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	(a7)+,a1
	move.w	_y,d2
	move.w	_x,d1
	move.l	_newbuffer,a0
	and.l	#65535,d2
	moveq	#0,d3
	move.w	_resx,d3
	move.l	d2,d6
	move.l	d3,d7
	swap	d6
	swap	d7
	mulu.w	d3,d6
	mulu.w	d2,d7
	mulu.w	d3,d2
	add.w	d7,d6
	swap	d6
	clr.w	d6
	add.l	d6,d2
	add.l	d2,a0
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	cmp.w	_resx,d0
	bcs	l60
l63
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l59
l62
	move.l	_SAGAMODEW,a2
	move.w	_oldmode,(a2)
	move.l	_SAGAPTRW,a2
	move.l	_oldbuffer,(a2)
	tst.l	_rawbuffer
	beq	l51
	move.l	_memsize,d0
	move.l	_rawbuffer,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l51
	moveq	#0,d0
l13
l79	reg	a2/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a6/d2/d3/d4/d5/d6/d7
l81	equ	32
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
	public	_resx
	cnop	0,4
_resx
	ds.b	2
	public	_resy
	cnop	0,4
_resy
	ds.b	2
