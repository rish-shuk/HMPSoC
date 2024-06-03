/*
 * sevenSegCustom.h
 *
 *  Created on: 3/06/2024
 *      Author: skend
 */

#ifndef INC_SEVENSEGCUSTOM_H_
#define INC_SEVENSEGCUSTOM_H_

#include "system.h"



// Use the custom instruction defined in system.h
#define HEX_ENCODE(number) ALT_CI_HEX_ENCODER_CI_0((alt_u32)number)

void HEX0_display(int number);
void HEX1_display(int number);
void HEX2_display(int number);
void HEX3_display(int number);
void HEX4_display(int number);
void HEX5_display(int number);



#endif /* INC_SEVENSEGCUSTOM_H_ */
