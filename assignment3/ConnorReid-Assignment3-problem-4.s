/*
    Connor Reid
    COSC 2325
    Spring 2018
    Section 001
    Karina

    Assignment 3
    4)

    for (k=0; k<5; k++)
    {
        m=m+m;
    }
*/

.text
.globl main

main:
    mov w0, #2  // m = 2;
    mov w1, #0  // k = 0;
    b l1        // begin loop
    ret
    // expect 64

l1:
    add w0, w0, w0  // m = m + m;
    add w1, w1, #1  // k++;
    cmp w1, #5      // if k < 5
    b.lt l1         // then repeat loop
