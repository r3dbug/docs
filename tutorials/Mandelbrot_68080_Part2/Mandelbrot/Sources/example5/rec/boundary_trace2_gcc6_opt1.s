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
.comm _i,2
.comm _MaxIter,2
.comm _resx,2
.comm _resy,2
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
.comm _Data,4
.comm _Done,4
.comm _Queue,4
.comm _DataSize,4
.comm _DoneSize,4
.comm _QueueSize,4
	.globl	_QueueHead
	.bss
	.align	2
_QueueHead:
	.skip 4
	.globl	_QueueTail
	.align	2
_QueueTail:
	.skip 4
.comm _p,4
.comm _flag,2
.comm _IterP1,2
.comm _IterP2,2
.comm _IterP3,2
.comm _IterP4,2
.comm _WordLoaded,2
.comm _LongLoaded,4
.comm _colorl,4
.comm _colorw,2
.comm _colorb,1
.comm _nbytes,4
.comm _nwords,4
.comm _nlong,4
.comm _rbytes,4
.comm _rwords,4
.comm _p1,4
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
	.align	2
	.globl	_Iterate
_Iterate:
	fmovem fp2/fp3/fp4/fp5/fp6,-(sp)
	fdmove.d (64,sp),fp5
	fdmove.d (72,sp),fp3
	move.w (82,sp),d0
	jne .L9
	jra .L10
.L12:
	fdadd.x fp0,fp0
	fdmul.x fp0,fp2
	fdmove.x fp4,fp0
	fdadd.x fp3,fp2
	fdsub.x fp1,fp0
	fdadd.x fp5,fp0
	fdmove.x fp0,fp4
	fdmove.x fp2,fp1
	fdmul.x fp0,fp4
	fdmul.x fp2,fp1
	subq.w #1,d0
	dbra d1,.L11
	jra .L10
.L9:
	fmove.w #0,fp2
	fdmove.x fp2,fp0
	fdmove.x fp2,fp1
	move.w d0,d1
	fdmove.x fp2,fp4
	subq.w #1,d1
.L11:
	fdmove.x fp4,fp6
	fdadd.x fp1,fp6
	fcmp.d #0x4010000000000000,fp6
	fjle .L12
.L10:
	fmovem (sp)+,fp6/fp5/fp4/fp3/fp2
	rts
	.align	2
	.globl	_AllocateBoundary
_AllocateBoundary:
	move.l a6,-(sp)
	move.w _resx,d0
	mulu.w _resy,d0
	move.l d0,_DoneSize
	move.l d0,d1
	lsl.l #4,d1
	move.l d1,_QueueSize
	move.l _newbuffer,_Data
	move.l #65537,d1
	move.l _SysBase,a6
#APP
| 180 "boundary_trace2.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_Done
	move.l _SysBase,a6
	move.l _QueueSize,d0
	move.l #65537,d1
#APP
| 181 "boundary_trace2.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_Queue
	tst.l _Data
	jeq .L17
	tst.l _Done
	jeq .L17
	tst.l d0
	sne d0
	extb.l d0
	neg.l d0
	jra .L14
.L17:
	clr.l d0
.L14:
	move.l (sp)+,a6
	rts
	.align	2
	.globl	_DeallocateBoundary
_DeallocateBoundary:
	move.l a6,-(sp)
	move.l _Queue,a1
	move.l a1,d0
	jeq .L19
	move.l _QueueSize,d0
	move.l _SysBase,a6
#APP
| 187 "boundary_trace2.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L19:
	move.l _Done,a1
	move.l a1,d0
	jeq .L18
	move.l _DoneSize,d0
	move.l _SysBase,a6
#APP
| 188 "boundary_trace2.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L18:
	move.l (sp)+,a6
	rts
.LC0:
	.ascii "Execution time (%dx core): %u.%04u seconds\12\0"
	.section .text
	.align	2
	.globl	_main
_main:
	add.w #-20,sp
	fmovem fp2,-(sp)
	movem.l a6/a5/a4/a3/a2/d7/d6/d5/d4/d3/d2,-(sp)
	move.l #720,d2
	move.l #1280,d1
	move.l #2561,d0
	jsr _Set8BitMode
	move.l d0,_newbuffer
	jne .L28
.L34:
	moveq #1,d0
	jra .L27
.L28:
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
	
	move.l d3,d2
	move.l d3,d1
	move.l d3,d0
	jsr _SetColor
	moveq #1,d4
	
.L33:
	jsr _rand
	move.l d0,d3
	jsr _rand
	move.l d0,d2
	jsr _rand
	and.l #-2147483393,d3
	jge .L30
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L30:
	and.l #-2147483393,d2
	jge .L31
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L31:
	move.l #-2147483393,d1
	and.l d0,d1
	jge .L32
	subq.l #1,d1
	moveq #-1,d0
	not.b d0
	or.l d0,d1
	addq.l #1,d1
.L32:
	move.l d4,d0
	jsr _SingleIterateAsm
	addq.l #1,d4
	cmp.l #256,d4
	jne .L33
	jsr _AllocateBoundary
	tst.l d0
	jeq .L34
	jsr _SetStart
	clr.w _y
	jra .L35
.L42:
	move.l _Done,a0
	mulu.w _resx,d0
	add.l d0,a0
	move.b (a0),d1
	btst #1,d1
	jne .L37
	or.b #2,d1
	move.b d1,(a0)
	move.l _QueueHead,d1
	move.l d1,d2
	addq.l #1,d2
	move.l d2,_QueueHead
	move.l d0,([_Queue],d1.l*4)
	
	cmp.l _QueueSize,d2
	jne .L37
	clr.l _QueueHead
.L37:
	clr.l d0
	move.w _resx,d0
	move.w d0,d1
	mulu.w _y,d1
	move.l d1,a0
	subq.l #1,d0
	move.l _Done,a1
	add.l d0,a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L40
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L40
	clr.l _QueueHead
.L40:
	addq.w #1,_y
.L35:
	move.w _y,d0
	cmp.w _resy,d0
	jcs .L42
	move.w #1,_x
	clr.l d1
	move.w _resx,d1
	jra .L43
.L50:
	move.l _Done,a0
	add.l d0,a0
	move.b (a0),d2
	btst #1,d2
	jne .L45
	or.b #2,d2
	move.b d2,(a0)
	move.l _QueueHead,d1
	move.l d1,d2
	addq.l #1,d2
	move.l d2,_QueueHead
	move.l d0,([_Queue],d1.l*4)
	
	cmp.l _QueueSize,d2
	jeq .L159
	jra .L162
.L159:
	clr.l _QueueHead
.L162:
	clr.l d1
	move.w _resx,d1
.L45:
	move.w _resy,d0
	subq.l #1,d0
	muls.l d1,d0
	clr.l d2
	move.w _x,d2
	move.l _Done,a0
	add.l d2,d0
	add.l d0,a0
	move.b (a0),d2
	btst #1,d2
	jne .L48
	or.b #2,d2
	move.b d2,(a0)
	move.l _QueueHead,d1
	move.l d1,d2
	addq.l #1,d2
	move.l d2,_QueueHead
	move.l d0,([_Queue],d1.l*4)
	
	cmp.l _QueueSize,d2
	jeq .L160
	jra .L163
.L160:
	clr.l _QueueHead
.L163:
	clr.l d1
	move.w _resx,d1
.L48:
	addq.w #1,_x
.L43:
	clr.l d0
	move.w _x,d0
	move.l d1,d2
	subq.l #1,d2
	cmp.l d0,d2
	jgt .L50
	clr.w _flag
	

	jra .L90
.L99:
	cmp.l d1,d0
	jhi .L52
.L55:
	move.l d1,d0
	addq.l #1,d0
	move.l d0,_QueueTail
	move.l ([_Queue],d1.l*4),_p
	cmp.l _QueueSize,d0
	jne .L54
	jra .L53
.L52:
	move.w _flag,d2
	addq.w #1,d2
	move.w d2,_flag
	and.w #3,d2
	jne .L55
	jra .L161
.L53:
	clr.l _QueueTail
	jra .L54
.L161:
	subq.l #1,d0
	move.l d0,_QueueHead
	move.l ([_Queue],d0.l*4),_p
.L54:
	move.l _p,a2
	clr.l d3
	move.w _resx,d3
	move.l a2,d5
	divul.l d3,d3:d5
	btst #0,([_Done],a2.l)
	jeq .L57
	clr.l d4
	move.b ([_Data],a2.l),d4
	jra .L58
.L57:
	clr.l d6
	move.w d5,d6
	fdmove.d _stepi,fp1
	fdmul.w d6,fp1
	fdmove.d _stepr,fp0
	fdmul.w d3,fp0
	clr.l d0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	jsr _SingleIterateAsm 
    move.l d0,d4
	and.l #255,d4
	move.w d4,d2
	move.l d6,d1
	move.l d3,d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a2.l)
	move.b d4,([_Data],a2.l)
	
.L58:
	clr.l d7
	move.w _resx,d7
	move.l d7,d1
	subq.l #1,d1
	move.l d1,(68,sp)
	clr.l d0
	move.w _resy,d0
	subq.l #1,d0
	move.l d0,(72,sp)
	tst.l d3
	jeq .L123
	lea (-1,a2),a5
	btst #0,([_Done],a5.l)
	jeq .L60
	clr.l d6
	move.b ([_Data],a5.l),d6
	jra .L61
.L60:
	move.l a5,d1
	divul.l d7,d7:d1
	
	fdmove.d _stepi,fp1
	fdmul.w d1,fp1
	fdmove.d _stepr,fp0
	fdmul.w d7,fp0
	clr.l d0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	move.l d1,(56,sp)
	jsr _SingleIterateAsm
	move.w d0,d6
	and.l #255,d6
	move.w d6,d2
	move.l (56,sp),d1
	move.l d7,d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a5.l)
	move.b d6,([_Data],a5.l)
	
.L61:
	cmp.l d4,d6
	sne d0
	extb.l d0
	neg.l d0
	move.l d0,(64,sp)
	jra .L59
.L123:
	move.l d3,(64,sp)
.L59:
	cmp.l (68,sp),d3
	jcc .L124
	lea (1,a2),a5
	btst #0,([_Done],a5.l)
	jeq .L63
	clr.l d6
	move.b ([_Data],a5.l),d6
	jra .L64
.L63:
	clr.l d7
	move.w _resx,d7
	move.l a5,d1
	divul.l d7,d7:d1
	
	fdmove.d _stepi,fp1
	fdmul.w d1,fp1
	fdmove.d _stepr,fp0
	fdmul.w d7,fp0
	clr.l d0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	move.l d1,(56,sp)
	jsr _SingleIterateAsm
	move.w d0,d6
	and.l #255,d6
	move.w d6,d2
	move.l (56,sp),d1
	move.l d7,d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a5.l)
	move.b d6,([_Data],a5.l)
	
.L64:
	cmp.l d4,d6
	sne d0
	extb.l d0
	neg.l d0
	move.l d0,a5
	jra .L62
.L124:
	lea 0.w,a5
.L62:
	tst.l d5
	jeq .L125
	clr.l d7
	move.l a2,a6
	move.w _resx,d7
	sub.l d7,a6
	btst #0,([_Done],a6.l)
	jeq .L66
	clr.l d6
	move.b ([_Data],a6.l),d6
	jra .L67
.L66:
	move.l a6,d1
	divul.l d7,d7:d1
	
	fdmove.d _stepi,fp1
	fdmul.w d1,fp1
	fdmove.d _stepr,fp0
	fdmul.w d7,fp0
	clr.l d0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	move.l d1,d6
	jsr _SingleIterateAsm
    move.l d6,d1
    move.w d0,d6
	and.l #255,d6
	move.w d6,d2
	move.l d7,d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a6.l)
	move.b d6,([_Data],a6.l)
	
.L67:
	cmp.l d4,d6
	sne d7
	extb.l d7
	neg.l d7
	jra .L65
.L125:
	move.l d5,d7
.L65:
	cmp.l (72,sp),d5
	jcc .L126
	clr.l d0
	move.w _resx,d0
	lea (a2,d0.l),a6
	btst #0,([_Done],a6.l)
	jeq .L69
	clr.l d6
	move.b ([_Data],a6.l),d6
	jra .L70
.L69:
	move.l a6,d1
	divul.l d0,d2:d1
	move.l d2,(60,sp)
	
	fdmove.d _stepi,fp1
	fdmul.w d1,fp1
	fdmove.d _stepr,fp0
	fdmul.w d2,fp0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	move.l d1,(56,sp)
	jsr _SingleIterateAsm
	move.w d0,d6
	and.l #255,d6
	move.w d0,d2
	move.l (56,sp),d1
	move.l (60,sp),d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a6.l)
	move.b d6,([_Data],a6.l)
	
.L70:
	cmp.l d4,d6
	sne d2
	extb.l d2
	neg.l d2
	jra .L68
.L126:
	clr.l d2
.L68:
	tst.l (64,sp)
	jeq .L72
	move.l _Done,a1
	lea (-1,a2),a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L72
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L72
	clr.l _QueueHead
.L72:
	move.l a5,d0
	jeq .L75
	move.l _Done,a1
	lea (1,a2),a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L75
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L75
	clr.l _QueueHead
.L75:
	tst.l d7
	jeq .L78
	clr.l d0
	move.l a2,a0
	move.w _resx,d0
	move.l _Done,a1
	sub.l d0,a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L78
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L78
	clr.l _QueueHead
.L78:
	tst.l d2
	jeq .L81
	clr.l d0
	move.w _resx,d0
	move.l _Done,a1
	lea (a2,d0.l),a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L81
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L81
	clr.l _QueueHead
.L81:
	tst.l d5
	jeq .L84
	tst.l d3
	jeq .L87
	tst.l (64,sp)
	jne .L86
	tst.l d7
	jeq .L87
.L86:
	clr.l d0
	lea (-1,a2),a0
	move.w _resx,d0
	move.l _Done,a1
	sub.l d0,a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L87
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L87
	clr.l _QueueHead
	jra .L87
.L122:
	move.l a5,d0
	jne .L88
	tst.l d7
	jeq .L84
.L88:
	clr.l d0
	lea (1,a2),a0
	move.w _resx,d0
	move.l _Done,a1
	sub.l d0,a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L84
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
    move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L84
	clr.l _QueueHead
.L84:
	cmp.l (72,sp),d5
	jcc .L90
	tst.l d3
	jeq .L92
	tst.l (64,sp)
	jne .L93
	tst.l d2
	jeq .L92
.L93:
	clr.l d0
	move.w _resx,d0
	subq.l #1,d0
	move.l _Done,a1
	lea (a2,d0.l),a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L92
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d1
	jne .L92
	clr.l _QueueHead
.L92:
	cmp.l (68,sp),d3
	jcc .L90
	move.l a5,d0
	jne .L97
	tst.l d2
	jeq .L90
.L97:
	clr.l d0
	move.w _resx,d0
	addq.l #1,d0
	move.l _Done,a0
	add.l d0,a2
	add.l a2,a0
	move.b (a0),d0
	btst #1,d0
	jne .L90
	or.b #2,d0
	move.b d0,(a0)
	move.l _QueueHead,d0
	move.l d0,d3
	addq.l #1,d3
	move.l d3,_QueueHead
	move.l a2,([_Queue],d0.l*4)
	
	cmp.l _QueueSize,d3
	jne .L90
	clr.l _QueueHead
.L90:
	move.l _QueueTail,d1
	move.l _QueueHead,d0
	cmp.l d1,d0
	jne .L99
	move.w #257,_WordLoaded
	move.l #16843009,_LongLoaded
	clr.l _p
	move.w _resx,d4
	mulu.w _resy,d4
	jra .L100
.L116:
	move.l _Done,a0
	btst #0,(a0,d2.l)
	jne .L101
.L108:
	addq.l #1,_p
	jra .L100
.L101:
	move.l d2,d3
	addq.l #1,d3
	move.l d3,_p1
	move.l _LongLoaded,d5
	jra .L102
.L103:
	addq.l #4,d1
	move.l d1,_p1
.L102:
	move.l _p1,d1
	move.l d5,d0
	lea (a0,d1.l),a1
	and.l (a1),d0
	jeq .L103
	move.w _WordLoaded,d6
	clr.b d0
	jra .L104
.L127:
	moveq #1,d0
.L104:
	move.l a1,a2
	move.w (a1)+,d5
	sub.l a0,a2
	and.w d6,d5
	jeq .L127
	tst.b d0
	jeq .L106
	move.l a2,_p1
	move.l a2,d1
	jra .L106
.L107:
	addq.l #1,d1
	move.l d1,_p1
.L106:
	btst #0,(a0,d1.l)
	jeq .L107
	move.l d2,d0
	not.l d0
	add.l d1,d0
	move.l d0,_nbytes
	jeq .L108
	move.l d0,d1
	lsr.l #1,d1
	move.l d1,_nwords
	moveq #1,d4
	and.l d0,d4
	move.l d4,_rbytes
	lsr.l #2,d0
	move.l d0,_nlong
	add.l d0,d0
	sub.l d0,d1
	move.l d1,_rwords
	move.l _Data,a2
	move.b (a2,d2.l),d0
	move.b d0,_colorb
	clr.w d1
	move.b d0,d1
	move.w d1,d0
	lsl.w #8,d0
	add.w d1,d0
	move.w d0,_colorw
	and.l #65535,d0
	move.l d0,d1
	swap d1
	clr.w d1
	add.l d0,d1
	move.l d1,_colorl
	move.l d3,_p
	clr.w _x
	clr.w d0
	jra .L109
.L110:
	move.l _colorl,([_p],a2.l)
	move.l _LongLoaded,d1
	or.l d1,([_p],a0.l)
	addq.l #4,_p
.L109:
	clr.l d1
	move.w d0,d1
	addq.w #1,d0
	cmp.l _nlong,d1
	jcs .L110
	clr.w _x
	move.l _p,a1
	move.l _rwords,d1
	add.l a1,a2
	add.l a0,a1
	clr.b d0
	jra .L111
.L112:
	move.w _colorw,(a2)+
	move.w (a1),d0
	or.w _WordLoaded,d0
	move.w d0,(a1)+
	addq.w #1,_x
	moveq #1,d0
.L111:
	move.l a1,a3
	sub.l a0,a3
	clr.l d2
	move.w _x,d2
	cmp.l d2,d1
	jhi .L112
	tst.b d0
	jeq .L113
	move.l a3,_p
.L113:
	clr.w _x
	jra .L114
.L115:
	move.l _Data,a0
	move.b _colorb,([_p],a0.l)
	move.l _Done,a0
	add.l _p,a0
	or.b #1,(a0)
	addq.l #1,_p
	addq.w #1,_x
.L114:
	clr.l d0
	move.w _x,d0
	cmp.l _rbytes,d0
	jcs .L115
	move.w _resx,d4
	mulu.w _resy,d4
	jra .L108
.L100:
	move.l _p,d2
	move.l d4,d0
	subq.l #1,d0
	cmp.l d0,d2
	jcs .L116
	jsr _SetStop
	jsr _DeallocateBoundary
	jsr _WaitMouse
	jsr _MouseOn
	jsr _MultiTaskOn
	jsr _RestoreMode
	jsr _GetTime
	fcmp.d #0x41e0000000000000,fp0
	fjge .L117
	fmovem.l fpcr,d2
	moveq #16,d3
	or.l d2,d3
	and.w #-33,d3
	fmovem.l d3,fpcr
	fmove.l fp0,d1
	fmovem.l d2,fpcr
	jra .L118
.L117:
	fdmove.x fp0,fp2
	fdsub.s #0x4f000000,fp2
	fmovem.l fpcr,d4
	moveq #16,d0
	or.l d4,d0
	and.w #-33,d0
	fmovem.l d0,fpcr
	fmove.l fp2,d1
	fmovem.l d4,fpcr
	add.l #-2147483648,d1
.L118:
	fdmove.l d1,fp1
	tst.l d1
	jge .L119
	fdadd.s #0x4f800000,fp1
.L119:
	fdsub.x fp1,fp0
	fdmul.w #10000,fp0
	fcmp.d #0x41e0000000000000,fp0
	fjge .L120
	fmovem.l fpcr,d2
	moveq #16,d3
	or.l d2,d3
	and.w #-33,d3
	fmovem.l d3,fpcr
	fmove.l fp0,d0
	fmovem.l d2,fpcr
	jra .L121
.L120:
	fdsub.s #0x4f000000,fp0
	fmovem.l fpcr,d4
	moveq #16,d2
	or.l d4,d2
	and.w #-33,d2
	fmovem.l d2,fpcr
	fmove.l fp0,d0
	fmovem.l d4,fpcr
	add.l #-2147483648,d0
.L121:
	move.l d0,-(sp)
	move.l d1,-(sp)
	clr.l d0
	move.b 14676989,d0
	move.l d0,-(sp)
	pea .LC0
	jsr _printf
	add.w #16,sp
	clr.l d0
	jra .L27
.L87:
	cmp.l (68,sp),d3
	jcs .L122
	jra .L84
.L27:
	movem.l (sp)+,d2/d3/d4/d5/d6/d7/a2/a3/a4/a5/a6
	fmovem (sp)+,fp2
	add.w #20,sp
	rts
