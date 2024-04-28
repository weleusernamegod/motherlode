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

#include "level.h"
#include "player.h"

#include "../assets/rover.h"
#include "../assets/nav.h"
#include "../assets/tile.h"
#include "../assets/progressbar.h"

#pragma bank 1
BANKREF(bank_map)

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

/**
 * Sets a 16x16 background tile by setting four 8x8 tiles.
 * 
 * @param array The array containing the tiles.
 * @param x1 Starting X position in 16x16 tile coordinates (0 - 15).
 * @param y1 Starting Y position in 16x16 tile coordinates (0 - 15).
 * @param r Number of rows (height) to set, in tiles (1 - 16).
 * @param c Number of columns (width) to set, in tiles (1 - 16).
 */
void set_4bkg_tiles(uint8_t array[][16], uint8_t x1, uint8_t y1, uint8_t r, uint8_t c) {
    for (uint8_t y = y1; y < y1 + r; y++) {
        for (uint8_t x = x1; x < x1 + c; x++) {
            uint8_t temp = (array[y][x] * 4) + TILESTART - 4; // Calculate tile offset
            uint8_t temp_array[4] = {temp, temp + 1, temp + 2, temp + 3};
            // 
            if (array[y][x] == EMPTY) {
                temp_array[0] = 0;
                temp_array[1] = 0;
                temp_array[2] = 0;
                temp_array[3] = 0;
            } else if (array[y][x] == GRAS) {
                temp_array[0] = temp + (rand() % 4);
                temp_array[1] = temp + (rand() % 4);
                temp_array[2] = temp - 1;
                temp_array[3] = temp - 2;
            }
            else if (array[y][x] == DIRT) {
                temp_array[0] = temp;
                temp_array[1] = temp + 1;
                temp_array[2] = temp + 2;
                temp_array[3] = temp + 3;
                shuffle(temp_array);
            }
            // loop x any y amount of times to create the grid, always drawing 2x tiles at once
            set_bkg_tiles(2 * x, 2 * y, 2, 1, temp_array);
            set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, temp_array + 2);
        }
    }
}

void spawn_bkg_row(void) {
        if (depth > 3) {
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
void clear_4bkg_tiles(uint8_t array[][16], uint8_t x, uint8_t y) {
    array[y][x] = 0; // Clear the tile in the array
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
void add_block(uint8_t array[][16], uint8_t x, uint8_t y, uint8_t type) {
    array[y][x] = type;
    set_4bkg_tiles(level_array, x, y, 1, 1);
}

/**
 * Sets a 16x16 background tile by setting four 8x8 tiles.
 * 
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
    itoa((depth <= 5) ? 0 : (depth - 5), string, 10);
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

void draw_fuel(void){
    progressbar(player.fuel.current_value, player.fuel.max_value, 3, 35, 44, 20);
}
void draw_hull(void){
    progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
}


void draw_character(void){
    set_sprite_data(CHARSTART, 16, rover_tiles);
    draw_metasprite(direction_prev);
}

void init_nav(void){
    set_win_tiles(0,0,20,3,nav_map);
    move_win(7, 0); //124
}

void init_tiles(void){
    set_bkg_data(TILESTART, 28, tile_tiles);
    set_bkg_data(NAVSTART, nav_TILE_COUNT, nav_tiles);
    set_4bkg_tiles(level_array, 0, 0, 16, 16);
}

void init_progressbar(void){
    set_sprite_data(SPRITE_TILE_1_8, progressbar_TILE_COUNT, progressbar_tiles);
    progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
}