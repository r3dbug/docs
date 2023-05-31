              SECTION      text,CODE
__code:
GetTime:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVEM.L        D6/D7,-(A7)              ;48e7 0300 
___GetTime__1:
              MOVE.L         #$dff3fd,A0              ;207c 00df f3fd 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.B         (A0),D0                  ;1010 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         #7.093790e+00,FP0        ;f23c 5423 401c 600a 7c5a c472 
              FMUL.D         #1.000000e+06,FP0        ;f23c 5423 412e 8480 0000 0000 
              FMOVE.D        FP0,-(A7)                ;f227 7400 
              MOVE.L         (A7)+,D0                 ;201f 
              MOVE.L         (A7)+,D1                 ;221f 
              BSR.W          _CXV52                   ;6100 0000 
              MOVE.L         D0,D7                    ;2e00 
              BSR.W          GetStart                 ;6100 0000 
              MOVE.L         D0,D6                    ;2c00 
              BSR.W          GetStop                  ;6100 0000 
              MOVE.L         D0,D1                    ;2200 
              CMP.L          D6,D0                    ;b086 
              BLS.B          ___GetTime__3            ;6306 
___GetTime__2:
              MOVE.L         D1,D0                    ;2001 
              SUB.L          D6,D0                    ;9086 
              BRA.B          ___GetTime__4            ;6006 
___GetTime__3:
              MOVEQ.L        #$ff,D0                  ;70ff 
              SUB.L          D6,D0                    ;9086 
              ADD.L          D1,D0                    ;d081 
___GetTime__4:
              MOVE.L         D7,D1                    ;2207 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D7,D1                    ;c287 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP1                   ;f201 4080 
              FADD.L         D1,FP1                   ;f201 40a2 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP1                   ;f201 40a2 
              FDIV.B         FP0,FP1                  ;f200 00a0 
              FMOVE.X        FP1,FP0                  ;f200 0400 
___GetTime__5:
              MOVEM.L        (A7)+,D6/D7              ;4cdf 00c0 
              RTS                                     ;4e75 
__const:
__strings:
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$50,D0                  ;90bc 0000 0050 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$c,A7                   ;9efc 000c 
              FMOVEM.X       D2/D3/D4/D5/D6/D7,-(A7)  ;f227 e0fc 
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
              BRA.W          ___main__13              ;6000 02a6 
___main__3:
              BSR.W          MultiTaskOff             ;6100 0000 
              BSR.W          MouseOff                 ;6100 0000 
              MOVE.W         #$100,__MERGEDBSS+$1e(A4);397c 0100 001e 
              LEA            __MERGEDBSS+$70(A4),A1   ;43ec 0070 
              MOVE.L         #$c0020000,(A1)+         ;22fc c002 0000 
              MOVE.L         #$0,(A1)+                ;22fc 0000 0000 
              FMOVE.D        #1.250000e+00,FP0        ;f23c 5400 3ff4 0000 0000 0000 
              FMOVE.D        FP0,__MERGEDBSS+$68(A4)  ;f22c 7400 0068 
              MOVE.L         #$bff40000,__MERGEDBSS+$80(A4);297c bff4 0000 0080 
              MOVE.L         #$0,__MERGEDBSS+$84(A4)  ;297c 0000 0000 0084 
              FMOVE.D        FP0,(A1)+                ;f219 7400 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$18(A4),D0   ;302c 0018 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMOVE.D        #3.500000e+00,FP1        ;f23c 5480 400c 0000 0000 0000 
              FDIV.B         FP0,FP1                  ;f200 00a0 
              FMOVE.D        FP1,__MERGEDBSS+$58(A4)  ;f22c 7480 0058 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMOVE.D        #2.500000e+00,FP1        ;f23c 5480 4004 0000 0000 0000 
              FDIV.B         FP0,FP1                  ;f200 00a0 
              FMOVE.D        FP1,__MERGEDBSS+$60(A4)  ;f22c 7480 0060 
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
              DIVS.L         #$100,D0:D1              ;4c7c 0801 0000 0100 
              MOVE.L         D1,D6                    ;2c01 
              BSR.W          rand                     ;6100 0000 
              DIVS.L         #$100,D0:D1              ;4c7c 0801 0000 0100 
              MOVE.L         D1,D2                    ;2401 
              BSR.W          rand                     ;6100 0000 
              DIVS.L         #$100,D0:D1              ;4c7c 0801 0000 0100 
              MOVE.L         D1,D3                    ;2601 
              MOVE.L         D7,D0                    ;2007 
              MOVE.L         D6,D1                    ;2206 
              BSR.W          SetColor                 ;6100 0000 
              ADDQ.W         #$1,D4                   ;5244 
              CMPI.W         #$ff,D4                  ;0c44 00ff 
              BLS.B          ___main__4               ;63c2 
___main__5:
              BSR.W          SetStart                 ;6100 0000 
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
              BRA.W          ___main__10              ;6000 012c 
___main__6:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.W          ___main__8               ;6000 0114 
___main__7:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              LEA            __MERGEDBSS+$80(A4),A1   ;43ec 0080 
              FADD.D         (A1)+,FP0                ;f219 5422 
              FMOVE.D        FP0,__MERGEDBSS+$90(A4)  ;f22c 7400 0090 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP1                   ;f201 4080 
              FADD.L         D1,FP1                   ;f201 40a2 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP1                   ;f201 40a2 
              LEA            __MERGEDBSS+$58(A4),A0   ;41ec 0058 
              FMUL.D         (A0),FP1                 ;f210 54a3 
              FADD.D         __MERGEDBSS+$70(A4),FP1  ;f22c 54a2 0070 
              FMOVE.D        FP1,(A1)+                ;f219 7480 
              FMOVE.X        FP1,FP2                  ;f200 0500 
              FADD.D         (A0),FP2                 ;f210 5522 
              FMOVE.D        FP2,__MERGEDBSS+$98(A4)  ;f22c 7500 0098 
              FMOVE.X        FP2,FP3                  ;f200 0980 
              FADD.D         (A0),FP3                 ;f210 55a2 
              FMOVE.D        FP3,__MERGEDBSS+$a8(A4)  ;f22c 7580 00a8 
              FMOVE.D        (A0)+,FP4                ;f218 5600 
              FADD.B         FP3,FP4                  ;f200 0e22 
              FMOVE.D        FP4,__MERGEDBSS+$b8(A4)  ;f22c 7600 00b8 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1e(A4),D0   ;302c 001e 
              MOVE.L         D0,D1                    ;2200 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.D        (A1)+,FP1                ;f219 5480 
              FMOVE.X        FP1,FP3                  ;f200 0580 
              FMOVE.D        __MERGEDBSS+$a8(A4),FP4  ;f22c 5600 00a8 
              FMOVE.X        FP1,FP5                  ;f200 0680 
              FMOVE.D        __MERGEDBSS+$b8(A4),FP6  ;f22c 5700 00b8 
              FMOVE.X        FP1,FP7                  ;f200 0780 
              BSR.W          Par4IterateAsm           ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$c8(A4),D2   ;342c 00c8 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              ADDQ.L         #$1,D0                   ;5280 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$ca(A4),D2   ;342c 00ca 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              ADDQ.L         #$2,D0                   ;5480 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$cc(A4),D2   ;342c 00cc 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              ADDQ.L         #$3,D0                   ;5680 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$ce(A4),D2   ;342c 00ce 
              BSR.W          Put8BitPixel             ;6100 0000 
              ADDQ.W         #$4,__MERGEDBSS+$14(A4)  ;586c 0014 
___main__8:
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.W          __MERGEDBSS+$18(A4),D0   ;b06c 0018 
              BCS.W          ___main__7               ;6500 fee4 
___main__9:
              ADDQ.W         #$1,__MERGEDBSS+$16(A4)  ;526c 0016 
___main__10:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              CMP.W          __MERGEDBSS+$1a(A4),D0   ;b06c 001a 
              BCS.W          ___main__6               ;6500 fecc 
___main__11:
              BSR.W          SetStop                  ;6100 0000 
              BSR.W          WaitMouseUp              ;6100 0000 
              BSR.W          MouseOn                  ;6100 0000 
              BSR.W          MultiTaskOn              ;6100 0000 
              BSR.W          RestoreMode              ;6100 0000 
              BSR.W          GetTime                  ;6100 fcd8 
___main__12:
              FMOVE.D        FP0,-(A7)                ;f227 7400 
              MOVE.L         (A7)+,D0                 ;201f 
              MOVE.L         (A7)+,D1                 ;221f 
              BSR.W          _CXV52                   ;6100 0000 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP1                   ;f201 4080 
              FADD.L         D1,FP1                   ;f201 40a2 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP1                   ;f201 40a2 
              FSUB.B         FP1,FP0                  ;f200 0428 
              FMUL.W         #$2710,FP0               ;f23c 5023 2710 
              MOVE.L         D0,$64(A7)               ;2f40 0064 
              FMOVE.D        FP0,-(A7)                ;f227 7400 
              MOVE.L         (A7)+,D0                 ;201f 
              MOVE.L         (A7)+,D1                 ;221f 
              BSR.W          _CXV52                   ;6100 0000 
              MOVE.L         #$dff3fd,A0              ;207c 00df f3fd 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.B         (A0),D1                  ;1210 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         $68(A7),-(A7)            ;2f2f 0068 
              MOVE.L         D1,-(A7)                 ;2f01 
              PEA            __MERGED+$18(A4)         ;486c 0018 
              BSR.W          printf                   ;6100 0000 
              LEA            $10(A7),A7               ;4fef 0010 
              MOVEQ.L        #$0,D0                   ;7000 
___main__13:
              MOVEM.L        (A7)+,D2/D3/D4/D6/D7     ;4cdf 00dc 
              FMOVEM.X       (A7)+,D2/D3/D4/D5/D6/D7  ;f21f d03f 
              ADD.W          #$c,A7                   ;defc 000c 
              RTS                                     ;4e75 
              XREF           __base
              XREF           _XCOVF
              XREF           _CXV52
              XREF           GetStart
              XREF           GetStop
              XREF           Set8BitMode
              XREF           MultiTaskOff
              XREF           MouseOff
              XREF           SetColor
              XREF           rand
              XREF           SetStart
              XREF           Par4IterateAsm
              XREF           Put8BitPixel
              XREF           SetStop
              XREF           WaitMouseUp
              XREF           MouseOn
              XREF           MultiTaskOn
              XREF           RestoreMode
              XREF           printf
              XDEF           GetTime
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
              DC.B           'Execution time (%dx core): %u.%04u seconds'
              DC.B           $0a
              DC.B           $00
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
i:
              DS.B           2
MaxIter:
              DS.B           2
xn:
              DS.B           8
yn:
              DS.B           8
xn1:
              DS.B           8
yn1:
              DS.B           8
cx:
              DS.B           8
cy:
              DS.B           8
d:
              DS.B           8
stepr:
              DS.B           8
stepi:
              DS.B           8
maxr:
              DS.B           8
minr:
              DS.B           8
maxi:
              DS.B           8
mini:
              DS.B           8
x1:
              DS.B           8
y1:
              DS.B           8
x2:
              DS.B           8
y2:
              DS.B           8
x3:
              DS.B           8
y3:
              DS.B           8
x4:
              DS.B           8
y4:
              DS.B           8
IterP1:
              DS.B           2
IterP2:
              DS.B           2
IterP3:
              DS.B           2
IterP4:
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
              XDEF           i
              XDEF           MaxIter
              XDEF           xn
              XDEF           yn
              XDEF           xn1
              XDEF           yn1
              XDEF           cx
              XDEF           cy
              XDEF           d
              XDEF           stepr
              XDEF           stepi
              XDEF           maxr
              XDEF           minr
              XDEF           maxi
              XDEF           mini
              XDEF           x1
              XDEF           y1
              XDEF           x2
              XDEF           y2
              XDEF           x3
              XDEF           y3
              XDEF           x4
              XDEF           y4
              XDEF           IterP1
              XDEF           IterP2
              XDEF           IterP3
              XDEF           IterP4
              END
