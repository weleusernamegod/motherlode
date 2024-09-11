#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "general.h"
#include "globals.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "palettes.h"
#include "sound.h"

#include "../assets/sell_frame.h"

#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_sell)
#endif

void draw_sell(void){
    set_win_tiles(0, 0, 20, 18, sell_frame_map);
}

void init_sell(void) {
    set_sprite_palette(0, 1, palette_default);
    set_sprite_palette(1, 1, palette_light_grey);

    set_win_data(sell_frame_TILE_ORIGIN, sell_frame_TILE_COUNT, sell_frame_tiles);
    draw_sell();

    set_bkg_palette(0, 1, palette_default);
    set_bkg_palette(1, 1, palette_light_grey);
}

// Function to draw a single line of ore information
void draw_total_value(uint8_t line) {
    uint32_t total_value = 0;
    for (uint8_t i = LOWEST_ORE; i <= HIGHEST_ORE; i++) {
        if (materials[i].inventory > 0) {
            total_value += materials[i].value * materials[i].inventory;
        }
    }
    char total_value_buffer[16];
    ultoa(total_value, total_value_buffer, 10);
    strcat(total_value_buffer, "$");



    if (total_value > 0) {
        draw_text(WIN, 2, line, "TOTAL", 6, TRUE, 0);
        draw_text(WIN, 10, line, total_value_buffer, 8, FALSE, 0);
        // this prints the underscores under the total
        // for (uint8_t i = 0; i < strlen(total_value_buffer); i++) {
        //     set_win_tile_xy(17 - i, line + 1, 25);
        // }
    } else {
        // draw_text(WIN, 2, line, "nothing to sell!", 16, TRUE, 0);
    }
}

// Function to draw a single line of ore information
void draw_one_ore_line(const Material *material, uint8_t counter, uint8_t line) {
    char amount_buffer[8];
    uitoa(material->inventory, amount_buffer, 10);

    char text_buffer[16];
    strcpy(text_buffer, amount_buffer);
    strcat(text_buffer, "*");
    strcat(text_buffer, material->name);

    char value_buffer[16];
    uint32_t value = material->value * material->inventory;
    ultoa(value, value_buffer, 10);
    strcat(value_buffer, "$");

    draw_text(WIN, 2, line + counter, text_buffer, 14, TRUE, 0);
    draw_text(WIN, 12, line + counter, value_buffer, 6, FALSE, 0);
}

// Function to display ores collected by the player, from most valuable to least
void draw_collected_ores(uint8_t line) {
    uint8_t draw_counter = 0;
    // Loop through the materials array
    for (uint8_t i = LOWEST_ORE; i <= HIGHEST_ORE; i++) {
        // Check if the material is an ore and has at least 1 in inventory
        if (materials[i].inventory > 0) {
            // Draw the ore information line
            draw_one_ore_line(&materials[i], draw_counter, line);
            draw_counter++;
        }
    }
}

void draw_sell_menu(void) {
    char money_string[16];
    ultoa(player.money, money_string, 10);
    strcat(money_string, "$");

    draw_text(WIN, 2, 2, "MINERAL EXCHANGE", 16, TRUE, 0);

    draw_collected_ores(4);

    draw_total_value(13);

    draw_text(WIN, 2, 15, "CASH", 4, TRUE, 0);
    draw_text(WIN, 11, 15, money_string, 7, FALSE, 0);
}

uint32_t calculate_total_value(void) {
    uint32_t total_value = 0;
    // Assuming COAL to DIAMOND includes all sellable ores and gems
    for (uint8_t i = COAL; i <= DIAMOND; i++) {
        total_value += materials[i].inventory * materials[i].value;
    }
    return total_value;
}

void reset_inventory(void) {
    // Optionally reset inventory if they're sold
    for (uint8_t i = COAL; i <= DIAMOND; i++) {
        materials[i].inventory = 0;  // Reset inventory after selling
    }
}

void sell_menu_loop(void) {
    read_buttons();
    uint32_t total_value = calculate_total_value();

    if (buttons & J_A && prev_buttons != buttons) {
        if (total_value > 0) {
            player.money += total_value;
            reset_inventory();
            draw_sell();
            draw_sell_menu();
            PLAY_SFX_money;
        } else {
            PLAY_SFX_buy_nothing;
        }
    }
    if (buttons & J_B) leave_station = TRUE;

    
    prev_buttons = buttons;
    vsync();
}