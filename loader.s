
.section .text
# Telling assembler there is going to be a function called kernelMain.
.extern kernelMain

.global loader

loader:
	mov $kernel_stack, %esp

.section .bss
.space 2*1024*1024; # 2 MB
kernel_stack:	