#ifndef MAP_H
#define MAP_H

#include <gb/gb.h>
#include <stdio.h>
#include "attributes.h"

BANKREF_EXTERN(bank_map)

typedef struct {
    uint8_t r, g, b;
} Background_color;

extern Background_color colors[];

typedef struct {
    const palette_color_t* palettes[8];
    uint8_t depth_threshold;
} Palette_group;

extern const Palette_group palette_groups[];
extern const Palette_group* last_used_palette_group;
extern const int palette_groups_count;  // Declare the size of palette_groups explicitly


void generate_map(uint16_t rows);
void shuffle(uint8_t array[4]);
void interpolate_color(Background_color* result, Background_color start, Background_color end, uint16_t progress, uint16_t max_progress);
void change_background_color(void);
void change_sky_color(void);
void update_progressbar_palette(player_attributes *attribute, uint8_t palette_index);
void init_palette_based_on_depth(void);
void update_palette_based_on_depth(void);
void spawn_bkg_row(void);
void clear_4bkg_tiles(uint8_t x, uint16_t y);
void add_block(uint8_t x, uint16_t y, uint8_t type);
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t palette, uint8_t x, uint8_t y);
void draw_test(void);
void draw_depth(void);
void draw_cargo(void);
extern const metasprite_t warning_fuel_metasprite[];
extern const metasprite_t warning_cargo_metasprite[];
void init_game_over(void);
void draw_game_over(void);
void init_a_button(void);
void draw_a_button(void);
void hide_a_button(void);
void init_warning(void);
void draw_warning_fuel(void);
void draw_warning_cargo(void);
void draw_fuel(void);
void draw_hull(void);
void init_character(void);
void draw_character(void);
void init_nav(void);
void draw_nav(void);
void init_progressbar(void);
void init_tiles(void);
void draw_tiles(void);
void init_buildings(void);
void draw_buildings(void);
void draw_sky(void);
void swap_tiles_sky_buildings(void);

#endif // MAP_H
