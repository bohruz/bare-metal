// #ifndef __AVR_ATmega328__
// #define __AVR_ATmega328__
// #endif

// #include <avr/io.h>
// #include <stdbool.h>
#include <util/delay.h>

#define BLINK_MS 100

int main() {
  *((uint8_t volatile *)0x24) |= (1 << 5);
  // DDRB |= _BV(PORT5);

  while (1) {
    *((uint8_t volatile *)0x25) ^= (1 << 5);
    _delay_ms(BLINK_MS);
  }
}
