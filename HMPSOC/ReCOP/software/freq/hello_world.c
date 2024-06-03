/*
 * main.c
 *
 *  Created on: Jun 3, 2024
 *      Author: rishishukla
 */

#include "system.h"
#include "io.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

// Use the custom instruction defined in system.h
#define HEX_ENCODE(number) ALT_CI_HEX_ENCODER_CI_0((alt_u32)number)

void HEX0_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_0_BASE, HEX_ENCODE(number));
}
void HEX1_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_1_BASE, HEX_ENCODE(number));
}

void HEX2_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_2_BASE, HEX_ENCODE(number));
}

void HEX3_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_3_BASE, HEX_ENCODE(number));
}

void HEX4_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_4_BASE, HEX_ENCODE(number));
}

void HEX5_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_5_BASE, HEX_ENCODE(number));
}

void freq_calc(){
//printf(IORD_ALTERA_AVALON_PIO_DATA(RECV_DATA_PIO_BASE));
}

int main() {
	while(1){
		HEX1_display(1);
		HEX2_display(2);
		HEX3_display(3);
		HEX4_display(4);
	}
	return 0;
}
