/*
    Connor Reid
    COSC 2325
    Spring 2018
    Section 001
    Karina

    Lab 3
    1/a)

    if (a >b) a+=1;
*/

.text
.globl main

main:
    mov w0, #0          // a = 0
    mov w1, #0          // b = 0
    add w0, w0, #1      // a += 1

    // a is now equal to 1, b is equal to 0
    cmp w0, w1          // compare a and b
    b.gt l1             // branch to l1 if a > b
    // expect: 2

l1:
    add w0, w0, #1      // a += 1 
    ret
