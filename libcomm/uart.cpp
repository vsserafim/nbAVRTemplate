/*
 * UART (Serial Interface)
 * 
 * Very simple UART implementation.
 * 
 * ATmega328P
 * ATmega8
 */

#include "uart.h"

/**
 * USART configuration and enable
 */
void uart_init() {

#ifdef __AVR_ATmega328P__
    UBRR0H = USART_UBRRH;
    UBRR0L = USART_UBRRL;

    // Transmitter Enabled
    BITSET(UCSR0B, TXEN0);

    // Receiver Disabled
    BITCLEAR(UCSR0B, RXEN0);

    // 8-N-1
    UCSR0C = _BV(UCSZ01) | _BV(UCSZ00);

#elif __AVR_ATmega8__
    UBRRH = USART_UBRRH;
    UBRRL = USART_UBRRL;

    // Transmitter Enable
    BITSET(UCSRB, TXEN);

    // Receiver disabled
    BITCLEAR(UCSRB, RXEN);

    // 8-N-1
    UCSRC = _BV(URSEL) | _BV(UCSZ1) | _BV(UCSZ0);

#endif

}

/**
 * Check if there is data to be read.
 * @return 
 */
bool uart_dataready() {
#ifdef __AVR_ATmega328P__
    return bit_is_set(UCSR0A, RXC0);
#elif __AVR_ATmega8__
    return bit_is_set(UCSRA, RXC);
#endif
}

/**
 * Enable/disable rx
 * @param enable
 */
void uart_rx(bool enable) {
#ifdef __AVR_ATmega328P__
    if (enable)
        BITSET(UCSR0B, RXEN0);
    else
        BITCLEAR(UCSR0B, RXEN0);
#elif __AVR_ATmega8__
    if (enable)
        BITSET(UCSRB, RXEN);
    else
        BITCLEAR(UCSRB, RXEN);
#endif
}

/**
 * Read one byte (resets watchdog)
 * @return 
 */
uint8_t uart_readByte() {
#ifdef __AVR_ATmega328P__
    loop_until_bit_is_set(UCSR0A, RXC0);
    return UDR0;
#elif __AVR_ATmega8__
    loop_until_bit_is_set(UCSRA, RXC);
    return UDR;
#endif
}

/**
 * Send one byte (resets watchdog)
 * @param byte
 */
void uart_sendByte(uint8_t byte) {
#ifdef __AVR_ATmega328P__
    loop_until_bit_is_set(UCSR0A, UDRE0);
    UDR0 = byte;
#elif __AVR_ATmega8__
    loop_until_bit_is_set(UCSRA, UDRE);
    UDR = byte;
#endif
}

/**
 * Send a null terminated string
 * @param str
 */
void uart_sendString(const char s[]) {
    uint8_t i = 0;

    while (s[i] != '\0') {
        uart_sendByte(s[i]);
        i++;
    }
}