              SECTION      text,CODE
__code:
Put8BitPixel:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
___Put8BitPixel__1:
              MOVE.W         __MERGEDBSS+$18(A4),D0   ;302c 0018 
              MOVE.W         $a(A7),D1                ;322f 000a 
              MULU.W         D0,D1                    ;c2c0 
              MOVE.L         __MERGEDBSS+$c(A4),A0    ;206c 000c 
              ADD.L          D1,A0                    ;d1c1 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         $6(A7),D0                ;302f 0006 
              MOVE.B         $f(A7),$0(A0,D0.L)       ;11af 000f 0800 
___Put8BitPixel__2:
              RTS                                     ;4e75 
__const:
__strings:
SetColor:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVE.L         D2,-(A7)                 ;2f02 
___SetColor__1:
              MOVE.L         $10(A7),D0               ;202f 0010 
              ASL.L          #$8,D0                   ;e180 
              MOVE.L         $c(A7),D1                ;222f 000c 
              SWAP           D1                       ;4841 
              CLR.W          D1                       ;4241 
              MOVE.L         $8(A7),D2                ;242f 0008 
              SWAP           D2                       ;4842 
              CLR.W          D2                       ;4242 
              ASL.L          #$8,D2                   ;e182 
              OR.L           D1,D2                    ;8481 
              OR.L           D0,D2                    ;8480 
              OR.L           $14(A7),D2               ;84af 0014 
              MOVE.L         __MERGED+$10(A4),A0      ;206c 0010 
              MOVE.L         D2,(A0)                  ;2082 
___SetColor__2:
              MOVE.L         (A7)+,D2                 ;241f 
              RTS                                     ;4e75 
WaitMouse:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$4,D0                   ;5980 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUBQ.W         #$4,A7                   ;594f 
___WaitMouse__1:
              MOVE.L         __MERGED+$14(A4),A0      ;206c 0014 
              MOVEQ.L        #$40,D0                  ;7040 
              AND.B          (A0),D0                  ;c010 
              MOVE.B         D0,$3(A7)                ;1f40 0003 
___WaitMouse__2:
              MOVE.L         __MERGED+$14(A4),A0      ;206c 0014 
              MOVE.B         (A0),D0                  ;1010 
              MOVE.B         $3(A7),D1                ;122f 0003 
              ANDI.B         #$40,D0                  ;0200 0040 
              CMP.B          D0,D1                    ;b200 
              BEQ.B          ___WaitMouse__2          ;67ee 
___WaitMouse__3:
___WaitMouse__4:
              ADDQ.W         #$4,A7                   ;584f 
              RTS                                     ;4e75 
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$18,D0                  ;90bc 0000 0018 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUBQ.W         #$8,A7                   ;514f 
              MOVEM.L        D2/D5/D6/D7,-(A7)        ;48e7 2700 
___main__1:
              MOVE.L         #$a01,D0                 ;203c 0000 0a01 
              MOVE.L         #$500,D1                 ;223c 0000 0500 
              MOVE.L         #$2d0,D2                 ;243c 0000 02d0 
              BSR.W          Set8BitMode              ;6100 0000 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              BNE.B          ___main__3               ;6606 
___main__2:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__16              ;6000 00cc 
___main__3:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          SetColor                 ;6100 ff58 
___main__4:
              LEA            $10(A7),A7               ;4fef 0010 
              MOVEQ.L        #$1,D2                   ;7401 
___main__5:
              MOVEQ.L        #$0,D7                   ;7e00 
              MOVE.W         D2,D7                    ;3e02 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,D6                    ;2c01 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,D5                    ;2a01 
              BSR.W          rand                     ;6100 0000 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,-(A7)                 ;2f01 
              MOVE.L         D5,-(A7)                 ;2f05 
              MOVE.L         D6,-(A7)                 ;2f06 
              MOVE.L         D7,-(A7)                 ;2f07 
              BSR.W          SetColor                 ;6100 ff14 
___main__6:
              LEA            $10(A7),A7               ;4fef 0010 
              ADDQ.W         #$1,D2                   ;5242 
              CMPI.W         #$ff,D2                  ;0c42 00ff 
              BLS.B          ___main__5               ;63b6 
___main__7:
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
              BRA.B          ___main__13              ;6052 
___main__8:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.B          ___main__11              ;603e 
___main__9:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D1,D2                    ;3401 
              MOVE.L         D0,$10(A7)               ;2f40 0010 
              MOVE.L         D2,D0                    ;2002 
              MOVE.L         D1,$14(A7)               ;2f41 0014 
              MOVE.L         #$100,D1                 ;223c 0000 0100 
              BSR.W          _CXD33                   ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.B         D1,D0                    ;1001 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         $18(A7),-(A7)            ;2f2f 0018 
              MOVE.L         $18(A7),-(A7)            ;2f2f 0018 
              BSR.W          Put8BitPixel             ;6100 fea0 
___main__10:
              LEA            $c(A7),A7                ;4fef 000c 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__11:
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.W          __MERGEDBSS+$18(A4),D0   ;b06c 0018 
              BCS.B          ___main__9               ;65b8 
___main__12:
              ADDQ.W         #$1,__MERGEDBSS+$16(A4)  ;526c 0016 
___main__13:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              CMP.W          __MERGEDBSS+$1a(A4),D0   ;b06c 001a 
              BCS.B          ___main__8               ;65a4 
___main__14:
              BSR.W          WaitMouse                ;6100 fed6 
___main__15:
              BSR.W          RestoreMode              ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
___main__16:
              MOVEM.L        (A7)+,D2/D5/D6/D7        ;4cdf 00e4 
              ADDQ.W         #$8,A7                   ;504f 
              RTS                                     ;4e75 
              XREF           __base
              XREF           _XCOVF
              XREF           Set8BitMode
              XREF           rand
              XREF           _CXD33
              XREF           RestoreMode
              XDEF           Put8BitPixel
              XDEF           SetColor
              XDEF           WaitMouse
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
