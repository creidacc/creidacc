.data   // Directive to switch the current section to the .data section
.balign 4   // Align directive, for consistent behavior across all architectures

StartupLog: .asciz  "(From ARMV8) blinkSetup:\n"
ErrorMessage: .asciz	"Error: blinkSetup Setup didn't work... Aborting...\n"
pin: .int 7
OUTPUT = 1

.globl blinkSetup // Define extern ARMV8 function (this will be called from C)
.section .text  // Directive to switch section to .text

/** Define external dependencies */
.extern printf
.extern wiringPiSetup
.extern pinMode
.extern digitalWrite
    
/** Setup for blinking */
blinkSetup:
    push  {ip, lr}	// Push return address & dummy register for alignment

    /** "(From ARMV8) blinkSetup:\n" */
    ldr	r0, =StartupLog	    // Load Startup log message into r0
    bl printf   // Copy the address of the printf extern function into lr		

    /** Setup wiringPi, exit if setup fails, blink if succeeds */
    bl wiringPiSetup    // Copy the address of the wiringPiSetup extern function into lr
    mov	r1,#-1  // Set r1 to -1
    cmp	r0, r1  // compare r0 and r1
    bne	setupPinOutputMode   // if r0 is not equal to -1, then blink
    ldr	r0, =ErrorMessage   // else load the ErrorMessage log into r0
    bl printf  // Copy the address of the printf extern function into lr 
    b done  // branch to done

/** Setup Output Mode  */
setupPinOutputMode:
    /** Set pin output mode */
    ldr	r0, =pin    // Load the pin number into r0
    ldr	r0, [r0]    // Load r0 into r0
    mov	r1, #OUTPUT // Set r1 to OUTPUT
    bl	pinMode // Copy the address of the pinMode extern function into lr

    /** Set pin OFF */
    ldr	r0, =pin    // Load pin into r0
    ldr	r0, [r0]    // load r0 into r0
    mov	r1, #0  // Set r1 to 0
    bl 	digitalWrite    // Copy the address of the digitalWrite extern function into lr 
    
/** Return to C */
done:	
    pop {ip, pc}	// Pop return address into pc, control will return to C
