#include <stdio.h>
#include "bsort-input.h"

int compareArrays(u_char a[], u_char b[], int n) {
  int ii;
  for(ii = 0; ii <= n; ii++) {
	  u_char alpha = a[ii];
	  u_char beta = b[ii];
    if (alpha != beta) {
		return 2;
	}
  }
  return 1;
}

int main(void)
{
	volatile unsigned int *		gDebugLedsMemoryMappedRegister = (unsigned int *)0x2000;
	/* Begin Benchmark - Hold Off; */
	*gDebugLedsMemoryMappedRegister = 0x00;

	int i;
	int maxindex = bsort_input_len - 1;

	while (maxindex > 0)
	{
		for (i = 0; i < maxindex; i++)
		{
			*gDebugLedsMemoryMappedRegister = 0xFF;
			*gDebugLedsMemoryMappedRegister = 0x00;
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

	int success = compareArrays(bsort_input, target_short, bsort_input_len-1);
	if (success == 1){
		while(1)
		{
			*gDebugLedsMemoryMappedRegister = 0xFF;
		}
	}
	else if (success == 2){
		while(1){
			*gDebugLedsMemoryMappedRegister = 0xFF;
			*gDebugLedsMemoryMappedRegister = 0x00;
			*gDebugLedsMemoryMappedRegister = 0x00;
			*gDebugLedsMemoryMappedRegister = 0x00;
		}
	}
	return 0;
}
