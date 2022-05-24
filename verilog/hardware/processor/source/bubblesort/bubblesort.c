#include <stdio.h>
#include "bsort-input.h"


int main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Pulse Off On Off */
	*gDebugLedsMemoryMappedRegister = 0x00;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0xFF;
	for (int j = 0; j < 1000; j++);
	*gDebugLedsMemoryMappedRegister = 0x00;
	
	int i;
	int maxindex = bsort_input_len - 1;

	while (maxindex > 0)
	{
		for (i = 0; i < maxindex; i++)
		{
			if (bsort_input[i] > bsort_input[i+1])
			{
				/*		swap		*/
				bsort_input[i] ^= bsort_input[i+1];
				bsort_input[i+1] ^= bsort_input[i];
				bsort_input[i] ^= bsort_input[i+1];
			}
		}

		maxindex--;
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
