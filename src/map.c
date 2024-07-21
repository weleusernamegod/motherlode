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

// #include "../assets/a_button.h"

#include "sfx.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(bank_map)
#endif


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
    uint8_t scale_factor = ROWS / 256;
    uint8_t depth_corrected = depth / scale_factor;
    uint8_t max_progress = 256 / (num_colors - 1);
    uint8_t progress = depth_corrected % max_progress;
    uint8_t index = depth_corrected / max_progress;

    Background_color current_color;
    interpolate_color(&current_color, colors[index], colors[index + 1], progress, max_progress);

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

    if (depth_offset < materials[STONE].depth_threshold) {
        for (uint8_t i = 0; i < 8; i++) {
            palette_groups[index++] = palette_group_close_to_ground[i];
        }
    } else {
        for (uint8_t i = 0; i < MATERIAL_COUNT; i++) {
            if (index >= MATERIAL_COUNT) break;
            
            palette_groups[index].palettes = &ore_tiles_palettes[materials[i].tile_number * BYTE_PER_PALETTE];
            palette_groups[index].palette_number = materials[i].palette_number;
            palette_groups[index].depth_threshold = materials[i].depth_threshold;
            index++;
        }
    }

    *count = index;
}

void update_palette_based_on_depth(void) {
    Palette_group palette_groups[MATERIAL_COUNT];
    uint8_t palette_groups_count;
    generate_palette_groups(palette_groups, &palette_groups_count);

    const Palette_group* selected_palette_group[MAX_PALETTES] = {NULL};

    for (uint8_t i = 0; i < palette_groups_count; i++) {
        if (depth_offset >= palette_groups[i].depth_threshold) {
            selected_palette_group[palette_groups[i].palette_number] = &palette_groups[i];
        }
    }

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
            } else if (y == UNDERGROUND && depth < 50) { // make stones look like gras
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
            set_bkg_tiles(2 * x, 2 * y, 2, 1, tile_array);
            set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, tile_array + 2);

            // Then set palette with VBK_REG = 1 (palette data)
            if (isGBC) {
                VBK_REG = 1;
                set_bkg_tiles(2 * x, 2 * y, 2, 1, palette_array);
                set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, palette_array + 2);
                VBK_REG = 0;
            }
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

void draw_depth(void){
    char string[5];
    // itoa(depth_offset, string, 10);
    itoa((depth < GROUND) ? 0 : (depth - GROUND), string, 10);
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

// void init_a_button(void){
//     set_sprite_data(a_button_TILE_ORIGIN, a_button_TILE_COUNT, a_button_tiles);
// }

// void draw_a_button(void){
//     if (animation_frames_left == 0 && (frame_counter % (60 / (sizeof(a_button_metasprites) >> 1)) == 0)) {
//             move_metasprite_ex(a_button_metasprites[(frame_counter / (60 / (sizeof(a_button_metasprites) >> 1))) % (sizeof(a_button_metasprites) >> 1)], a_button_TILE_ORIGIN, TRACKS_PALETTE, A_BUTTON_START, width_pixel.h, depth_pixel.h + 16);
//     }
// }

// void hide_a_button(void){
//     hide_metasprite(a_button_metasprites[0], A_BUTTON_START);
// }

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
    set_bkg_tiles(STATION_POWERUP_X * 2, (((STATION_Y + 1)* 2) - (station_powerup_HEIGHT/station_powerup_TILE_H)), (station_powerup_WIDTH/station_powerup_TILE_W), (station_powerup_HEIGHT/station_powerup_TILE_H), station_powerup_map);
    set_bkg_tiles(STATION_SELL_X * 2, (((STATION_Y + 1)* 2) - (station_sell_HEIGHT/station_sell_TILE_H)), (station_sell_WIDTH/station_sell_TILE_W), (station_sell_HEIGHT/station_sell_TILE_H), station_sell_map);
    set_bkg_tiles(STATION_UPGRADE_X * 2, (((STATION_Y + 1)* 2) - (station_upgrade_HEIGHT/station_upgrade_TILE_H)), (station_upgrade_WIDTH/station_upgrade_TILE_W), (station_upgrade_HEIGHT/station_upgrade_TILE_H), station_upgrade_map);
    set_bkg_tiles(STATION_SAVE_X * 2, (((STATION_SAVE_Y + 1)* 2) - (station_save_HEIGHT/station_save_TILE_H)), (station_save_WIDTH/station_save_TILE_W), (station_save_HEIGHT/station_save_TILE_H), station_save_map);
    if (isGBC) {
        VBK_REG = 1;
        set_bkg_tiles(STATION_POWERUP_X * 2, (((STATION_Y + 1)* 2) - (station_powerup_HEIGHT/station_powerup_TILE_H)), (station_powerup_WIDTH/station_powerup_TILE_W), (station_powerup_HEIGHT/station_powerup_TILE_H), station_powerup_map_attributes);
        set_bkg_tiles(STATION_SELL_X * 2, (((STATION_Y + 1)* 2) - (station_sell_HEIGHT/station_sell_TILE_H)), (station_sell_WIDTH/station_sell_TILE_W), (station_sell_HEIGHT/station_sell_TILE_H), station_sell_map_attributes);
        set_bkg_tiles(STATION_UPGRADE_X * 2, (((STATION_Y + 1)* 2) - (station_upgrade_HEIGHT/station_upgrade_TILE_H)), (station_upgrade_WIDTH/station_upgrade_TILE_W), (station_upgrade_HEIGHT/station_upgrade_TILE_H), station_upgrade_map_attributes);
        set_bkg_tiles(STATION_SAVE_X * 2, (((STATION_SAVE_Y + 1)* 2) - (station_save_HEIGHT/station_save_TILE_H)), (station_save_WIDTH/station_save_TILE_W), (station_save_HEIGHT/station_save_TILE_H), station_save_map_attributes);
        VBK_REG = 0;
    }

}

void draw_sky(void){
    unsigned char sky_map[32 * UNDERGROUND * 2];
    unsigned char sky_palette[32 * UNDERGROUND * 2];

    // Initialize sky_map array using memset
    memset(sky_map, COLOR_0, sizeof(sky_map));

    // Initialize sky_palette array using memset
    memset(sky_palette, PALETTE_SKY, sizeof(sky_palette));

    set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_map);
    if (isGBC) {
        VBK_REG = 1;
        set_bkg_tiles(0, 0, 32, UNDERGROUND * 2, sky_palette);
        VBK_REG = 0;
    }
}

void swap_tiles_sky_buildings(void) {
    if (depth_offset == GROUND && prev_depth_offset == UNDERGROUND) buildings_loaded = FALSE;

    if (depth_offset < UNDERGROUND && !buildings_loaded) {
        // Load and draw buildings if the player is deeper than the threshold and buildings are not loaded
        init_buildings();
        draw_sky();
        draw_buildings();
        buildings_loaded = TRUE;  // Mark buildings as loaded
    } else if (depth_offset >= DEPTH_CHANGE && buildings_loaded) {
        // Load tiles if the player is shallower than the threshold and tiles are not loaded
        init_tiles();
        buildings_loaded = FALSE;  // Mark tiles as loaded (buildings are not loaded)
    }
}
