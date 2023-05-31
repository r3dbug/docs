#NO_APP
	.globl	_SAGAMODEW
	.data
	.align	2
_SAGAMODEW:
	.long	14676468
	.globl	_SAGAMODER
	.align	2
_SAGAMODER:
	.long	14672372
	.globl	_SAGAPTRW
	.align	2
_SAGAPTRW:
	.long	14676460
	.globl	_SAGAPTRR
	.align	2
_SAGAPTRR:
	.long	14672364
	.globl	_SAGACOLORW
	.align	2
_SAGACOLORW:
	.long	14676872
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
	.text
	.align	2
	.globl	_Set8BitMode
_Set8BitMode:
	movem.l a6/d4/d3/d2,-(sp)
	move.l (20,sp),d4
	move.l (24,sp),d3
	move.l (28,sp),d2
	move.w ([_SAGAMODER]),_oldmode
	move.l ([_SAGAPTRR]),_oldbuffer
	move.w d3,d0
	mulu.w d2,d0
	moveq #16,d1
	add.l d1,d0
	move.l d0,_memsize
	moveq #1,d1
	swap d1
	move.l _SysBase,a6
#APP
| 44 "simple_saga1.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_rawbuffer
	jeq .L1
	moveq #16,d1
	add.l d1,d0
	moveq #-16,d1
	and.l d1,d0
	move.l d0,_newbuffer
	move.w d4,_newmode
	move.w d4,([_SAGAMODEW])
	move.l d0,([_SAGAPTRW])
	move.w d3,_resx
	move.w d2,_resy
	move.l _newbuffer,d0
.L1:
	movem.l (sp)+,d2/d3/d4/a6
	rts
	.align	2
	.globl	_RestoreMode
_RestoreMode:
	move.l a6,-(sp)
	move.w _oldmode,([_SAGAMODEW])
	move.l _oldbuffer,([_SAGAPTRW])
	move.l _rawbuffer,a1
	move.l a1,d0
	jeq .L4
	move.l _memsize,d0
	move.l _SysBase,a6
#APP
| 60 "simple_saga1.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L4:
	move.l (sp)+,a6
	rts
	.align	2
	.globl	_Put8BitPixel
_Put8BitPixel:
	move.w (10,sp),d0
	mulu.w _resx,d0
	clr.l d1
	move.w (6,sp),d1
	add.l d1,d0
	move.b (15,sp),([_newbuffer],d0.l)
	rts
	.align	2
	.globl	_SetColor
_SetColor:
	move.l d2,-(sp)
	lea (8,sp),a0
	move.l (a0)+,d1
	move.l (a0)+,d2
	move.l (a0)+,d0
	lsl.l #8,d0
	or.l (a0),d0
	swap d2
	clr.w d2
	or.l d2,d0
	moveq #24,d2
	lsl.l d2,d1
	or.l d1,d0
	move.l d0,([_SAGACOLORW])
	move.l (sp)+,d2
	rts
	.align	2
	.globl	_WaitMouse
_WaitMouse:
	subq.l #4,sp
	move.l #12574721,a0
	move.b (a0),d0
	and.b #64,d0
	move.b d0,(3,sp)
.L12:
	move.b (3,sp),d1
	move.b (a0),d0
	and.b #64,d0
	cmp.b d0,d1
	jeq .L12
	addq.l #4,sp
	rts
	.section .text
	.align	2
	.globl	_main
_main:
	movem.l a3/a2/d4/d3/d2,-(sp)
	pea 720.w
	pea 1280.w
	pea 2561.w
	jsr _Set8BitMode
	move.l d0,_newbuffer
	add.w #12,sp
	jeq .L24
	clr.l ([_SAGACOLORW])
	moveq #1,d4
	lea _rand,a2
	lea _SetColor,a3
.L19:
	jsr (a2)
	move.l d0,d3
	jsr (a2)
	move.l d0,d2
	jsr (a2)
	and.l #-2147483393,d3
	jge .L16
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L16:
	move.l d3,-(sp)
	and.l #-2147483393,d2
	jge .L17
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L17:
	move.l d2,-(sp)
	and.l #-2147483393,d0
	jge .L18
	subq.l #1,d0
	moveq #-1,d1
	not.b d1
	or.l d1,d0
	addq.l #1,d0
.L18:
	move.l d0,-(sp)
	move.l d4,-(sp)
	jsr (a3)
	addq.l #1,d4
	add.w #16,sp
	cmp.l #256,d4
	jne .L19
	clr.w _y
	lea _Put8BitPixel,a2
	jra .L20
.L23:
	clr.w _x
	jra .L21
.L22:
	move.w _y,d1
	clr.l d2
	move.b d1,d2
	move.l d2,-(sp)
	move.w d1,-(sp)
	clr.w -(sp)
	move.w d0,-(sp)
	clr.w -(sp)
	jsr (a2)
	addq.w #1,_x
	add.w #12,sp
.L21:
	move.w _x,d0
	cmp.w _resx,d0
	jcs .L22
	addq.w #1,_y
.L20:
	move.w _resy,d0
	cmp.w _y,d0
	jhi .L23
	jsr _WaitMouse
	jsr _RestoreMode
	clr.l d0
	jra .L14
.L24:
	moveq #1,d0
.L14:
	movem.l (sp)+,d2/d3/d4/a2/a3
	rts
