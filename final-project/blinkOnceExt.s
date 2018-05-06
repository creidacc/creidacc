.data   // Directive to switch the current section to the .data section
.balign 4   // Align directive, for consistent behavior across all architectures

/** Define constants */
StartupLog: .asciz  "(From ARMV8) blinkOnceExt:\n"
ErrorMessage: .asciz	"Error: blinkOnceExt Setup didn't work... Aborting...\n"
pin: .int 7
delayMs: .int 1
OUTPUT = 1

.globl blinkOnceExt // Define extern ARMV8 function (this will be called from C)
.section .text // Directive to switch section to .text

// Define external dependencies
.extern printf
.extern delay
.extern digitalWrite
    
/** Blink LED exactly one time */
blinkOnceExt:
    push  {ip, lr}	// Push return address & dummy register for alignment

    /** "(From ARMV8) blinkOnceExt:\n" */
    @ ldr	r0, =StartupLog	// Load Startup log message into r0
    @ bl printf // Copy the address of the printf extern function into lr

    b blink // Branch to blink LED
    b done  // Branch to return to C

/** Blink LED  */
blink:
    /** Set pin ON */
    ldr	r0, =pin    // Load pin into r0
    ldr	r0, [r0]    // load r0 into r0
    mov	r1, #1  // Set r1 to 1
    bl 	digitalWrite  // Copy the address of the digitalWrite extern function into lr  
    
    /** Wait */
    ldr	r0, =delayMs // Load the delay in ms into r0
    ldr	r0, [r0]    // Load r0 into r0
    bl	delay   // Copy the address of the delay extern function into lr 

    /** Set pin OFF */
    ldr	r0, =pin    // Load pin into r0
    ldr	r0, [r0]    // load r0 into r0
    mov	r1, #0  // Set r1 to 0
    bl 	digitalWrite    // Copy the address of the digitalWrite extern function into lr 
    
/** Return to C */
done:	
    pop {ip, pc}	// Pop return address into pc, control will return to C
