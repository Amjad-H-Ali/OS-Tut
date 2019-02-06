# Magic number so boot loader can know it's a kernel
.set MAGIC, 0x1badb002
.set FLAGS, (1<<0 | 1<<1)
.set CHECKSUM, -(MAGIC + FLAGS)

#  Put into .o file
.section .multiboot
	.long MAGIC
	.long FLAGS
	.long CHECKSUM


.section .text
# Telling assembler there is going to be a function called kernelMain.
.extern kernelMain

.global loader

# Point esp register to kernel_stack
loader:
	mov $kernel_stack, %esp
	# Boot loader stores pointer to multi boot structure in ax register.
	push %eax
	# Bootloader copies Magic number to bx register
	push %ebx
	call kernelMain

# Backup infinit loop
_stop:
	cli
	hlt
	jmp _stop	


.section .bss
# Space behind kernel_stack so as to not override anything in stack already.
.space 2*1024*1024; # 2 MB
kernel_stack:	