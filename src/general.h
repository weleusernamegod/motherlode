#ifndef GENERAL_H
#define GENERAL_H

#include <gb/gb.h>
#include <stdio.h>

void init_font(void);
void init_progressbar(void);
void init_screen(void);
void init_clear_screen(void);
void init_sound(void);
void mute_sound(void);
void read_buttons(void);
unsigned char convert_char_to_tile(char c);
void draw_text_win(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette);
void draw_text_bkg(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette);
void draw_text_sprite(uint8_t x, uint8_t y, uint8_t hardware_sprite, char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette);
void init_sprite_palettes(void);
void init_palette_0(void);
void turn_screen_off(void);
void turn_screen_on(void);
void wait_for_input(void);
void switch_ram_bank_back_to_prev(void);
void switch_ram_bank_based_on_value(uint16_t value);
uint8_t get_tile_from_array(uint16_t depth, uint16_t width);
void shuffle(uint8_t array[4]);
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t palette, uint8_t x, uint8_t y);

#endif // GENERAL_H