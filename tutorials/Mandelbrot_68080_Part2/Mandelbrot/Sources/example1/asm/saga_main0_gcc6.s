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
	.globl	_CIAAPRA
	.align	2
_CIAAPRA:
	.long	12574721
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
	move.l _CIAAPRA,a0
	move.b (a0),d0
	and.b #64,d0
	move.b d0,(3,sp)
.L4:
	move.b (3,sp),d1
	move.b (a0),d0
	and.b #64,d0
	cmp.b d1,d0
	jeq .L4
	addq.l #4,sp
	rts
	.section .text
	.align	2
	.globl	_main
_main:
	movem.l a3/a2/d4/d3/d2,-(sp)
	move.l #720,d2
	move.l #1280,d1
	move.l #2561,d0
	jsr _Set8BitMode
	move.l d0,_newbuffer
	jeq .L16
	clr.l ([_SAGACOLORW])
	moveq #1,d4
	lea _rand,a2
	lea _SetColor,a3
.L11:
	jsr (a2)
	move.l d0,d3
	jsr (a2)
	move.l d0,d2
	jsr (a2)
	and.l #-2147483393,d3
	jge .L8
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L8:
	move.l d3,-(sp)
	and.l #-2147483393,d2
	jge .L9
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L9:
	move.l d2,-(sp)
	and.l #-2147483393,d0
	jge .L10
	subq.l #1,d0
	moveq #-1,d1
	not.b d1
	or.l d1,d0
	addq.l #1,d0
.L10:
	move.l d0,-(sp)
	move.l d4,-(sp)
	jsr (a3)
	addq.l #1,d4
	add.w #16,sp
	cmp.l #256,d4
	jne .L11
	clr.w _y
	lea _Put8BitPixel,a2
	jra .L12
.L15:
	clr.w _x
	jra .L13
.L14:
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
.L13:
	move.w _x,d0
	cmp.w _resx,d0
	jcs .L14
	addq.w #1,_y
.L12:
	move.w _resy,d0
	cmp.w _y,d0
	jhi .L15
	jsr _WaitMouse
	jsr _RestoreMode
	clr.l d0
	jra .L6
.L16:
	moveq #1,d0
.L6:
	movem.l (sp)+,d2/d3/d4/a2/a3
	rts
