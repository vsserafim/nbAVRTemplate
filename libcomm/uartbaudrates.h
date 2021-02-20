/*
 * Best baud rates for common MCU Clock Frequencies
 * 
 * From: http://wormfood.net/avrbaudcalc.php
 * 
 * Reference: datasheet page 172 20.3.1 Internal Clock Generation 
 */

#ifndef UARTBAUDRATES_H
#define UARTBAUDRATES_H

#include "../includes/mcu_setup.h"

#if F_CPU == 1000000UL
#define BAUD        4800
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 1200000UL
#define BAUD        600
#define USART_UBRRH 0x00
#define USART_UBRRL 0x7c

#elif F_CPU == 2000000UL
#define BAUD        9600
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 4000000UL
#define BAUD        19200
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 6000000UL
#define BAUD        28800
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 8000000UL
#define BAUD        38400
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 9600000UL
#define BAUD        4800
#define USART_UBRRH 0x00
#define USART_UBRRL 0x7c

#elif F_CPU == 12000000UL
#define BAUD        57600
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0c

#elif F_CPU == 16000000UL
#define BAUD        38400
#define USART_UBRRH 0x00
#define USART_UBRRL 0x19

#elif F_CPU == 20000000UL
#define BAUD        115200
#define USART_UBRRH 0x00
#define USART_UBRRL 0x0a
#endif


#endif /* UARTBAUDRATES_H */

