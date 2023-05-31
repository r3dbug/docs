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
	.globl	_AddQueue
_AddQueue:
	move.l _Done,a1
	move.l (4,sp),a0
	add.l a0,a1
	move.b (a1),d0
	btst #1,d0
	jne .L14
	or.b #2,d0
	move.b d0,(a1)
	move.l _QueueHead,d0
	move.l d0,d1
	addq.l #1,d1
	move.l d1,_QueueHead
	move.l a0,([_Queue],d0.l*4)
	move.l _QueueHead,d0
	cmp.l _QueueSize,d0
	jne .L14
	clr.l _QueueHead
.L14:
	rts
	.align	2
	.globl	_AllocateBoundary
_AllocateBoundary:
	move.l a6,-(sp)
	move.w _resx,d0
	mulu.w _resy,d0
	move.l d0,_DataSize
	move.l d0,_DoneSize
	move.l d0,d1
	lsl.l #4,d1
	move.l d1,_QueueSize
	move.l #65537,d1
	move.l _SysBase,a6
#APP
| 164 "boundary_trace0.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_Data
	move.l _SysBase,a6
	move.l _DoneSize,d0
	move.l #65537,d1
#APP
| 165 "boundary_trace0.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_Done
	move.l _SysBase,a6
	move.l _QueueSize,d0
	move.l #65537,d1
#APP
| 166 "boundary_trace0.c" 1
	jsr a6@(-0xc6:W)
| 0 "" 2
#NO_APP
	move.l d0,_Queue
	tst.l _Data
	jeq .L21
	tst.l _Done
	jeq .L21
	tst.l d0
	sne d0
	extb.l d0
	neg.l d0
	jra .L18
.L21:
	clr.l d0
.L18:
	move.l (sp)+,a6
	rts
	.align	2
	.globl	_DeallocateBoundary
_DeallocateBoundary:
	move.l a6,-(sp)
	move.l _Queue,a1
	move.l a1,d0
	jeq .L23
	move.l _QueueSize,d0
	move.l _SysBase,a6
#APP
| 172 "boundary_trace0.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L23:
	move.l _Done,a1
	move.l a1,d0
	jeq .L24
	move.l _DoneSize,d0
	move.l _SysBase,a6
#APP
| 173 "boundary_trace0.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L24:
	move.l _Data,a1
	move.l a1,d0
	jeq .L22
	move.l _DataSize,d0
	move.l _SysBase,a6
#APP
| 174 "boundary_trace0.c" 1
	jsr a6@(-0xd2:W)
| 0 "" 2
#NO_APP
.L22:
	move.l (sp)+,a6
	rts
	.align	2
	.globl	_Load
_Load:
	movem.l a2/d5/d4/d3/d2,-(sp)
	move.l (24,sp),a2
	btst #0,([_Done],a2.l)
	jeq .L36
	clr.l d0
	move.b ([_Data],a2.l),d0
	jra .L35
.L36:
	clr.l d4
	move.w _resx,d4
	move.l a2,d5
	divul.l d4,d4:d5
	and.l #65535,d5
	fdmove.d _stepi,fp1
	fdmul.l d5,fp1
	fdmove.d _stepr,fp0
	fdmul.l d4,fp0
	clr.l d0
	move.w _MaxIter,d0
	fdadd.d _mini,fp1
	fdadd.d _minr,fp0
	jsr _SingleIterateAsm
	move.w d0,d3
	clr.l d2
	move.w d0,d2
	move.l d5,d1
	move.l d4,d0
	jsr _Put8BitPixel
	or.b #1,([_Done],a2.l)
	move.b d3,([_Data],a2.l)
	clr.l d0
	move.b d3,d0
.L35:
	movem.l (sp)+,d2/d3/d4/d5/a2
	rts
	.align	2
	.globl	_Scan
_Scan:
	movem.l a5/a4/a3/a2/d7/d6/d5/d4/d3/d2,-(sp)
	move.l (44,sp),a2
	clr.l d2
	move.w _resx,d2
	move.l a2,d0
	divul.l d2,d2:d0
	move.l d0,a3
	move.l a2,-(sp)
	lea _Load,a5
	jsr (a5)
	move.l d0,d5
	clr.l d7
	move.w _resx,d7
	subq.l #1,d7
	clr.l d0
	move.w _resy,d0
	move.l d0,a4
	subq.l #1,a4
	addq.l #4,sp
	tst.l d2
	jeq .L60
	pea (-1,a2)
	jsr (a5)
	addq.l #4,sp
	cmp.l d5,d0
	sne d3
	extb.l d3
	neg.l d3
	jra .L39
.L60:
	move.l d2,d3
.L39:
	cmp.l d2,d7
	jls .L61
	pea (1,a2)
	jsr (a5)
	addq.l #4,sp
	cmp.l d5,d0
	sne d4
	extb.l d4
	neg.l d4
	jra .L40
.L61:
	clr.l d4
.L40:
	move.l a3,d0
	jeq .L62
	clr.l d0
	move.w _resx,d0
	move.l a2,d1
	sub.l d0,d1
	move.l d1,-(sp)
	jsr (a5)
	addq.l #4,sp
	cmp.l d5,d0
	sne d6
	extb.l d6
	neg.l d6
	jra .L41
.L62:
	move.l a3,d6
.L41:
	cmp.l a3,a4
	jls .L63
	clr.l d0
	move.w _resx,d0
	pea (a2,d0.l)
	jsr (a5)
	addq.l #4,sp
	cmp.l d5,d0
	sne d5
	extb.l d5
	neg.l d5
	jra .L42
.L63:
	clr.l d5
.L42:
	tst.l d3
	jeq .L43
	pea (-1,a2)
	jsr _AddQueue
	addq.l #4,sp
.L43:
	tst.l d4
	jeq .L44
	pea (1,a2)
	jsr _AddQueue
	addq.l #4,sp
.L44:
	tst.l d6
	jeq .L45
	clr.l d0
	move.w _resx,d0
	move.l a2,d1
	sub.l d0,d1
	move.l d1,-(sp)
	jsr _AddQueue
	addq.l #4,sp
.L45:
	tst.l d5
	jeq .L46
	clr.l d0
	move.w _resx,d0
	pea (a2,d0.l)
	jsr _AddQueue
	addq.l #4,sp
.L46:
	move.l a3,d0
	jeq .L48
	tst.l d2
	jeq .L49
	tst.l d3
	jne .L50
	tst.l d6
	jeq .L49
.L50:
	clr.l d0
	move.l a2,a0
	move.w _resx,d0
	sub.l d0,a0
	pea (-1,a0)
	jsr _AddQueue
	addq.l #4,sp
	jra .L49
.L59:
	tst.l d4
	jne .L51
	tst.l d6
	jeq .L48
.L51:
	clr.l d0
	move.l a2,a0
	move.w _resx,d0
	sub.l d0,a0
	pea (1,a0)
	jsr _AddQueue
	addq.l #4,sp
.L48:
	cmp.l a3,a4
	jls .L38
	tst.l d2
	jeq .L55
	tst.l d3
	jne .L56
	tst.l d5
	jeq .L55
.L56:
	clr.l d0
	move.w _resx,d0
	subq.l #1,d0
	pea (a2,d0.l)
	jsr _AddQueue
	addq.l #4,sp
.L55:
	cmp.l d2,d7
	jls .L38
	tst.l d4
	jne .L58
	tst.l d5
	jeq .L38
.L58:
	clr.l d0
	move.w _resx,d0
	addq.l #1,d0
	add.l a2,d0
	move.l d0,(44,sp)
	movem.l (sp)+,d2/d3/d4/d5/d6/d7/a2/a3/a4/a5
	jmp _AddQueue
.L49:
	cmp.l d2,d7
	jhi .L59
	jra .L48
.L38:
	movem.l (sp)+,d2/d3/d4/d5/d6/d7/a2/a3/a4/a5
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
	jne .L95
.L101:
	moveq #1,d0
	jra .L94
.L95:
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
.L100:
	jsr (a2)
	move.l d0,d3
	jsr (a2)
	move.l d0,d2
	jsr (a2)
	and.l #-2147483393,d3
	jge .L97
	subq.l #1,d3
	moveq #-1,d1
	not.b d1
	or.l d1,d3
	addq.l #1,d3
.L97:
	and.l #-2147483393,d2
	jge .L98
	subq.l #1,d2
	moveq #-1,d1
	not.b d1
	or.l d1,d2
	addq.l #1,d2
.L98:
	move.l #-2147483393,d1
	and.l d0,d1
	jge .L99
	subq.l #1,d1
	moveq #-1,d0
	not.b d0
	or.l d0,d1
	addq.l #1,d1
.L99:
	move.l d4,d0
	jsr (a3)
	addq.l #1,d4
	cmp.l #256,d4
	jne .L100
	jsr _AllocateBoundary
	tst.l d0
	jeq .L101
	jsr _SetStart
	clr.w _y
	lea _AddQueue,a2
	jra .L102
.L103:
	mulu.w _resx,d0
	move.l d0,-(sp)
	jsr (a2)
	clr.l d0
	move.w _resx,d0
	move.w d0,d1
	mulu.w _y,d1
	move.l d1,a0
	subq.l #1,d0
	pea (a0,d0.l)
	jsr (a2)
	addq.w #1,_y
	addq.l #8,sp
.L102:
	move.w _y,d0
	cmp.w _resy,d0
	jcs .L103
	move.w #1,_x
	lea _AddQueue,a2
	jra .L104
.L105:
	move.l d1,-(sp)
	jsr (a2)
	clr.l d0
	move.w _resy,d0
	subq.l #1,d0
	clr.l d1
	move.w _resx,d1
	muls.l d1,d0
	move.l d0,a0
	move.w _x,d1
	pea (a0,d1.l)
	jsr (a2)
	addq.w #1,_x
	addq.l #8,sp
.L104:
	clr.l d1
	move.w _x,d1
	clr.l d0
	move.w _resx,d0
	subq.l #1,d0
	cmp.l d1,d0
	jgt .L105
	clr.w _flag
	lea _Scan,a2
	jra .L106
.L112:
	cmp.l d1,d0
	jhi .L107
.L110:
	move.l d1,d0
	addq.l #1,d0
	move.l d0,_QueueTail
	move.l ([_Queue],d1.l*4),_p
	cmp.l _QueueSize,d0
	jne .L109
	jra .L108
.L107:
	move.w _flag,d2
	addq.w #1,d2
	move.w d2,_flag
	and.w #3,d2
	jne .L110
	jra .L128
.L108:
	clr.l _QueueTail
	jra .L109
.L128:
	subq.l #1,d0
	move.l d0,_QueueHead
	move.l ([_Queue],d0.l*4),_p
.L109:
	move.l _p,-(sp)
	jsr (a2)
	addq.l #4,sp
.L106:
	move.l _QueueTail,d1
	move.l _QueueHead,d0
	cmp.l d1,d0
	jne .L112
	clr.l _p
	move.w _resx,d0
	mulu.w _resy,d0
	jra .L113
.L115:
	move.l _Done,a2
	btst #0,(a2,a0.l)
	jeq .L114
	lea (1,a0),a1
	btst #0,(a2,a1.l)
	jne .L114
	move.b ([_Data],a0.l),([_Data],a0.l,1)
	move.l _p,a0
	move.b ([_Data],a0.l),([_newbuffer],a0.l,1)
	move.l _p,a0
	addq.l #1,a0
	or.b #1,([_Done],a0.l)
	move.w _resx,d0
	mulu.w _resy,d0
.L114:
	addq.l #1,_p
.L113:
	move.l d0,d1
	move.l _p,a0
	subq.l #1,d1
	cmp.l d1,a0
	jcs .L115
	jsr _SetStop
	jsr _DeallocateBoundary
	jsr _WaitMouse
	jsr _MouseOn
	jsr _MultiTaskOn
	jsr _RestoreMode
	jsr _GetTime
	fcmp.d #0x41e0000000000000,fp0
	fjge .L116
	fmovem.l fpcr,d0
	moveq #16,d2
	or.l d0,d2
	and.w #-33,d2
	fmovem.l d2,fpcr
	fmove.l fp0,d1
	fmovem.l d0,fpcr
	jra .L117
.L116:
	fdmove.x fp0,fp2
	fdsub.s #0x4f000000,fp2
	fmovem.l fpcr,d3
	moveq #16,d0
	or.l d3,d0
	and.w #-33,d0
	fmovem.l d0,fpcr
	fmove.l fp2,d1
	fmovem.l d3,fpcr
	add.l #-2147483648,d1
.L117:
	fdmove.l d1,fp1
	tst.l d1
	jge .L118
	fdadd.s #0x4f800000,fp1
.L118:
	fdsub.x fp1,fp0
	fdmul.w #10000,fp0
	fcmp.d #0x41e0000000000000,fp0
	fjge .L119
	fmovem.l fpcr,d2
	moveq #16,d3
	or.l d2,d3
	and.w #-33,d3
	fmovem.l d3,fpcr
	fmove.l fp0,d0
	fmovem.l d2,fpcr
	jra .L120
.L119:
	fdsub.s #0x4f000000,fp0
	fmovem.l fpcr,d2
	moveq #16,d3
	or.l d2,d3
	and.w #-33,d3
	fmovem.l d3,fpcr
	fmove.l fp0,d0
	fmovem.l d2,fpcr
	add.l #-2147483648,d0
.L120:
	move.l d0,-(sp)
	move.l d1,-(sp)
	clr.l d0
	move.b 14676989,d0
	move.l d0,-(sp)
	pea .LC0
	jsr _printf
	add.w #16,sp
	clr.l d0
.L94:
	movem.l (sp)+,d2/d3/d4/a2/a3
	fmovem (sp)+,fp2
	rts
