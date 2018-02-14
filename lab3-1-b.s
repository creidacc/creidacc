/* 
    if (i==j) f=g+h
    else f=g-h;
*/

.text
.globl main

main:
    b l1                // init
    cmp w3, w4          // compare i to j
    b.eq l2             // if i == j
    b l3                // else
    // expect: 3

l1:
    mov w0, #0          // f = 0
    mov w1, #1          // g = 1
    mov w2, #2          // h = 2
    mov w3, #7          // i = 7
    mov w4, #7          // j = 7

l2: 
    add w0, w1, w2      // f = g + h
    ret

l3:
    sub w0, w1, w2      // f = g - h
    ret
