#include <stdio.h>
#include <printf.h>
#include "dat.h"

float LowPassFilter(float *in, float *out, int N, double in0)
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
	const int	numberOfSamples = 128;
	int		halfNumberOfSamples = numberOfSamples/2;
	float 		xBuffer[numberOfSamples];
	float 		xBufferOut[numberOfSamples];
	float 		in0 = 0;
	for(int j = 0; j < numberOfSamples; j++)
    	{
		/* 
		 * Insert delay of 2500 uSeconds to simulate 400 Hz sample rate
		 */     
		// xudelay(2500);
		/* 
		 * Read sensor readings from sigsrc 0 which is the x-axis accelerometer readings
		 */
    		xBuffer[j] = phonysig[j];
		/*	
		 *	Please note that sigsrc simulates a real signal which changes in time. 
		 *	The value returned by devsignal_read() will be different at different simulation times.
	   	 *	Here we use delay to wait for 1/f seconds where f is the 400 Hz sample frequency specified in the run.m file. 
	   	 *	If we don't wait for this amount of time and instead sample as quickly as we can we will see the same sensor value many times. 
	   	 *	If we set xudelay to a higher value we will start to miss some samples in the file as we are looking at the return value of i
		 *	devsignal_read() at a frequency lower than 400 Hz.
	 	 */
	}	
	
	in0 = LowPassFilter(xBuffer, xBufferOut, halfNumberOfSamples, in0);
	in0 = LowPassFilter(&xBuffer[halfNumberOfSamples], &xBufferOut[halfNumberOfSamples], halfNumberOfSamples, in0);

	for(int i = 0; i < numberOfSamples; i++)
	{
		printf("x[%d]=%f\ty[%d]=%f\n",i,xBuffer[i], i, xBufferOut[i]);
	}	
	return 0;
}
