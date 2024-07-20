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

void init_attributes(void){
    player.drill.attribute_name = "drill";
    player.drill.attribute_unit = "M/S";
    player.drill.upgrade_level = 0;
    player.drill.upgrade_value[0] = 1;
    player.drill.upgrade_value[1] = 2;
    player.drill.upgrade_value[2] = 4;    
    player.drill.upgrade_value[3] = 6;
    player.drill.upgrade_value[4] = 8;
    player.drill.upgrade_value[5] = 10;
    player.drill.upgrade_cost[0] = 0;
    player.drill.upgrade_cost[1] = 2000;
    player.drill.upgrade_cost[2] = 5000;
    player.drill.upgrade_cost[3] = 8000;
    player.drill.upgrade_cost[4] = 10000;
    player.drill.upgrade_cost[5] = 30000;
    player.drill.upgrade_name[0] = "iron drill";
    player.drill.upgrade_name[1] = "bronze drill";
    player.drill.upgrade_name[2] = "steel drill";
    player.drill.upgrade_name[3] = "titanium drill";
    player.drill.upgrade_name[4] = "diamond drill";
    player.drill.upgrade_name[5] = "platinum drill";

    player.hull.attribute_name = "hull";
    player.hull.attribute_unit = "PT";
    player.hull.attribute_unit_short = "())";
    player.hull.upgrade_level = 0;
    player.hull.upgrade_value[0] = 17;
    player.hull.upgrade_value[1] = 30;
    player.hull.upgrade_value[2] = 50;
    player.hull.upgrade_value[3] = 80;
    player.hull.upgrade_value[4] = 120;
    player.hull.upgrade_value[5] = 180;
    player.hull.upgrade_cost[0] = 0;
    player.hull.upgrade_cost[1] = 750;
    player.hull.upgrade_cost[2] = 2000;
    player.hull.upgrade_cost[3] = 5000;
    player.hull.upgrade_cost[4] = 15000;
    player.hull.upgrade_cost[5] = 30000;
    player.hull.upgrade_name[0] = "iron hull";
    player.hull.upgrade_name[1] = "bronze hull";
    player.hull.upgrade_name[2] = "steel hull";
    player.hull.upgrade_name[3] = "carbon hull";
    player.hull.upgrade_name[4] = "platinum hull";
    player.hull.upgrade_name[5] = "enegry shield";

    player.engine.attribute_name = "engine";
    player.engine.attribute_unit = "HP";
    player.engine.upgrade_level = 0;
    player.engine.upgrade_value[0] = 50;
    player.engine.upgrade_value[1] = 80;
    player.engine.upgrade_value[2] = 115;
    player.engine.upgrade_value[3] = 140;
    player.engine.upgrade_value[4] = 175;
    player.engine.upgrade_value[5] = 250;
    player.engine.upgrade_cost[0] = 0;
    player.engine.upgrade_cost[1] = 750;
    player.engine.upgrade_cost[2] = 2000;
    player.engine.upgrade_cost[3] = 5000;
    player.engine.upgrade_cost[4] = 20000;
    player.engine.upgrade_cost[5] = 30000;
    player.engine.upgrade_name[0] = "stock engine";
    player.engine.upgrade_name[1] = "125cc";
    player.engine.upgrade_name[2] = "v2 1.0 ltr";
    player.engine.upgrade_name[3] = "v6 3.8 ltr";
    player.engine.upgrade_name[4] = "v8 5.0 ltr turbo";
    player.engine.upgrade_name[5] = "v8 jaguar";

    player.fuel.attribute_name = "fueltank";
    player.fuel.attribute_unit = "LTR";
    player.fuel.attribute_unit_short = "?";
    player.fuel.upgrade_level = 5;
    player.fuel.upgrade_value[0] = 120;
    player.fuel.upgrade_value[1] = 200;
    player.fuel.upgrade_value[2] = 350;
    player.fuel.upgrade_value[3] = 600;
    player.fuel.upgrade_value[4] = 950;
    player.fuel.upgrade_value[5] = 1200;
    player.fuel.upgrade_cost[0] = 0;
    player.fuel.upgrade_cost[1] = 750;
    player.fuel.upgrade_cost[2] = 2000;
    player.fuel.upgrade_cost[3] = 8000;
    player.fuel.upgrade_cost[4] = 10000;
    player.fuel.upgrade_cost[5] = 30000;
    player.fuel.upgrade_name[0] = "jerry can";
    player.fuel.upgrade_name[1] = "gas cylinder";
    player.fuel.upgrade_name[2] = "stainless tank";
    player.fuel.upgrade_name[3] = "dual cylinder";
    player.fuel.upgrade_name[4] = "pressure tank";
    player.fuel.upgrade_name[5] = "lithium pack";

    player.radiator.attribute_name = "radiator";
    player.radiator.attribute_unit = "%";
    player.radiator.upgrade_level = 0;
    player.radiator.upgrade_value[0] = 0;
    player.radiator.upgrade_value[1] = 10;
    player.radiator.upgrade_value[2] = 25;
    player.radiator.upgrade_value[3] = 40;
    player.radiator.upgrade_value[4] = 30;
    player.radiator.upgrade_value[5] = 80;
    player.radiator.upgrade_cost[0] = 0;
    player.radiator.upgrade_cost[1] = 2000;
    player.radiator.upgrade_cost[2] = 5000;
    player.radiator.upgrade_cost[3] = 8000;
    player.radiator.upgrade_cost[4] = 10000;
    player.radiator.upgrade_cost[5] = 30000;
    player.radiator.upgrade_name[0] = "air condition";
    player.radiator.upgrade_name[1] = "single fan";
    player.radiator.upgrade_name[2] = "dual fans";
    player.radiator.upgrade_name[3] = "propeller";
    player.radiator.upgrade_name[4] = "single turbine";
    player.radiator.upgrade_name[5] = "jet turbine";

    player.cargo.attribute_name = "cargo bay";
    player.cargo.attribute_unit = "M&";
    player.cargo.upgrade_level = 0;
    player.cargo.upgrade_value[0] = 7;
    player.cargo.upgrade_value[1] = 15;
    player.cargo.upgrade_value[2] = 25;
    player.cargo.upgrade_value[3] = 40;
    player.cargo.upgrade_value[4] = 70;
    player.cargo.upgrade_value[5] = 120;
    player.cargo.upgrade_cost[0] = 0;
    player.cargo.upgrade_cost[1] = 750;
    player.cargo.upgrade_cost[2] = 2000;
    player.cargo.upgrade_cost[3] = 5000;
    player.cargo.upgrade_cost[4] = 10000;
    player.cargo.upgrade_cost[5] = 30000;
    player.cargo.upgrade_name[0] = "micro bay";
    player.cargo.upgrade_name[1] = "medium bay";
    player.cargo.upgrade_name[2] = "huge bay";
    player.cargo.upgrade_name[3] = "gigantic bay";
    player.cargo.upgrade_name[4] = "titanic bay";
    player.cargo.upgrade_name[5] = "dimention void";


    player.money = 50000;
    player.speed.l = 0;
    player.speed.h = 16;
    player.prev_speed.w = player.speed.w;
    
    // set all attributes based on the upgrade level
    for (uint8_t i = 0; i < 6; i++) {
        attributes_numbers[i]->current_value = attributes_numbers[i]->max_value = attributes_numbers[i]->upgrade_value[attributes_numbers[i]->upgrade_level];
    }

}

