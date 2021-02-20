#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=avr-gcc
CCC=avr-g++
CXX=avr-g++
FC=gfortran
AS=avr-as

# Macros
CND_PLATFORM=AVR-Linux
CND_DLIB_EXT=so
CND_CONF=attiny85
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/libcomm/uart.o \
	${OBJECTDIR}/sources/main.o


# C Compiler Flags
CFLAGS=-g -Os -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=${CND_CONF}

# CC Compiler Flags
CCFLAGS=-g -Os -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=${CND_CONF}
CXXFLAGS=-g -Os -std=gnu++11 -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=${CND_CONF}

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/nbAVRTemplate.elf

${CND_DISTDIR}/${CND_CONF}/nbAVRTemplate.elf: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}
	avr-gcc -o ${CND_DISTDIR}/${CND_CONF}/nbAVRTemplate.elf ${OBJECTFILES} ${LDLIBSOPTIONS} -Os -Wl,--gc-sections -lm -mmcu=${CND_CONF}

${OBJECTDIR}/libcomm/uart.o: libcomm/uart.cpp
	${MKDIR} -p ${OBJECTDIR}/libcomm
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -D__AVR_ATtiny85__ -I../includes -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/libcomm/uart.o libcomm/uart.cpp

${OBJECTDIR}/sources/main.o: sources/main.cpp
	${MKDIR} -p ${OBJECTDIR}/sources
	${RM} "$@.d"
	$(COMPILE.cc) -O2 -D__AVR_ATtiny85__ -I../includes -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/sources/main.o sources/main.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
