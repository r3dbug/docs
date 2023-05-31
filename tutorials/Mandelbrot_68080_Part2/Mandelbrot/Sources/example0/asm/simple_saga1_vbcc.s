	idnt	"simple_saga1.c"
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_Set8BitMode
	cnop	0,4
_Set8BitMode
	movem.l	l87,-(a7)
	move.l	_SAGAMODER,a0
	move.w	(a0),_oldmode
	move.l	_SAGAPTRR,a0
	move.l	(a0),_oldbuffer
	moveq	#0,d0
	move.w	(10+l89,a7),d0
	moveq	#0,d1
	move.w	(14+l89,a7),d1
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
	move.w	(6+l89,a7),_newmode
	move.l	_SAGAMODEW,a0
	move.w	(6+l89,a7),(a0)
	move.l	_SAGAPTRW,a0
	move.l	d0,(a0)
	move.w	(10+l89,a7),_resx
	move.w	(14+l89,a7),_resy
	move.l	_newbuffer,d0
l1
l87	reg	a6/d2/d3
	movem.l	(a7)+,a6/d2/d3
l89	equ	12
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_RestoreMode
	cnop	0,4
_RestoreMode
	movem.l	l90,-(a7)
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
l90	reg	a6
	movem.l	(a7)+,a6
l92	equ	4
	rts
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_Put8BitPixel
	cnop	0,4
_Put8BitPixel
	movem.l	l93,-(a7)
	move.l	_newbuffer,a0
	moveq	#0,d0
	move.w	(10+l95,a7),d0
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
	move.w	(6+l95,a7),d0
	move.b	(15+l95,a7),(0,a0,d0.l)
l93	reg	d2/d3
	movem.l	(a7)+,d2/d3
l95	equ	8
	rts
; stacksize=8
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_SetColor
	cnop	0,4
_SetColor
	movem.l	l96,-(a7)
	moveq	#24,d1
	move.l	(4+l98,a7),d0
	lsl.l	d1,d0
	moveq	#16,d2
	move.l	(8+l98,a7),d1
	lsl.l	d2,d1
	or.l	d1,d0
	move.l	(12+l98,a7),d1
	lsl.l	#8,d1
	or.l	d1,d0
	move.l	_SAGACOLORW,a0
	or.l	(16+l98,a7),d0
	move.l	d0,(a0)
l96	reg	d2
	movem.l	(a7)+,d2
l98	equ	4
	rts
; stacksize=4
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_WaitMouse
	cnop	0,4
_WaitMouse
	sub.w	#12,a7
	movem.l	l99,-(a7)
	move.l	#12574721,a0
	moveq	#64,d0
	and.b	(a0),d0
	move.b	d0,(8+l101,a7)
	moveq	#0,d0
	move.b	(8+l101,a7),d0
	move.l	d0,(0+l101,a7)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(4+l101,a7)
	moveq	#64,d0
	move.l	d0,d1
	and.l	(4+l101,a7),d1
	move.l	d1,(4+l101,a7)
	move.l	(0+l101,a7),d0
	cmp.l	(4+l101,a7),d0
	bne	l48
l47
	moveq	#0,d0
	move.b	(8+l101,a7),d0
	move.l	d0,(0+l101,a7)
	moveq	#0,d0
	move.b	(a0),d0
	move.l	d0,(4+l101,a7)
	moveq	#64,d0
	move.l	d0,d1
	and.l	(4+l101,a7),d1
	move.l	d1,(4+l101,a7)
	move.l	(0+l101,a7),d0
	cmp.l	(4+l101,a7),d0
	beq	l47
l48
l99	reg
l101	equ	0
	add.w	#12,a7
	rts
; stacksize=12
	fpu	1
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_main
	cnop	0,4
_main
	movem.l	l102,-(a7)
	move.w	#255,d5
	move.l	#12574721,a2
	move.l	_SAGAMODER,a3
	move.w	(a3),_oldmode
	move.l	_SAGAPTRR,a3
	move.l	(a3),_oldbuffer
	move.l	#921616,_memsize
	move.l	_SysBase,a6
	move.l	#921616,d0
	move.l	#65536,d1
	jsr	-198(a6)
	move.l	d0,_rawbuffer
	bne	l55
	move.l	#0,a0
	bra	l52
l55
	moveq	#16,d0
	add.l	_rawbuffer,d0
	and.l	#4294967280,d0
	move.l	d0,_newbuffer
	move.w	#2561,_newmode
	move.l	_SAGAMODEW,a3
	move.w	_newmode,(a3)
	move.l	_SAGAPTRW,a3
	move.l	d0,(a3)
	move.w	#1280,_resx
	move.w	#720,_resy
	move.l	_newbuffer,a0
l52
	move.l	a0,_newbuffer
	bne	l21
	moveq	#1,d0
	bra	l18
l21
	move.l	_SAGACOLORW,a3
	move.l	#0,(a3)
	moveq	#1,d4
l76
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
	move.l	_SAGACOLORW,a3
	or.l	d2,d0
	move.l	d0,(a3)
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
	move.l	_SAGACOLORW,a3
	or.l	d2,d0
	move.l	d0,(a3)
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
	move.l	_SAGACOLORW,a3
	or.l	d2,d0
	move.l	d0,(a3)
	addq.w	#1,d4
	cmp.w	d4,d5
	bcc	l76
	move.w	#0,_y
	move.w	_y,d3
	cmp.w	_resy,d3
	bcc	l81
l77
	move.w	#0,_x
	move.w	_x,d3
	cmp.w	_resx,d3
	bcc	l82
l78
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
	bcs	l78
l82
	moveq	#1,d0
	add.w	_y,d0
	move.w	d0,_y
	cmp.w	_resy,d0
	bcs	l77
l81
	moveq	#64,d2
	and.b	(a2),d2
	moveq	#0,d1
	move.b	d2,d1
	moveq	#0,d0
	move.b	(a2),d0
	and.l	#64,d0
	cmp.l	d1,d0
	bne	l83
l79
	moveq	#0,d1
	move.b	d2,d1
	moveq	#0,d0
	move.b	(a2),d0
	and.l	#64,d0
	cmp.l	d1,d0
	beq	l79
l83
	move.l	_SAGAMODEW,a3
	move.w	_oldmode,(a3)
	move.l	_SAGAPTRW,a3
	move.l	_oldbuffer,(a3)
	tst.l	_rawbuffer
	beq	l67
	move.l	_memsize,d0
	move.l	_rawbuffer,a1
	move.l	_SysBase,a6
	jsr	-210(a6)
l67
	moveq	#0,d0
l18
l102	reg	a2/a3/a6/d2/d3/d4/d5/d6/d7
	movem.l	(a7)+,a2/a3/a6/d2/d3/d4/d5/d6/d7
l104	equ	36
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
