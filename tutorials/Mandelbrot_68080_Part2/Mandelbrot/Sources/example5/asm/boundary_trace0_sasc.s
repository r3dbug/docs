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
              LEA            __MERGEDBSS+$94(A4),A1   ;43ec 0094 
              MOVE.L         D1,(A1)+                 ;22c1 
              MOVE.L         D1,(A1)+                 ;22c1 
              MOVE.W         __MERGEDBSS+$1c(A4),D2   ;342c 001c 
              MULU.W         D0,D2                    ;c4c0 
              ASL.L          #$2,D2                   ;e582 
              ASL.L          #$2,D2                   ;e582 
              MOVE.L         D2,(A1)+                 ;22c2 
              MOVE.L         D1,D0                    ;2001 
              MOVE.L         #$10001,D1               ;223c 0001 0001 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff3a(A6)            ;4eae ff3a 
              MOVE.L         D0,__MERGEDBSS+$88(A4)   ;2940 0088 
              MOVE.L         __MERGEDBSS+$98(A4),D0   ;202c 0098 
              MOVE.L         #$10001,D1               ;223c 0001 0001 
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
              MOVE.L         __MERGEDBSS+$88(A4),D0   ;202c 0088 
              BEQ.B          ___DeallocateBoundary__7 ;670e 
___DeallocateBoundary__6:
              MOVE.L         D0,A1                    ;2240 
              MOVE.L         __MERGEDBSS+$94(A4),D0   ;202c 0094 
              MOVE.L         ($4).w,A6                ;2c78 0004 
              JSR            $ffffff2e(A6)            ;4eae ff2e 
___DeallocateBoundary__7:
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
              SUB.L          #$1c,D0                  ;90bc 0000 001c 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$18,A7                  ;9efc 0018 
              MOVEM.L        D2/D3/D4/D5/D6/D7,-(A7)  ;48e7 3f00 
___Scan__1:
              MOVE.L         $34(A7),D7               ;2e2f 0034 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              DIVU.L         D0,D1:D2                 ;4c40 1002 
              MOVE.L         D2,D6                    ;2c02 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         D0,D1                    ;3200 
              MOVE.L         D7,D5                    ;2a07 
              DIVU.L         D1,D5                    ;4c41 5005 
              MOVE.L         D7,-(A7)                 ;2f07 
              BSR.W          Load                     ;6100 fede 
___Scan__2:
              ADDQ.W         #$4,A7                   ;584f 
              MOVE.L         D0,D4                    ;2800 
              MOVEQ.L        #$1,D1                   ;7201 
              CMP.L          D1,D6                    ;bc81 
              SCC            D0                       ;54c0 
              NEG.B          D0                       ;4400 
              EXTB.L         D0                       ;49c0 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1c(A4),D2   ;342c 001c 
              SUBQ.L         #$1,D2                   ;5382 
              CMP.L          D2,D6                    ;bc82 
              SCS            D3                       ;55c3 
              NEG.B          D3                       ;4403 
              EXTB.L         D3                       ;49c3 
              CMP.L          D1,D5                    ;ba81 
              SCC            D2                       ;54c2 
              NEG.B          D2                       ;4402 
              EXTB.L         D2                       ;49c2 
              MOVE.L         D2,D6                    ;2c02 
              MOVE.L         D6,$20(A7)               ;2f46 0020 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1e(A4),D2   ;342c 001e 
              SUBQ.L         #$1,D2                   ;5382 
              CMP.L          D2,D5                    ;ba82 
              SCS            D2                       ;55c2 
              NEG.B          D2                       ;4402 
              EXTB.L         D2                       ;49c2 
              MOVE.L         D0,$2c(A7)               ;2f40 002c 
              BEQ.B          ___Scan__6               ;6714 
___Scan__3:
              MOVE.L         D7,D1                    ;2207 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 fe92 
___Scan__4:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D4,D0                    ;b084 
              BEQ.B          ___Scan__6               ;6704 
___Scan__5:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__6:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__7:
              MOVE.L         D0,D5                    ;2a00 
              MOVE.L         D0,$24(A7)               ;2f40 0024 
              TST.L          D3                       ;4a83 
              BEQ.B          ___Scan__11              ;6714 
___Scan__8:
              MOVE.L         D7,D1                    ;2207 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 fe72 
___Scan__9:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D4,D0                    ;b084 
              BEQ.B          ___Scan__11              ;6704 
___Scan__10:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__11:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__12:
              MOVE.L         D0,$1c(A7)               ;2f40 001c 
              TST.L          D6                       ;4a86 
              BEQ.B          ___Scan__16              ;671a 
___Scan__13:
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVE.L         D7,D0                    ;2007 
              SUB.L          D1,D0                    ;9081 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          Load                     ;6100 fe4e 
___Scan__14:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D4,D0                    ;b084 
              BEQ.B          ___Scan__16              ;6704 
___Scan__15:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__16:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__17:
              MOVE.L         D0,D6                    ;2c00 
              TST.L          D2                       ;4a82 
              BEQ.B          ___Scan__21              ;671a 
___Scan__18:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          Load                     ;6100 fe2c 
___Scan__19:
              ADDQ.W         #$4,A7                   ;584f 
              CMP.L          D4,D0                    ;b084 
              BEQ.B          ___Scan__21              ;6704 
___Scan__20:
              MOVEQ.L        #$1,D0                   ;7001 
              DC.W           $c40                     ;0c40 
___Scan__21:
              MOVEQ.L        #$0,D0                   ;7000 
___Scan__22:
              MOVE.L         D0,D4                    ;2800 
              TST.L          D5                       ;4a85 
              BEQ.B          ___Scan__25              ;670c 
___Scan__23:
              MOVE.L         D7,D0                    ;2007 
              SUBQ.L         #$1,D0                   ;5380 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          AddQueue                 ;6100 fd04 
___Scan__24:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__25:
              TST.L          $1c(A7)                  ;4aaf 001c 
              BEQ.B          ___Scan__28              ;670c 
___Scan__26:
              MOVE.L         D7,D0                    ;2007 
              ADDQ.L         #$1,D0                   ;5280 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          AddQueue                 ;6100 fcf2 
___Scan__27:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__28:
              TST.L          D6                       ;4a86 
              BEQ.B          ___Scan__31              ;6712 
___Scan__29:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 fcdc 
___Scan__30:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__31:
              TST.L          D4                       ;4a84 
              BEQ.B          ___Scan__34              ;6712 
___Scan__32:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              ADD.L          D0,D1                    ;d280 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 fcc6 
___Scan__33:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__34:
              MOVE.L         $20(A7),D5               ;2a2f 0020 
              BEQ.B          ___Scan__40              ;6724 
___Scan__35:
              TST.L          $2c(A7)                  ;4aaf 002c 
              BEQ.B          ___Scan__40              ;671e 
___Scan__36:
              TST.L          $24(A7)                  ;4aaf 0024 
              BNE.B          ___Scan__38              ;6604 
___Scan__37:
              TST.L          D6                       ;4a86 
              BEQ.B          ___Scan__40              ;6714 
___Scan__38:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 fc9c 
___Scan__39:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__40:
              TST.L          D5                       ;4a85 
              BEQ.B          ___Scan__46              ;6722 
___Scan__41:
              TST.L          D3                       ;4a83 
              BEQ.B          ___Scan__46              ;671e 
___Scan__42:
              TST.L          $1c(A7)                  ;4aaf 001c 
              BNE.B          ___Scan__44              ;6604 
___Scan__43:
              TST.L          D6                       ;4a86 
              BEQ.B          ___Scan__46              ;6714 
___Scan__44:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              SUB.L          D0,D1                    ;9280 
              ADDQ.L         #$1,D1                   ;5281 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 fc76 
___Scan__45:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__46:
              TST.L          D2                       ;4a82 
              BEQ.B          ___Scan__52              ;6724 
___Scan__47:
              TST.L          $2c(A7)                  ;4aaf 002c 
              BEQ.B          ___Scan__52              ;671e 
___Scan__48:
              TST.L          $24(A7)                  ;4aaf 0024 
              BNE.B          ___Scan__50              ;6604 
___Scan__49:
              TST.L          D4                       ;4a84 
              BEQ.B          ___Scan__52              ;6714 
___Scan__50:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.L         D7,D1                    ;2207 
              ADD.L          D0,D1                    ;d280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 fc4e 
___Scan__51:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__52:
              TST.L          D2                       ;4a82 
              BEQ.B          ___Scan__58              ;6720 
___Scan__53:
              TST.L          D3                       ;4a83 
              BEQ.B          ___Scan__58              ;671c 
___Scan__54:
              TST.L          $1c(A7)                  ;4aaf 001c 
              BNE.B          ___Scan__56              ;6604 
___Scan__55:
              TST.L          D4                       ;4a84 
              BEQ.B          ___Scan__58              ;6712 
___Scan__56:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              ADD.L          D0,D7                    ;de80 
              ADDQ.L         #$1,D7                   ;5287 
              MOVE.L         D7,-(A7)                 ;2f07 
              BSR.W          AddQueue                 ;6100 fc2a 
___Scan__57:
              ADDQ.W         #$4,A7                   ;584f 
___Scan__58:
              MOVEM.L        (A7)+,D2/D3/D4/D5/D6/D7  ;4cdf 00fc 
              ADD.W          #$18,A7                  ;defc 0018 
              RTS                                     ;4e75 
main:
              MOVE.L         A7,D0                    ;200f 
              SUB.L          #$1c,D0                  ;90bc 0000 001c 
              CMP.L          __base(A4),D0            ;b0ac 0000 
              BCS.W          _XCOVF                   ;6500 0000 
              SUB.W          #$c,A7                   ;9efc 000c 
              MOVEM.L        D2/D3/D4/D6/D7/A2,-(A7)  ;48e7 3b20 
___main__1:
              MOVE.L         #$a01,D0                 ;203c 0000 0a01 
              MOVE.L         #$500,D1                 ;223c 0000 0500 
              MOVE.L         #$2d0,D2                 ;243c 0000 02d0 
              BSR.W          Set8BitMode              ;6100 0000 
              MOVE.L         D0,__MERGEDBSS+$c(A4)    ;2940 000c 
              BNE.B          ___main__3               ;6606 
___main__2:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__36              ;6000 02c0 
___main__3:
              BSR.W          MultiTaskOff             ;6100 0000 
              BSR.W          MouseOff                 ;6100 0000 
              LEA            __MERGEDBSS+$1a(A4),A2   ;45ec 001a 
              MOVE.W         #$100,(A2)+              ;34fc 0100 
              LEA            __MERGEDBSS+$70(A4),A1   ;43ec 0070 
              MOVE.L         #$c0020000,(A1)+         ;22fc c002 0000 
              MOVE.L         #$0,(A1)+                ;22fc 0000 0000 
              FMOVE.D        #1.250000e+00,FP0        ;f23c 5400 3ff4 0000 0000 0000 
              FMOVE.D        FP0,__MERGEDBSS+$68(A4)  ;f22c 7400 0068 
              MOVE.L         #$bff40000,__MERGEDBSS+$80(A4);297c bff4 0000 0080 
              MOVE.L         #$0,__MERGEDBSS+$84(A4)  ;297c 0000 0000 0084 
              FMOVE.D        FP0,(A1)+                ;f219 7400 
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         (A2)+,D0                 ;301a 
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
              MOVE.W         (A2)+,D0                 ;301a 
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
              BSR.W          AllocateBoundary         ;6100 fb2e 
___main__6:
              TST.L          D0                       ;4a80 
              BNE.B          ___main__8               ;6606 
___main__7:
              MOVEQ.L        #$1,D0                   ;7001 
              BRA.W          ___main__36              ;6000 01c4 
___main__8:
              BSR.W          SetStart                 ;6100 0000 
              CLR.W          __MERGEDBSS+$16(A4)      ;426c 0016 
              BRA.B          ___main__12              ;602c 
___main__9:
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MULU.W         D0,D1                    ;c2c0 
              MOVE.L         D1,-(A7)                 ;2f01 
              BSR.W          AddQueue                 ;6100 face 
___main__10:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              MOVE.W         __MERGEDBSS+$16(A4),D1   ;322c 0016 
              MULU.W         D0,D1                    ;c2c0 
              ADD.L          D0,D1                    ;d280 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         D1,(A7)                  ;2e81 
              BSR.W          AddQueue                 ;6100 fab8 
___main__11:
              ADDQ.W         #$4,A7                   ;584f 
              ADDQ.W         #$1,__MERGEDBSS+$16(A4)  ;526c 0016 
___main__12:
              MOVE.W         __MERGEDBSS+$16(A4),D0   ;302c 0016 
              CMP.W          __MERGEDBSS+$1e(A4),D0   ;b06c 001e 
              BCS.B          ___main__9               ;65ca 
___main__13:
              MOVE.W         #$1,__MERGEDBSS+$14(A4)  ;397c 0001 0014 
              BRA.B          ___main__17              ;6032 
___main__14:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVE.L         D0,-(A7)                 ;2f00 
              BSR.W          AddQueue                 ;6100 fa94 
___main__15:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$14(A4),D0   ;302c 0014 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MOVEQ.L        #$0,D2                   ;7400 
              MOVE.W         __MERGEDBSS+$1e(A4),D2   ;342c 001e 
              SUBQ.L         #$1,D2                   ;5382 
              MULS.L         D1,D2                    ;4c01 2802 
              ADD.L          D0,D2                    ;d480 
              MOVE.L         D2,(A7)                  ;2e82 
              BSR.W          AddQueue                 ;6100 fa74 
___main__16:
              ADDQ.W         #$4,A7                   ;584f 
              ADDQ.W         #$1,__MERGEDBSS+$14(A4)  ;526c 0014 
___main__17:
              MOVEQ.L        #$0,D0                   ;7000 
              MOVE.W         __MERGEDBSS+$1c(A4),D0   ;302c 001c 
              SUBQ.L         #$1,D0                   ;5380 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.W         __MERGEDBSS+$14(A4),D1   ;322c 0014 
              CMP.L          D0,D1                    ;b280 
              BLT.B          ___main__14              ;6dbc 
___main__18:
              CLR.W          __MERGEDBSS+$a4(A4)      ;426c 00a4 
              BRA.B          ___main__26              ;6054 
___main__19:
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              MOVE.L         __MERGED+$18(A4),D1      ;222c 0018 
              CMP.L          D0,D1                    ;b280 
              BLS.B          ___main__21              ;630c 
___main__20:
              ADDQ.W         #$1,__MERGEDBSS+$a4(A4)  ;526c 00a4 
              MOVEQ.L        #$3,D2                   ;7403 
              AND.W          __MERGEDBSS+$a4(A4),D2   ;c46c 00a4 
              BEQ.B          ___main__23              ;671e 
___main__21:
              ADDQ.L         #$1,__MERGED+$1c(A4)     ;52ac 001c 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         $0(A0,D0.L*4),__MERGEDBSS+$a0(A4);2970 0c00 00a0 
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              CMP.L          __MERGEDBSS+$9c(A4),D0   ;b0ac 009c 
              BNE.B          ___main__24              ;661a 
___main__22:
              CLR.L          __MERGED+$1c(A4)         ;42ac 001c 
              BRA.B          ___main__24              ;6014 
___main__23:
              SUBQ.L         #$1,__MERGED+$18(A4)     ;53ac 0018 
              MOVE.L         __MERGED+$18(A4),D0      ;202c 0018 
              MOVE.L         __MERGEDBSS+$90(A4),A0   ;206c 0090 
              MOVE.L         $0(A0,D0.L*4),D0         ;2030 0c00 
              MOVE.L         D0,__MERGEDBSS+$a0(A4)   ;2940 00a0 
___main__24:
              MOVE.L         __MERGEDBSS+$a0(A4),-(A7);2f2c 00a0 
              BSR.W          Scan                     ;6100 fbfa 
___main__25:
              ADDQ.W         #$4,A7                   ;584f 
___main__26:
              MOVE.L         __MERGED+$1c(A4),D0      ;202c 001c 
              CMP.L          __MERGED+$18(A4),D0      ;b0ac 0018 
              BNE.B          ___main__19              ;66a2 
___main__27:
              CLR.L          __MERGEDBSS+$a0(A4)      ;42ac 00a0 
              BRA.B          ___main__32              ;6042 
___main__28:
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              MOVE.L         __MERGEDBSS+$8c(A4),A0   ;206c 008c 
              MOVE.L         A0,A1                    ;2248 
              BTST           #$0,$0(A1,D0.L)          ;0831 0000 0800 
              BEQ.B          ___main__31              ;672c 
___main__29:
              MOVE.L         D0,D1                    ;2200 
              ADDQ.L         #$1,D1                   ;5281 
              ADD.L          D1,A0                    ;d1c1 
              BTST           #$0,(A0)                 ;0810 0000 
              BNE.B          ___main__31              ;6620 
___main__30:
              MOVE.L         __MERGEDBSS+$88(A4),A1   ;226c 0088 
              MOVE.L         A1,A2                    ;2449 
              ADD.L          D0,A2                    ;d5c0 
              ADD.L          D1,A1                    ;d3c1 
              MOVE.B         (A2),D1                  ;1212 
              MOVE.B         D1,(A1)                  ;1281 
              MOVE.L         __MERGEDBSS+$c(A4),A1    ;226c 000c 
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              ADD.L          D0,A1                    ;d3c0 
              MOVE.B         (A2),$1(A1)              ;1352 0001 
              BSET           #$0,(A0)                 ;08d0 0000 
___main__31:
              ADDQ.L         #$1,__MERGEDBSS+$a0(A4)  ;52ac 00a0 
___main__32:
              MOVE.W         __MERGEDBSS+$1e(A4),D0   ;302c 001e 
              MOVE.W         __MERGEDBSS+$1c(A4),D1   ;322c 001c 
              MULU.W         D0,D1                    ;c2c0 
              SUBQ.L         #$1,D1                   ;5381 
              MOVE.L         __MERGEDBSS+$a0(A4),D0   ;202c 00a0 
              CMP.L          D1,D0                    ;b081 
              BCS.B          ___main__28              ;65aa 
___main__33:
              BSR.W          SetStop                  ;6100 0000 
              BSR.W          DeallocateBoundary       ;6100 fa52 
___main__34:
              BSR.W          WaitMouse                ;6100 0000 
              BSR.W          MouseOn                  ;6100 0000 
              BSR.W          MultiTaskOn              ;6100 0000 
              BSR.W          RestoreMode              ;6100 0000 
              BSR.W          GetTime                  ;6100 f842 
___main__35:
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
              MOVE.L         D0,$20(A7)               ;2f40 0020 
              FMOVE.D        FP0,-(A7)                ;f227 7400 
              MOVE.L         (A7)+,D0                 ;201f 
              MOVE.L         (A7)+,D1                 ;221f 
              BSR.W          _CXV52                   ;6100 0000 
              MOVE.L         #$dff3fd,A0              ;207c 00df f3fd 
              MOVEQ.L        #$0,D1                   ;7200 
              MOVE.B         (A0),D1                  ;1210 
              MOVE.L         D0,-(A7)                 ;2f00 
              MOVE.L         $24(A7),-(A7)            ;2f2f 0024 
              MOVE.L         D1,-(A7)                 ;2f01 
              PEA            __MERGED+$20(A4)         ;486c 0020 
              BSR.W          printf                   ;6100 0000 
              LEA            $10(A7),A7               ;4fef 0010 
              MOVEQ.L        #$0,D0                   ;7000 
___main__36:
              MOVEM.L        (A7)+,D2/D3/D4/D6/D7/A2  ;4cdf 04dc 
              ADD.W          #$c,A7                   ;defc 000c 
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
              END
