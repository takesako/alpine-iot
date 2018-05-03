# make EXAMLE=DigisparkMouse

EXAMPLE := DigisparkKeyboard

DIGISPARK_INC_DIR := /usr/include/digispark
DIGISPARK_LIB_DIR := /usr/lib/digispark

INCLUDES := -I$(DIGISPARK_INC_DIR) -I$(DIGISPARK_INC_DIR)/$(EXAMPLE) 

CC := avr-gcc
CXX := avr-g++

CFLAGS_OPT := -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections
CFLAGS_TINY:= -mmcu=attiny85 -DF_CPU=16500000L -DARDUINO=10805 -DARDUINO_AVR_DIGISPARK -DARDUINO_ARCH_AVR
CFLAGS_PRO := -mmcu=attiny167 -DF_CPU=16000000L -DARDUINO=10805 -DARDUINO_AVR_DIGISPARKPRO -DARDUINO_ARCH_AVR

CFLAGS := $(CFLAGS_OPT) $(CFLAGS_TINY)
CXXFLAGS := -fno-exceptions $(CFLAGS)

SRCS := a.cpp 
OBJS := $(addsuffix .o, $(basename $(SRCS)))

ifdef TARGET
  LIB_A := $(TARGET)
else
  TARGET := $(EXAMPLE).o $(EXAMPLE).elf $(EXAMPLE).eep $(EXAMPLE).hex
endif

.PHONY: all
all: $(TARGET)

.cpp.o:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $^

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $^

.S.o:
	$(CC) -x assembler-with-cpp $(CFLAGS) $(INCLUDES) -c -o $@ $^

$(LIB_A): $(OBJS)
	$(RM) $(LIB_A)
	avr-ar rcs $(LIB_A) $(OBJS)

$(EXAMPLE).elf: $(EXAMPLE).o
	$(CC) -mmcu=attiny85 -Wl,--gc-sections -o $(EXAMPLE).elf $(EXAMPLE).o -L$(DIGISPARK_LIB_DIR) -ltiny -l$(EXAMPLE)

$(EXAMPLE).eep: $(EXAMPLE).elf
	avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0 $(EXAMPLE).elf $(EXAMPLE).eep

$(EXAMPLE).hex: $(EXAMPLE).elf
	avr-objcopy -O ihex -R .eeprom $(EXAMPLE).elf $(EXAMPLE).hex

firmwareupgrade:
	micronucleus --timeout 60 /usr/share/micronucleus/upgrade-t85_default.hex

upload: $(EXAMPLE).hex
	micronucleus --timeout 60 $(EXAMPLE).hex

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS)

