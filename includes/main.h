/*
 * main.h
 * 
 * Vinícius da Silveira Serafim <vinicius@serafim.eti.br>
 */

#ifndef MAIN_H
#define	MAIN_H

#include "misc.h"
#include "mcu_setup.h"
#include "fuses.h"
#include "../libcomm/uart.h"

#include <avr/io.h>
#include <util/delay.h>
#include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#define LED_ON  BITSET(LED_PORT, LED_PIN)
#define LED_OFF BITCLEAR(LED_PORT, LED_PIN)

#endif	/* MAIN_H */

// eof