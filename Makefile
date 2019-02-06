# 32 Bit
GPPPARAMS = -m32

ASPARAMS = --32

# To create a .output file from a .cpp file
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<
	
# To create a .o file from a .s file
%.o: %.s
	as $(ASPARAMS) -o $@ -c $<