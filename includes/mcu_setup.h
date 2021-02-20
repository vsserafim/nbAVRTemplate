/*
 * mcusetup.h
 * 
 * Vinícius da Silveira Serafim <vinicius@serafim.eti.br>
 */


#ifndef MCUSETUP_H
#define MCUSETUP_H

#ifdef __AVR_ATmega328P__
#include "atmega328p.h"

#elif __AVR_ATmega8__
#include "atmega8.h"

#elif __AVR_ATtiny85__
#include "attiny85.h"

#elif __AVR_ATtiny13A__
#include "attiny13.h"

#endif

#endif	// MCUSETUP_H

// eof