// Rudimentary made printf function since we don't have access to standard library in this case.
void printf(char* string){

	unsigned short* VideoMemory =  (unsigned short*) 0xb8000;

	for(int i = 0; string[i] != '\0'; i ++) {
							// To stop overriding high byte
							// Copy High byte that was in memory.
		VideoMemory[i] =  (VideoMemory[i] & 0xFF00) | string[i];
	};	
};

extern "C" void kernelMain(void* multiboot_struct, unsigned int magic_number){
	printf("Hello, World!\n");

	while(true);
};