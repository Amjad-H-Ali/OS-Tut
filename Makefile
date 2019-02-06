GPPPARAMS = -m32
# To create a .output file from a .cpp file
%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<