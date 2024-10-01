#pragma bank 6

#include <gbdk/platform.h>
#include <stdint.h>

BANKREF(motherlode_sfx_00)
const uint8_t motherlode_sfx_00[] = {
0xf2,0b01000100,0xdd,0b01111011,0x2a,0xa8,0x81,0x80,
0x80,
0x71,0b01111011,0x2a,0x68,0x63,0x80,
0xf1,0b01111011,0x2a,0xa8,0x81,0x80,
0x80,
0x71,0b01111011,0x2a,0x68,0x63,0x80,
0xf1,0b01111011,0x2a,0xa8,0x81,0x80,
0x80,
0x71,0b01111011,0x2a,0x68,0x63,0x80,
0xf1,0b01111011,0x2a,0xa8,0x81,0x80,
0x80,
0x71,0b01111011,0x2a,0x68,0x63,0x80,
0x03,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001000) __mute_mask_motherlode_sfx_00;

BANKREF(motherlode_sfx_01)
const uint8_t motherlode_sfx_01[] = {
0x32,0b01000100,0xdd,0b01111011,0x2a,0xb8,0x00,0x80,
0x31,0b01111011,0x2a,0xc8,0x11,0x80,
0x31,0b01111011,0x2a,0xd8,0x21,0x80,
0x31,0b01111011,0x2a,0xf8,0x31,0x80,
0x31,0b01111011,0x2a,0xc8,0x41,0x80,
0x71,0b01111011,0x2a,0x78,0x31,0x80,
0xf1,0b01111011,0x2a,0x28,0x11,0x80,
0xc0,
0x03,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001000) __mute_mask_motherlode_sfx_01;

BANKREF(motherlode_sfx_02)
const uint8_t motherlode_sfx_02[] = {
0x32,0b01111001,0xc0,0xc8,0x0a,0x86,0b01111011,0x2a,0xf8,0x20,0x80,
0x32,0b01111001,0x80,0xf8,0xed,0x85,0b01101011,0x2a,0xd8,0x80,
0x72,0b01011001,0xc0,0xe5,0x84,0b01111011,0x2a,0xa8,0x10,0x80,
0x72,0b01111001,0x80,0xd8,0xb5,0x84,0b01101011,0x2a,0x98,0x80,
0x72,0b01111001,0xc0,0x48,0x83,0x84,0b01101011,0x2a,0x78,0x80,
0x72,0b01000100,0xdd,0b01111011,0x2a,0x58,0x50,0x80,
0xb1,0b01111011,0x2a,0x38,0x20,0x80,
0xb1,0b01111011,0x2a,0x28,0x00,0x80,
0x04,0b00101001,0x00,0xc0,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001010) __mute_mask_motherlode_sfx_02;

BANKREF(motherlode_sfx_03)
const uint8_t motherlode_sfx_03[] = {
0x32,0b01111001,0x80,0xf8,0xe5,0x84,0b01111011,0x2a,0xf8,0x50,0x80,
0xb2,0b01011001,0x80,0x16,0x84,0b01011011,0x2a,0x80,0x80,
0x32,0b01011001,0x80,0x9b,0x83,0b01011011,0x2a,0x30,0x80,
0x72,0b01011001,0x80,0x12,0x83,0b01011011,0x2a,0x60,0x80,
0xb2,0b01011001,0x80,0x77,0x82,0b01011011,0x2a,0x70,0x80,
0x72,0b01011001,0x80,0x23,0x82,0b01011011,0x2a,0x40,0x80,
0xf2,0b01011001,0x80,0xc9,0x81,0b01111011,0x2a,0xa8,0x60,0x80,
0x72,0b01011001,0x80,0x6b,0x81,0b01111011,0x2a,0xc8,0x70,0x80,
0x72,0b01111001,0x80,0x88,0x06,0x81,0b01111011,0x2a,0x88,0x50,0x80,
0x72,0b01111001,0x80,0x48,0x9c,0x80,0b01111011,0x2a,0x48,0x20,0x80,
0x72,0b01111001,0x80,0x18,0x2c,0x80,0b01111011,0x2a,0x58,0x50,0x80,
0x72,0b01000100,0xdd,0b01011011,0x2a,0x40,0x80,
0x71,0b01111011,0x2a,0x18,0x20,0x80,
0x71,0b01001011,0x2a,0x80,
0x71,0b01001011,0x2a,0x80,
0x71,0b01001011,0x2a,0x80,
0xf1,0b01111011,0x2a,0xe8,0x74,0x80,
0xf0,
0x50,
0xf1,0b01101011,0x2a,0xf8,0x80,
0xf0,
0x50,
0xf1,0b01101011,0x2a,0xd8,0x80,
0xf0,
0x50,
0xf1,0b01101011,0x2a,0xa8,0x80,
0xf0,
0x90,
0xb1,0b01101011,0x2a,0x78,0x80,
0xb1,0b01111011,0x2a,0x58,0x73,0x80,
0xb1,0b01111011,0x2a,0x28,0x72,0x80,
0x04,0b00101001,0x00,0xc0,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001010) __mute_mask_motherlode_sfx_03;

BANKREF(motherlode_sfx_04)
const uint8_t motherlode_sfx_04[] = {
0x32,0b01111001,0x80,0xf8,0xe5,0x84,0b01111011,0x2a,0xf8,0x50,0x80,
0xb2,0b01011001,0x80,0x16,0x84,0b01011011,0x2a,0x80,0x80,
0x32,0b01011001,0x80,0x9b,0x83,0b01011011,0x2a,0x30,0x80,
0x72,0b01011001,0x80,0x12,0x83,0b01011011,0x2a,0x60,0x80,
0xb2,0b01011001,0x80,0x77,0x82,0b01011011,0x2a,0x70,0x80,
0x72,0b01011001,0x80,0x23,0x82,0b01011011,0x2a,0x40,0x80,
0xf2,0b01011001,0x80,0xc9,0x81,0b01111011,0x2a,0xa8,0x60,0x80,
0x72,0b01011001,0x80,0x6b,0x81,0b01111011,0x2a,0xc8,0x70,0x80,
0x72,0b01111001,0x80,0x88,0x06,0x81,0b01111011,0x2a,0x88,0x50,0x80,
0x72,0b01111001,0x80,0x48,0x9c,0x80,0b01111011,0x2a,0x48,0x20,0x80,
0x72,0b01111001,0x80,0x18,0x2c,0x80,0b01111011,0x2a,0x58,0x50,0x80,
0x71,0b01000100,0x55,
0x70,
0x70,
0x70,
0x70,
0xf0,
0xf0,
0x50,
0xf0,
0xf0,
0x50,
0xf0,
0xf0,
0x50,
0xf0,
0xf0,
0x90,
0xb0,
0xb0,
0xb0,
0x04,0b00101001,0x00,0xc0,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001010) __mute_mask_motherlode_sfx_04;

BANKREF(motherlode_sfx_05)
const uint8_t motherlode_sfx_05[] = {
0x32,0b01111001,0x40,0xf8,0xc1,0x87,0b01111011,0x2a,0x88,0x50,0x80,
0xb2,0b01011001,0x80,0x83,0x87,0b01111011,0x2a,0x38,0x30,0x80,
0x32,0b01011001,0x40,0xce,0x87,0b01011011,0x2a,0x20,0x80,
0xb2,0b01011001,0x80,0x9d,0x87,0b01101011,0x2a,0x28,0x80,
0x72,0b01101001,0x40,0x88,0x87,0b01001011,0x2a,0x80,
0x72,0b01101001,0x20,0x48,0x87,0b01111011,0x2a,0x18,0x10,0x80,
0x32,0b01000100,0x57,0b01111001,0x40,0x68,0xc1,0x87,
0xb1,0b01011001,0x80,0x83,0x87,
0x32,0b01000100,0x75,0b01011001,0x40,0xce,0x87,
0x71,0b01011001,0x80,0x9d,0x87,
0x71,0b01101001,0x40,0x48,0x87,
0x71,0b01101001,0x20,0x28,0x87,
0x04,0b00101001,0x00,0xc0,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001010) __mute_mask_motherlode_sfx_05;

BANKREF(motherlode_sfx_06)
const uint8_t motherlode_sfx_06[] = {
0x72,0b01000100,0x77,0b01111001,0x80,0xc8,0x06,0x87,
0x71,0b01101001,0x80,0xf8,0x87,
0x71,0b01111001,0x00,0x08,0x2c,0x80,
0x71,0b01111001,0x80,0xd8,0x59,0x87,
0x71,0b01101001,0x80,0xf8,0x87,
0x71,0b01101001,0x80,0xb8,0x87,
0x71,0b01101001,0x80,0x88,0x87,
0x71,0b01101001,0x80,0x58,0x87,
0x71,0b01101001,0x80,0x38,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_06;

BANKREF(motherlode_sfx_07)
const uint8_t motherlode_sfx_07[] = {
0xb2,0b01000100,0x77,0b01111001,0x00,0xf8,0xc1,0x87,
0x31,0b01101001,0x00,0x18,0x87,
0x71,0b01101001,0x00,0xf8,0x87,
0x31,0b01111001,0x00,0x18,0x2c,0x80,
0x71,0b01111001,0x00,0xf8,0xc1,0x87,
0x31,0b01101001,0x00,0x98,0x87,
0x31,0b01101001,0x00,0x68,0x87,
0x31,0b01101001,0x00,0x38,0x87,
0x31,0b01101001,0x00,0x28,0x87,
0x71,0b01111001,0x00,0x08,0x2c,0x80,
0x31,0b01111001,0x00,0x68,0xc1,0x87,
0x71,0b01101001,0x00,0x08,0x87,
0x31,0b01101001,0x00,0x38,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_07;

BANKREF(motherlode_sfx_08)
const uint8_t motherlode_sfx_08[] = {
0x32,0b01000100,0x77,0b01111001,0x80,0xf8,0xe5,0x84,
0x31,0b01011001,0x80,0x89,0x85,
0x31,0b01011001,0x80,0x0a,0x86,
0x31,0b01111001,0x80,0xe8,0x72,0x86,
0x31,0b01111001,0x80,0xd8,0xc4,0x86,
0x31,0b01111001,0x80,0xc8,0x06,0x87,
0x31,0b01111001,0x80,0xb8,0x39,0x87,
0x32,0b01000100,0x75,0b01111001,0x80,0x48,0xe5,0x84,
0x31,0b01011001,0x80,0x89,0x85,
0x31,0b01011001,0x80,0x0a,0x86,
0x32,0b01000100,0x57,0b01011001,0x80,0x72,0x86,
0x31,0b01111001,0x80,0x38,0xc4,0x86,
0x31,0b01111001,0x80,0x28,0x06,0x87,
0x31,0b01111001,0x80,0x18,0x39,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_08;

BANKREF(motherlode_sfx_09)
const uint8_t motherlode_sfx_09[] = {
0x32,0b01000100,0x77,0b01111001,0x80,0x58,0x6b,0x87,
0x71,0b01111001,0x80,0x98,0x73,0x87,
0x31,0b01111001,0x80,0xf8,0x7b,0x87,
0x31,0b01101001,0x80,0xb8,0x87,
0x31,0b01101001,0x80,0x58,0x87,
0x31,0b01101001,0x80,0x38,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_09;

BANKREF(motherlode_sfx_0a)
const uint8_t motherlode_sfx_0a[] = {
0x72,0b01000100,0x77,0b01111001,0x80,0xc8,0x06,0x87,
0x71,0b01101001,0x80,0xf8,0x87,
0x71,0b01111001,0x00,0x08,0x2c,0x80,
0x71,0b01111001,0x80,0xd8,0x06,0x87,
0x71,0b01101001,0x80,0xf8,0x87,
0x71,0b01101001,0x80,0xb8,0x87,
0x71,0b01101001,0x80,0x88,0x87,
0x71,0b01101001,0x80,0x58,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_0a;

BANKREF(motherlode_sfx_0b)
const uint8_t motherlode_sfx_0b[] = {
0x72,0b01000100,0x77,0b01111001,0x80,0xf8,0x0a,0x86,
0x71,0b01011001,0x80,0x5b,0x86,
0xb1,0b01111001,0x00,0x08,0x2c,0x80,
0x71,0b01111001,0x80,0xf8,0x06,0x87,
0x31,0b01101001,0x80,0xa8,0x87,
0x31,0b01101001,0x80,0x38,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_0b;

BANKREF(motherlode_sfx_0c)
const uint8_t motherlode_sfx_0c[] = {
0xf2,0b01000100,0x77,0b01111001,0x80,0xc8,0x0a,0x86,
0x31,0b01111001,0x80,0xf8,0xed,0x85,
0x31,0b01011001,0x80,0x89,0x85,
0x31,0b01011001,0x80,0x11,0x85,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_0c;

BANKREF(motherlode_sfx_0d)
const uint8_t motherlode_sfx_0d[] = {
0x72,0b01000100,0xdd,0b01111011,0x2a,0xf8,0x30,0x80,
0x71,0b01111011,0x2a,0xa8,0x20,0x80,
0x03,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001000) __mute_mask_motherlode_sfx_0d;

BANKREF(motherlode_sfx_0e)
const uint8_t motherlode_sfx_0e[] = {
0x32,0b01111001,0x00,0x08,0x2c,0x80,0b01111011,0x2a,0xf8,0x30,0x80,
0x32,0b01001001,0x00,0x80,0b01011011,0x2a,0x40,0x80,
0x32,0b01001001,0x00,0x80,0b01011011,0x2a,0x83,0x80,
0x32,0b01001001,0x00,0x80,0b01011011,0x2a,0x63,0x80,
0x32,0b01111001,0x40,0x48,0xbe,0x87,0b01011011,0x2a,0x50,0x80,
0xf2,0b01111001,0x40,0xf8,0xc1,0x87,0b01011011,0x2a,0x40,0x80,
0xb2,0b01000100,0x77,0b01101001,0x40,0xc8,0x87,
0xf1,0b01101001,0x40,0x58,0x87,
0xf1,0b01101001,0x40,0x38,0x87,
0xf1,0b01101001,0x40,0x28,0x87,
0xf1,0b01101001,0x40,0x18,0x87,
0x04,0b00101001,0x00,0xc0,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001010) __mute_mask_motherlode_sfx_0e;

BANKREF(motherlode_sfx_0f)
const uint8_t motherlode_sfx_0f[] = {
0x72,0b01000100,0x77,0b01111001,0x40,0xb8,0x16,0x84,
0x71,0b01111001,0x40,0xc8,0x4e,0x84,
0x71,0b01111001,0x40,0xd8,0x83,0x84,
0x71,0b01111001,0x40,0xe8,0xe5,0x84,
0x71,0b01111001,0x40,0xf8,0x3b,0x85,
0x71,0b01011001,0x40,0x89,0x85,
0x71,0b01011001,0x40,0xce,0x85,
0x71,0b01111001,0x40,0xb8,0xed,0x85,
0x71,0b01111001,0x40,0x88,0x0a,0x86,
0x71,0b01011001,0x40,0x27,0x86,
0x71,0b01111001,0x40,0x78,0x42,0x86,
0x71,0b01111001,0x40,0x68,0x5b,0x86,
0x71,0b01111001,0x40,0x58,0x72,0x86,
0x71,0b01011001,0x40,0x89,0x86,
0x71,0b01111001,0x40,0x48,0x9e,0x86,
0x71,0b01011001,0x40,0xb2,0x86,
0x71,0b01111001,0x40,0x38,0xc4,0x86,
0x71,0b01111001,0x40,0x28,0xd6,0x86,
0x71,0b01011001,0x40,0xe7,0x86,
0x71,0b01111001,0x40,0x18,0xf7,0x86,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_0f;

BANKREF(motherlode_sfx_10)
const uint8_t motherlode_sfx_10[] = {
0xb2,0b01000100,0x77,0b01111001,0x80,0x68,0xf7,0x86,
0x71,0b01111001,0x80,0x78,0x7b,0x87,
0xb1,0b01101001,0x80,0x98,0x87,
0x31,0b01101001,0x80,0x78,0x87,
0x31,0b01101001,0x80,0x68,0x87,
0x31,0b01101001,0x80,0x58,0x87,
0x31,0b01101001,0x80,0x38,0x87,
0x31,0b01101001,0x80,0x28,0x87,
0x31,0b01101001,0x80,0x18,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_10;

BANKREF(motherlode_sfx_11)
const uint8_t motherlode_sfx_11[] = {
0x72,0b01000100,0x77,0b01111001,0x80,0xc8,0x0a,0x86,
0xb1,0b01111001,0x80,0x08,0x8a,0x87,
0x71,0b01111001,0x80,0xd8,0x72,0x86,
0xb1,0b01111001,0x80,0x08,0x8a,0x87,
0x71,0b01111001,0x80,0xf8,0xb2,0x86,
0xb1,0b01111001,0x80,0x08,0x8a,0x87,
0x71,0b01111001,0x80,0xf8,0x06,0x87,
0xb1,0b01111001,0x80,0x08,0x2c,0x80,
0x71,0b01111001,0x80,0xf8,0x59,0x87,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_11;

BANKREF(motherlode_sfx_12)
const uint8_t motherlode_sfx_12[] = {
0x32,0b01000100,0x77,0b01111001,0xc0,0xc8,0xce,0x85,
0x31,0b01111001,0x80,0xf8,0x89,0x85,
0x71,0b01011001,0xc0,0x83,0x84,
0x71,0b01111001,0x80,0xd8,0x4e,0x84,
0x71,0b01111001,0xc0,0x48,0x16,0x84,
0x03,0b00101001,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00000010) __mute_mask_motherlode_sfx_12;

BANKREF(motherlode_sfx_13)
const uint8_t motherlode_sfx_13[] = {
0xb2,0b01000100,0xdd,0b01111011,0x2a,0xf8,0x62,0x80,
0x71,0b01111011,0x2a,0x28,0x61,0x80,
0x31,0b01111011,0x2a,0xf8,0x60,0x80,
0x71,0b01101011,0x2a,0xb8,0x80,
0x31,0b01101011,0x2a,0x98,0x80,
0x03,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001000) __mute_mask_motherlode_sfx_13;

BANKREF(motherlode_sfx_14)
const uint8_t motherlode_sfx_14[] = {
0xb2,0b01000100,0xdd,0b01111011,0x2a,0xf8,0x60,0x80,
0x71,0b01111011,0x2a,0x28,0x61,0x80,
0x31,0b01111011,0x2a,0xf8,0x62,0x80,
0x71,0b01101011,0x2a,0xb8,0x80,
0x31,0b01111011,0x2a,0x98,0x61,0x80,
0x03,0b00101011,0x00,0xc0,0b01000100,0xff,0b00000111
};
void AT(0b00001000) __mute_mask_motherlode_sfx_14;
