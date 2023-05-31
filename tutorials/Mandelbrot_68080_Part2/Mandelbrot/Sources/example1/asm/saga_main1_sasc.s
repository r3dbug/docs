              SECTION      text,CODE
__code:
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$10,D0                  ;90bc 0000 0010 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVEM.L        D2/D3/D4/D6/D7,-(A7)     ;48e7 3b00 
___main__1:
              MOVE.L         #$a01,D0                 ;203c 0000 0a01 
              MOVE.L         #$500,D1                 ;223c 0000 0500 
              MOVE.L         #$2d0,D2                 ;243c 0000 02d0 
              BSR.W          Set8BitMode              ;6100 0000 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              BNE.B          ___main__3               ;6606 
___main__2:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__12              ;6000 00a2 
___main__3:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.L         D0,D1                    ;2200 
              MOVE.L         D0,D2                    ;2400 
              MOVE.L         D0,D3                    ;2600 
              BSR.W          SetColor                 ;6100 0000 
              MOVEQ.L        #$1,D4                   ;7801 
___main__4:
              MOVEQ.L        #$0,D7                   ;7e00 
              MOVE.W         D4,D7                    ;3e04 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,D6                    ;2c01 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,D2                    ;2401 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,D3                    ;2601 
              MOVE.L         D7,D0                    ;2007 
              MOVE.L         D6,D1                    ;2206 
              BSR.W          SetColor                 ;6100 0000 
              ADDQ.W         #$1,D4                   ;5244 
              CMPI.W         #$ff,D4                  ;0c44 00ff 
              BLS.B          ___main__4               ;63bc 
___main__5:
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
              BRA.B          ___main__10              ;6034 
___main__6:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.B          ___main__8               ;6020 
___main__7:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVE.W         #$ff,D2                  ;343c 00ff 
              AND.W          D1,D2                    ;c441 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D2,D3                    ;3602 
              MOVE.L         D3,D2                    ;2403 
              BSR.W          Put8BitPixel             ;6100 0000 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__8:
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.W          __MERGEDBSS+$18(A4),D0   ;b06c 0018 
              BCS.B          ___main__7               ;65d6 
___main__9:
              ADDQ.W         #$1,__MERGEDBSS+$16(A4)  ;526c 0016 
___main__10:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              CMP.W          __MERGEDBSS+$1a(A4),D0   ;b06c 001a 
              BCS.B          ___main__6               ;65c2 
___main__11:
              BSR.W          WaitMouseUp              ;6100 0000 
              BSR.W          RestoreMode              ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
___main__12:
              MOVEM.L        (A7)+,D2/D3/D4/D6/D7     ;4cdf 00dc 
              RTS                                     ;4e75 
__const:
__strings:
              XREF           __base
              XREF           _XCOVF
              XREF           Set8BitMode
              XREF           SetColor
              XREF           rand
              XREF           _CXD33
              XREF           Put8BitPixel
              XREF           WaitMouseUp
              XREF           RestoreMode
              XDEF           main

              SECTION        __MERGED,DATA
__MERGED
SAGAMODEW:
              DC.L           $00DFF1F4
SAGAMODER:
              DC.L           $00DFE1F4
SAGAPTRW:
              DC.L           $00DFF1EC
SAGAPTRR:
              DC.L           $00DFE1EC
SAGACOLORW:
              DC.L           $00DFF388
CIAAPRA:
              DC.L           $00BFE001
              XDEF           SAGAMODEW
              XDEF           SAGAMODER
              XDEF           SAGAPTRW
              XDEF           SAGAPTRR
              XDEF           SAGACOLORW
              XDEF           CIAAPRA

              SECTION        __MERGED,BSS
__MERGEDBSS
oldmode:
              DS.B           2
oldbuffer:
              DS.B           4
newmode:
              DS.B           2
rawbuffer:
              DS.B           4
newbuffer:
              DS.B           4
memsize:
              DS.B           4
x:
              DS.B           2
y:
              DS.B           2
resx:
              DS.B           2
resy:
              DS.B           2
              XDEF           oldmode
              XDEF           oldbuffer
              XDEF           newmode
              XDEF           rawbuffer
              XDEF           newbuffer
              XDEF           memsize
              XDEF           x
              XDEF           y
              XDEF           resx
              XDEF           resy
              END
