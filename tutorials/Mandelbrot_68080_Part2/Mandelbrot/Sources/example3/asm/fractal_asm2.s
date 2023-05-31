	SECTION code

	XDEF _Set8BitMode
	XDEF _RestoreMode
	XDEF _SetColor
	XDEF _Put8BitPixel
	XDEF _WaitMouse
	XDEF _WaitMouseUp
	XDEF _SetStart
	XDEF _SetStop
	XDEF _GetStart
	XDEF _GetStop
	XDEF _MultiTaskOff
	XDEF _MultiTaskOn
	XDEF _MouseOff
	XDEF _MouseOn
	XDEF _IterateAsmClassic
	XDEF _IterateAsmVampire0
	
SAGAMODEW 		EQU	$dff1f4		; SAGA mode and pixel format - write
SAGAMODER		EQU	$dfe1f4		;  "     "   "    "      "   - read 
SAGAPTRW		EQU	$dff1ec		; SAGA screen buffer - write
SAGAPTRR		EQU	$dfe1ec		;  "     "      "    - read 
SAGACOLORW		EQU	$dff388		; chunky port color register
CIAAPRA			EQU $bfe001 	; Complex Interface Adapter => for mouse click

_Set8BitMode:
	move.w		SAGAMODER,oldmode		; save actual graphics mode in oldmode
	move.l 		SAGAPTRR,oldbuffer		; save actual graphics buffer in oldbuffer
	move.w      d0,SAGAMODEW			; set new graphics mode and pixelformat
	move.l      #buffer,d0				; copy buffer address to d0
	add.l       #16,d0					; align buffer
	and.l       #$fffffff0,d0			;   "     "
	move.l		d0,SAGAPTRW				; copy aligned buffer pointer to SAGAPTRW
	move.w      d1,_resx				; set global C variable resx
	move.w      d2,_resy				; set global C variable resy
	rts

_RestoreMode:
	move.w oldmode,SAGAMODEW			; copy oldmode back to SAGAMODEW
	move.l oldbuffer,SAGAPTRW			; copy oldbuffer back to SAGAPTRW
	rts

_SetColor:
    and.l   #$ff,d0				; clear bits 31-8 of d0
	and.l   #$ff,d1				; idem for d1
	and.l   #$ff,d2				; idem for d2
	and.l   #$ff,d3				; idem for d3
	lsl.l 	#8,d0				; color<<8
	or.l    d1,d0				; d0=color(bits 15-8)+red(bits 7-0)
	swap 	d0					; d1=color(bits 31-24)+red(bits 23-16)
	lsl.l   #8,d2				; green<<8
	or.l    d2,d0				; d0=color(bits 31-24)+red(bits 23-16)+green(15-8)
	or.l    d3,d0				; d0=color(31-24)+red(23-16)+green(15-8)+blue(7-0)
	move.l	d0,SAGACOLORW
	rts

_Put8BitPixel:
	movem.l a0,-(sp)			; save address register a0 on stack (predecrement = stack grows towards lower addresses)
	move.l  SAGAPTRR,a0			; copy saga screen buffer base address to a0
	mulu.w	_resx,d1			; multiply d1 (=y) with global C variable resx (word)
	add.l   d0,d1				; add d0 (=x) to d1 (=y*resx+x)
	move.b  d2,(a0,d1.l)		; write byte (pixel) in d2 (= color) to address a0+d1 = buffer+y*resx+x
	movem.l (sp)+,a0			; restore address register a0 from stack (postincrement = stack shrinks towars higher addresses)
	rts 
	
_WaitMouse:
	btst	#6,CIAAPRA			; bit 6 in register CIAAPRA = fire / mouse button (1 = pressed / 0 = not pressed)
	bne     _WaitMouse			; while button is not pressed => go back to _WaitMouse (= check bit 6 again)
	rts

_WaitMouseUp:
	btst	#6,CIAAPRA			; wait for fire / mouse button pressed (like above)
	bne.s   _WaitMouse
.mouseup:
	btst    #6,CIAAPRA			; loop while fire / mouse button is pressed
	beq.s   .mouseup
	rts							; return when it is released
	
_SetStart:
	movec   CCC,d0				; CCC = Clock Cycle Count register <=> dc.w $4e7a,$0809
	move.l  d0,time_start		; write CCC to time_start (via d0)
	rts
	
_SetStop:
	movec   CCC,d0
	move.l  d0,time_stop		; idem for time_stop
	rts

_GetStart:
	move.l  time_start,d0		; read variable time_start and return it in d0
	rts

_GetStop:
	move.l  time_stop,d0		; read variable time_stop and return it in d0
	rts

_MultiTaskOff:
	movem.l d0,-(sp)			; save d0 on stack
	move.w	$dff002,d0			; save dmacon
	or.w	d0,dmacon			; dmacon | $8000 ($8000 = bit 15 set => this is the value MultiTaskOn can write back)
	move.w	#$7fff,$dff096		; all dma off
	move.w	$dff01c,d0			; save intena
	or.w	d0,intena			; intena | $8000 (again: set bit 15 to write value back in MultiTaskOn)
	move.w	#$7fff,$dff09a		; all intena off
	movem.l (sp)+,d0			; restore d0 from stack
	rts
	
_MultiTaskOn:
	move.w	#$7fff,$dff096
	move.w	dmacon,$dff096		; restore old dmacon
	move.w	intena,$dff09a		; restore old intena
	rts

_MouseOff:
	move.w  $dfe1d0,mouse		; save sprite 0 pointer to mouse
	clr.w   $dff1d0				; clear sprite 0 pointer to hide mouse (= "empty sprite")
	rts

_MouseOn:
	move.w  mouse,$dff1d0		; restore old mouse pointer
	rts
	
_IterateAsmClassic:
	; fp0: cx
	; fp1: cy
	fmovem  fp2-fp6,-(sp)
	fmove   #0,fp2			; xn=0
	fmove   #0,fp4			; xn1=0
	fmove   #0,fp3			; yn=0
	fmove   #0,fp5			; yn1=0
.loop:
    fmove   fp4,fp6			; xn1
	fadd    fp5,fp6			; xn1+yn1
	fcmp.s  #4,fp6
	fbgt    .exit			; xn1+yn1>4 => .exit
	fmul    fp2,fp3			; yn=xn*yn
	fadd    fp3,fp3			; yn=2*xn*yn
	fadd    fp1,fp3			; yn=2*xn*yn+cy
	fmove   fp4,fp2			; xn=xn1
	fsub    fp5,fp2			; xn=xn1-yn1
	fadd    fp0,fp2			; xn=xn1-yn1+cx
	fmove   fp2,fp4			; xn1=xn
	fmul    fp4,fp4			; xn1=xn*xn
	fmove   fp3,fp5			; yn1=yn
	fmul    fp5,fp5
    dbra.w  d0,.loop  		; d0>0 => .loop
    moveq.l #0,d0    		; iteration = 0

.exit:
	fmovem  (sp)+,fp2-fp6
    rts  					; return iterations (D0)
	
_IterateAsmVampire0:
	; fp0: cx
	; fp1: cy
	; use e2-e6 as scratch registers
	; use 3-operant instructions
	fmove   #0,e2			; xn=0
	fmove   #0,e4			; xn1=0
	fmove   #0,e3			; yn=0
	fmove   #0,e5			; yn1=0
.loop:
    ; fmove   fp4,fp6		; xn1
	; fadd    fp5,fp6		; xn1+yn1
	fadd    e4,e5,e6		; 3 operant fadd replaces fmove+fadd (= 2 instructions)
	fcmp.s  #4,e6
	fbgt    .exit			; xn1+yn1>4 => .exit
	fmul    e2,e3			; yn=xn*yn
	fadd    e3,e3			; yn=2*xn*yn
	fadd    fp1,e3			; yn=2*xn*yn+cy
	; fmove   fp4,fp2		; xn=xn1
	; fsub    fp5,fp2		; xn=xn1-yn1
	fsub    e5,e4,e2		; 3 operant fsub replaces fmove+fsub (= 2 instructions)
	fadd    fp0,e2			; xn=xn1-yn1+cx
	; fmove   fp2,fp4		; xn1=xn
	; fmul    fp4,fp4		; xn1=xn*xn
	fmul    e2,e2,e4		; 3 operant fmul replaces fmove+fadd (= 2 instructions)
	; fmove   fp3,fp5			; yn1=yn
	; fmul    fp5,fp5
    fmul    e3,e3,e5 
	dbra.w  d0,.loop  		; d0>0 => .loop
    moveq.l #0,d0    		; iteration = 0

.exit:
    rts  					; return 
	
	SECTION data1
	
oldmode	:	dc.w 0		; save the actual graphics mode to restore it later
oldbuffer:	dc.l 0		;   "   "    "    screen buffer  "    "    "    "
newmode:	dc.w 0		; new graphics mode that we will use for SAGA screen
newbuffer:	dc.l 0		;  "  screen buffer   "   "   "   "   "    "     "     

time_start:	dc.l 0
time_stop:	dc.l 0

dmacon:		dc.w $8000
intena:		dc.w $8000

mouse:		dc.w 0

	SECTION data2,BSS

buffer:	ds.b	1280*720+16
		
	END