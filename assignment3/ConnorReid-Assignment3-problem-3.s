/*
    Connor Reid
    COSC 2325
    Spring 2018
    Section 001
    Karina

    Assignment 3
    3)

    z=a*(b+c)
*/

.text
.globl main

main:
    mov w0, #1              // z = 0;
    mov w1, #3              // a = 3;   
    mov w2, #5              // b = 5;
    mov w3, #7              // c = 7;
    mov w4, #0              // tmp = 0;
    add w4, w2, w3          // tmp = b + c
    mul w0, w1, w4          // z = a * tmp
    ret
    // expect: 36
