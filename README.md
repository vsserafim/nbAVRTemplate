# NetBeans AVR Template

Vinícius da Silveira Serafim <vinicius@serafim.eti.br>

## Steps to create a new project:

1) git clone <repository_url> <NewProjectName> 

2) cd <NewProjectName>

3) ./setup.sh <NewProjectName>


## Notes

### All peripherals are disabled by mcu_init()
Timers, ADC, Analog Comparator, SPI, USART, ... are disabled!
You have to create your own init/start/stop functions to configure the peripherals
you want to use.

### Edit the following sections in atmega328p.h (or atmega8.h, attiny13.h,...)
* PIN NAMES AND CONFIGURATION
* OUTPUT PORTS (by default all ports are INPUTs with PULL-UPs enabled)
* USED AIN PINS
* WATCHDOG
* CPU FREQUENCY

### You should take a look at the following files
* Makefile
* fuses.h

## Directories
* Header Files (includes): your program header files
* Source Files (sources): your program sources
* Libraries: a logical folder for the libxxxxs (ex: libcomm)
* Important Files: here is your Makefile

## Links
* [AVR Libc Reference Manual](https://www.microchip.com/webdoc/AVRLibcReferenceManual/)
* [Atmel START](http://start.atmel.com/)
* [Engbedded Atmel AVR Fuse Calculator](http://www.engbedded.com/fusecalc)