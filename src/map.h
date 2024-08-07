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
    const palette_color_t* palettes;
    uint8_t palette_number;
    uint16_t depth_threshold;
} Palette_group;

extern const Palette_group palette_groups[];
extern const Palette_group palette_group_close_to_ground[];

extern const Palette_group* last_used_palette_group[8];
extern const uint8_t palette_groups_count;  // Declare the size of palette_groups explicitly

void interpolate_color(Background_color* result, Background_color start, Background_color end, uint16_t progress, uint16_t max_progress);
void change_background_color(void);
void change_sky_color(void);
void update_progressbar_palette(player_attributes *attribute, uint8_t palette_index);
void init_palette_based_on_depth(void);
void generate_palette_groups(Palette_group* palette_groups, uint8_t* count);
void update_palette_based_on_depth(void);
void set_4bkg_tiles(uint8_t array[][COLS], uint8_t x1, uint16_t y1, uint8_t r, uint8_t c);
void spawn_bkg_row(void);
void clear_4bkg_tiles(uint8_t x, uint16_t y);
void draw_depth(void);
void draw_cargo(void);
extern const metasprite_t warning_fuel_metasprite[];
extern const metasprite_t warning_cargo_metasprite[];
// void init_a_button(void);
// void draw_a_button(void);
// void hide_a_button(void);
void init_icon(void);
void update_icon_hull(void);
void update_icon_fuel(void);
void update_icon_cargo(void);
void draw_fuel_bar(void);
void draw_hull_bar(void);
void init_character(void);
void draw_character(void);
void init_nav(void);
void draw_nav(void);
void init_tiles(void);
void draw_tiles(void);
void init_buildings(void);
void draw_buildings(void);
void draw_sky(void);
void swap_tiles_sky_buildings(void);

#endif // MAP_H
