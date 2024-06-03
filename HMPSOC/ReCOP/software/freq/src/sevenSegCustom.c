#include "io.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

#include "../inc/sevenSegCustom.h"


void HEX0_display(int number) {
	IOWR_ALTERA_AVALON_PIO_DATA(HEX_0_BASE, HEX_ENCODE(number));
	return;
}
void HEX1_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_1_BASE, HEX_ENCODE(number));
return;
}

void HEX2_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_2_BASE, HEX_ENCODE(number));
return;
}

void HEX3_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_3_BASE, HEX_ENCODE(number));
return;
}

void HEX4_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_4_BASE, HEX_ENCODE(number));
return;
}

void HEX5_display(int number) {
IOWR_ALTERA_AVALON_PIO_DATA(HEX_5_BASE, HEX_ENCODE(number));
return;
}
