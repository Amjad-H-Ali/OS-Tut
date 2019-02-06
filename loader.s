
.section .text
# Telling assembler there is going to be a function called kernelMain.
.extern kernelMain

.global loader

loader:
	mov $kernel_stack, %esp

.section .bss

kernel_stack:	