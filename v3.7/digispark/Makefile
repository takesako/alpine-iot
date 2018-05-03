CC  := avr-gcc
CXX := avr-g++

CFLAGS  := -g -Os -w -fno-exceptions -ffunction-sections -fdata-sections  
CXXFLAGS:= -fno-exceptions $(CFLAGS)

SRCS    := X.cpp XX.c XXX.S 
OBJS    := $(addsuffix .o, $(basename $(SRCS)))

TARGET  := libXXX.a 

.PHONY: all
all: $(TARGET)

.cpp.o:
	$(CXX) $(CXXFLAGS) -c -o $@ $^

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $^

.S.o:
	$(CC) -x assembler-with-cpp $(CFLAGS) -c -o $@ $^

$(TARGET): $(OBJS)
	avr-ar rcs $(TARGET) $(OBJS)

.PHONY: clean
clean:
	$(RM) $(TARGET) $(OBJS)

