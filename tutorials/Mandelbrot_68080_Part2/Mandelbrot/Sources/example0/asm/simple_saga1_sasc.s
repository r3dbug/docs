              SECTION      text,CODE
__code:
Set8BitMode:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$8,D0                   ;5180 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVEM.L        D5/D6/D7/A6,-(A7)        ;48e7 0702 
___Set8BitMode__1:
              MOVE.W         $1e(A7),D5               ;3a2f 001e 
              MOVE.W         $1a(A7),D6               ;3c2f 001a 
              MOVE.W         $16(A7),D7               ;3e2f 0016 
              MOVE.L         __MERGED+$4(A4),A0       ;206c 0004 
              MOVE.W         (A0),__MERGEDBSS(A4)     ;3950 0000 
              MOVE.L         __MERGED+$c(A4),A0       ;206c 000c 
              MOVE.L         (A0),__MERGEDBSS+$2(A4)  ;2950 0002 
              MOVE.W         D6,D0                    ;3006 
              MULU.W         D5,D0                    ;c0c5 
              MOVEQ.L        #$10,D1                  ;7210 
              ADD.L          D1,D0                    ;d081 
              MOVE.L         D0,__MERGEDBSS+$10(A4)   ;2940 0010 
              MOVEQ.L        #$1,D1                   ;7201 
              SWAP           D1                       ;4841 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff3a(A6)            ;4eae ff3a 
              MOVE.L         D0,__MERGEDBSS+$8(A4)    ;2940 0008 
              BNE.B          ___Set8BitMode__3        ;6604 
___Set8BitMode__2:
              MOVEQ.L        #$0,D0                   ;7000 
              BRA.B          ___Set8BitMode__5        ;6030 
___Set8BitMode__3:
              MOVEQ.L        #$10,D1                  ;7210 
              ADD.L          D1,D0                    ;d081 
              ANDI.W         #$fffffff0,D0            ;0240 fff0 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              MOVE.L         D7,D1                    ;2207 
              MOVE.W         D1,__MERGEDBSS+$6(A4)    ;3941 0006 
              MOVE.L         __MERGED(A4),A0          ;206c 0000 
              MOVE.W         D1,(A0)                  ;3081 
              MOVE.L         __MERGEDBSS+$c(A4),D0    ;202c 000c 
              MOVE.L         __MERGED+$8(A4),A0       ;206c 0008 
              MOVE.L         D0,(A0)                  ;2080 
              MOVE.W         D6,__MERGEDBSS+$18(A4)   ;3946 0018 
              MOVE.W         D5,__MERGEDBSS+$1a(A4)   ;3945 001a 
              MOVE.L         __MERGEDBSS+$c(A4),A0    ;206c 000c 
              MOVE.L         A0,D0                    ;2008 
___Set8BitMode__4:
___Set8BitMode__5:
              MOVEM.L        (A7)+,D5/D6/D7/A6        ;4cdf 40e0 
              RTS                                     ;4e75 
__const:
__strings:
RestoreMode:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$8,D0                   ;5180 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVE.L         A6,-(A7)                 ;2f0e 
___RestoreMode__1:
              MOVE.L         __MERGED(A4),A0          ;206c 0000 
              MOVE.W         __MERGEDBSS(A4),(A0)     ;30ac 0000 
              MOVE.L         __MERGED+$8(A4),A0       ;206c 0008 
              MOVE.L         __MERGEDBSS+$2(A4),(A0)  ;20ac 0002 
              MOVE.L         __MERGEDBSS+$8(A4),D0    ;202c 0008 
              BEQ.B          ___RestoreMode__4        ;670e 
___RestoreMode__2:
              MOVE.L         D0,A1                    ;2240 
              MOVE.L         __MERGEDBSS+$10(A4),D0   ;202c 0010 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff2e(A6)            ;4eae ff2e 
___RestoreMode__3:
___RestoreMode__4:
              MOVE.L         (A7)+,A6                 ;2c5f 
              RTS                                     ;4e75 
Put8BitPixel:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVEM.L        D5/D6/D7,-(A7)           ;48e7 0700 
___Put8BitPixel__1:
              MOVE.B         $1b(A7),D5               ;1a2f 001b 
              MOVE.W         $16(A7),D6               ;3c2f 0016 
              MOVE.W         $12(A7),D7               ;3e2f 0012 
              MOVE.L         __MERGEDBSS+$c(A4),A0    ;206c 000c 
              MOVE.W         __MERGEDBSS+$18(A4),D0   ;302c 0018 
              MOVE.W         D6,D1                    ;3206 
              MULU.W         D0,D1                    ;c2c0 
              ADD.L          D1,A0                    ;d1c1 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D7,D0                    ;3007 
              ADD.L          D0,A0                    ;d1c0 
              MOVE.B         D5,(A0)                  ;1085 
___Put8BitPixel__2:
              MOVEM.L        (A7)+,D5/D6/D7           ;4cdf 00e0 
              RTS                                     ;4e75 
SetColor:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$4,D0                   ;5980 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUBQ.W         #$4,A7                   ;594f 
              MOVEM.L        D4/D5/D6/D7,-(A7)        ;48e7 0f00 
___SetColor__1:
              MOVE.L         $24(A7),D4               ;282f 0024 
              MOVE.L         $20(A7),D5               ;2a2f 0020 
              MOVE.L         $1c(A7),D6               ;2c2f 001c 
              MOVE.L         $18(A7),D7               ;2e2f 0018 
              MOVE.L         D7,D0                    ;2007 
              SWAP           D0                       ;4840 
              CLR.W          D0                       ;4240 
              ASL.L          #$8,D0                   ;e180 
              MOVE.L         D6,D1                    ;2206 
              SWAP           D1                       ;4841 
              CLR.W          D1                       ;4241 
              OR.L           D1,D0                    ;8081 
              MOVE.L         D5,D1                    ;2205 
              ASL.L          #$8,D1                   ;e181 
              OR.L           D1,D0                    ;8081 
              OR.L           D4,D0                    ;8084 
              MOVE.L         __MERGED+$10(A4),A0      ;206c 0010 
              MOVE.L         D0,(A0)                  ;2080 
___SetColor__2:
              MOVEM.L        (A7)+,D4/D5/D6/D7        ;4cdf 00f0 
              ADDQ.W         #$4,A7                   ;584f 
              RTS                                     ;4e75 
WaitMouse:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$4,D0                   ;5980 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUBQ.W         #$4,A7                   ;594f 
___WaitMouse__1:
              MOVE.L         #$bfe001,A0              ;207c 00bf e001 
              MOVEQ.L        #$40,D0                  ;7040 
              AND.B          (A0),D0                  ;c010 
              MOVE.B         D0,$3(A7)                ;1f40 0003 
___WaitMouse__2:
              MOVE.L         #$bfe001,A0              ;207c 00bf e001 
              MOVEQ.L        #$40,D0                  ;7040 
              AND.B          (A0),D0                  ;c010 
              MOVE.B         $3(A7),D1                ;122f 0003 
              CMP.B          D0,D1                    ;b200 
              BNE.B          ___WaitMouse__5          ;6602 
___WaitMouse__3:
              BRA.B          ___WaitMouse__2          ;60ec 
___WaitMouse__4:
___WaitMouse__5:
              ADDQ.W         #$4,A7                   ;584f 
              RTS                                     ;4e75 
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$1c,D0                  ;90bc 0000 001c 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$c,A7                   ;9efc 000c 
              MOVEM.L        D2/D7,-(A7)              ;48e7 2100 
___main__1:
              PEA            ($2d0).w                 ;4878 02d0 
              PEA            ($500).w                 ;4878 0500 
              PEA            ($a01).w                 ;4878 0a01 
              BSR.W          Set8BitMode              ;6100 fe70 
___main__2:
              LEA            $c(A7),A7                ;4fef 000c 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              BNE.B          ___main__4               ;6606 
___main__3:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__21              ;6000 00e2 
___main__4:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          SetColor                 ;6100 ff40 
___main__5:
              LEA            $10(A7),A7               ;4fef 0010 
              MOVEQ.L        #$1,D7                   ;7e01 
___main__6:
              CMPI.W         #$ff,D7                  ;0c47 00ff 
              BHI.B          ___main__10              ;624e 
___main__7:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D7,D0                    ;3007 
              MOVE.L         D0,$8(A7)                ;2f40 0008 
              BSR.W          rand                     ;6100 0000 
              MOVEQ.L        #$40,D1                  ;7240 
              LSL.L          #$2,D1                   ;e589 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,$c(A7)                ;2f41 000c 
              BSR.W          rand                     ;6100 0000 
              MOVEQ.L        #$40,D1                  ;7240 
              LSL.L          #$2,D1                   ;e589 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,$10(A7)               ;2f41 0010 
              BSR.W          rand                     ;6100 0000 
              MOVEQ.L        #$40,D1                  ;7240 
              LSL.L          #$2,D1                   ;e589 
              BSR.W          _CXD33                   ;6100 0000 
              MOVE.L         D1,-(A7)                 ;2f01 
              MOVE.L         $14(A7),-(A7)            ;2f2f 0014 
              MOVE.L         $14(A7),-(A7)            ;2f2f 0014 
              MOVE.L         $14(A7),-(A7)            ;2f2f 0014 
              BSR.W          SetColor                 ;6100 feee 
___main__8:
              LEA            $10(A7),A7               ;4fef 0010 
___main__9:
              ADDQ.W         #$1,D7                   ;5247 
              BRA.B          ___main__6               ;60ac 
___main__10:
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
___main__11:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              MOVE.W         __MERGEDBSS+$1a(A4),D1   ;322c 001a 
              CMP.W          D1,D0                    ;b041 
              BCC.B          ___main__18              ;645e 
___main__12:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
___main__13:
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVE.W         __MERGEDBSS+$18(A4),D1   ;322c 0018 
              CMP.W          D1,D0                    ;b041 
              BCC.B          ___main__17              ;6442 
___main__14:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D0,D2                    ;3400 
              MOVE.L         D0,$c(A7)                ;2f40 000c 
              MOVE.L         D2,D0                    ;2002 
              MOVE.L         D1,$8(A7)                ;2f41 0008 
              MOVEQ.L        #$40,D1                  ;7240 
              LSL.L          #$2,D1                   ;e589 
              BSR.W          _CXD33                   ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.B         D1,D0                    ;1001 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         $10(A7),-(A7)            ;2f2f 0010 
              MOVE.L         $10(A7),-(A7)            ;2f2f 0010 
              BSR.W          Put8BitPixel             ;6100 fe60 
___main__15:
              LEA            $c(A7),A7                ;4fef 000c 
___main__16:
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              ADDQ.W         #$1,D0                   ;5240 
              MOVE.W         D0,__MERGEDBSS+$14(A4)   ;3940 0014 
              BRA.B          ___main__13              ;60b2 
___main__17:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              ADDQ.W         #$1,D0                   ;5240 
              MOVE.W         D0,__MERGEDBSS+$16(A4)   ;3940 0016 
              BRA.B          ___main__11              ;6096 
___main__18:
              BSR.W          WaitMouse                ;6100 febc 
___main__19:
              BSR.W          RestoreMode              ;6100 fe06 
___main__20:
              MOVEQ.L        #$0,D0                   ;7000 
___main__21:
              MOVEM.L        (A7)+,D2/D7              ;4cdf 0084 
              ADD.W          #$c,A7                   ;defc 000c 
              RTS                                     ;4e75 
              XREF           __base
              XREF           _XCOVF
              XREF           rand
              XREF           _CXD33
              XDEF           Set8BitMode
              XDEF           RestoreMode
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
              XDEF           SAGAMODEW
              XDEF           SAGAMODER
              XDEF           SAGAPTRW
              XDEF           SAGAPTRR
              XDEF           SAGACOLORW

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
