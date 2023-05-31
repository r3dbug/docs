/* $VER: asm_call.h 0.2 (15.11.2016)

Universal assembler function call support and register specification aid for
various Amiga C compilers. Include this header file and then define internal
functions as:

ASM LONG myfunc( REG(d0, ULONG somevar), REG(a0, APTR someptr) );

Define functions to libraries which use the A4 register to access data as:

SAVEDS ASM LONG mylibfunc( REG(d0, ULONG somevar), REG(a0, APTR someptr) );
*/

#if defined(__GNUC__) /* GCC (only unofficial Amiga versions) */
#define REG(x,y) register y __asm(#x)
#define ASM
#define SAVEDS
#elif defined(__VBCC__) /* VBCC */
#define REG(x,y) __reg(#x) y
#define ASM
#define SAVEDS __saveds
#elif defined(__SASC) /* SAS/C */
#define REG(x,y) register __ ## x y
#define ASM __asm
#define SAVEDS __saveds
#elif defined(_DCC) /* DICE */
#define REG(x,y) __ ## x y
#define ASM
#define SAVEDS __geta4
#elif defined(__STORM__)
#define REG(x,y) register __ ## x y
#define ASM
#define SAVEDS __saveds
#endif
