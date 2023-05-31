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
	jeq .L11
	clr.l d3
	lea _SetColor,a3
	move.l d3,d2
	move.l d3,d1
	move.l d3,d0
	jsr (a3)
	moveq #1,d4
	lea _rand,a2
.L6:
	jsr (a2)
	move.l d0,d3
	jsr (a2)
	move.l d0,d2
	jsr (a2)
	and.l #-2147483393,d3
	jge .L3
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L3:
	and.l #-2147483393,d2
	jge .L4
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L4:
	move.l #-2147483393,d1
	and.l d0,d1
	jge .L5
	subq.l #1,d1
	moveq #-1,d0
	not.b d0
	or.l d0,d1
	addq.l #1,d1
.L5:
	move.l d4,d0
	jsr (a3)
	addq.l #1,d4
	cmp.l #256,d4
	jne .L6
	clr.w _y
	lea _Put8BitPixel,a2
	jra .L7
.L10:
	clr.w _x
	jra .L8
.L9:
	clr.l d1
	move.w _y,d1
	clr.l d2
	move.b d1,d2
	and.l #65535,d0
	jsr (a2)
	addq.w #1,_x
.L8:
	move.w _x,d0
	cmp.w _resx,d0
	jcs .L9
	addq.w #1,_y
.L7:
	move.w _resy,d0
	cmp.w _y,d0
	jhi .L10
	jsr _WaitMouseUp
	jsr _RestoreMode
	clr.l d0
	jra .L1
.L11:
	moveq #1,d0
.L1:
	movem.l (sp)+,d2/d3/d4/a2/a3
	rts
