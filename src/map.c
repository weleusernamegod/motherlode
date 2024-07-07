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

#include "level.h"
#include "player.h"

#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/drill_h.h"
#include "../assets/drill_v.h"
#include "../assets/prop.h"
#include "../assets/nav.h"
#include "../assets/ore_tiles.h"
#include "../assets/progressbar.h"
#include "../assets/font.h"
#include "../assets/character.h"

#include "../assets/station.h"
#include "../assets/station_powerup.h"
#include "../assets/station_sell.h"
#include "../assets/station_upgrade.h"
#include "../assets/station_save.h"

#include "../assets/game_over_skull.h"
#include "../assets/a_button.h"
#include "../assets/warning_cargo.h"
#include "../assets/warning_fuel.h"
#include "../assets/loading_screen.h"

#include "sfx.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(bank_map)
#endif

uint8_t get_tile_from_array(uint16_t depth, uint16_t width) {
    switch_ram_bank_based_on_value(depth);
    uint8_t tile = level_array[depth % 256][width];
    switch_ram_bank_back_to_prev();
    return tile;
}

void switch_ram_bank_back_to_prev(void) {
    current_ram_bank = prev_ram_bank;
    SWITCH_RAM(prev_ram_bank);
}

void switch_ram_bank_based_on_value(uint16_t value) {
    prev_ram_bank = current_ram_bank;
    current_ram_bank = value / 256; // Determine which bank to switch to
    SWITCH_RAM(current_ram_bank); // Switch to the appropriate bank
}
void init_loading_screen(void) {
    set_bkg_palette(0, 1, loading_screen_palettes);
    set_sprite_palette(0, 1, loading_screen_palettes);
    set_bkg_data(loading_screen_TILE_ORIGIN, loading_screen_TILE_COUNT, loading_screen_tiles);
    set_bkg_tiles(0,0,loading_screen_MAP_ATTRIBUTES_WIDTH, loading_screen_MAP_ATTRIBUTES_HEIGHT, loading_screen_map);
    VBK_REG = 1;
    set_bkg_tiles(0,0,loading_screen_MAP_ATTRIBUTES_WIDTH, loading_screen_MAP_ATTRIBUTES_HEIGHT, loading_screen_map_attributes);
    VBK_REG = 0;
    hide_sprites_range(0, MAX_HARDWARE_SPRITES);
    HIDE_WIN;
}

void draw_loading_screen(uint16_t rows, uint16_t desired_rows) {
    progressbar(rows, desired_rows, 10, 0, 0, 40+8, 72+16);

    char rows_buffer[5];
    uitoa(rows, rows_buffer, 10);
    draw_text_bkg(5,11,rows_buffer,4,FALSE,0);


    if (rows == 0) {
        char desired_rows_buffer[5];
        uitoa(desired_rows, desired_rows_buffer, 10);
        draw_text_bkg(11,11,desired_rows_buffer,4,FALSE,0);
    }
}

void done_loading(void){
    draw_text_bkg(5,11,"   DONE   ",10,TRUE,0);
    delay(1000);
}

void generate_map(uint16_t desired_rows) {
    uint16_t rows;
    uint8_t cols = COLS;
    for (rows = 0; rows < desired_rows; rows++) {
        for (cols = 0; cols < COLS; cols++) {

            if (rows % 32 == 0) draw_loading_screen(rows, desired_rows);

            if (rows > 6) {
                // Start generating the map based on depth
                uint8_t randValue = rand() % 100;  // Random value from 0 to 99
                uint8_t tileType = 1; // Default to dirt

                // Determine ore distribution based on depth
                if (rows < DEPTH_LEVEL_1 && randValue >= 80) {
                    // Rows 7 to 19: Ores 4 to 5
                    tileType = rand() % 2 + COAL; // Ores 4 and 5
                } else if (rows >= DEPTH_LEVEL_1 && rows < DEPTH_LEVEL_2 && randValue >= 80) {
                    // Rows 20 to 49: Ores 4 to 7
                    tileType = rand() % 4 + STONE; // Ores 4 to 7
                } else if (rows >= DEPTH_LEVEL_2 && rows < DEPTH_LEVEL_3 && randValue >= 75) {
                    // Rows 50 to 149: Ores 8 to 11
                    tileType = rand() % 4 + 8; // Ores 8 to 11
                } else if (rows >= DEPTH_LEVEL_3 && rows < DEPTH_LEVEL_4 && randValue >= 70) {
                    // Rows 150 to 299: Ores 12 to 14
                    tileType = rand() % 3 + 12; // Ores 12 to 14
                } else if (rows >= DEPTH_LEVEL_4 && rows < DEPTH_LEVEL_5 && randValue >= 65) {
                    // Rows 300 to 599: Ores 15 to 17
                    tileType = rand() % 3 + 15; // Ores 15 to 17
                } else if (rows >= DEPTH_LEVEL_5 && randValue >= 60) {
                    // Rows 600 and deeper: Ores 16 to 18
                    tileType = rand() % 3 + 16; // Ores 16 to 18
                }

                // Introduce caves (empty spaces)
                if (randValue < 20) {  // Increase to 20% chance for caves
                    tileType = 0;
                }
                
                // Mix ores a bit more in the deeper rows
                if (rows >= 300 && randValue >= 50) {
                    tileType = rand() % 18 + 1;  // Mix all ores from 1 to 18
                }

                switch_ram_bank_based_on_value(rows);
                level_array[rows % 256][cols] = tileType;

            } else if (rows == 6) {
                // Seventh row is all gras
                level_array[rows][cols] = GRASS;

                if (cols == STATION_POWERUP_X + STATION_POWERUP_DOOR_OFFSET || cols == STATION_SELL_X + STATION_SELL_DOOR_OFFSET || cols == STATION_UPGRADE_X + STATION_UPGRADE_DOOR_OFFSET){
                  level_array[rows][cols] = STONE;  
                }

            } else if (rows < 6) {
                // First six rows are empty
                level_array[rows][cols] = EMPTY;
            }
        }
    }

    draw_loading_screen(rows, desired_rows); // draw it once again when finished

    SWITCH_RAM(0); // back to default RAM bank
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
    uint8_t num_colors = sizeof(colors) / sizeof(colors[0]);
    uint16_t phase_per_color = ROWS / (num_colors - 1);
    uint16_t color_phase = ((depth < DEPTH_LEVEL_1) ? 0 : depth - DEPTH_LEVEL_1) % ROWS;
    uint8_t index = color_phase / phase_per_color;
    uint16_t progress = color_phase % phase_per_color;

    Background_color current_color;
    interpolate_color(&current_color, colors[index], colors[index + 1], progress, phase_per_color);

    set_bkg_palette_entry(0, COLOR_TO_CHANGE_BKG, RGB8(current_color.r, current_color.g, current_color.b));
}

void change_sky_color(void) {
    uint8_t r, g, b;
    const uint8_t color_threshold = 20; // Define the maximum value for sky_color_value

    // Change color every x seconds
    if (second_counter % 10 == 0) {
        sky_color_value += sky_color_direction;

        // Check if sky_color_value has reached the thresholds
        if (sky_color_value >= color_threshold) {
            sky_color_value = color_threshold;
            sky_color_direction = -1; // Change direction to decreasing
        } else if (sky_color_value <= 0) {
            sky_color_value = 0;
            sky_color_direction = 1; // Change direction to increasing
        }
    }

    // Adjust the RGB values to become darker at lower sky_color_value
    r = 22 - sky_color_value;
    g = 28 - sky_color_value;
    b = 31 - sky_color_value;

    // Update the background color
    set_bkg_palette_entry(4, COLOR_TO_CHANGE_SKY, RGB(r, g, b));
    set_bkg_palette_entry(5, COLOR_TO_CHANGE_SKY, RGB(r, g, b));
    set_bkg_palette_entry(6, COLOR_TO_CHANGE_SKY, RGB(r, g, b));
    set_bkg_palette_entry(7, COLOR_TO_CHANGE_SKY, RGB(r, g, b));
}

void update_progressbar_palette(player_attributes *attribute, uint8_t palette_index) {
    // Calculate the percentage using integer math
    uint16_t percentage = (attribute->current_value * 10) / attribute->max_value;
    percentage = percentage * 10;

    // Choose color based on the percentage
    uint8_t red, green, blue;
    if (percentage > 50) {
        red = (uint8_t)(50 + (50 * (100 - 2 * (percentage - 50)) / 100)); // Decrease red as the resource decreases
        green = 100;
        blue = 50;
    } else {
        // Less resource, more red
        red = 100;
        green = (uint8_t)((100 * 2 * percentage / 100)); // Decrease green as the resource decreases
        blue = 50;
    }

    // Update the specified palette entry
    set_sprite_palette_entry(palette_index, 2, RGB8(red, green, blue)); // Update the palette in the background
}



const Palette_group palette_group_close_to_ground[] = {
    {palette_background, 0, 0},
    {&ore_tiles_palettes[GRASS * BYTE_PER_PALETTE], 1, 0},
    {&ore_tiles_palettes[COAL * BYTE_PER_PALETTE], 2, 0},
    {&ore_tiles_palettes[IRON * BYTE_PER_PALETTE], 3, 0},
    {&station_palettes[4 * BYTE_PER_PALETTE], 4, 0},
    {&station_palettes[5 * BYTE_PER_PALETTE], 5, 0},
    {&station_palettes[6 * BYTE_PER_PALETTE], 6, 0},
    {&station_palettes[7 * BYTE_PER_PALETTE], 7, 0},
};


const Palette_group* last_used_palette_group[8] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};  // Initialize to NULL

void init_palette_based_on_depth(void) {
    memset(last_used_palette_group, NULL, 8);
    reload_palettes = TRUE;
}

void generate_palette_groups(Palette_group* palette_groups, uint8_t* count) {
    uint8_t index = 0;
    
    // Choose the appropriate palette group based on depth_offset
    if (depth_offset < DEPTH_LEVEL_1) {
        for (uint8_t i = 0; i < 8; i++) {
            palette_groups[index++] = palette_group_close_to_ground[i];
        }
    } else {
        // Add other palette group generation logic here for depths 10 and above
        // Example:
        for (uint8_t i = 0; i < MAX_PALETTE_GROUPS; i++) {
            if (index >= MAX_PALETTE_GROUPS) break;  // Prevent overflow
            
            palette_groups[index].palettes = &ore_tiles_palettes[materials[i].tile_number * BYTE_PER_PALETTE];
            palette_groups[index].palette_number = materials[i].palette_number;
            palette_groups[index].depth_threshold = materials[i].depth_threshold;
            index++;
        }
    }
    
    *count = index;  // Return the number of palette groups generated
}

void update_palette_based_on_depth(void) {
    Palette_group palette_groups[MAX_PALETTE_GROUPS];
    uint8_t palette_groups_count;
    generate_palette_groups(palette_groups, &palette_groups_count);

    // Initialize selected_palette_group array to NULL pointers
    const Palette_group* selected_palette_group[MAX_PALETTES] = {NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};

    // Iterate through the palette groups
    for (uint8_t i = 0; i < palette_groups_count; i++) {
        // Select the appropriate palette group based on depth_offset
        if (depth_offset >= palette_groups[i].depth_threshold) {
            selected_palette_group[palette_groups[i].palette_number] = &palette_groups[i];
        } else {
            break;  // Assumes palette_groups are sorted by depth_threshold
        }
    }

    // Update the palette if it has changed
    for (uint8_t i = 0; i < MAX_PALETTES; i++) {
        if (selected_palette_group[i] != last_used_palette_group[i]) {
            if (selected_palette_group[i] != NULL) {
                set_bkg_palette(selected_palette_group[i]->palette_number, 1, selected_palette_group[i]->palettes);
            }
            last_used_palette_group[i] = selected_palette_group[i];
        }
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

void set_4bkg_tiles(uint8_t array[][COLS], uint8_t x1, uint16_t y1, uint8_t r, uint8_t c) {
    for (uint16_t y = y1; y < y1 + r; y++) {
        for (uint8_t x = x1; x < x1 + c; x++) {
            uint8_t temp = (array[y][x] * 4) + ore_tiles_TILE_ORIGIN - 4;
            uint8_t tile_array[4] = {temp, temp + 1, temp + 2, temp + 3};
            uint8_t palette_array[4];

            if (array[y][x] == EMPTY) {
                for (uint8_t i = 0; i < 4; i++) tile_array[i] = COLOR_1;
            } else if (array[y][x] == DIRT) {
                for (uint8_t i = 0; i < 4; i++) tile_array[i] = temp + i;
                shuffle(tile_array);
            } else if (y == UNDERGROUND) { // make stones look like gras
                if (array[y][x] == GRASS) {
                tile_array[0] = temp + (rand() % 4);
                tile_array[1] = temp + (rand() % 4);
                tile_array[2] = temp - 1;
                tile_array[3] = temp - 2;
                } else if (array[y][x] == STONE) {
                tile_array[0] = temp - 4 + (rand() % 4);
                tile_array[1] = temp - 4 + (rand() % 4);
                tile_array[2] = temp - 4 - 1;
                tile_array[3] = temp - 4 - 2;
                }
            }

            if (array[y][x] == EMPTY) {
                for (uint8_t i = 0; i < 4; i++) palette_array[i] = 0;
            } else {
                for (uint8_t i = 0; i < 4; i++) palette_array[i] = materials[(tile_array[i] - ore_tiles_TILE_ORIGIN + 4) >> 2].palette_number;
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
        if (depth > METATILES_TOTAL - 1) {
            if (depth - depth_offset == (8 - THRESHOLD - BOTTOM)) {
                switch_ram_bank_based_on_value(depth + 4);
                set_4bkg_tiles(level_array, 0, (depth + 4) % 256, 1, 16);
            } else if (depth - depth_offset == THRESHOLD) {
                switch_ram_bank_based_on_value(depth - 4);
                set_4bkg_tiles(level_array, 0, (depth - 4) % 256, 1, 16);
            }
            switch_ram_bank_back_to_prev(); // ram bank back to where it was
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
    if (y < ROWS && x < COLS){
        level_array[y][x] = EMPTY; // Clear the tile in the array
        set_4bkg_tiles(level_array, x, y, 1, 1); // Update the background
    }
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
 * @param palette what palette to use
 * @param x x-coordinate of first tile
 * @param y y-coordinate of first tile
 */
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t palette, uint8_t x, uint8_t y) {
    // Calculate percentage of progress in terms of total available width in pixels (digits * 8)
    uint8_t total_pixels = digits * 8;
    uint16_t pixels_to_fill;
    // for large values use 32 bit value
    if (digits > 3) {
        uint32_t scaled_value = (uint32_t)current_value * total_pixels; // Use uint32_t for the intermediate result
        pixels_to_fill = scaled_value / max_value;
    } else {
        pixels_to_fill = (current_value * total_pixels) / max_value;
    }


    for (uint8_t i = 0; i < digits; i++) {
        uint8_t tile_index = PROGRESSBAR_TILE_0_8; // Default to empty
        uint8_t sprite_pixels = 8; // Each sprite can show up to 8 pixels (full sprite width)
        uint8_t effective_pixels = (pixels_to_fill > sprite_pixels) ? sprite_pixels : pixels_to_fill;

        // Adjust pixel count for next sprite
        pixels_to_fill -= effective_pixels;

        // Map effective pixels to sprite tiles
        switch (effective_pixels) {
            case 0: tile_index = PROGRESSBAR_TILE_0_8; break;
            case 1: tile_index = PROGRESSBAR_TILE_1_8; break;
            case 2: tile_index = PROGRESSBAR_TILE_2_8; break;
            case 3: tile_index = PROGRESSBAR_TILE_3_8; break;
            case 4: tile_index = PROGRESSBAR_TILE_4_8; break;
            case 5: tile_index = PROGRESSBAR_TILE_5_8; break;
            case 6: tile_index = PROGRESSBAR_TILE_6_8; break;
            case 7: tile_index = PROGRESSBAR_TILE_7_8; break;
            case 8: 
                if (i == digits - 1 || pixels_to_fill == 0) { // Last sprite or no more pixels to fill
                    tile_index = PROGRESSBAR_TILE_8_8;
                } else {
                    tile_index = PROGRESSBAR_TILE_END;
                }
                break;
        }

        // Set the sprite tile and move it into position
        set_sprite_tile(tilestart + i, tile_index);
        set_sprite_prop(tilestart + i, 0b10000000 | palette); // set it to background and OR it with palette
        move_sprite(tilestart + i, x + i * 8, y);
    }
}

void draw_test(void) {
    char string1[10];
    char string2[10];
    itoa(absolute_movement, string1, 10);
    itoa(abs(velocity), string2, 10);
    draw_text_win(2,4,string1,5,FALSE,0);
    draw_text_win(10,4,string2,5,FALSE,0);
}

void draw_depth(void){
    char string[5];
    itoa(depth_offset, string, 10);
    // itoa((depth < GROUND) ? 0 : (depth - GROUND), string, 10);
    // strcat(string, "^");
    draw_text_win(14,1,string,5,FALSE,0);
}

void draw_cargo(void){
    char string[5];
    if (player.cargo.current_value > player.cargo.max_value) player.cargo.current_value = player.cargo.max_value; // make sure even if the cargo is more than full, to only display just full (15/15 for example not 16/15)
    itoa(player.cargo.current_value, string, 10);
    // strcat(string, "#");
    draw_text_win(10,1,string,3,FALSE,0);
}

const metasprite_t warning_cargo_metasprite[] = {
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+1, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+2, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+3, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+4, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+5, .props=0},
    {.dy=0, .dx=8, .dtile=warning_cargo_TILE_ORIGIN+6, .props=0},
	METASPR_TERM
};

const metasprite_t warning_fuel_metasprite[] = {
    {.dy=0, .dx=8, .dtile=warning_fuel_TILE_ORIGIN, .props=0},
    {.dy=0, .dx=8, .dtile=warning_fuel_TILE_ORIGIN+1, .props=0},
    {.dy=0, .dx=8, .dtile=warning_fuel_TILE_ORIGIN+2, .props=0},
    {.dy=0, .dx=8, .dtile=warning_fuel_TILE_ORIGIN+3, .props=0},
    {.dy=0, .dx=8, .dtile=warning_fuel_TILE_ORIGIN+4, .props=0},
	METASPR_TERM
};

void init_a_button(void){
    set_sprite_data(a_button_TILE_ORIGIN, a_button_TILE_COUNT, a_button_tiles);
}

void draw_a_button(void){
    if (animation_frames_left == 0 && (frame_counter % (60 / (sizeof(a_button_metasprites) >> 1)) == 0)) {
            move_metasprite_ex(a_button_metasprites[(frame_counter / (60 / (sizeof(a_button_metasprites) >> 1))) % (sizeof(a_button_metasprites) >> 1)], a_button_TILE_ORIGIN, TRACKS_PALETTE, A_BUTTON_START, width_pixel.h, depth_pixel.h + 16);
    }
}

void hide_a_button(void){
    hide_metasprite(a_button_metasprites[0], A_BUTTON_START);
}

void init_game_over(void){
    set_sprite_data(game_over_skull_TILE_ORIGIN, game_over_skull_TILE_COUNT, game_over_skull_tiles);
    set_sprite_palette(GAME_OVER_PALETTE, 1, palette_game_over);
    game_over_animation_active = TRUE;
    game_over_animation_cycle = 0;
    game_over_animation_frame = 0;
}

void draw_game_over(void) {
    // Play skull laughing sound at the start of the animation
    if (game_over_animation_cycle == 0 && game_over_animation_frame == 0 && game_over_animation_active) {
        PLAY_SFX_explosion;
    }

    // Animate the skull if animation is active
    if (game_over_animation_active) {
        // Move metasprite with the calculated animation frame
        game_over_animation_frame ++;
        move_metasprite_ex(game_over_skull_metasprites[game_over_animation_frame / GAME_OVER_ANIMATION_DURATION % (sizeof(game_over_skull_metasprites) >> 1)], game_over_skull_TILE_ORIGIN, GAME_OVER_PALETTE, SKULL_START, SCREENWIDTH/2+8, GAME_OVER_Y+16);

        // Check if one cycle of animation is complete
        if (game_over_animation_frame == (sizeof(game_over_skull_metasprites) >> 1) * GAME_OVER_ANIMATION_DURATION) {
            game_over_animation_frame = 0;
            game_over_animation_cycle++;
            
            // Check if desired animation cycles are complete
            if (game_over_animation_cycle >= GAME_OVER_ANIMATION_CYCLES) {
                game_over_animation_active = FALSE;  // Stop animating after completing desired cycles

                // After animation completes, display "GAME OVER"
                draw_text_sprite(72, 116, GAME_OVER_START, "GAME", 4, TRUE, GAME_OVER_PALETTE);
                draw_text_sprite(72, 116 + 10, GAME_OVER_START + 4, "OVER", 4, TRUE, GAME_OVER_PALETTE);
                scroll_sprite(GAME_OVER_START + 3, 1, 0); // move letter E one over, because it looks more nice
            }
        }
    }
}

void init_warning(void){
    set_sprite_data(warning_cargo_TILE_ORIGIN, warning_cargo_TILE_COUNT, warning_cargo_tiles);
    set_sprite_data(warning_fuel_TILE_ORIGIN, warning_fuel_TILE_COUNT, warning_fuel_tiles);
}

void init_icon(void) {
    set_sprite_tile(ICON_HULL_START, HULL_ICON);
    set_sprite_tile(ICON_FUEL_START, FUEL_ICON);
    set_sprite_tile(ICON_CARGO_START, CARGO_ICON);
    set_sprite_tile(ICON_DEPTH_START, DEPTH_ICON);
    move_sprite(ICON_HULL_START, ICON_HULL_X, ICON_Y);
    move_sprite(ICON_FUEL_START, ICON_FUEL_X, ICON_Y);
    move_sprite(ICON_CARGO_START, ICON_CARGO_X, ICON_Y);
    move_sprite(ICON_DEPTH_START, ICON_DEPTH_X, ICON_Y);
    set_sprite_prop(ICON_HULL_START, ICON_PALETTE);
    set_sprite_prop(ICON_FUEL_START, ICON_PALETTE);
    set_sprite_prop(ICON_CARGO_START, ICON_PALETTE);
    set_sprite_prop(ICON_DEPTH_START, ICON_PALETTE);
}

void update_icon_hull(void){

    if (display_warning_hull_normal) {
        if (frame_counter % PERCENTAGE_NORMAL == 0) {
            set_sprite_prop(ICON_HULL_START, WARNING_PALETTE);
            PLAY_SFX_up;
        } else if (frame_counter % (PERCENTAGE_NORMAL / 2) == 0) {
            set_sprite_prop(ICON_HULL_START, ICON_PALETTE);
        }
    } else {
        set_sprite_prop(ICON_HULL_START, ICON_PALETTE);
    }
}

void update_icon_fuel(void){
    if (display_warning_fuel_normal && !display_warning_fuel_critical) {
        if (frame_counter % PERCENTAGE_NORMAL == 0) {
            set_sprite_prop(ICON_FUEL_START, WARNING_PALETTE);
            PLAY_SFX_up;
        } else if (frame_counter % (PERCENTAGE_NORMAL / 2) == 0) {
            set_sprite_prop(ICON_FUEL_START, ICON_PALETTE);
        }
    } else if (display_warning_fuel_normal && display_warning_fuel_critical) {
        if (frame_counter % PERCENTAGE_CRITICAL == 0) {
            set_sprite_prop(ICON_FUEL_START, WARNING_PALETTE);
            PLAY_SFX_up;
        } else if (frame_counter % (PERCENTAGE_CRITICAL / 2) == 0) {
            set_sprite_prop(ICON_FUEL_START, ICON_PALETTE);
        }
    }
    if (!display_warning_fuel_critical && !display_warning_fuel_normal) {
        set_sprite_prop(ICON_FUEL_START, ICON_PALETTE);
    }
}

void update_icon_cargo(void){
    if (display_warning_cargo_normal) {
            set_sprite_prop(ICON_CARGO_START, WARNING_PALETTE);
            PLAY_SFX_exp_up;
    } else {
        set_sprite_prop(ICON_CARGO_START, ICON_PALETTE);
    }
}

void draw_fuel_bar(void){
    progressbar(player.fuel.current_value, player.fuel.max_value, 3,  PROGRESSBAR_FUEL_START, FUEL_BAR_PALETTE, 45, 24);
}
void draw_hull_bar(void){
    progressbar(player.hull.current_value, player.hull.max_value, 2, PROGRESSBAR_HULL_START, HULL_BAR_PALETTE, 13, 24);
}

void init_character(void){
    set_sprite_data(rover_TILE_ORIGIN, rover_TILE_COUNT, rover_tiles);
    set_sprite_data(rover_eye_TILE_ORIGIN, rover_eye_TILE_COUNT, rover_eye_tiles);
    set_sprite_data(tracks_TILE_ORIGIN, tracks_TILE_COUNT, tracks_tiles);
    set_sprite_data(drill_h_TILE_ORIGIN, drill_h_TILE_COUNT, drill_h_tiles);
    set_sprite_data(drill_v_TILE_ORIGIN, drill_v_TILE_COUNT, drill_v_tiles);
    set_sprite_data(prop_TILE_ORIGIN, prop_TILE_COUNT, prop_tiles);
}
void draw_character(void){
    draw_metasprite(direction_prev);
}

void init_nav(void){

}
void draw_nav(void){
    set_win_tiles(0,0,nav_WIDTH / nav_TILE_W,nav_HEIGHT / nav_TILE_H,nav_map);
    move_win(WIN_X, WIN_Y);
}

void init_progressbar(void){
    set_sprite_data(PROGRESSBAR_TILE_0_8, progressbar_TILE_COUNT, progressbar_tiles);
}

void init_tiles(void){
    set_bkg_data(ore_tiles_TILE_ORIGIN, ore_tiles_TILE_COUNT, ore_tiles_tiles);
}
void draw_tiles(void){
    set_4bkg_tiles(level_array, 0, 0, 16, 16);
}

void init_buildings(void){
    set_bkg_data(station_TILE_ORIGIN, station_TILE_COUNT, station_tiles);
}
void draw_buildings(void){

    VBK_REG = 0;
    set_bkg_tiles(STATION_POWERUP_X * 2, (((STATION_Y + 1)* 2) - (station_powerup_HEIGHT/station_powerup_TILE_H)), (station_powerup_WIDTH/station_powerup_TILE_W), (station_powerup_HEIGHT/station_powerup_TILE_H), station_powerup_map);
    set_bkg_tiles(STATION_SELL_X * 2, (((STATION_Y + 1)* 2) - (station_sell_HEIGHT/station_sell_TILE_H)), (station_sell_WIDTH/station_sell_TILE_W), (station_sell_HEIGHT/station_sell_TILE_H), station_sell_map);
    set_bkg_tiles(STATION_UPGRADE_X * 2, (((STATION_Y + 1)* 2) - (station_upgrade_HEIGHT/station_upgrade_TILE_H)), (station_upgrade_WIDTH/station_upgrade_TILE_W), (station_upgrade_HEIGHT/station_upgrade_TILE_H), station_upgrade_map);
    set_bkg_tiles(STATION_SAVE_X * 2, (((STATION_SAVE_Y + 1)* 2) - (station_save_HEIGHT/station_save_TILE_H)), (station_save_WIDTH/station_save_TILE_W), (station_save_HEIGHT/station_save_TILE_H), station_save_map);
    VBK_REG = 1;
    set_bkg_tiles(STATION_POWERUP_X * 2, (((STATION_Y + 1)* 2) - (station_powerup_HEIGHT/station_powerup_TILE_H)), (station_powerup_WIDTH/station_powerup_TILE_W), (station_powerup_HEIGHT/station_powerup_TILE_H), station_powerup_map_attributes);
    set_bkg_tiles(STATION_SELL_X * 2, (((STATION_Y + 1)* 2) - (station_sell_HEIGHT/station_sell_TILE_H)), (station_sell_WIDTH/station_sell_TILE_W), (station_sell_HEIGHT/station_sell_TILE_H), station_sell_map_attributes);
    set_bkg_tiles(STATION_UPGRADE_X * 2, (((STATION_Y + 1)* 2) - (station_upgrade_HEIGHT/station_upgrade_TILE_H)), (station_upgrade_WIDTH/station_upgrade_TILE_W), (station_upgrade_HEIGHT/station_upgrade_TILE_H), station_upgrade_map_attributes);
    set_bkg_tiles(STATION_SAVE_X * 2, (((STATION_SAVE_Y + 1)* 2) - (station_save_HEIGHT/station_save_TILE_H)), (station_save_WIDTH/station_save_TILE_W), (station_save_HEIGHT/station_save_TILE_H), station_save_map_attributes);
    VBK_REG = 0;

}

void draw_sky(void){
    unsigned char sky_map[32 * UNDERGROUND * 2];
    unsigned char sky_palette[32 * UNDERGROUND * 2];

    // Initialize sky_map array using memset
    memset(sky_map, COLOR_0, sizeof(sky_map));

    // Initialize sky_palette array using memset
    memset(sky_palette, PALETTE_SKY, sizeof(sky_palette));

    VBK_REG = 0;
    set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_map);
    VBK_REG = 1;
    set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_palette);
    VBK_REG = 0;
}

void swap_tiles_sky_buildings(void) {
    if (depth_offset < UNDERGROUND && !buildings_loaded) {
        // Load and draw buildings if the player is deeper than the threshold and buildings are not loaded
        init_buildings();
        draw_sky();
        draw_buildings();
        buildings_loaded = TRUE;  // Mark buildings as loaded
    } else if (depth_offset >= DEPTH_LEVEL_1 && buildings_loaded) {
        // Load tiles if the player is shallower than the threshold and tiles are not loaded
        init_tiles();
        buildings_loaded = FALSE;  // Mark tiles as loaded (buildings are not loaded)
    }
}
