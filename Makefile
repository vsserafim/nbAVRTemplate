#  Vinícius da Silveira Serafim <vinicius@serafim.eti.br>
#
#  There exist several targets which are by default empty and which can be 
#  used for execution of your targets. These targets are usually executed 
#  before and after some main targets. They are: 
#
#     .build-pre:              called before 'build' target
#     .build-post:             called after 'build' target
#     .clean-pre:              called before 'clean' target
#     .clean-post:             called after 'clean' target
#     .clobber-pre:            called before 'clobber' target
#     .clobber-post:           called after 'clobber' target
#     .all-pre:                called before 'all' target
#     .all-post:               called after 'all' target
#     .help-pre:               called before 'help' target
#     .help-post:              called after 'help' target
#
#  Targets beginning with '.' are not intended to be called on their own.
#
#  Main targets can be executed directly, and they are:
#  
#     build                    build a specific configuration
#     clean                    remove built files from a configuration
#     clobber                  remove all built files
#     all                      build all configurations
#     help                     print help mesage
#  
#  Targets .build-impl, .clean-impl, .clobber-impl, .all-impl, and
#  .help-impl are implemented in nbproject/makefile-impl.mk.
#
#  Available make variables:
#
#     CND_BASEDIR                base directory for relative paths
#     CND_DISTDIR                default top distribution directory (build artifacts)
#     CND_BUILDDIR               default top build directory (object files, ...)
#     CONF                       name of current configuration
#     CND_PLATFORM_${CONF}       platform name (current configuration)
#     CND_ARTIFACT_DIR_${CONF}   directory of build artifact (current configuration)
#     CND_ARTIFACT_NAME_${CONF}  name of build artifact (current configuration)
#     CND_ARTIFACT_PATH_${CONF}  path to build artifact (current configuration)
#     CND_PACKAGE_DIR_${CONF}    directory of package (current configuration)
#     CND_PACKAGE_NAME_${CONF}   name of package (current configuration)
#     CND_PACKAGE_PATH_${CONF}   path to package (current configuration)
#
# NOCDDL

# Environment 
MKDIR=mkdir
CP=cp
CCADMIN=CCadmin

# ISP In System Programmer configuration.
# Change as needed
ISP=usbasp
ISP_PORT=/dev/ttyUSB0
ISP_BAUD=19200

# AVRDUDE paths
# Change as needed
AVRDUDE=/usr/local/bin/avrdude
AVRDUDE_CONF=/usr/local/etc/avrdude.conf
# bitclock <= F_CPU / 4
AVRDUDE_BITCLOCK=250kHz

# Your configurations
# Change as needed
ifeq ("${CONF}", "atmega328p")
    AVRDUDE_PARTNO=atmega328p

else ifeq ("${CONF}", "atmega8")
    AVRDUDE_PARTNO=atmega8

else ifeq ("${CONF}", "attiny85")
    AVRDUDE_PARTNO=attiny85

else ifeq ("${CONF}", "attiny13a")
    AVRDUDE_PARTNO=attiny13
    AVRDUDE_BITCLOCK=300kHz

endif

# Those are safe FUSES values.
# Add safe values for a new MCU partno here.
ifeq ("${AVRDUDE_PARTNO}", "atmega328p")
    SAFE_LFUSE=0x62
    SAFE_HFUSE=0xd7
    SAFE_EFUSE=0xff
else ifeq ("${AVRDUDE_PARTNO}", "atmega8")
    SAFE_LFUSE=0xe1
    SAFE_HFUSE=0xd7
else ifeq ("${AVRDUDE_PARTNO}", "attiny85")
    SAFE_LFUSE=0x62
    SAFE_HFUSE=0xd7
    SAFE_EFUSE=0xff
else ifeq ("${AVRDUDE_PARTNO}", "attiny13")
    SAFE_LFUSE=0x2a
    SAFE_HFUSE=0xff
endif

# build
build: .build-post

.build-pre:
# Add your pre 'build' code here...

.build-post: .build-impl
# extracting flash ROM data
#avr-objcopy -O ihex -R .eeprom -R .fuse \
#${CND_ARTIFACT_PATH_${CONF}} ${CND_ARTIFACT_PATH_${CONF}}.flash

# extracting EEPROM data
#avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load \
#--no-change-warnings --change-section-lma .eeprom=0 \
#${CND_ARTIFACT_PATH_${CONF}} ${CND_ARTIFACT_PATH_${CONF}}.eeprom

# extracting FUSES
#avr-objcopy -O ihex -j .fuse --change-section-lma .fuse=0 \
#${CND_ARTIFACT_PATH_${CONF}} ${CND_ARTIFACT_PATH_${CONF}}.fuses
	
	# list section sizes and total size
	avr-size --mcu=${CONF} -C ${CND_ARTIFACT_PATH_${CONF}}

	@echo "\"cd ${CND_BASEDIR}/${CND_ARTIFACT_DIR_${CONF}}\" and then"

	@echo "\n########## SAFE FUSES VERIFY command ##########"
ifdef SAFE_EFUSE
	@echo \
	    "${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
	    "-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
	    "-p ${AVRDUDE_PARTNO}" \
	    "-U lfuse:v:${SAFE_LFUSE}:m" \
	    "-U hfuse:v:${SAFE_HFUSE}:m" \
	    "-U efuse:v:${SAFE_EFUSE}:m -u -q"
else
	@echo \
	    "${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
	    "-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
	    "-p ${AVRDUDE_PARTNO}" \
	    "-U lfuse:v:${SAFE_LFUSE}:m" \
	    "-U hfuse:v:${SAFE_HFUSE}:m -u -q"
endif

	@echo "\n########## FUSES VERIFY command ##########"
ifdef SAFE_EFUSE
	@echo \
	    "${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
	    "-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
	    "-p ${AVRDUDE_PARTNO}" \
	    "-U lfuse:v:${CND_ARTIFACT_NAME_${CONF}}:e" \
	    "-U hfuse:v:${CND_ARTIFACT_NAME_${CONF}}:e" \
	    "-U efuse:v:${CND_ARTIFACT_NAME_${CONF}}:e -u -q"
else
	@echo \
	    "${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
	    "-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
	    "-p ${AVRDUDE_PARTNO}" \
	    "-U lfuse:v:${CND_ARTIFACT_NAME_${CONF}}:e" \
	    "-U hfuse:v:${CND_ARTIFACT_NAME_${CONF}}:e -u -q"
endif
	
	@echo "\n########## EEPROM VERIFY command ##########"
	@echo \
	    "${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
	    "-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
	    "-p ${AVRDUDE_PARTNO}" \
	    "-U eeprom:v:${CND_ARTIFACT_NAME_${CONF}}:e -q"
	
	@echo "\n########## ROM VERIFY command ##########"
	@echo \
		"${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK}" \
		"-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD}" \
		"-p ${AVRDUDE_PARTNO}" \
		"-U flash:v:${CND_ARTIFACT_NAME_${CONF}}:e -q"

# clean
clean: .clean-post

.clean-pre:
# Add your pre 'clean' code here...

.clean-post: .clean-impl
# Add your post 'clean' code here...


# clobber
clobber: .clobber-post

.clobber-pre:
# Add your pre 'clobber' code here...

.clobber-post: .clobber-impl
	    rm -rf ${CND_DISTDIR}
	    mkdir ${CND_DISTDIR}

# all
all: .all-post

.all-pre:
# Add your pre 'all' code here...

.all-post: .all-impl
# Add your post 'all' code here...


# build tests
build-tests: .build-tests-post

.build-tests-pre:
# Add your pre 'build-tests' code here...

.build-tests-post: .build-tests-impl
# Add your post 'build-tests' code here...


# run tests
test: .test-post

.test-pre: build-tests
# Add your pre 'test' code here...

.test-post: .test-impl
# Add your post 'test' code here...


# help
help: .help-post

.help-pre:
# Add your pre 'help' code here...

.help-post: .help-impl
# Add your post 'help' code here...

flash:
	${AVRDUDE} -C ${AVRDUDE_CONF} -B ${AVRDUDE_BITCLOCK} \
	-c ${ISP} -P ${ISP_PORT} -b ${ISP_BAUD} \
	-p ${AVRDUDE_PARTNO} \
	-U flash:w:${CND_ARTIFACT_PATH_${CONF}}:e

# include project implementation makefile
include nbproject/Makefile-impl.mk

# include project make variables
include nbproject/Makefile-variables.mk