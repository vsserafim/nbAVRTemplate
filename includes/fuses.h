/*
 * MCU fuses
 * 
 * Vinícius da Silveira Serafim <vinicius@serafim.eti.br>
 */

/*** WARNING!!!! ***
 * Never put your F_CPU bellow 2000UL (2kHz)! (This is the limit for avrdude)
 * Never disable SPIEN fuse!
 * Never enable RSTDISBL fuse!
 * 
 * If you do any of those things, you will have to do a High-Voltage Programming
 * to recover access to your MCU.
 * 
 * Use this site for fuses calculation: https://www.engbedded.com/fusecalc/
 */

#ifndef FUSES_H
#define FUSES_H

#include <avr/io.h>
#include <avr/fuse.h>

#ifdef __AVR_ATmega328P__
FUSES ={
    (FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL2 & FUSE_CKSEL0), // LOW 0xe2
    (FUSE_SPIEN & FUSE_EESAVE), // HIGH 0xd7
    0xFF // EXTENDED 0xff
};

#elif __AVR_ATmega8__
FUSES ={
    (FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL2 & FUSE_CKSEL1), // LOW 0xe1
    (FUSE_SPIEN & FUSE_EESAVE) // HIGH 0xd7
};

#elif __AVR_ATtiny85__
FUSES ={
    (FUSE_SUT0 & FUSE_CKSEL3 & FUSE_CKSEL2 & FUSE_CKSEL0), // LOW 0xe2
    (FUSE_SPIEN & FUSE_EESAVE), // HIGH 0xd7
    0xFF // EXTENDED 0xff
};

#elif __AVR_ATtiny13A__
FUSES ={
    (FUSE_SPIEN & FUSE_EESAVE & FUSE_SUT0 & FUSE_CKSEL0), // LOW 0x3a
    0xFF // HIGH 0xff
};
#endif


#endif /* FUSES_H */

