#include <stdio.h>

void dot(volatile unsigned int *LED){
	*LED = 0xFF;
	for (int j = 0; j < 50000; j++);
	*LED = 0x00;
	for (int j = 0; j < 50000; j++);
}

void dash(volatile unsigned int *LED){
	*LED = 0xFF;
	for (int j = 0; j < 100000; j++);
	*LED = 0x00;
	for (int j = 0; j < 50000; j++);
}

void space(void){
	for (int j = 0; j < 400000; j++);
}

int main(void)
{
	volatile unsigned int *		gLed = (unsigned int *)0x2000;
	while(1){
		dot(gLed); dot(gLed); dot(gLed); dot(gLed); // H
		space();
		dot(gLed); // E
		space();
		dot(gLed); dash(gLed); dot(gLed); dot(gLed); // L
		space();
		dot(gLed); dash(gLed); dot(gLed); dot(gLed); // L
		space();
		dash(gLed); dash(gLed); dash(gLed); // O

		space();space();space();
	}
}
