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
Iterate:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              FMOVEM.X       D3/D4/D5/D6/D7,-(A7)     ;f227 e0f8 
              MOVE.L         D7,-(A7)                 ;2f07 
___Iterate__1:
              FMOVE.D        $4c(A7),FP7              ;f22f 5780 004c 
              FMOVE.D        #0.000000e+00,FP6        ;f23c 5700 0000 0000 0000 0000 
              FMOVE.D        #0.000000e+00,FP5        ;f23c 5680 0000 0000 0000 0000 
              FMOVE.D        #0.000000e+00,FP4        ;f23c 5600 0000 0000 0000 0000 
              FMOVE.D        #0.000000e+00,FP3        ;f23c 5580 0000 0000 0000 0000 
              MOVE.W         $56(A7),D7               ;3e2f 0056 
              BRA.B          ___Iterate__3            ;6032 
___Iterate__2:
              FMUL.W         #$2,FP6                  ;f23c 5323 0002 
              FMUL.B         FP4,FP6                  ;f200 1323 
              FADD.B         FP7,FP6                  ;f200 1f22 
              FMOVE.X        FP6,FP4                  ;f200 1a00 
              FMOVE.X        FP5,FP6                  ;f200 1700 
              FSUB.B         FP3,FP6                  ;f200 0f28 
              FADD.D         $44(A7),FP6              ;f22f 5722 0044 
              FMOVE.X        FP6,FP5                  ;f200 1a80 
              FMUL.B         FP6,FP5                  ;f200 1aa3 
              FMOVE.X        FP4,FP3                  ;f200 1180 
              FMUL.B         FP4,FP3                  ;f200 11a3 
              SUBQ.W         #$1,D7                   ;5347 
___Iterate__3:
              TST.W          D7                       ;4a47 
              BEQ.B          ___Iterate__5            ;6712 
___Iterate__4:
              FMOVE.X        FP5,FP0                  ;f200 1400 
              FADD.B         FP3,FP0                  ;f200 0c22 
              FCMP.W         #$4,FP0                  ;f23c 5038 0004 
              FBULE.W        ___Iterate__2            ;f28d ffba 
___Iterate__5:
              MOVE.W         D7,D0                    ;3007 
___Iterate__6:
              MOVE.L         (A7)+,D7                 ;2e1f 
              FMOVEM.X       (A7)+,D3/D4/D5/D6/D7     ;f21f d01f 
              RTS                                     ;4e75 
AddQueue:
              CMP.L          __base(A4),A7            ;bfec 0000 
              BCS.W          _XCOVF                   ;6500 0000 
___AddQueue__1:
              MOVE.L         $4(A7),D1                ;222f 0004 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___AddQueue__4           ;6622 
___AddQueue__2:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___AddQueue__4           ;6604 
___AddQueue__3:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___AddQueue__4:
              RTS                                     ;4e75 
AllocateBoundary:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$8,D0                   ;5180 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVEM.L        D2/A6,-(A7)              ;48e7 2002 
___AllocateBoundary__1:
              MOVE.W         __MERGEDBSS+$1e(A4),D0   ;302c 001e 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MULU.W         D0,D1                    ;c2c0 
              MOVE.L         D1,__MERGEDBSS+$98(A4)   ;2941 0098 
              MOVE.W         __MERGEDBSS+$1c(A4),D2   ;342c 001c 
              MULU.W         D0,D2                    ;c4c0 
              ASL.L          #$2,D2                   ;e582 
              ASL.L          #$2,D2                   ;e582 
              MOVE.L         D2,__MERGEDBSS+$9c(A4)   ;2942 009c 
              MOVE.L         __MERGEDBSS+$c(A4),__MERGEDBSS+$88(A4);296c 000c 0088 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         #$10001,D1               ;223c 0001 0001 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff3a(A6)            ;4eae ff3a 
              MOVE.L         D0,__MERGEDBSS+$8c(A4)   ;2940 008c 
              MOVE.L         __MERGEDBSS+$9c(A4),D0   ;202c 009c 
              MOVE.L         #$10001,D1               ;223c 0001 0001 
              JSR            $ffffff3a(A6)            ;4eae ff3a 
              MOVE.L         D0,__MERGEDBSS+$90(A4)   ;2940 0090 
              TST.L          __MERGEDBSS+$88(A4)      ;4aac 0088 
              BEQ.B          ___AllocateBoundary__4   ;670a 
___AllocateBoundary__2:
              TST.L          __MERGEDBSS+$8c(A4)      ;4aac 008c 
              BEQ.B          ___AllocateBoundary__4   ;6704 
___AllocateBoundary__3:
              TST.L          D0                       ;4a80 
              BNE.B          ___AllocateBoundary__5   ;6604 
___AllocateBoundary__4:
              MOVEQ.L        #$0,D0                   ;7000 
              DC.W           $c40                     ;0c40 
___AllocateBoundary__5:
              MOVEQ.L        #$1,D0                   ;7001 
___AllocateBoundary__6:
              MOVEM.L        (A7)+,D2/A6              ;4cdf 4004 
              RTS                                     ;4e75 
DeallocateBoundary:
              MOVE.L         A7,D0                    ;200f 
              SUBQ.L         #$8,D0                   ;5180 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              MOVE.L         A6,-(A7)                 ;2f0e 
___DeallocateBoundary__1:
              MOVE.L         __MERGEDBSS+$90(A4),D0   ;202c 0090 
              BEQ.B          ___DeallocateBoundary__3 ;670e 
___DeallocateBoundary__2:
              MOVE.L         D0,A1                    ;2240 
              MOVE.L         __MERGEDBSS+$9c(A4),D0   ;202c 009c 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff2e(A6)            ;4eae ff2e 
___DeallocateBoundary__3:
              MOVE.L         __MERGEDBSS+$8c(A4),D0   ;202c 008c 
              BEQ.B          ___DeallocateBoundary__5 ;670e 
___DeallocateBoundary__4:
              MOVE.L         D0,A1                    ;2240 
              MOVE.L         __MERGEDBSS+$98(A4),D0   ;202c 0098 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff2e(A6)            ;4eae ff2e 
___DeallocateBoundary__5:
              MOVE.L         (A7)+,A6                 ;2c5f 
              RTS                                     ;4e75 
Load:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$14,D0                  ;90bc 0000 0014 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              FMOVE.X        FP2,-(A7)                ;f227 6900 
              MOVEM.L        D2/D3/D4/D7,-(A7)        ;48e7 3900 
___Load__1:
              MOVE.L         $20(A7),D7               ;2e2f 0020 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D7.L)          ;0830 0000 7800 
              BEQ.B          ___Load__3               ;670e 
___Load__2:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.B         $0(A0,D7.L),D0           ;1030 7800 
              BRA.W          ___Load__4               ;6000 00ac 
___Load__3:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              DIVU.L         D0,D1:D2                 ;4c40 1002 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D7,D3                    ;2607 
              DIVU.L         D1,D3                    ;4c41 3003 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D2,D0                    ;3002 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D3,D0                    ;3003 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVE.W         D0,D4                    ;3800 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D2,D1                    ;3202 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D3,D2                    ;3403 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D0,D3                    ;3600 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         D2,D1                    ;2202 
              MOVE.L         D3,D2                    ;2403 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D7.L)          ;08f0 0000 7800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         D4,D0                    ;3004 
              MOVE.B         D0,$0(A0,D7.L)           ;1180 7800 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.B         D0,D1                    ;1200 
              MOVE.L         D1,D0                    ;2001 
___Load__4:
              MOVEM.L        (A7)+,D2/D3/D4/D7        ;4cdf 009c 
              FMOVE.X        (A7)+,FP2                ;f21f 4900 
              RTS                                     ;4e75 
Scan:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$3c,D0                  ;90bc 0000 003c 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$28,A7                  ;9efc 0028 
              FMOVE.X        FP2,-(A7)                ;f227 6900 
              MOVEM.L        D2/D3/D4/D5/D6/D7,-(A7)  ;48e7 3f00 
___Scan__1:
              MOVE.L         $50(A7),D7               ;2e2f 0050 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              DIVU.L         D0,D1:D2                 ;4c40 1002 
              MOVE.L         D2,D6                    ;2c02 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D7,D5                    ;2a07 
              DIVU.L         D1,D5                    ;4c41 5005 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D7.L)          ;0830 0000 7800 
              BEQ.B          ___Scan__3               ;670e 
___Scan__2:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVEQ.L        #$0,D4                   ;7800 
              MOVE.B         $0(A0,D7.L),D4           ;1830 7800 
              BRA.W          ___Scan__4               ;6000 00b6 
___Scan__3:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D7,D2                    ;2407 
              DIVU.L         D1,D2:D3                 ;4c41 2003 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D7,D0                    ;2007 
              DIVU.L         D1,D0                    ;4c41 0000 
              MOVE.W         D0,$26(A7)               ;3f40 0026 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D3,D0                    ;3003 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVE.W         $26(A7),D1               ;322f 0026 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D3,D1                    ;3203 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         $26(A7),D2               ;342f 0026 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D0,D3                    ;3600 
              MOVE.W         D0,$24(A7)               ;3f40 0024 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         D2,D1                    ;2202 
              MOVE.L         D3,D2                    ;2403 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D7.L)          ;08f0 0000 7800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         $24(A7),D0               ;302f 0024 
              MOVE.B         D0,$0(A0,D7.L)           ;1180 7800 
              MOVEQ.L        #$0,D4                   ;7800 
              MOVE.B         D0,D4                    ;1800 
___Scan__4:
              MOVEQ.L        #$1,D1                   ;7201 
              CMP.L          D1,D6                    ;bc81 
              SCC            D0                       ;54c0 
              NEG.B          D0                       ;4400 
              EXTB.L         D0                       ;49c0 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1c(A4),D2   ;342c 001c 
              MOVE.L         D2,D3                    ;2602 
              SUBQ.L         #$1,D3                   ;5383 
              CMP.L          D3,D6                    ;bc83 
              SCS            D3                       ;55c3 
              NEG.B          D3                       ;4403 
              EXTB.L         D3                       ;49c3 
              MOVE.L         D3,$3a(A7)               ;2f43 003a 
              CMP.L          D1,D5                    ;ba81 
              SCC            D3                       ;54c3 
              NEG.B          D3                       ;4403 
              EXTB.L         D3                       ;49c3 
              MOVE.L         D3,$32(A7)               ;2f43 0032 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         __MERGEDBSS+$1e(A4),D3   ;362c 001e 
              SUBQ.L         #$1,D3                   ;5383 
              CMP.L          D3,D5                    ;ba83 
              SCS            D3                       ;55c3 
              NEG.B          D3                       ;4403 
              EXTB.L         D3                       ;49c3 
              MOVE.L         D0,$3e(A7)               ;2f40 003e 
              MOVE.L         D3,$36(A7)               ;2f43 0036 
              TST.L          D0                       ;4a80 
              BEQ.W          ___Scan__10              ;6700 00de 
___Scan__5:
              MOVE.L         D7,D6                    ;2c07 
              SUBQ.L         #$1,D6                   ;5386 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D6.L)          ;0830 0000 6800 
              BEQ.B          ___Scan__7               ;670e 
___Scan__6:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              ADD.L          D6,A0                    ;d1c6 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         (A0),D6                  ;1c10 
              BRA.W          ___Scan__8               ;6000 00b8 
___Scan__7:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D2,D1                    ;3202 
              MOVE.L         D6,D0                    ;2006 
              MOVE.L         D1,$2a(A7)               ;2f41 002a 
              MOVE.L         $2a(A7),D3               ;262f 002a 
              DIVU.L         D3,D0:D1                 ;4c43 0001 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D2,D0                    ;3002 
              MOVE.L         D6,D2                    ;2406 
              DIVU.L         D0,D2                    ;4c40 2002 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D0,D3                    ;2600 
              LSR.L          #$1,D3                   ;e28b 
              FMOVE.L        D3,FP0                   ;f203 4000 
              FADD.L         D3,FP0                   ;f203 4022 
              MOVEQ.L        #$1,D3                   ;7601 
              AND.L          D0,D3                    ;c680 
              FADD.L         D3,FP0                   ;f203 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D2,D0                    ;3002 
              MOVE.L         D0,D3                    ;2600 
              LSR.L          #$1,D3                   ;e28b 
              FMOVE.L        D3,FP0                   ;f203 4000 
              FADD.L         D3,FP0                   ;f203 4022 
              MOVEQ.L        #$1,D3                   ;7601 
              AND.L          D0,D3                    ;c680 
              FADD.L         D3,FP0                   ;f203 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              MOVE.W         D1,$28(A7)               ;3f41 0028 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVE.W         $28(A7),D1               ;322f 0028 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D1,D3                    ;3601 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D2,D1                    ;3202 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D0,D2                    ;3400 
              MOVE.W         D0,$24(A7)               ;3f40 0024 
              MOVE.L         D3,D0                    ;2003 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D6.L)          ;08f0 0000 6800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         $24(A7),D0               ;302f 0024 
              MOVE.B         D0,$0(A0,D6.L)           ;1180 6800 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         D0,D6                    ;1c00 
___Scan__8:
              CMP.L          D4,D6                    ;bc84 
              BEQ.B          ___Scan__10              ;6704 
___Scan__9:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__10:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__11:
              MOVE.L         D0,$2e(A7)               ;2f40 002e 
              TST.L          $3a(A7)                  ;4aaf 003a 
              BEQ.W          ___Scan__17              ;6700 00da 
___Scan__12:
              MOVE.L         D7,D6                    ;2c07 
              ADDQ.L         #$1,D6                   ;5286 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D6.L)          ;0830 0000 6800 
              BEQ.B          ___Scan__14              ;670e 
___Scan__13:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              ADD.L          D6,A0                    ;d1c6 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         (A0),D6                  ;1c10 
              BRA.W          ___Scan__15              ;6000 00b4 
___Scan__14:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVE.L         D6,D0                    ;2006 
              DIVU.L         D1,D0:D3                 ;4c41 0003 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D6,D1                    ;2206 
              DIVU.L         D0,D1                    ;4c40 1001 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D3,D0                    ;3003 
              MOVE.L         D0,D2                    ;2400 
              LSR.L          #$1,D2                   ;e28a 
              FMOVE.L        D2,FP0                   ;f202 4000 
              FADD.L         D2,FP0                   ;f202 4022 
              MOVEQ.L        #$1,D2                   ;7401 
              AND.L          D0,D2                    ;c480 
              FADD.L         D2,FP0                   ;f202 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D0,D2                    ;2400 
              LSR.L          #$1,D2                   ;e28a 
              FMOVE.L        D2,FP0                   ;f202 4000 
              FADD.L         D2,FP0                   ;f202 4022 
              MOVEQ.L        #$1,D2                   ;7401 
              AND.L          D0,D2                    ;c480 
              FADD.L         D2,FP0                   ;f202 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              MOVE.W         D1,$26(A7)               ;3f41 0026 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D3,D1                    ;3203 
              MOVE.W         $26(A7),D2               ;342f 0026 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D2,D3                    ;3602 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D0,D2                    ;3400 
              MOVE.W         D0,$24(A7)               ;3f40 0024 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         D3,D1                    ;2203 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D6.L)          ;08f0 0000 6800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         $24(A7),D0               ;302f 0024 
              MOVE.B         D0,$0(A0,D6.L)           ;1180 6800 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         D0,D6                    ;1c00 
___Scan__15:
              CMP.L          D4,D6                    ;bc84 
              BEQ.B          ___Scan__17              ;6704 
___Scan__16:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__17:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__18:
              MOVE.L         D0,$2a(A7)               ;2f40 002a 
              TST.L          $32(A7)                  ;4aaf 0032 
              BEQ.W          ___Scan__24              ;6700 00f0 
___Scan__19:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVE.L         D7,D6                    ;2c07 
              SUB.L          D1,D6                    ;9c81 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D6.L)          ;0830 0000 6800 
              BEQ.B          ___Scan__21              ;670e 
___Scan__20:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              ADD.L          D6,A0                    ;d1c6 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         (A0),D6                  ;1c10 
              BRA.W          ___Scan__22              ;6000 00c4 
___Scan__21:
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D1,D2                    ;3401 
              MOVE.L         D6,D3                    ;2606 
              DIVU.L         D2,D3:D0                 ;4c42 3000 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D1,D2                    ;3401 
              MOVE.L         D6,D1                    ;2206 
              DIVU.L         D2,D1                    ;4c42 1001 
              MOVE.W         D0,$28(A7)               ;3f40 0028 
              SWAP           D0                       ;4840 
              CLR.W          D0                       ;4240 
              SWAP           D0                       ;4840 
              MOVE.L         D0,D2                    ;2400 
              LSR.L          #$1,D2                   ;e28a 
              FMOVE.L        D2,FP0                   ;f202 4000 
              FADD.L         D2,FP0                   ;f202 4022 
              MOVEQ.L        #$1,D2                   ;7401 
              AND.L          D0,D2                    ;c480 
              FADD.L         D2,FP0                   ;f202 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D0,D2                    ;2400 
              LSR.L          #$1,D2                   ;e28a 
              FMOVE.L        D2,FP0                   ;f202 4000 
              FADD.L         D2,FP0                   ;f202 4022 
              MOVEQ.L        #$1,D2                   ;7401 
              AND.L          D0,D2                    ;c480 
              FADD.L         D2,FP0                   ;f202 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              MOVE.W         D1,$26(A7)               ;3f41 0026 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVE.W         $28(A7),D1               ;322f 0028 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         D1,D2                    ;3401 
              MOVE.W         $26(A7),D1               ;322f 0026 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D1,D3                    ;3601 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.W         D0,$24(A7)               ;3f40 0024 
              MOVE.L         D1,$48(A7)               ;2f41 0048 
              MOVE.L         D2,D0                    ;2002 
              MOVE.L         D3,D1                    ;2203 
              MOVE.L         $48(A7),D2               ;242f 0048 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D6.L)          ;08f0 0000 6800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         $24(A7),D0               ;302f 0024 
              MOVE.B         D0,$0(A0,D6.L)           ;1180 6800 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         D0,D6                    ;1c00 
___Scan__22:
              CMP.L          D4,D6                    ;bc84 
              BEQ.B          ___Scan__24              ;6704 
___Scan__23:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__24:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__25:
              MOVE.L         D0,D5                    ;2a00 
              TST.L          $36(A7)                  ;4aaf 0036 
              BEQ.W          ___Scan__31              ;6700 00e2 
___Scan__26:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D6                    ;2c07 
              ADD.L          D0,D6                    ;dc80 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$0,$0(A0,D6.L)          ;0830 0000 6800 
              BEQ.B          ___Scan__28              ;670e 
___Scan__27:
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              ADD.L          D6,A0                    ;d1c6 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         (A0),D6                  ;1c10 
              BRA.W          ___Scan__29              ;6000 00b6 
___Scan__28:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D6,D2                    ;2406 
              DIVU.L         D1,D2:D3                 ;4c41 2003 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D6,D0                    ;2006 
              DIVU.L         D1,D0                    ;4c41 0000 
              MOVE.W         D0,$26(A7)               ;3f40 0026 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D3,D0                    ;3003 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$58(A4),FP0  ;f22c 5423 0058 
              FMOVE.D        __MERGEDBSS+$70(A4),FP1  ;f22c 5480 0070 
              FADD.B         FP0,FP1                  ;f200 00a2 
              MOVE.W         $26(A7),D1               ;322f 0026 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         D1,D0                    ;3001 
              MOVE.L         D0,D1                    ;2200 
              LSR.L          #$1,D1                   ;e289 
              FMOVE.L        D1,FP0                   ;f201 4000 
              FADD.L         D1,FP0                   ;f201 4022 
              MOVEQ.L        #$1,D1                   ;7201 
              AND.L          D0,D1                    ;c280 
              FADD.L         D1,FP0                   ;f201 4022 
              FMUL.D         __MERGEDBSS+$60(A4),FP0  ;f22c 5423 0060 
              FMOVE.D        __MERGEDBSS+$80(A4),FP2  ;f22c 5500 0080 
              FADD.B         FP0,FP2                  ;f200 0122 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1a(A4),D0   ;302c 001a 
              FMOVE.X        FP1,FP0                  ;f200 0400 
              FMOVE.X        FP2,FP1                  ;f200 0880 
              BSR.W          SingleIterateAsm         ;6100 0000 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D3,D1                    ;3203 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         $26(A7),D2               ;342f 0026 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.W         D0,D3                    ;3600 
              MOVE.W         D0,$24(A7)               ;3f40 0024 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         D2,D1                    ;2202 
              MOVE.L         D3,D2                    ;2403 
              BSR.W          Put8BitPixel             ;6100 0000 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D6.L)          ;08f0 0000 6800 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         $24(A7),D0               ;302f 0024 
              MOVE.B         D0,$0(A0,D6.L)           ;1180 6800 
              MOVEQ.L        #$0,D6                   ;7c00 
              MOVE.B         D0,D6                    ;1c00 
___Scan__29:
              CMP.L          D4,D6                    ;bc84 
              BEQ.B          ___Scan__31              ;6704 
___Scan__30:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__31:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__32:
              MOVE.L         D0,$24(A7)               ;2f40 0024 
              TST.L          $2e(A7)                  ;4aaf 002e 
              BEQ.B          ___Scan__36              ;6732 
___Scan__33:
              MOVE.L         D7,D0                    ;2007 
              SUBQ.L         #$1,D0                   ;5380 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D0.L)          ;0830 0001 0800 
              BNE.B          ___Scan__36              ;6622 
___Scan__34:
              BSET           #$1,$0(A0,D0.L)          ;08f0 0001 0800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D1                  ;2211 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D0,$0(A0,D1.L*4)         ;2180 1c00 
              MOVE.L         (A1)+,D1                 ;2219 
              CMP.L          __MERGEDBSS+$9c(A4),D1   ;b2ac 009c 
              BNE.B          ___Scan__36              ;6604 
___Scan__35:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__36:
              TST.L          $2a(A7)                  ;4aaf 002a 
              BEQ.B          ___Scan__40              ;6732 
___Scan__37:
              MOVE.L         D7,D1                    ;2207 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__40              ;6622 
___Scan__38:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__40              ;6604 
___Scan__39:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__40:
              TST.L          D5                       ;4a85 
              BEQ.B          ___Scan__44              ;6738 
___Scan__41:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__44              ;6622 
___Scan__42:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__44              ;6604 
___Scan__43:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__44:
              TST.L          $24(A7)                  ;4aaf 0024 
              BEQ.B          ___Scan__48              ;6738 
___Scan__45:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__48              ;6622 
___Scan__46:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__48              ;6604 
___Scan__47:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__48:
              MOVE.L         $32(A7),D4               ;282f 0032 
              BEQ.B          ___Scan__55              ;674a 
___Scan__49:
              TST.L          $3e(A7)                  ;4aaf 003e 
              BEQ.B          ___Scan__55              ;6744 
___Scan__50:
              TST.L          $2e(A7)                  ;4aaf 002e 
              BNE.B          ___Scan__52              ;6604 
___Scan__51:
              TST.L          D5                       ;4a85 
              BEQ.B          ___Scan__55              ;673a 
___Scan__52:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__55              ;6622 
___Scan__53:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__55              ;6604 
___Scan__54:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__55:
              MOVE.L         $2a(A7),D2               ;242f 002a 
              TST.L          D4                       ;4a84 
              BEQ.B          ___Scan__62              ;6748 
___Scan__56:
              TST.L          $3a(A7)                  ;4aaf 003a 
              BEQ.B          ___Scan__62              ;6742 
___Scan__57:
              TST.L          D2                       ;4a82 
              BNE.B          ___Scan__59              ;6604 
___Scan__58:
              TST.L          D5                       ;4a85 
              BEQ.B          ___Scan__62              ;673a 
___Scan__59:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__62              ;6622 
___Scan__60:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__62              ;6604 
___Scan__61:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__62:
              MOVE.L         $24(A7),D3               ;262f 0024 
              TST.L          $36(A7)                  ;4aaf 0036 
              BEQ.B          ___Scan__69              ;674a 
___Scan__63:
              TST.L          $3e(A7)                  ;4aaf 003e 
              BEQ.B          ___Scan__69              ;6744 
___Scan__64:
              TST.L          $2e(A7)                  ;4aaf 002e 
              BNE.B          ___Scan__66              ;6604 
___Scan__65:
              TST.L          D3                       ;4a83 
              BEQ.B          ___Scan__69              ;673a 
___Scan__66:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              ADD.L          D0,D1                    ;d280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___Scan__69              ;6622 
___Scan__67:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__69              ;6604 
___Scan__68:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__69:
              TST.L          $36(A7)                  ;4aaf 0036 
              BEQ.B          ___Scan__76              ;6746 
___Scan__70:
              TST.L          $3a(A7)                  ;4aaf 003a 
              BEQ.B          ___Scan__76              ;6740 
___Scan__71:
              TST.L          D2                       ;4a82 
              BNE.B          ___Scan__73              ;6604 
___Scan__72:
              TST.L          D3                       ;4a83 
              BEQ.B          ___Scan__76              ;6738 
___Scan__73:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              ADD.L          D0,D7                    ;de80 
              ADDQ.L         #$1,D7                   ;5287 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D7.L)          ;0830 0001 7800 
              BNE.B          ___Scan__76              ;6622 
___Scan__74:
              BSET           #$1,$0(A0,D7.L)          ;08f0 0001 7800 
              LEA            __MERGED+$18(A4),A1      ;43ec 0018 
              MOVE.L         (A1),D0                  ;2011 
              ADDQ.L         #$1,(A1)                 ;5291 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D7,$0(A0,D0.L*4)         ;2187 0c00 
              MOVE.L         (A1)+,D0                 ;2019 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___Scan__76              ;6604 
___Scan__75:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___Scan__76:
              MOVEM.L        (A7)+,D2/D3/D4/D5/D6/D7  ;4cdf 00fc 
              FMOVE.X        (A7)+,FP2                ;f21f 4900 
              ADD.W          #$28,A7                  ;defc 0028 
              RTS                                     ;4e75 
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$2c,D0                  ;90bc 0000 002c 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$1c,A7                  ;9efc 001c 
              MOVEM.L        D2/D3/D4/D5/D6/D7/A5,-(A7);48e7 3f04 
___main__1:
              MOVE.L         #$a01,D0                 ;203c 0000 0a01 
              MOVE.L         #$500,D1                 ;223c 0000 0500 
              MOVE.L         #$2d0,D2                 ;243c 0000 02d0 
              BSR.W          Set8BitMode              ;6100 0000 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              BNE.B          ___main__3               ;6606 
___main__2:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__116             ;6000 0686 
___main__3:
              BSR.W          MultiTaskOff             ;6100 0000 
              BSR.W          MouseOff                 ;6100 0000 
              LEA            __MERGEDBSS+$1a(A4),A5   ;4bec 001a 
              MOVE.W         #$100,(A5)+              ;3afc 0100 
              LEA            __MERGEDBSS+$70(A4),A1   ;43ec 0070 
              MOVE.L         #$c0020000,(A1)+         ;22fc c002 0000 
              MOVE.L         #$0,(A1)+                ;22fc 0000 0000 
              FMOVE.D        #1.250000e+00,FP0        ;f23c 5400 3ff4 0000 0000 0000 
              FMOVE.D        FP0,__MERGEDBSS+$68(A4)  ;f22c 7400 0068 
              MOVE.L         #$bff40000,__MERGEDBSS+$80(A4);297c bff4 0000 0080 
              MOVE.L         #$0,__MERGEDBSS+$84(A4)  ;297c 0000 0000 0084 
              FMOVE.D        FP0,(A1)+                ;f219 7400 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         (A5)+,D0                 ;301d 
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
              MOVE.W         (A5)+,D0                 ;301d 
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
              MOVE.W         #$1,$36(A7)              ;3f7c 0001 0036 
___main__4:
              MOVEQ.L        #$0,D7                   ;7e00 
              MOVE.W         $36(A7),D7               ;3e2f 0036 
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
              ADDQ.W         #$1,$36(A7)              ;526f 0036 
              CMPI.W         #$ff,$36(A7)             ;0c6f 00ff 0036 
              BLS.B          ___main__4               ;63bc 
___main__5:
              BSR.W          AllocateBoundary         ;6100 f5fc 
___main__6:
              TST.L          D0                       ;4a80 
              BNE.B          ___main__8               ;6606 
___main__7:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__116             ;6000 0580 
___main__8:
              BSR.W          SetStart                 ;6100 0000 
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
              BRA.B          ___main__16              ;607c 
___main__9:
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MULU.W         D0,D1                    ;c2c0 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D1.L)          ;0830 0001 1800 
              BNE.B          ___main__12              ;6622 
___main__10:
              BSET           #$1,$0(A0,D1.L)          ;08f0 0001 1800 
              LEA            __MERGED+$18(A4),A5      ;4bec 0018 
              MOVE.L         (A5),D0                  ;2015 
              ADDQ.L         #$1,(A5)                 ;5295 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D1,$0(A0,D0.L*4)         ;2181 0c00 
              MOVE.L         (A5)+,D0                 ;201d 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__12              ;6604 
___main__11:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___main__12:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MULU.W         D0,D1                    ;c2c0 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         D1,D7                    ;2e01 
              SUBQ.L         #$1,D7                   ;5387 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D7.L)          ;0830 0001 7800 
              BNE.B          ___main__15              ;6622 
___main__13:
              BSET           #$1,$0(A0,D7.L)          ;08f0 0001 7800 
              LEA            __MERGED+$18(A4),A5      ;4bec 0018 
              MOVE.L         (A5),D0                  ;2015 
              ADDQ.L         #$1,(A5)                 ;5295 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D7,$0(A0,D0.L*4)         ;2187 0c00 
              MOVE.L         (A5)+,D0                 ;201d 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__15              ;6604 
___main__14:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___main__15:
              ADDQ.W         #$1,__MERGEDBSS+$16(A4)  ;526c 0016 
___main__16:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              CMP.W          __MERGEDBSS+$1e(A4),D0   ;b06c 001e 
              BCS.W          ___main__9               ;6500 ff7a 
___main__17:
              MOVE.W         #$1,__MERGEDBSS+$14(A4)  ;397c 0001 0014 
              BRA.W          ___main__25              ;6000 0084 
___main__18:
              MOVEQ.L        #$0,D7                   ;7e00 
              MOVE.W         __MERGEDBSS+$14(A4),D7   ;3e2c 0014 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D7.L)          ;0830 0001 7800 
              BNE.B          ___main__21              ;6622 
___main__19:
              BSET           #$1,$0(A0,D7.L)          ;08f0 0001 7800 
              LEA            __MERGED+$18(A4),A5      ;4bec 0018 
              MOVE.L         (A5),D0                  ;2015 
              ADDQ.L         #$1,(A5)                 ;5295 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D7,$0(A0,D0.L*4)         ;2187 0c00 
              MOVE.L         (A5)+,D0                 ;201d 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__21              ;6604 
___main__20:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___main__21:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1e(A4),D2   ;342c 001e 
              SUBQ.L         #$1,D2                   ;5382 
              MULS.L         D1,D2                    ;4c01 2802 
              ADD.L          D0,D2                    ;d480 
              MOVE.L         D2,D7                    ;2e02 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BTST           #$1,$0(A0,D7.L)          ;0830 0001 7800 
              BNE.B          ___main__24              ;6622 
___main__22:
              BSET           #$1,$0(A0,D7.L)          ;08f0 0001 7800 
              LEA            __MERGED+$18(A4),A5      ;4bec 0018 
              MOVE.L         (A5),D0                  ;2015 
              ADDQ.L         #$1,(A5)                 ;5295 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         D7,$0(A0,D0.L*4)         ;2187 0c00 
              MOVE.L         (A5)+,D0                 ;201d 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__24              ;6604 
___main__23:
              CLR.L          __MERGED+$18(A4)         ;42ac 0018 
___main__24:
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__25:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              SUBQ.L         #$1,D0                   ;5380 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$14(A4),D1   ;322c 0014 
              CMP.L          D0,D1                    ;b280 
              BLT.W          ___main__18              ;6d00 ff6c 
___main__26:
              CLR.W          __MERGEDBSS+$a4(A4)      ;426c 00a4 
              BRA.W          ___main__89              ;6000 021c 
___main__27:
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              MOVE.L         __MERGED+$18(A4),D1      ;222c 0018 
              CMP.L          D0,D1                    ;b280 
              BLS.B          ___main__29              ;630c 
___main__28:
              ADDQ.W         #$1,__MERGEDBSS+$a4(A4)  ;526c 00a4 
              MOVEQ.L        #$3,D2                   ;7403 
              AND.W          __MERGEDBSS+$a4(A4),D2   ;c46c 00a4 
              BEQ.B          ___main__31              ;671e 
___main__29:
              ADDQ.L         #$1,__MERGED+$1c(A4)     ;52ac 001c 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         $0(A0,D0.L*4),__MERGEDBSS+$a0(A4);2970 0c00 00a0 
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__32              ;661a 
___main__30:
              CLR.L          __MERGED+$1c(A4)         ;42ac 001c 
              BRA.B          ___main__32              ;6014 
___main__31:
              SUBQ.L         #$1,__MERGED+$18(A4)     ;53ac 0018 
              MOVE.L         __MERGED+$18(A4),D0      ;202c 0018 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         $0(A0,D0.L*4),D0         ;2030 0c00 
              MOVE.L         D0,__MERGEDBSS+$a0(A4)   ;2940 00a0 
___main__32:
              MOVE.L         __MERGEDBSS+$a0(A4),D4   ;282c 00a0 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              DIVU.L         D0,D1:D2                 ;4c40 1002 
              MOVE.L         D2,D7                    ;2e02 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D4,D6                    ;2c04 
              DIVU.L         D1,D6                    ;4c41 6006 
              MOVE.L         D4,-(A7)                 ;2f04 
              BSR.W          Load                     ;6100 f4fa 
___main__33:
              ADDQ.W         #$4,A7                   ;584f 
              MOVE.L         D0,D5                    ;2a00 
              MOVEQ.L        #$1,D1                   ;7201 
              CMP.L          D1,D7                    ;be81 
              SCC            D0                       ;54c0 
              NEG.B          D0                       ;4400 
              EXTB.L         D0                       ;49c0 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1c(A4),D2   ;342c 001c 
              SUBQ.L         #$1,D2                   ;5382 
              CMP.L          D2,D7                    ;be82 
              SCS            D3                       ;55c3 
              NEG.B          D3                       ;4403 
              EXTB.L         D3                       ;49c3 
              CMP.L          D1,D6                    ;bc81 
              SCC            D2                       ;54c2 
              NEG.B          D2                       ;4402 
              EXTB.L         D2                       ;49c2 
              MOVE.L         D2,D7                    ;2e02 
              MOVE.L         D7,$24(A7)               ;2f47 0024 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1e(A4),D2   ;342c 001e 
              SUBQ.L         #$1,D2                   ;5382 
              CMP.L          D2,D6                    ;bc82 
              SCS            D2                       ;55c2 
              NEG.B          D2                       ;4402 
              EXTB.L         D2                       ;49c2 
              MOVE.L         D0,$30(A7)               ;2f40 0030 
              BEQ.B          ___main__37              ;6714 
___main__34:
              MOVE.L         D4,D1                    ;2204 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 f4ae 
___main__35:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D5,D0                    ;b085 
              BEQ.B          ___main__37              ;6704 
___main__36:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___main__37:
              MOVEQ.L        #$0,D0                   ;7000 
___main__38:
              MOVE.L         D0,D6                    ;2c00 
              MOVE.L         D0,$28(A7)               ;2f40 0028 
              TST.L          D3                       ;4a83 
              BEQ.B          ___main__42              ;6714 
___main__39:
              MOVE.L         D4,D1                    ;2204 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 f48e 
___main__40:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D5,D0                    ;b085 
              BEQ.B          ___main__42              ;6704 
___main__41:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___main__42:
              MOVEQ.L        #$0,D0                   ;7000 
___main__43:
              MOVE.L         D0,$20(A7)               ;2f40 0020 
              TST.L          D7                       ;4a87 
              BEQ.B          ___main__47              ;671a 
___main__44:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVE.L         D4,D0                    ;2004 
              SUB.L          D1,D0                    ;9081 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          Load                     ;6100 f46a 
___main__45:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D5,D0                    ;b085 
              BEQ.B          ___main__47              ;6704 
___main__46:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___main__47:
              MOVEQ.L        #$0,D0                   ;7000 
___main__48:
              MOVE.L         D0,D7                    ;2e00 
              TST.L          D2                       ;4a82 
              BEQ.B          ___main__52              ;671a 
___main__49:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 f448 
___main__50:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D5,D0                    ;b085 
              BEQ.B          ___main__52              ;6704 
___main__51:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___main__52:
              MOVEQ.L        #$0,D0                   ;7000 
___main__53:
              MOVE.L         D0,D5                    ;2a00 
              TST.L          D6                       ;4a86 
              BEQ.B          ___main__56              ;670c 
___main__54:
              MOVE.L         D4,D0                    ;2004 
              SUBQ.L         #$1,D0                   ;5380 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          AddQueue                 ;6100 f342 
___main__55:
              ADDQ.W         #$4,A7                   ;584f 
___main__56:
              TST.L          $20(A7)                  ;4aaf 0020 
              BEQ.B          ___main__59              ;670c 
___main__57:
              MOVE.L         D4,D0                    ;2004 
              ADDQ.L         #$1,D0                   ;5280 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          AddQueue                 ;6100 f330 
___main__58:
              ADDQ.W         #$4,A7                   ;584f 
___main__59:
              TST.L          D7                       ;4a87 
              BEQ.B          ___main__62              ;6712 
___main__60:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              SUB.L          D0,D1                    ;9280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 f31a 
___main__61:
              ADDQ.W         #$4,A7                   ;584f 
___main__62:
              TST.L          D5                       ;4a85 
              BEQ.B          ___main__65              ;6712 
___main__63:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 f304 
___main__64:
              ADDQ.W         #$4,A7                   ;584f 
___main__65:
              MOVE.L         $24(A7),D6               ;2c2f 0024 
              BEQ.B          ___main__71              ;6724 
___main__66:
              TST.L          $30(A7)                  ;4aaf 0030 
              BEQ.B          ___main__71              ;671e 
___main__67:
              TST.L          $28(A7)                  ;4aaf 0028 
              BNE.B          ___main__69              ;6604 
___main__68:
              TST.L          D7                       ;4a87 
              BEQ.B          ___main__71              ;6714 
___main__69:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              SUB.L          D0,D1                    ;9280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 f2da 
___main__70:
              ADDQ.W         #$4,A7                   ;584f 
___main__71:
              MOVE.L         D6,D0                    ;2006 
              MOVE.L         D3,D6                    ;2c03 
              TST.L          D0                       ;4a80 
              BEQ.B          ___main__77              ;6722 
___main__72:
              TST.L          D6                       ;4a86 
              BEQ.B          ___main__77              ;671e 
___main__73:
              TST.L          $20(A7)                  ;4aaf 0020 
              BNE.B          ___main__75              ;6604 
___main__74:
              TST.L          D7                       ;4a87 
              BEQ.B          ___main__77              ;6714 
___main__75:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              SUB.L          D0,D1                    ;9280 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 f2b0 
___main__76:
              ADDQ.W         #$4,A7                   ;584f 
___main__77:
              MOVE.L         D2,D7                    ;2e02 
              BEQ.B          ___main__83              ;6724 
___main__78:
              TST.L          $30(A7)                  ;4aaf 0030 
              BEQ.B          ___main__83              ;671e 
___main__79:
              TST.L          $28(A7)                  ;4aaf 0028 
              BNE.B          ___main__81              ;6604 
___main__80:
              TST.L          D5                       ;4a85 
              BEQ.B          ___main__83              ;6714 
___main__81:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D4,D1                    ;2204 
              ADD.L          D0,D1                    ;d280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 f288 
___main__82:
              ADDQ.W         #$4,A7                   ;584f 
___main__83:
              TST.L          D7                       ;4a87 
              BEQ.B          ___main__89              ;6720 
___main__84:
              TST.L          D6                       ;4a86 
              BEQ.B          ___main__89              ;671c 
___main__85:
              TST.L          $20(A7)                  ;4aaf 0020 
              BNE.B          ___main__87              ;6604 
___main__86:
              TST.L          D5                       ;4a85 
              BEQ.B          ___main__89              ;6712 
___main__87:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              ADD.L          D0,D4                    ;d880 
              ADDQ.L         #$1,D4                   ;5284 
              MOVE.L         D4,-(A7)                 ;2f04 
              BSR.W          AddQueue                 ;6100 f264 
___main__88:
              ADDQ.W         #$4,A7                   ;584f 
___main__89:
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              CMP.L          __MERGED+$18(A4),D0      ;b0ac 0018 
              BNE.W          ___main__27              ;6600 fddc 
___main__90:
              MOVE.W         #$101,__MERGEDBSS+$ae(A4);397c 0101 00ae 
              MOVE.L         #$1010101,__MERGEDBSS+$b0(A4);297c 0101 0101 00b0 
              CLR.L          __MERGEDBSS+$a0(A4)      ;42ac 00a0 
              BRA.W          ___main__112             ;6000 017e 
___main__91:
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              MOVE.L         A0,A1                    ;2248 
              BTST           #$0,$0(A1,D0.L)          ;0831 0000 0800 
              BEQ.W          ___main__111             ;6700 0166 
___main__92:
              ADDQ.L         #$1,D0                   ;5280 
              MOVE.L         D0,__MERGEDBSS+$d0(A4)   ;2940 00d0 
              MOVE.L         A0,A5                    ;2a48 
              MOVE.L         __MERGEDBSS+$b0(A4),D7   ;2e2c 00b0 
              BRA.B          ___main__94              ;6004 
___main__93:
              ADDQ.L         #$4,__MERGEDBSS+$d0(A4)  ;58ac 00d0 
___main__94:
              MOVE.L         __MERGEDBSS+$d0(A4),A0   ;206c 00d0 
              MOVE.L         A0,D0                    ;2008 
              MOVE.L         $0(A5,D0.L),D0           ;2035 0800 
              AND.L          D7,D0                    ;c087 
              BEQ.B          ___main__93              ;67ee 
___main__95:
              MOVE.L         __MERGEDBSS+$8c(A4),A5   ;2a6c 008c 
              MOVE.W         __MERGEDBSS+$ae(A4),D0   ;302c 00ae 
              MOVE.W         D0,$1c(A7)               ;3f40 001c 
              BRA.B          ___main__97              ;6004 
___main__96:
              ADDQ.L         #$2,__MERGEDBSS+$d0(A4)  ;54ac 00d0 
___main__97:
              MOVE.L         __MERGEDBSS+$d0(A4),A0   ;206c 00d0 
              MOVE.L         A0,D0                    ;2008 
              MOVE.W         $0(A5,D0.L),D0           ;3035 0800 
              AND.W          $1c(A7),D0               ;c06f 001c 
              BEQ.B          ___main__96              ;67ec 
___main__98:
              MOVE.L         __MERGEDBSS+$8c(A4),A5   ;2a6c 008c 
              BRA.B          ___main__100             ;6004 
___main__99:
              ADDQ.L         #$1,__MERGEDBSS+$d0(A4)  ;52ac 00d0 
___main__100:
              MOVE.L         __MERGEDBSS+$d0(A4),A0   ;206c 00d0 
              MOVE.L         A0,D0                    ;2008 
              BTST           #$0,$0(A5,D0.L)          ;0835 0000 0800 
              BEQ.B          ___main__99              ;67ee 
___main__101:
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              MOVE.L         __MERGEDBSS+$d0(A4),D1   ;222c 00d0 
              SUB.L          D0,D1                    ;9280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,__MERGEDBSS+$bc(A4)   ;2941 00bc 
              MOVEQ.L        #$0,D2                   ;7400 
              CMP.L          D2,D1                    ;b282 
              BLS.W          ___main__111             ;6300 00f4 
___main__102:
              MOVE.L         D1,D2                    ;2401 
              LSR.L          #$1,D2                   ;e28a 
              MOVE.L         D2,__MERGEDBSS+$c0(A4)   ;2942 00c0 
              MOVE.L         D2,D3                    ;2602 
              ADD.L          D3,D3                    ;d683 
              SUB.L          D3,D1                    ;9283 
              MOVE.L         D1,__MERGEDBSS+$c8(A4)   ;2941 00c8 
              MOVE.L         D2,D1                    ;2202 
              LSR.L          #$1,D1                   ;e289 
              MOVE.L         D1,__MERGEDBSS+$c4(A4)   ;2941 00c4 
              ADD.L          D1,D1                    ;d281 
              SUB.L          D1,D2                    ;9481 
              MOVE.L         D2,__MERGEDBSS+$cc(A4)   ;2942 00cc 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.B         $0(A0,D0.L),D1           ;1230 0800 
              MOVE.B         D1,__MERGEDBSS+$ba(A4)   ;1941 00ba 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.B         D1,D2                    ;1401 
              ASL.L          #$8,D2                   ;e182 
              MOVEQ.L        #$0,D3                   ;7600 
              MOVE.B         D1,D3                    ;1601 
              ADD.L          D2,D3                    ;d682 
              MOVE.W         D3,__MERGEDBSS+$b8(A4)   ;3943 00b8 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D3,D1                    ;3203 
              MOVE.L         D1,D2                    ;2401 
              SWAP           D2                       ;4842 
              CLR.W          D2                       ;4242 
              ADD.L          D2,D1                    ;d282 
              MOVE.L         D1,__MERGEDBSS+$b4(A4)   ;2941 00b4 
              ADDQ.L         #$1,__MERGEDBSS+$a0(A4)  ;52ac 00a0 
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.B          ___main__104             ;6024 
___main__103:
              LEA            __MERGEDBSS+$a0(A4),A5   ;4bec 00a0 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.L         __MERGEDBSS+$b4(A4),$0(A0,D0.L);21ac 00b4 0800 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              MOVE.L         __MERGEDBSS+$b0(A4),D1   ;222c 00b0 
              OR.L           D1,$0(A0,D0.L)           ;83b0 0800 
              ADDQ.L         #$4,(A5)+                ;589d 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__104:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.L          __MERGEDBSS+$c4(A4),D0   ;b0ac 00c4 
              BCS.B          ___main__103             ;65d0 
___main__105:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.B          ___main__107             ;6024 
___main__106:
              LEA            __MERGEDBSS+$a0(A4),A5   ;4bec 00a0 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.W         __MERGEDBSS+$b8(A4),$0(A0,D0.L);31ac 00b8 0800 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              MOVE.W         __MERGEDBSS+$ae(A4),D1   ;322c 00ae 
              OR.W           D1,$0(A0,D0.L)           ;8370 0800 
              ADDQ.L         #$2,(A5)+                ;549d 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__107:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.L          __MERGEDBSS+$cc(A4),D0   ;b0ac 00cc 
              BCS.B          ___main__106             ;65d0 
___main__108:
              CLR.W          __MERGEDBSS+$14(A4)      ;426c 0014 
              BRA.B          ___main__110             ;6022 
___main__109:
              LEA            __MERGEDBSS+$a0(A4),A5   ;4bec 00a0 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$88(A4),A0   ;206c 0088 
              MOVE.B         __MERGEDBSS+$ba(A4),$0(A0,D0.L);11ac 00ba 0800 
              MOVE.L         (A5),D0                  ;2015 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              BSET           #$0,$0(A0,D0.L)          ;08f0 0000 0800 
              ADDQ.L         #$1,(A5)+                ;529d 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__110:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              CMP.L          __MERGEDBSS+$c8(A4),D0   ;b0ac 00c8 
              BCS.B          ___main__109             ;65d2 
___main__111:
              ADDQ.L         #$1,__MERGEDBSS+$a0(A4)  ;52ac 00a0 
___main__112:
              MOVE.W         __MERGEDBSS+$1e(A4),D0   ;302c 001e 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MULU.W         D0,D1                    ;c2c0 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              CMP.L          D1,D0                    ;b081 
              BCS.W          ___main__91              ;6500 fe70 
___main__113:
              BSR.W          SetStop                  ;6100 0000 
              BSR.W          DeallocateBoundary       ;6100 f156 
___main__114:
              BSR.W          WaitMouse                ;6100 0000 
              BSR.W          MouseOn                  ;6100 0000 
              BSR.W          MultiTaskOn              ;6100 0000 
              BSR.W          RestoreMode              ;6100 0000 
              BSR.W          GetTime                  ;6100 ef54 
___main__115:
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
              MOVE.L         D0,$24(A7)               ;2f40 0024 
              FMOVE.D        FP0,-(A7)                ;f227 7400 
              MOVE.L         (A7)+,D0                 ;201f 
              MOVE.L         (A7)+,D1                 ;221f 
              BSR.W          _CXV52                   ;6100 0000 
              MOVE.L         #$dff3fd,A0              ;207c 00df f3fd 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.B         (A0),D1                  ;1210 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         $28(A7),-(A7)            ;2f2f 0028 
              MOVE.L         D1,-(A7)                 ;2f01 
              PEA            __MERGED+$20(A4)         ;486c 0020 
              BSR.W          printf                   ;6100 0000 
              LEA            $10(A7),A7               ;4fef 0010 
              MOVEQ.L        #$0,D0                   ;7000 
___main__116:
              MOVEM.L        (A7)+,D2/D3/D4/D5/D6/D7/A5;4cdf 20fc 
              ADD.W          #$1c,A7                  ;defc 001c 
              RTS                                     ;4e75 
              XREF           __base
              XREF           _XCOVF
              XREF           _CXV52
              XREF           GetStart
              XREF           GetStop
              XREF           SingleIterateAsm
              XREF           Put8BitPixel
              XREF           Set8BitMode
              XREF           MultiTaskOff
              XREF           MouseOff
              XREF           SetColor
              XREF           rand
              XREF           SetStart
              XREF           SetStop
              XREF           WaitMouse
              XREF           MouseOn
              XREF           MultiTaskOn
              XREF           RestoreMode
              XREF           printf
              XDEF           GetTime
              XDEF           Iterate
              XDEF           AddQueue
              XDEF           AllocateBoundary
              XDEF           DeallocateBoundary
              XDEF           Load
              XDEF           Scan
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
QueueHead:
              DC.L           $00000000
QueueTail:
              DC.L           $00000000
              DC.B           'Execution time (%dx core): %u.%04u seconds'
              DC.B           $0a
              DC.B           $00
              XDEF           SAGAMODEW
              XDEF           SAGAMODER
              XDEF           SAGAPTRW
              XDEF           SAGAPTRR
              XDEF           SAGACOLORW
              XDEF           CIAAPRA
              XDEF           QueueHead
              XDEF           QueueTail

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
i:
              DS.B           2
MaxIter:
              DS.B           2
resx:
              DS.B           2
resy:
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
Data:
              DS.B           4
Done:
              DS.B           4
Queue:
              DS.B           4
DataSize:
              DS.B           4
DoneSize:
              DS.B           4
QueueSize:
              DS.B           4
p:
              DS.B           4
flag:
              DS.B           2
IterP1:
              DS.B           2
IterP2:
              DS.B           2
IterP3:
              DS.B           2
IterP4:
              DS.B           2
WordLoaded:
              DS.B           2
LongLoaded:
              DS.B           4
colorl:
              DS.B           4
colorw:
              DS.B           2
colorb:
              DS.B           1
              DS.B           1
nbytes:
              DS.B           4
nwords:
              DS.B           4
nlong:
              DS.B           4
rbytes:
              DS.B           4
rwords:
              DS.B           4
p1:
              DS.B           4
              XDEF           oldmode
              XDEF           oldbuffer
              XDEF           newmode
              XDEF           rawbuffer
              XDEF           newbuffer
              XDEF           memsize
              XDEF           x
              XDEF           y
              XDEF           i
              XDEF           MaxIter
              XDEF           resx
              XDEF           resy
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
              XDEF           Data
              XDEF           Done
              XDEF           Queue
              XDEF           DataSize
              XDEF           DoneSize
              XDEF           QueueSize
              XDEF           p
              XDEF           flag
              XDEF           IterP1
              XDEF           IterP2
              XDEF           IterP3
              XDEF           IterP4
              XDEF           WordLoaded
              XDEF           LongLoaded
              XDEF           colorl
              XDEF           colorw
              XDEF           colorb
              XDEF           nbytes
              XDEF           nwords
              XDEF           nlong
              XDEF           rbytes
              XDEF           rwords
              XDEF           p1
              END
