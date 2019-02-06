# 32 Bit
GPPPARAMS = -m32

ASPARAMS = --32

LDPARAMS = -melf_i386

objects = loader.o kernel.o

# To create a .output file from a .cpp file
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

# To create a .o file from a .s file
%.o: %.s
	as $(ASPARAMS) -o $@ -c $<

# To create .bin file. Will depend on linker.ld file and object files.
mykernel.bin: linker.ld $(objects)
	ld $(LDPARAMS) -T $< -o $@ $(objects)

# Install mykernel.bin
install: mykernel.bin
	sudo cp $< /boot/mykernel.bin