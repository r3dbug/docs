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
	XDEF _IterateAsmVampire1
	XDEF _SingleIterateAsm
	XDEF _Par2IterateAsm
	XDEF _Par4IterateAsm


	
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
	
_IterateAsmVampire1:
	; fp0: cx
	; fp1: cy
	; use e2-e6 as scratch registers
	; use 3-operant instructions
	; use instruction scheduling
	; * = new position of a moved instruction
	; # = instruction that has been moved (for better performance)
	fmove   #0,e2			; xn=0
	fmove   #0,e4			; xn1=0
	fmove   #0,e3			; yn=0
	fmove   #0,e5			; yn1=0
.loop:
	fmul    e2,e3		; * yn=xn*yn
	fadd    e4,e5,e6		; 3 operant fadd replaces fmove+fadd (= 2 instructions)
	fsub    e5,e4,e2	; * 3 operant fsub replaces fmove+fsub
	fcmp.s  #4,e6
	fbgt    .exit			; xn1+yn1>4 => .exit
	; fmul    e2,e3			; # yn=xn*yn  => move it upwards!
	fadd    e3,e3			; yn=2*xn*yn
	; fadd    fp1,e3		; # yn=2*xn*yn+cy => move it downwards!
	; fsub    e5,e4,e2		; # 3 operant fsub replaces fmove+fsub (= 2 instructions) => move it upwards!
	fadd    fp0,e2			; xn=xn1-yn1+cx
	fadd    fp1,e3		; * yn=2*xn*yn+cy
	fmul    e2,e2,e4		; 3 operant fmul replaces fmove+fadd (= 2 instructions)
    fmul    e3,e3,e5 
	dbra.w  d0,.loop  		; d0>0 => .loop
    moveq.l #0,d0    		; iteration = 0

.exit:
    rts  					; return 
	
; ********************************

_Par4IterateAsm:
	; parameters
	; fp0/fp1: x1, y1 (point 1)	-- regs: e2-e6	(=0)
	; fp2/fp3: x2, y2 (point 2) -- regs: e7-e11 (+5)
	; fp4/fp5: x3, y3 (point 2) -- regs: e12-e16 (+10)
	; fp6/fp7: x4, y4 (point 2) -- regs: e17-e22 (+15)
	; d1: MaxIter
	
	; prepare
	movem.l d2-d3,-(sp)
	clr.l   d0			; d0: mark points as "not done" (0)
	; start
	move.w  #0,_IterP1	; default value = 0
	fmove   #0,e3		; i (y1)
	fmove   #0,e2		; r (x1)
	; ------ p2
	move.w  #0,_IterP2
	fmove   #0,e8		; y2
	fmove   #0,e7		; x2
	; ------ p3
	move.w  #0,_IterP3
	fmove   #0,e13		; y3
	fmove   #0,e12		; x3
	; ------ p4
	fmove   #0,e18		; y3
	fmove   #0,e17		; x3
	move.w  #0,_IterP4


.loop4:
	; (1)
	fmul    e2,e2,e4	; r2=r*r
	fmul    e3,e3,e5	; i2=i*i
	; ------ p2
	fmul    e7,e7,e9
	fmul    e8,e8,e10
	; ------ p3
	fmul    e12,e12,e14
	fmul    e13,e13,e15
	; ------ p4
	fmul    e17,e17,e19
	fmul    e18,e18,e20

	; (2)
	fadd    e4,e5,e6    ; r2+i2
	fmul    e2,e3		; r*i
	; ------ p2
	fadd	e9,e10,e11
	fmul    e7,e8    
	; ------ p3
	fadd	e14,e15,e16
	fmul    e12,e13    
	; ------ p4
	fadd	e19,e20,e21
	fmul    e17,e18    

	fsub    e5,e4,e2	; r2-i2
	fadd    e3,e3		; 2*r*i
	; (3)
	; check if points are done
	btst.l  #0,d0		; p1 done?
	bne   	.contp1		; yes => continue with p2
	fcmp.s 	#4,e6		; p1>=4?
	fblt    .contp1		; no => continue
	or.l    #%0001,d0		; mark p1 as done
	move.w  d1,_IterP1	; store iterations for p1
.contp1:
	; ------ p2
	fsub    e10,e9,e7
	fadd    e8,e8
	
	btst.l  #1,d0		; p2 done?
	bne   	.contp2		; yes => continue with calculation
	fcmp.s 	#4,e11		; p2>4?
	fblt    .contp2		; no => continue
	or.l    #%0010,d0		; mark p2 as done
	move.w  d1,_IterP2	; store iterations for p2
.contp2:
	fsub    e15,e14,e12
	fadd    e13,e13

	; ------ p3
	btst.l  #2,d0		; p3 done?
	bne   	.contp3		; yes => continue with calculation
	fcmp.s  #4,e16		; p3>4?
	fblt    .contp3		; no => continue
	or.l    #%0100,d0		; mark p4 as done
	move.w  d1,_IterP3	; store iterations for p3
.contp3:
	; ------ p4
	fsub    e20,e19,e17
	fadd    e18,e18

	; (5)
	fadd    fp0,e2		; r=r2-i2+x
	fadd    fp1,e3		; i=2*r*i+y
	; ------ p2
	fadd    fp2,e7
	fadd    fp3,e8
	; ------ p3
	fadd    fp4,e12
	fadd    fp5,e13
	; ------ p4
	;fadd    fp6,e17
	;fadd    fp7,e18

	btst.l  #3,d0		; p4 done?
	bne   	.contp4		; yes => continue with calculation
	fcmp.s  #4,e21		; p4>4?
	fblt    .contp4		; no => continue
	or.l    #%1000,d0		; mark p4 as done
	move.w  d1,_IterP4	; store iterations for p4
.contp4:

	; (4) => squeeze these instruction in some latencies above!
	;fsub    e5,e4,e2	; r2-i2
	;fadd    e3,e3		; 2*r*i
	; ------ p2
	;fsub    e10,e9,e7
	;fadd    e8,e8
	; ------ p3
	;fsub    e15,e14,e12
	;fadd    e13,e13
	; ------ p4
	;fsub    e20,e19,e17
	;fadd    e18,e18

	; (5)
	;fadd    fp0,e2		; r=r2-i2+x
	;fadd    fp1,e3		; i=2*r*i+y
	; ------ p2
	;fadd    fp2,e7
	;fadd    fp3,e8
	; ------ p3
	;fadd    fp4,e12
	;fadd    fp5,e13
	; ------ p4
	fadd    fp6,e17
	fadd    fp7,e18
	
	; ------
	; [
	; "early" exit in between
	cmp.l   #%1111,d0
	beq     .4exit
	; ]
	dbra.w  d1,.loop4
	
.4exit:
	movem.l (sp)+,d2-d3
	rts
	
; ********************************

_Par2IterateAsm:
	; parameters
	; fp0/fp1: x1, y1 (point 1)	-- regs: e2-e10	(=0)
	; fp2/fp3: x2, y2 (point 2) -- regs: e12-e20 (+10)
	; d0: MaxIter
	; prepare
	
	move.w  #0,_IterP1	; default value = 0
	move.w  #0,_IterP2
	;move.l  d0,d1		; MaxIter
	clr.l   d0			; d0: mark points as "not done" (0)
	; start
	fmove   #0,e3		; i (x1)
	fmove   #0,e2		; r (y1)
	; ------
	fmove   #0,e13		; y2
	fmove   #0,e12		; x2

.loop:
	; (1)
	fmul    e2,e2,e4	; r2=r*r
	fmul    e3,e3,e5	; i2=i*i
	; ------
	fmul    e12,e12,e14
	fmul    e13,e13,e15
	; (2)
	fadd    e4,e5,e6    ; r2+i2
	fmul    e2,e3		; do this instruction here (for free:)
	; ------
	fadd	e14,e15,e16
	fmul    e12,e13    
	; (3)
	
	; check if points are done
	btst.l  #0,d0		; p1 done?
	bne.s   .contp1		; yes => continue with p2
	fcmp.s  #4,e6		; p1>=4?
	fblt    .contp1		; no => continue
	or.l    #1,d0		; mark p1 as done
	move.w  d1,_IterP1	; store iterations for p1
	; ------
.contp1:
	btst.l  #1,d0		; p2 done?
	bne.s   .contp2		; yes => continue with calculation
	fcmp.s  #4,e16		; p2>4?
	fblt    .contp2		; no => continue
	or.l    #2,d0		; mark p2 as done
	move.w  d1,_IterP2	; store iterations for p2
.contp2:
	; (4)
	fsub    e5,e4,e2
	fadd    e3,e3
	; ------
	; [
	; "early" exit in between
	cmp.l   #3,d0
	beq     .exit
	; ]
	; ------
	fsub    e15,e14,e12
	fadd    e13,e13
	; (5)
	fadd    fp0,e2		; r=r2-i2+x
	fadd    fp1,e3		; i=2*r*i+y
	; ------
	fadd    fp2,e12
	fadd    fp3,e13
	; ------
	dbra.w  d1,.loop
	
.exit:
	; d0 = result
	rts
	
; *******************************

; *** original single point calculation routine

_SingleIterateAsm:
	fmove   #0,e3		; i
	fmove   #0,e2		; r

.loop:
	; (1)
	fmul    e2,e2,e4	; r2=r*r
	fmul    e3,e3,e5	; i2=i*i
	; (2)
	fadd    e4,e5,e6    ; r2+i2
	fmul    e2,e3
	; (3)
	fcmp.s  #4,e6		; >=4?
	fbgt    .exit
	; (4)
	fsub    e5,e4,e2
	fadd    e3,e3
	; (5)
	fadd    fp0,e2		; r=r2-i2+x
	fadd    fp1,e3		; i=2*r*i+y
	
	dbra.w    d0,.loop
	clr.l   d0
.exit:
	rts
	
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