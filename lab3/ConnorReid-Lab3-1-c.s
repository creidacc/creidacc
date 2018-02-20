/*
    Connor Reid
    COSC 2325
    Spring 2018
    Section 001
    Karina

    Lab 3
    1/c)

    a=5;
    b=3;       
    total=a-b;
*/

.text
.globl main

main:
    b l1    // init
    b l2    // total = a - b
    // expect: 2

l1: 
    mov w0, #5          // a = 5
    mov w1, #3          // b = 3
    mov w2, #0          // total = 0

l2:
    sub w2, w0, w1      // total = a - b
    mov w0, w2          // put the result of the sub on the top
    ret
