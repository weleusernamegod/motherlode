#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/console.h>
#include <gbdk/font.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <rand.h>

#include "globals.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "general.h"
#include "palettes.h"
#include "map.h"

#include "level.ba0.h"
#include "player.h"

#include "../assets/rover.h"
#include "../assets/nav.h"
#include "../assets/tile.h"
#include "../assets/progressbar.h"

#include "../assets/stationfuel.h"
#include "../assets/stationrepair.h"
#include "../assets/stationsell.h"
#include "../assets/stationupgrade.h"

#include "../assets/warnings.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(bank_map)
#endif

void generateMap(void) {
    uint16_t i, j;
    for (i = 0; i < ROWS; i++) {
        for (j = 0; j < COLS; j++) {
            if (i < 6) {
                // First six rows are empty
                level_array[i][j] = 0;
            } else if (i == 6) {
                // Seventh row is all '2'
                level_array[i][j] = 2;
            } else {
                // Start generating the map based on depth
                uint8_t tileType = 1;  // Default to dirt
                uint8_t randValue = rand() % 100;  // Random value from 0 to 99

                // Determine ore distribution based on depth
                if (i < 20 && randValue >= 80) {
                    // Rows 7 to 19: Ores 4 to 6
                    tileType = rand() % 3 + 4;
                } else if (i >= 20 && i < 40 && randValue >= 80) {
                    // Rows 20 to 39: Ores 5 to 9
                    tileType = rand() % 5 + 5;
                } else if (i >= 40 && i < 80 && randValue >= 80) {
                    // Rows 40 to 79: Introduce very rare ores 16 to 19
                    if (randValue >= 99) { // Extremely rare ore 19
                        tileType = 19;
                    } else if (randValue >= 95) { // Rare ores 16 to 18
                        tileType = rand() % 3 + 16;
                    } else {
                        // Rows 40 to 79: Ores 10 to 15
                        tileType = rand() % 6 + 10;
                    }
                } else if (i >= 80) {
                    // Rows 80 and deeper: Rarest ores 15, and slowly introduce 20 and 21
                    if (randValue >= 90) {
                        tileType = rand() % 2 + 20; // Tiles 20 or 21
                    } else {
                        tileType = 15; // Rarest ore 15
                    }
                }

                // Introduce caves (empty spaces)
                if (randValue < 10) {  // Increase to 10% chance for caves
                    tileType = 0;
                }

                level_array[i][j] = tileType;
            }
        }
    }
}


void shuffle(uint8_t array[4]) {
    uint16_t seed = LY_REG;
    seed |= (uint16_t)DIV_REG << 8;
    initrand(seed);
    // Get two random numbers for swapping
    uint8_t firstSwapIndex = rand() % 4;
    uint8_t secondSwapIndex;
    do {
        secondSwapIndex = rand() % 4;
    } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index

    // Perform the first swap
    uint8_t temp = array[firstSwapIndex];
    array[firstSwapIndex] = array[secondSwapIndex];
    array[secondSwapIndex] = temp;

    // Optional: A second swap to increase randomness without full loop
    firstSwapIndex = rand() % 4;
    do {
        secondSwapIndex = rand() % 4;
    } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index

    temp = array[firstSwapIndex];
    array[firstSwapIndex] = array[secondSwapIndex];
    array[secondSwapIndex] = temp;
}

Background_color colors[] = {
    {100, 80, 60},   // Brown
    {25, 20, 15},    // Almost Black
    {50, 100, 50},   // Green
    {30, 50, 100},   // Blue
    {140, 50, 30}    // Red
};

void interpolate_color(Background_color* result, Background_color start, Background_color end, uint16_t progress, uint16_t max_progress) {
    if (result != NULL) {
        result->r = start.r + ((end.r - start.r) * progress / max_progress);
        result->g = start.g + ((end.g - start.g) * progress / max_progress);
        result->b = start.b + ((end.b - start.b) * progress / max_progress);
    }
}

void change_background_color(void) {
    int num_colors = sizeof(colors) / sizeof(colors[0]);
    int phase_per_color = ROWS / (num_colors - 1);

    int color_phase = depth % ROWS;
    int index = color_phase / phase_per_color;
    int progress = color_phase % phase_per_color;

    Background_color current_color;
    interpolate_color(&current_color, colors[index], colors[index + 1], progress, phase_per_color);

    set_bkg_palette_entry(0, 1, RGB8(current_color.r, current_color.g, current_color.b));
}

const Palette_group palette_groups[] = {
    { {palette_background, palette_stone, palette_coal, palette_iron, palette_copper, palette_gras, palette_sky, palette_station}, 0},
    { {palette_background, palette_stone, palette_coal, palette_iron, palette_copper, palette_tin, palette_silver, palette_gold}, 9},
};
const int palette_groups_count = sizeof(palette_groups) / sizeof(palette_groups[0]);
const Palette_group* last_used_palette_group = NULL;  // Initialize to NULL

void init_palette_based_on_depth(void) {
    last_used_palette_group = NULL;
}

void update_palette_based_on_depth(void) {
    const Palette_group* selected_palette_group = NULL;

    // Use palette_groups_count instead of sizeof calculation
    for (int i = 0; i < palette_groups_count; i++) {
        if (depth_offset >= palette_groups[i].depth_threshold) {
            selected_palette_group = &palette_groups[i];
        } else {
            break;  // Assumes palette_groups are sorted by depth_threshold
        }
    }

    // Update the palette if it has changed
    if (selected_palette_group != last_used_palette_group) {
        for (uint8_t i = 1; i < 8; i++) {  // Assuming each group has 8 palettes
            set_bkg_palette(i, 1, selected_palette_group->palettes[i]);
        }
        last_used_palette_group = selected_palette_group;
    }
}


/**
 * Sets a 16x16 background tile by setting four 8x8 tiles.
 * 
 * @param array The array containing the tiles.
 * @param x1 Starting X position in 16x16 tile coordinates (0 - 15).
 * @param y1 Starting Y position in 16x16 tile coordinates (0 - 15).
 * @param r Number of rows (height) to set, in tiles (1 - 16).
 * @param c Number of columns (width) to set, in tiles (1 - 16).
 */
void set_4bkg_tiles(uint8_t array[][16], uint8_t x1, uint16_t y1, uint8_t r, uint8_t c) {
    for (uint8_t y = y1; y < y1 + r; y++) {
        for (uint8_t x = x1; x < x1 + c; x++) {
            uint8_t temp = (array[y][x] * 4) + TILE_START - 4;
            uint8_t tile_array[4] = {temp, temp + 1, temp + 2, temp + 3};
            uint8_t palette_array[4];

            if (array[y][x] == EMPTY) {
                for (uint8_t i = 0; i < 4; i++) tile_array[i] = 1;
            } else if (array[y][x] == GRAS) {
                tile_array[0] = temp + (rand() % 4);
                tile_array[1] = temp + (rand() % 4);
                tile_array[2] = temp - 1;
                tile_array[3] = temp - 2;
            } else if (array[y][x] == DIRT) {
                for (uint8_t i = 0; i < 4; i++) tile_array[i] = temp + i;
                shuffle(tile_array);
            }

            if (array[y][x] == EMPTY) {
                for (uint8_t i = 0; i < 4; i++) palette_array[i] = 0;
            } else {
                for (uint8_t i = 0; i < 4; i++) palette_array[i] = materials[(tile_array[i] + 4 - TILE_START) / 4].color_palette;
            }

            // Set tiles first with VBK_REG = 0 (tile data)
            VBK_REG = 0;
            set_bkg_tiles(2 * x, 2 * y, 2, 1, tile_array);
            set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, tile_array + 2);

            // Then set palette with VBK_REG = 1 (palette data)
            VBK_REG = 1;
            set_bkg_tiles(2 * x, 2 * y, 2, 1, palette_array);
            set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, palette_array + 2);

            // Switch back to VBK_REG = 0 for further tile setting
            VBK_REG = 0;
        }
    }
}


void spawn_bkg_row(void) {
        if (depth > METATILES_PER_SCREEN) { // just a guess, tested and found out it has to be 9
            if (depth - depth_offset == (8 - THRESHOLD - BOTTOM)) set_4bkg_tiles(level_array, 0, depth + 4, 1, 16);
            else if (depth - depth_offset == THRESHOLD) set_4bkg_tiles(level_array, 0, depth - 4, 1, 16);
        }
}

/**
 * Clears a 16x16 tile at the player's current location.
 * 
 * @param array The array containing the tiles.
 * @param x X position in 16x16 tile coordinates (0 - 15).
 * @param y Y position in 16x16 tile coordinates (0 - 15).
 */
void clear_4bkg_tiles(uint8_t x, uint16_t y) {
    level_array[y][x] = 0; // Clear the tile in the array
    set_4bkg_tiles(level_array, x, y, 1, 1); // Update the background
}

/**
 * Adds a block of a given type at the specified location.
 * 
 * @param array The array containing the tiles.
 * @param x X position in 16x16 tile coordinates.
 * @param y Y position in 16x16 tile coordinates.
 * @param type The tile type to add.
 * 
 * Example: add_block(level_array, 6, 6, ROCK);
 */
void add_block(uint8_t x, uint16_t y, uint8_t type) {
    level_array[y][x] = type;
    set_4bkg_tiles(level_array, x, y, 1, 1);
}

/**
 * @param current_value the current value for the progressbar
 * @param max_value the max value / range of the bar
 * @param digits how many 8x8 sprites the bar should be long
 * @param tilestart what hardware sprite to use
 * @param x x-coordinate of first tile
 * @param y y-coordinate of first tile
 */
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t x, uint8_t y) {
    // Calculate percentage of progress in terms of total available width in pixels (digits * 8)
    uint8_t total_pixels = digits * 8;
    uint16_t pixels_to_fill = (current_value * total_pixels) / max_value;

    for (uint8_t i = 0; i < digits; i++) {
        uint8_t tile_index = SPRITE_TILE_EMPTY; // Default to empty
        uint8_t sprite_pixels = 8; // Each sprite can show up to 8 pixels (full sprite width)
        uint8_t effective_pixels = (pixels_to_fill > sprite_pixels) ? sprite_pixels : pixels_to_fill;

        // Adjust pixel count for next sprite
        pixels_to_fill -= effective_pixels;

        // Map effective pixels to sprite tiles
        switch (effective_pixels) {
            case 0: tile_index = SPRITE_TILE_EMPTY; break;
            case 1: tile_index = SPRITE_TILE_1_8; break;
            case 2: tile_index = SPRITE_TILE_2_8; break;
            case 3: tile_index = SPRITE_TILE_3_8; break;
            case 4: tile_index = SPRITE_TILE_4_8; break;
            case 5: tile_index = SPRITE_TILE_5_8; break;
            case 6: tile_index = SPRITE_TILE_6_8; break;
            case 7: tile_index = SPRITE_TILE_7_8; break;
            case 8: 
                if (i == 0) { // First sprite
                    tile_index = (digits == 1 || pixels_to_fill == 0) ? SPRITE_TILE_END : SPRITE_TILE_MID;
                } else if (i == digits - 1 || pixels_to_fill == 0) { // Last sprite or no more pixels to fill
                    tile_index = SPRITE_TILE_END;
                } else {
                    tile_index = SPRITE_TILE_MID;
                }
                break;
        }

        // Set the sprite tile and move it into position
        set_sprite_tile(tilestart + i, tile_index);
        move_sprite(tilestart + i, x + i * 8, y);
    }
}

void draw_depth(void){
    char string[10];
    itoa((depth < GROUND) ? 0 : (depth - GROUND), string, 10);
    strcat(string, "m");
    draw_text(15,0,"Depth",5,TRUE,0);
    draw_text(15,1,string,5,FALSE,0);
}

void draw_cargo(void){
    char string[10];
    char string_max[10];
    itoa(player.cargo.current_value, string, 10);
    itoa(player.cargo.max_value, string_max, 10);
    strcat(string, "/");
    strcat(string, string_max);
    draw_text(9,0,"Cargo",5,TRUE,0);
    draw_text(9,1,string,5,TRUE,0);
}

const metasprite_t warning_cargo_metasprite[] = {
    {.dy=-8, .dx=-16, .dtile=warnings_TILE_ORIGIN, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+1, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+2, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+3, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+4, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+5, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+6, .props=0},
	METASPR_TERM
};

const metasprite_t warning_fuel_metasprite[] = {
    {.dy=-8, .dx=-16, .dtile=warnings_TILE_ORIGIN+7, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+8, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+9, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+10, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+11, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+12, .props=0},
    {.dy=0, .dx=8, .dtile=warnings_TILE_ORIGIN+13, .props=0},
	METASPR_TERM
};


void init_warning(void){
    set_sprite_data(warnings_TILE_ORIGIN, warnings_TILE_COUNT, warnings_tiles);
}

void draw_warning_cargo(void){
    if (display_warning_cargo == TRUE) {
        move_metasprite_ex(warning_cargo_metasprite, 0, 0, WARNING_CARGO_START, 50, 50);
    } else {
        hide_metasprite(warning_cargo_metasprite, WARNING_CARGO_START);
    }
}

void draw_warning_fuel(void){
    if (display_warning_fuel == TRUE) {
        move_metasprite_ex(warning_fuel_metasprite, 0, 0, WARNING_FUEL_START, 50, 80);
    } else {
        hide_metasprite(warning_fuel_metasprite, WARNING_FUEL_START);
    }
}

void draw_fuel(void){
    progressbar(player.fuel.current_value, player.fuel.max_value, 3, 35, 44, 20);
}
void draw_hull(void){
    progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
}

void init_character(void){
    set_sprite_data(CHAR_START, 16, rover_tiles);
}
void draw_character(void){
    draw_metasprite(direction_prev);
}

void init_nav(void){
    set_bkg_data(nav_TILE_ORIGIN, nav_TILE_COUNT, nav_tiles);
}
void draw_nav(void){
    set_win_tiles(0,0,20,3,nav_map);
    move_win(7, 0); //124
}

void init_progressbar(void){
    set_sprite_data(SPRITE_TILE_1_8, progressbar_TILE_COUNT, progressbar_tiles);
}
void draw_progressbar(void){
    progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
}

void init_tiles(void){
    set_bkg_data(TILE_START, tile_TILE_COUNT, tile_tiles);
}
void draw_tiles(void){
    set_4bkg_tiles(level_array, 0, 0, 16, 16);
}

void init_buildings(void){
    set_bkg_data(stationfuel_TILE_ORIGIN, stationfuel_TILE_COUNT, stationfuel_tiles);
    set_bkg_data(stationrepair_TILE_ORIGIN, stationrepair_TILE_COUNT, stationrepair_tiles);
    set_bkg_data(stationsell_TILE_ORIGIN, stationsell_TILE_COUNT, stationsell_tiles);
    set_bkg_data(stationupgrade_TILE_ORIGIN, stationupgrade_TILE_COUNT, stationupgrade_tiles);
}
void draw_buildings(void){
    set_bkg_tiles(STATION_FUEL_X * 2, (((STATION_Y + 1)* 2) - (stationfuel_HEIGHT/stationfuel_TILE_H)), (stationfuel_WIDTH/stationfuel_TILE_W), (stationfuel_HEIGHT/stationfuel_TILE_H), stationfuel_map);
    set_bkg_tiles(STATION_REPAIR_X * 2, (((STATION_Y + 1)* 2) - (stationrepair_HEIGHT/stationrepair_TILE_H)), (stationrepair_WIDTH/stationrepair_TILE_W), (stationrepair_HEIGHT/stationrepair_TILE_H), stationrepair_map);
    set_bkg_tiles(STATION_SELL_X * 2, (((STATION_Y + 1)* 2) - (stationsell_HEIGHT/stationsell_TILE_H)), (stationsell_WIDTH/stationsell_TILE_W), (stationsell_HEIGHT/stationsell_TILE_H), stationsell_map);
    set_bkg_tiles(STATION_UPGRADE_X * 2, (((STATION_Y + 1)* 2) - (stationupgrade_HEIGHT/stationupgrade_TILE_H)), (stationupgrade_WIDTH/stationupgrade_TILE_W), (stationupgrade_HEIGHT/stationupgrade_TILE_H), stationupgrade_map);
}

void draw_sky(void){
    unsigned char sky_map[32 * UNDERGROUND * 2];
    unsigned char sky_palette[32 * UNDERGROUND * 2];

    // Initialize sky_map array using memset
    memset(sky_map, 0, sizeof(sky_map));

    // Initialize sky_palette array using memset
    memset(sky_palette, 6, sizeof(sky_palette));

    VBK_REG = 0;
    set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_map);
    VBK_REG = 1;
    set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_palette);
    VBK_REG = 0;
}

void swap_tiles_sky_buildings(void) {
    const uint8_t depth_threshold = UNDERGROUND;

    if (depth_offset < depth_threshold && !buildings_loaded) {
        // Load and draw buildings if the player is deeper than the threshold and buildings are not loaded
        init_buildings();
        draw_sky();
        draw_buildings();
        buildings_loaded = TRUE;  // Mark buildings as loaded
    } else if (depth_offset >= depth_threshold && buildings_loaded) {
        // Load tiles if the player is shallower than the threshold and tiles are not loaded
        init_tiles();
        buildings_loaded = FALSE;  // Mark tiles as loaded (buildings are not loaded)
    }
}
