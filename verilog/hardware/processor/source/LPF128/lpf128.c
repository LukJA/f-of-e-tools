#include <stdio.h>
#include "dat.h"

int LowPassFilter(int *in, int *out, int N, int in0)
{
	out[0] = in[0] + in0;
	for (int n=1; n < N ; n++) 
	{
		out[n] =  in[n]  + in[n-1];
	}
	return in[N-1];
}

int
main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Pulse Off On Off */
	*gDebugLedsMemoryMappedRegister = 0x00;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;

	const int	numberOfSamples = NOS;
	int		halfNumberOfSamples = numberOfSamples/2;
	int 		xBuffer[numberOfSamples];
	int 		xBufferOut[numberOfSamples];
	int 		in0 = 0;

	for(int j = 0; j < numberOfSamples; j++)
    	{
    		xBuffer[j] = phonysig[j];
	}	
	
	in0 = LowPassFilter(xBuffer, xBufferOut, halfNumberOfSamples, in0);
	in0 = LowPassFilter(&xBuffer[halfNumberOfSamples], &xBufferOut[halfNumberOfSamples], halfNumberOfSamples, in0);

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
