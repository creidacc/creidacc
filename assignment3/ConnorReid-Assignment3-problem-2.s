/*
    Connor Reid
    COSC 2325
    Spring 2018
    Section 001
    Karina

    Assignment 3
    2)

    if (i == 0) r = r + 2; else r = r - 1;

*/

// note: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.den0024a/CHDEEABE.html

.text
.globl main

main:
    mov w0, #1              // r = 1;
    mov w1, #0              // i = 0;   
    mov w2, #0              // tmp = 0;
    cmp w1, #0              // if (i == 0)
    sub w2, w0, #1          // r = r - 1
    add w0, w0, #2          // r = r + 2
    csel w0, w0, w2, eq     // select between the two results
    ret
    // expect: 3
