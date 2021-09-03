// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

M[ptr]=0

(LOOP)
    D=M[KBD]
    @WHITE
    D;JEQ
    @BLACK
    0;JMP
(LOOP_END)

(WHITE)
    @SCREEN
    D=A
    D=D+M[ptr]
    A=D
    M=0
    @ptr
    M=M-1
    @PTR_VALIDATION
    0;JMP
(WHITE_END)

(BLACK)
    @SCREEN
    D=A
    D=D+M[ptr]
    A=D
    M=-1
    @ptr
    M=M+1
    @PTR_VALIDATION
    0;JMP
(BLACK_END)


(PTR_VALIDATION)
D=M[ptr]
@NEGATIVE
D;JLE
D=M[ptr]
@512
D=A-D
@OVER
D;JLE
@LOOP
0;JMP
(NEGATIVE)
    M[ptr]=0
    @LOOP
    0;JMP
(OVER)
    @512
    M[ptr]=A
    @LOOP
    0;JMP
(PTR_VALIDATION_END)