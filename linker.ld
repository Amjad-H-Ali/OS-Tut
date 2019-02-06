/* Tells linker.ld that what section of loader.s will be the entry point of the resulting .bin file*\

ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

/* Collect the sections from the .o files and combine them into new ones *\