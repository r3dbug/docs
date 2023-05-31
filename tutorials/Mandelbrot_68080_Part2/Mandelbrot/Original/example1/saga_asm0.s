	SECTION code

	XDEF _Set8BitMode
	XDEF _RestoreMode

SAGAMODEW 		EQU	$dff1f4		; SAGA mode and pixel format - write
SAGAMODER		EQU	$dfe1f4		;  "     "   "    "      "   - read 
SAGAPTRW		EQU	$dff1ec		; SAGA screen buffer - write
SAGAPTRR		EQU	$dfe1ec		;  "     "      "    - read 
SAGACOLORW		EQU	$dff388		; chunky port color register

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

	SECTION data1
	
oldmode	:	dc.w 0		; save the actual graphics mode to restore it later
oldbuffer:	dc.l 0		;   "   "    "    screen buffer  "    "    "    "
newmode:	dc.w 0		; new graphics mode that we will use for SAGA screen
newbuffer:	dc.l 0		;  "  screen buffer   "   "   "   "   "    "     "     

	SECTION data2,BSS

buffer:		ds.b	1280*720+16
		
	END