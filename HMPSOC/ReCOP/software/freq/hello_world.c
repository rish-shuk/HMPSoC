/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>

/*
 * main.c
 *
 *  Created on: Jun 3, 2024
 *      Author: Robert Sefaj
 */

#include "system.h"
#include "io.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include <sys/alt_alarm.h>
#include <stdio.h>

#include "inc/sevenSegCustom.h"

#define PD_DATA_IDENTIFIER 0xB8000000
#define AVG_CONFIG_IDENTIFIER 0x90000000
#define COR_CONFIG_IDENTIFIER 0x98000000

volatile float frequency = 0;
int cor_window_size = 0;
int avg_window_size = 0;

void freq_calc(){

	printf("The peak packet is: %d", IORD_ALTERA_AVALON_PIO_DATA(RECV_DATA_PIO_BASE));
}

alt_u32 seven_seg_timer_isr(void* context){
	printf("sevensegISR\n\r");
	int firstDigit = (int)frequency % 10;
	int secondDigit = frequency/10;
	HEX0_display(firstDigit);
	HEX1_display(secondDigit);
	return 200;
}

int main() {
	int packetIdentifier = 0;
	int recievedPacket = IORD_ALTERA_AVALON_PIO_DATA(RECV_DATA_PIO_BASE);
	packetIdentifier = recievedPacket & 0xF8000000;

	//initialise timer, reinitialisign done with the return
	//empty context
	int timeCountMain = 0;
	void* timerContext = (void*) &timeCountMain;
	alt_alarm seven_seg_timer;
	alt_alarm_start(&seven_seg_timer, 200, seven_seg_timer_isr, timerContext);

	while(1){
		printf("Whole Packet 0x%x\n\r", recievedPacket);
		switch (packetIdentifier){
			case(PD_DATA_IDENTIFIER):
				printf("PD DATA Packet, received\n\r");
				int isr_pt_bits = recievedPacket & 0xC00000;
				isr_pt_bits = isr_pt_bits >> 21;
				printf("The ISR bits are 0x%x\n\r", isr_pt_bits);
				if (isr_pt_bits == 0b11){
					printf("PEAK: calculate frequency\n\r");
				} else if (isr_pt_bits == 0b10){
					printf("Trough detected");
				}
			break;
			case(AVG_CONFIG_IDENTIFIER):
				avg_window_size = recievedPacket & 0x3F;
				printf("Avg config Packet, avg_windows = 0x%x\n\r", avg_window_size);
			break;
			case(COR_CONFIG_IDENTIFIER):
				cor_window_size = recievedPacket & 0x3F;
				printf("Cor config Packet, cor_windows = 0x%x\n\r", cor_window_size);
			break;
		}
	}

}

