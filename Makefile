# 32 Bit                             # Tell compiler don't assume there's Dynamic memory management, Standard Lib, Exception Handlind or ETC.
GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

# To create a .output file from a .cpp file
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

# To create a .o file from a .s file
%.o: %.s
	as $(ASPARAMS) -o $@ $<

# To create .bin file. Will depend on linker.ld file and object files.
mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

# Install mykernel.bin
install: mykernel.bin
	sudo cp $< /boot/mykernel.bin