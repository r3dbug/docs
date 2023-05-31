	idnt	"saga_main1.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	movem.l	l32,-(a7)
	move.w	#255,d5
	move.l	#2561,d0
	move.l	#1280,d1
	move.l	#720,d2
	jsr	_Set8BitMode
	move.l	d0,_newbuffer
	bne	l4
	moveq	#1,d0
	bra	l1
l4
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	moveq	#0,d3
	jsr	_SetColor
	moveq	#1,d4
l23
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
	bcc	l23
	move.w	#0,_y
	move.w	_y,d6
	cmp.w	_resy,d6
	bcc	l27
l24
	move.w	#0,_x
	move.w	_x,d6
	cmp.w	_resx,d6
	bcc	l28
l25
	moveq	#0,d2
	move.w	_y,d2
	move.l	#256,-(a7)
	move.l	d2,-(a7)
	public	__ldivs
	jsr	__ldivs
	addq.w	#8,a7
	move.l	d1,d0
	move.l	d0,d2
	moveq	#0,d1
	move.w	_y,d1
	moveq	#0,d0
	move.w	_x,d0
	jsr	_Put8BitPixel
	moveq	#1,d0
	add.w	_x,d0
	move.w	d0,_x
	cmp.w	_resx,d0
	bcs	l25
l28
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l24
l27
	jsr	_WaitMouseUp
	jsr	_RestoreMode
	moveq	#0,d0
l1
l32	reg	d2/d3/d4/d5/d6
	movem.l	(a7)+,d2/d3/d4/d5/d6
l34	equ	20
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
	public	_Set8BitMode
	public	_RestoreMode
	public	_SetColor
	public	_Put8BitPixel
	public	_WaitMouseUp
