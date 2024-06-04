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
#include <stdint.h>

#include "inc/sevenSegCustom.h"

#define PD_DATA_IDENTIFIER 0xB8000000
#define PD_WS_COR 0xC0000000
#define SAMPLING_RATE 6249

volatile float frequency = 0;
int correlation_count = 0;
int cor_window_size = 4;
int avg_window_size = 4;

int current_packet = 0;

void freq_calc(){
	//TODO: change the time between samples
	frequency = (SAMPLING_RATE * avg_window_size * cor_window_size * correlation_count);
	frequency = 50*10*10*10*10*10*10 / frequency;

}

alt_u32 seven_seg_timer_isr(void* context){
	int firstDigit = (int)frequency % 10;
	int secondDigit = frequency/10;
	HEX0_display(firstDigit);
	HEX1_display(secondDigit);
	return 200;
}

int main() {
	int packetIdentifier = 0;
	int recievedPacket = 0;
	//initialise timer, reinitialisign done with the return
	//empty context
	int timeCountMain = 0;
	void* timerContext = (void*) &timeCountMain;
	alt_alarm seven_seg_timer;
	alt_alarm_start(&seven_seg_timer, 200, seven_seg_timer_isr, timerContext);

	printf("Setup the frequency calculation\n\r");

	while(1){
		recievedPacket = IORD_ALTERA_AVALON_PIO_DATA(RECV_DATA_PIO_BASE);
		//Extract identifier
		packetIdentifier = recievedPacket & 0xF8000000;

		if (recievedPacket != current_packet){
			printf("PD DATA Packet, received 0x%x\n\r", recievedPacket);
			current_packet = recievedPacket;
		}
		switch (packetIdentifier){
			case(PD_DATA_IDENTIFIER):{
				//printf("PD DATA Packet, received %0xd\n\r", recievedPacket);
				int isr_pt_bits = recievedPacket & 0x600000;
				isr_pt_bits = isr_pt_bits >> 21;
				//if peak detected
				//printf("The ISR bits are 0x%x\n\r", isr_pt_bits);
				if (isr_pt_bits == 0b11){
					correlation_count = recievedPacket & 0x1FFFFF;
					printf("PEAK: correlation count 0x%x\n\r", correlation_count);
					//TODO: Change to calculate frequency
					freq_calc();
				}
				// if trough detected
				else if (isr_pt_bits == 0b10){
					printf("Trough detected");
				}
			break;
			}
			case(PD_WS_COR):
				printf("Avg DATA Packet, received %0xd\n\r", recievedPacket);
				avg_window_size = recievedPacket & 0x3F;
				// extract whether it is a avg or corrolation packet
				int avg_cor_bit = recievedPacket & 0x800000;
				avg_cor_bit = avg_cor_bit >> 23;

				//Average Window Size
				if (avg_cor_bit == 0){
					avg_window_size = recievedPacket & 0x1F;
					avg_window_size = avg_window_size*2;
					printf("\n\r AVG WINDOW CHANGED");
					printf("avg Window Size is 0x%d\n\r", avg_window_size);
					printf("cor Window Size %x\n\r", cor_window_size);
				}
				// Corrolation Window Size
				else if (avg_cor_bit == 1){
					printf("\n\r COR WINDOW CHANGED");
					cor_window_size = recievedPacket & 0x1F;
					cor_window_size = cor_window_size*2;
					printf("avg Window Size is 0x%d\n\r", avg_window_size);
					printf("cor Window Size %x\n\r", cor_window_size);
				}
			break;
		}
	}

}
