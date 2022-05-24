#include <stdio.h>
#include "dat.h"


int Schlieren(int a, int b) {
	return (a+b)/(a-b);
}

int main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Pulse Off On Off */
	*gDebugLedsMemoryMappedRegister = 0x00;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;

	const int 	samplesPerDistribution = NOS; 

	for(int i = 0; i < samplesPerDistribution; i++)
	{
		volatile int x = Schlieren(temp[i], humidity[i]);
		//gDebugLedsMemoryMappedRegister = x & 0xFF;
	}

	/* End Benchmark - Pulse On Off On */
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;
	for (int j = 0; j < 1000; j++);
	while(1)
	{
		*gDebugLedsMemoryMappedRegister = 0xFF;	
	}
}
