CC=avr-gcc
CFLAGS= -Os -DF_CPU=16000000UL -mmcu=atmega328

# Compiling
all: blink.out

# Detect what port my arduino is on.

USBPORT=/dev/ttyUSB0

%.out: %.c 
	$(CC) $(CFLAGS) $< -o $@

%.hex: %.out 
	avr-objcopy -O ihex -R .eeprom $< $@

# Upload to the board

install.%: %.hex
	avrdude -F -V -c arduino -p ATMEGA328 -P ${USBPORT} -b 115200 -U flash:w:$< $@:i

clean:  
	rm -f *.hex *.out 