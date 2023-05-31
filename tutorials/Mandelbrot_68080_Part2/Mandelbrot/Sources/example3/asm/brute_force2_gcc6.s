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
.comm _i,2
.comm _MaxIter,2
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
	.text
	.align	2
	.globl	_GetTime
_GetTime:
	move.l d3,-(sp)
	move.l d2,-(sp)
	clr.l d0
	move.b 14676989,d0
	fmove.d #0x401c600a7c5ac472,fp0
	fdmul.l d0,fp0
	fdmul.s #0e1.0e+6,fp0
	fcmp.d #0x41e0000000000000,fp0
	fjge .L2
	fmovem.l fpcr,d0
	moveq #16,d1
	or.l d0,d1
	and.w #-33,d1
	fmovem.l d1,fpcr
	fmove.l fp0,d2
	fmovem.l d0,fpcr
	jra .L3
.L2:
	fdsub.s #0x4f000000,fp0
	fmovem.l fpcr,d0
	moveq #16,d1
	or.l d0,d1
	and.w #-33,d1
	fmovem.l d1,fpcr
	fmove.l fp0,d2
	fmovem.l d0,fpcr
	add.l #-2147483648,d2
.L3:
	jsr _GetStart
	move.l d0,d3
	jsr _GetStop
	cmp.l d3,d0
	jls .L4
	sub.l d3,d0
	jra .L5
.L4:
	sub.l d0,d3
	move.l d3,d0
	not.l d0
.L5:
	fdmove.l d0,fp0
	tst.l d0
	jge .L6
	fdadd.s #0x4f800000,fp0
.L6:
	fdmove.l d2,fp1
	tst.l d2
	jge .L7
	fdadd.s #0x4f800000,fp1
.L7:
	fddiv.x fp1,fp0
	move.l (sp)+,d2
	move.l (sp)+,d3
	rts
.LC0:
	.ascii "Execution time (%dx core): %u.%04u seconds\12\0"
	.section .text
	.align	2
	.globl	_main
_main:
	fmovem fp2,-(sp)
	movem.l a3/a2/d4/d3/d2,-(sp)
	move.l #720,d2
	move.l #1280,d1
	move.l #2561,d0
	jsr _Set8BitMode
	move.l d0,_newbuffer
	jeq .L23
	jsr _MultiTaskOff
	jsr _MouseOff
	move.w #256,_MaxIter
	move.l #-1073610752,_minr
	clr.l 4+_minr
	fmove.s #0e1.25e+0,fp0
	fmove.d fp0,_maxr
	move.l #-1074528256,_mini
	clr.l 4+_mini
	fmove.d fp0,_maxi
	clr.l d0
	move.w _resx,d0
	fmove.s #0e3.5e+0,fp0
	fddiv.l d0,fp0
	fmove.d fp0,_stepr
	move.w _resy,d0
	fmove.s #0e2.5e+0,fp0
	fddiv.l d0,fp0
	fmove.d fp0,_stepi
	clr.l d3
	lea _SetColor,a3
	move.l d3,d2
	move.l d3,d1
	move.l d3,d0
	jsr (a3)
	moveq #1,d4
	lea _rand,a2
.L13:
	jsr (a2)
	move.l d0,d3
	jsr (a2)
	move.l d0,d2
	jsr (a2)
	and.l #-2147483393,d3
	jge .L10
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L10:
	and.l #-2147483393,d2
	jge .L11
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L11:
	move.l #-2147483393,d1
	and.l d0,d1
	jge .L12
	subq.l #1,d1
	moveq #-1,d0
	not.b d0
	or.l d0,d1
	addq.l #1,d1
.L12:
	move.l d4,d0
	jsr (a3)
	addq.l #1,d4
	cmp.l #256,d4
	jne .L13
	jsr _SetStart
	clr.w _y
	lea _IterateAsmVampire0,a2
	lea _Put8BitPixel,a3
	jra .L14
.L17:
	clr.w _x
	jra .L15
.L16:
	clr.l d1
	move.w _y,d1
	fdmove.d _stepi,fp0
	fdmul.l d1,fp0
	fdmove.x fp0,fp1
	fdadd.d _mini,fp1
	fmove.d fp1,_cy
	and.l #65535,d0
	fdmove.d _stepr,fp0
	fdmul.l d0,fp0
	fdadd.d _minr,fp0
	fmove.d fp0,_cx
	move.w _MaxIter,d0
	jsr (a2)
	move.w d0,_i
	clr.l d2
	move.b d0,d2
	clr.l d1
	move.w _y,d1
	clr.l d0
	move.w _x,d0
	jsr (a3)
	addq.w #1,_x
.L15:
	move.w _x,d0
	cmp.w _resx,d0
	jcs .L16
	addq.w #1,_y
.L14:
	move.w _resy,d0
	cmp.w _y,d0
	jhi .L17
	jsr _SetStop
	jsr _WaitMouseUp
	jsr _MouseOn
	jsr _MultiTaskOn
	jsr _RestoreMode
	jsr _GetTime
	fcmp.d #0x41e0000000000000,fp0
	fjge .L18
	fmovem.l fpcr,d2
	moveq #16,d3
	or.l d2,d3
	and.w #-33,d3
	fmovem.l d3,fpcr
	fmove.l fp0,d1
	fmovem.l d2,fpcr
	jra .L19
.L18:
	fdmove.x fp0,fp2
	fdsub.s #0x4f000000,fp2
	fmovem.l fpcr,d0
	moveq #16,d2
	or.l d0,d2
	and.w #-33,d2
	fmovem.l d2,fpcr
	fmove.l fp2,d1
	fmovem.l d0,fpcr
	add.l #-2147483648,d1
.L19:
	fdmove.l d1,fp1
	tst.l d1
	jge .L20
	fdadd.s #0x4f800000,fp1
.L20:
	fdsub.x fp1,fp0
	fdmul.w #10000,fp0
	fcmp.d #0x41e0000000000000,fp0
	fjge .L21
	fmovem.l fpcr,d3
	moveq #16,d2
	or.l d3,d2
	and.w #-33,d2
	fmovem.l d2,fpcr
	fmove.l fp0,d0
	fmovem.l d3,fpcr
	jra .L22
.L21:
	fdsub.s #0x4f000000,fp0
	fmovem.l fpcr,d3
	moveq #16,d2
	or.l d3,d2
	and.w #-33,d2
	fmovem.l d2,fpcr
	fmove.l fp0,d0
	fmovem.l d3,fpcr
	add.l #-2147483648,d0
.L22:
	move.l d0,-(sp)
	move.l d1,-(sp)
	clr.l d0
	move.b 14676989,d0
	move.l d0,-(sp)
	pea .LC0
	jsr _printf
	add.w #16,sp
	clr.l d0
	jra .L8
.L23:
	moveq #1,d0
.L8:
	movem.l (sp)+,d2/d3/d4/a2/a3
	fmovem (sp)+,fp2
	rts
