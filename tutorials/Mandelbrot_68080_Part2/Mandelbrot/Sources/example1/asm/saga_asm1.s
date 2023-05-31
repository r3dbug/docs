	SECTION code

	XDEF _Set8BitMode
	XDEF _RestoreMode
	XDEF _SetColor
	XDEF _Put8BitPixel
	XDEF _WaitMouse
	XDEF _WaitMouseUp
	
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
	
	SECTION data1
	
oldmode	:	dc.w 0		; save the actual graphics mode to restore it later
oldbuffer:	dc.l 0		;   "   "    "    screen buffer  "    "    "    "
newmode:	dc.w 0		; new graphics mode that we will use for SAGA screen
newbuffer:	dc.l 0		;  "  screen buffer   "   "   "   "   "    "     "     

	SECTION data2,BSS

buffer:	ds.b	1280*720+16
		
	END