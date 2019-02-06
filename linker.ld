/* Tells linker.ld that what section of loader.s will be the entry point of the resulting .bin file*\

ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)

/* Collect the sections from the .o files and combine them into new ones *\

SECTIONS
{
	. = 0x0100000;

	.text :
	{
		*(.multiboot)
		*(.text*)
		*(.rodata)
	}

	.data :
	{
		start_ctors = .;
		KEEP(*(.init_array));
		KEEP(*(SORT_BY_INIT_PRIORITY(.init_array.*)));
		end_ctors = .;

		*(.data)
	}

	.bss :
	{
		*(.bss)
	}

	/* Tell linker it's ok that some symbols like comments are not converted to binary file. *\
	/DISCARD/ :
	{	
		*(.fini_array*)
		*(.comment)
	}
}