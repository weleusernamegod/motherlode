#ifndef MAP_H
#define MAP_H

#include <gb/gb.h>
#include <stdio.h>

BANKREF_EXTERN(bank_map)

typedef struct {
    uint8_t r, g, b;
} Color;

extern Color colors[];

void draw_buildings(void);
void generateMap(void);
void shuffle(uint8_t array[4]);
void interpolate_color(Color* result, Color start, Color end, uint16_t progress, uint16_t max_progress);
void change_background_color(void);
void spawn_bkg_row(void);
void clear_4bkg_tiles(uint8_t x, uint16_t y);
void add_block(uint8_t x, uint16_t y, uint8_t type);
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t x, uint8_t y);
void draw_depth(void);
void draw_cargo(void);
void draw_fuel(void);
void draw_hull(void);
void draw_character(void);
void init_nav(void);
void init_tiles(void);
void init_progressbar(void);

#endif // MAP_H
