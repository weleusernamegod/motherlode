#ifndef GENERAL_H
#define GENERAL_H

#include <gb/gb.h>
#include <stdio.h>

void init_font(void);
void init_screen(void);
void init_clear_screen(void);
void read_buttons(void);
unsigned char convert_char_to_tile(char c);
void draw_text(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette);
void turn_screen_off(void);
void turn_screen_on(void);
#endif // GENERAL_H