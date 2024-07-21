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

#include "../assets/loading_screen.h"


#pragma bank 4
#ifndef __INTELLISENSE__
BANKREF(bank_loading)
#endif


void init_loading_screen(void) {
    set_bkg_palette(0, 1, loading_screen_palettes);
    set_sprite_palette(0, 1, loading_screen_palettes);
    set_bkg_data(loading_screen_TILE_ORIGIN, loading_screen_TILE_COUNT, loading_screen_tiles);
    set_bkg_tiles(0,0,loading_screen_MAP_ATTRIBUTES_WIDTH, loading_screen_MAP_ATTRIBUTES_HEIGHT, loading_screen_map);
    if (isGBC) {
        VBK_REG = 1;
        set_bkg_tiles(0,0,loading_screen_MAP_ATTRIBUTES_WIDTH, loading_screen_MAP_ATTRIBUTES_HEIGHT, loading_screen_map_attributes);
        VBK_REG = 0;
    }
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

void calculate_depth_ranges(void) {
    for (uint8_t i = 0; i < MATERIAL_COUNT; ++i) {
        uint16_t depth_threshold = materials[i].depth_threshold;
        uint8_t palette_number = materials[i].palette_number;

        uint8_t j;
        for (j = i + 1; j < MATERIAL_COUNT; ++j) {
            if (materials[j].palette_number == palette_number) {
                materials[i].depth_range = materials[j].depth_threshold - depth_threshold;
                break;
            }
        }
        if (j == MATERIAL_COUNT) {
            // If no subsequent material with the same palette_number is found, set depth_range to the max row value
            materials[i].depth_range = ROWS - materials[i].depth_threshold;
        }
    }
}

void generate_map(uint16_t desired_rows) {
    uint16_t rows;
    uint8_t cols = COLS;

    calculate_depth_ranges();

    for (rows = 0; rows < desired_rows; rows++) {
        if (rows % 32 == 0) draw_loading_screen(rows, desired_rows);

        // Array to store possible ores for the current row
        uint8_t possible_ores[ARTEFACT - STONE]; // the range of possible ores
        uint8_t possible_ores_count = 0;

        // Check what possible ores can occur in this row
        for (uint8_t i = STONE; i < ARTEFACT - STONE; i++) {
            uint8_t tile_offset = (materials[i].depth_threshold == 0) ? 0 : METATILES_TOTAL;

            if (rows >= materials[i].depth_threshold + tile_offset &&
                rows < materials[i].depth_threshold + materials[i].depth_range - METATILES_TOTAL) {
                possible_ores[possible_ores_count++] = i;
            }
        }

        // Initialize rarity_by_depth values for this row
        uint8_t rarity_by_depth[ARTEFACT - STONE];
        for (uint8_t j = 0; j < possible_ores_count; j++) {
            uint8_t i = possible_ores[j];
            if (i == STONE || i == LAVA || i == GAS) {
                uint8_t depth_threshold = materials[i].depth_threshold;
                uint8_t rarity = materials[i].rarity;
                rarity_by_depth[j] = (rows - depth_threshold) / ((ROWS - depth_threshold) / rarity);
            } else {
                rarity_by_depth[j] = materials[i].rarity;
            }
        }

        for (cols = 0; cols < COLS; cols++) {
            uint8_t tileType = 1; // Default to dirt

            if (rows > 6) {
                uint8_t randValue = rand();  // Random value from 0 to 255

                // Introduce caves (empty spaces)
                if (randValue < 50) {  // chance for caves
                    tileType = 0;
                } else {
                    // Loop through the possible ores array
                    for (uint8_t j = 0; j < possible_ores_count; j++) {
                        uint8_t i = possible_ores[j];
                        uint8_t threshold_value = rarity_by_depth[j];

                        randValue = rand();  // Re-generate random value for each ore
                        if (randValue < threshold_value) {
                            tileType = i;
                            break; // Stop once we set the tileType
                        }
                    }
                }

                switch_ram_bank_based_on_value(rows);
                level_array[rows % 256][cols] = tileType;
            } else if (rows == 6) {
                // Seventh row is all grass
                level_array[rows][cols] = GRASS;

                if (cols == STATION_POWERUP_X + STATION_POWERUP_DOOR_OFFSET ||
                    cols == STATION_SELL_X + STATION_SELL_DOOR_OFFSET ||
                    cols == STATION_UPGRADE_X + STATION_UPGRADE_DOOR_OFFSET) {
                    level_array[rows][cols] = STONE;
                }
            } else if (rows < 6) {
                // First six rows are empty
                level_array[rows][cols] = EMPTY;
            }
        }
    }

    draw_loading_screen(rows, desired_rows); // Draw it once again when finished

    SWITCH_RAM(0); // Back to default RAM bank
}


