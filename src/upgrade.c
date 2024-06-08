#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "general.h"
#include "interrupt.h"
#include "inventory.h"
#include "attributes.h"
#include "globals.h"
#include "constants.h"
#include "palettes.h"

#include "../assets/upgrade_highlight_frame.h"
#include "../assets/upgrade_frame.h"
#include "../assets/upgrade_tiles.h"



#include "upgrade.h"

#pragma bank 2
#ifndef __INTELLISENSE__
BANKREF(bank_upgrade)
#endif


const metasprite_t metasprite_upgrade_highlight_frame[] = {
    {.dy=15, .dx=7, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=2, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0b00100000},
    {.dy=8, .dx=0, .dtile=3, .props=0},
    {.dy=8, .dx=0, .dtile=3, .props=0},
    {.dy=2, .dx=0, .dtile=3, .props=0},
    {.dy=8, .dx=0, .dtile=1, .props=0b01100000},
    {.dy=0, .dx=-8, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-2, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-8, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-8, .dtile=1, .props=0b01000000},
    {.dy=-8, .dx=0, .dtile=3, .props=0b00100000},
    {.dy=-2, .dx=0, .dtile=3, .props=0b00100000},
    {.dy=-8, .dx=0, .dtile=3, .props=0b00100000},
	METASPR_TERM
};

UpgradeMenu *upgrade_menu_numbers[] = {
    &drill_menu,
    &hull_menu,
    &engine_menu,
    &fuel_menu,
    &radiator_menu,
    &cargo_menu,
    &main_menu
};

UpgradeMenu drill_menu = {0};
UpgradeMenu hull_menu = {0};
UpgradeMenu engine_menu = {0};
UpgradeMenu fuel_menu = {0};
UpgradeMenu radiator_menu = {0};
UpgradeMenu cargo_menu = {0};
UpgradeMenu main_menu = {0};

UpgradeMenuState currentUpgradeState = MAIN_MENU;
UpgradeMenu *currentUpgradeMenu = &main_menu;

void init_upgrade(void) {
    set_sprite_palette(0, 1, palette_default);
    set_sprite_palette(1, 1, palette_light_grey);

    set_win_data(upgrade_frame_TILE_ORIGIN, upgrade_frame_TILE_COUNT, upgrade_frame_tiles);
    set_win_tiles(0, 0, 20, 18, upgrade_frame_map);

    set_bkg_palette(0, 1, palette_default);
    set_bkg_palette(1, 1, palette_light_grey);

    set_sprite_data(1, upgrade_highlight_frame_TILE_COUNT, upgrade_highlight_frame_tiles); // blank tile in the end
    set_sprite_tile(UPGRADE_TICK_TILE, 4); // the tick for the upgrades
    move_metasprite_ex(metasprite_upgrade_highlight_frame, 0, 0, 0, 24, 40);

    update_menu = TRUE; // always update the menu the first time the player enters the shop
}

void init_upgrade_tiles_palettes(void) {
    // write every option in the menu with another palette from 2 to 7
    uint8_t x_coords[] = {3, 8, 13, 3, 8, 13};
    uint8_t y_coords[] = {5, 5, 5, 10, 10, 10};

    VBK_REG = 1;
    // Check if the position is valid
    for (uint8_t i = 0; i < 6; i++) {
        unsigned char tileData[16];
        for (uint8_t j = 0; j < 16; j++) {
            tileData[j]=i+2;    // first palette = 2, then inc up to 7
        }
        set_win_tiles(x_coords[i], y_coords[i], 4, 4, tileData);
    }
    VBK_REG = 0;
}

void update_upgrade_highlight_frame_position(uint8_t currentUpgradeSelection) {
    uint8_t x, y;
    x = 24 + (40 * (currentUpgradeSelection % 3));
    y = 40 + (40 * (currentUpgradeSelection / 3));
    move_metasprite_ex(metasprite_upgrade_highlight_frame, 0, 0, 0, x, y);
}

void update_upgrade_tick(UpgradeMenuState state) {
    // Additional code for other states would go here
    // For example, setting the sprite position based on the current upgrade level
    if (state != MAIN_MENU) {
        player_attributes *currentAttributes = attributes_numbers[state];
        uint8_t x = 8 + 24 + 24 - 2 + (40 * (currentAttributes->upgrade_level % 3));
        uint8_t y = 16 + 24 + 40 - 2 + (40 * (currentAttributes->upgrade_level / 3));
        move_sprite(UPGRADE_TICK_TILE, x, y);
    } else {
        hide_sprite(UPGRADE_TICK_TILE);  // Hide the sprite if not in a specific upgrade menu
    }
}


void display_upgrade_menu(UpgradeMenu *menu) {
    update_upgrade_highlight_frame_position(menu->currentUpgradeSelection);
}

void load_upgrade_single_tile(uint16_t tilestart, uint8_t tilenumber, uint8_t position, uint8_t upgrade_type) {
    uint8_t array[16];
    for (uint8_t i = 0; i < 16; i++){
        array[i] = tilestart+i;
    }
    set_win_data(tilestart, 16, &upgrade_tiles_tiles[(tilenumber * 16 * 16) + (upgrade_type * 16 * 16 * 6)]);
    if (position == 0) set_win_tiles(3, 5, 4, 4, array);
    else if (position == 1) set_win_tiles(8, 5, 4, 4, array);
    else if (position == 2) set_win_tiles(13, 5, 4, 4, array);
    else if (position == 3) set_win_tiles(3, 10, 4, 4, array);
    else if (position == 4) set_win_tiles(8, 10, 4, 4, array);
    else if (position == 5) set_win_tiles(13, 10, 4, 4, array);
}

void load_sub_upgrade_tiles(void) {
    for (uint8_t i = 0; i < 6; i++) {
        load_upgrade_single_tile(upgrade_tiles_TILE_ORIGIN + 16 * i, i, i, currentUpgradeState);
    }
}
void load_main_upgrade_tiles(void) {
    for (uint8_t i = 0; i < 6; i++) {
        load_upgrade_single_tile(upgrade_tiles_TILE_ORIGIN + i * 16, attributes_numbers[i]->upgrade_level, i, i);
    }
}

void write_main_upgrade_text(void) {
    char money_string[16];

    ultoa(player.money, money_string, 10);
    strcat(money_string, "$");
    // line 1
    draw_text(3, 2, "UPGRADE STORE", 14, TRUE, 0);
    // line 2
    draw_text(3, 3, attributes_numbers[currentUpgradeMenu->currentUpgradeSelection]->attribute_name, 14, TRUE, 0);
    //draw_text(3, 3, attributes_numbers[selection]->upgrade_name[attributes_numbers[selection]->upgrade_level], 14, TRUE, 0);
    // line 3
    draw_text(3, 15, "CASH", 5, TRUE, 0);
    draw_text(8, 15, money_string, 9, FALSE, 0);
}

void write_sub_upgrade_text(void) {
    char upgrade_string[8];
    char cost_string[16];
    char money_string[16];

    uitoa(attributes_numbers[currentUpgradeState]->upgrade_value[currentUpgradeMenu->currentUpgradeSelection], upgrade_string, 10);
    ultoa(attributes_numbers[currentUpgradeState]->upgrade_cost[currentUpgradeMenu->currentUpgradeSelection], cost_string, 10);

    ultoa(player.money, money_string, 10);
    strcat(money_string, "$");
    strcat(upgrade_string, attributes_numbers[currentUpgradeState]->attribute_unit);
    
    // line 1
    draw_text(3, 2, upgrade_string, 8, TRUE, 0);
    draw_text(11, 2, cost_string, 5, FALSE, 0);
    draw_text(16, 2, "$", 1, TRUE, 0);
    // line 2
    draw_text(3, 3, attributes_numbers[currentUpgradeState]->upgrade_name[currentUpgradeMenu->currentUpgradeSelection], 14, TRUE, 0);
    // line 3
    draw_text(3, 15, "CASH", 5, TRUE, 0);
    draw_text(8, 15, money_string, 9, FALSE, 0);
}


void change_sub_upgrade_tile_palettes (void) {
    for (uint8_t i = 0; i < 6; i++) {
        if (attributes_numbers[currentUpgradeState]->upgrade_level < i && player.money < attributes_numbers[currentUpgradeState]->upgrade_cost[i]) {
            set_bkg_palette(2 + i, 1, palette_light_grey);
        } else {
            set_bkg_palette(2 + i, 1, &upgrade_tiles_palettes[(currentUpgradeState * 6 + i) * 4]);
            // set_bkg_palette(2 + i, 1, attributes_numbers[currentUpgradeState]->color_palette[i]);
        }
    }
}

void change_main_upgrade_tile_palettes (void) {
    for (uint8_t i = 0; i < 6; i++) {
        set_bkg_palette(2 + i, 1, &upgrade_tiles_palettes[(6 * i + attributes_numbers[i]->upgrade_level) * 4]);
        // set_bkg_palette(2 + i, 1, attributes_numbers[i]->color_palette[attributes_numbers[i]->upgrade_level]);
    }
}


void attempt_upgrade_purchase(UpgradeMenuState currentUpgradeState, UpgradeMenu *currentUpgradeMenu) {
    // Using currentUpgradeState to index directly into the attributes array
    player_attributes *currentAttributes = attributes_numbers[currentUpgradeState];
    uint16_t cost = currentAttributes->upgrade_cost[currentUpgradeMenu->currentUpgradeSelection];
    uint8_t upgrade_to = currentUpgradeMenu->currentUpgradeSelection;

    // Check if the upgrade level is already too high or matches the selection
    if (currentAttributes->upgrade_level >= upgrade_to) {
        return;
    }

    // Check if the player can afford the upgrade
    if (player.money >= cost) {
        // Deduct the cost and upgrade the level
        player.money -= cost;
        currentAttributes->upgrade_level = upgrade_to;
        currentAttributes->max_value = currentAttributes->upgrade_value[upgrade_to];
        currentAttributes->current_value = currentAttributes->upgrade_value[upgrade_to];
    } else {
        return;
        // Handle feedback that the player can't afford the upgrade
        // display_cannot_afford_message();  // Hypothetical function to show error message
    }
}


void handle_upgrade_input(UpgradeMenuState *currentUpgradeState, UpgradeMenu *currentUpgradeMenu) {
        if (prev_buttons != buttons) {
        if (buttons & J_UP) {
            if (currentUpgradeMenu->currentUpgradeSelection > 2) currentUpgradeMenu->currentUpgradeSelection -= 3;
        } else if (buttons & J_DOWN) {
            if (currentUpgradeMenu->currentUpgradeSelection < 3) currentUpgradeMenu->currentUpgradeSelection += 3;
        } else if (buttons & J_LEFT) {
            if (currentUpgradeMenu->currentUpgradeSelection % 3 != 0) currentUpgradeMenu->currentUpgradeSelection--;
        } else if (buttons & J_RIGHT) {
            if ((currentUpgradeMenu->currentUpgradeSelection % 3) != 2) currentUpgradeMenu->currentUpgradeSelection++;
        }

            // Selecting an option with 'A'
        if (buttons & J_A) {
            switch (*currentUpgradeState) {
                case MAIN_MENU:
                    // Assuming main menu has two submenus and four other options
                    if (currentUpgradeMenu->currentUpgradeSelection == 0) *currentUpgradeState = DRILL_MENU;
                    else if (currentUpgradeMenu->currentUpgradeSelection == 1) *currentUpgradeState = HULL_MENU;
                    else if (currentUpgradeMenu->currentUpgradeSelection == 2) *currentUpgradeState = ENGINE_MENU;
                    else if (currentUpgradeMenu->currentUpgradeSelection == 3) *currentUpgradeState = FUEL_MENU;
                    else if (currentUpgradeMenu->currentUpgradeSelection == 4) *currentUpgradeState = RADIATOR_MENU;
                    else if (currentUpgradeMenu->currentUpgradeSelection == 5) *currentUpgradeState = CARGO_MENU;
                    break;
                case DRILL_MENU:
                case HULL_MENU:
                case ENGINE_MENU:
                case FUEL_MENU:
                case RADIATOR_MENU:
                case CARGO_MENU:
                    attempt_upgrade_purchase(*currentUpgradeState, currentUpgradeMenu);
                    break;
                default:
                break; // Other menus may not have purchasable items
            }
        }

        // Going back with 'B'
        if (buttons & J_B) {
            switch (*currentUpgradeState) {
                case MAIN_MENU:
                    leave_station = TRUE;
                    main_menu.currentUpgradeSelection = 0;
                    drill_menu.currentUpgradeSelection = 0;
                    hull_menu.currentUpgradeSelection = 0;
                    engine_menu.currentUpgradeSelection = 0;
                    fuel_menu.currentUpgradeSelection = 0;
                    radiator_menu.currentUpgradeSelection = 0;
                    cargo_menu.currentUpgradeSelection = 0;
                    break;
                case DRILL_MENU:
                case HULL_MENU:
                case ENGINE_MENU:
                case FUEL_MENU:
                case RADIATOR_MENU:
                case CARGO_MENU:
                    *currentUpgradeState = MAIN_MENU; // Go back to the main menu
                    break;
            }
        }
    }
}

void upgrade_menu_loop(void) {

    read_buttons();

    // Check if input has changed the state or selection
    if (prev_buttons != buttons) {
        handle_upgrade_input(&currentUpgradeState, currentUpgradeMenu);
        update_menu = TRUE;  // Set the update flag
    }

    if (update_menu) {
        display_upgrade_menu(currentUpgradeMenu);
        update_upgrade_tick(currentUpgradeState);

        // Update the display and functionality based on the current state
        if (currentUpgradeState == MAIN_MENU) {
            currentUpgradeMenu = &main_menu;
            change_main_upgrade_tile_palettes();
            write_main_upgrade_text();
            load_main_upgrade_tiles();
        } else {
            currentUpgradeMenu = upgrade_menu_numbers[currentUpgradeState];
            change_sub_upgrade_tile_palettes();
            write_sub_upgrade_text();
            load_sub_upgrade_tiles();
        }

        update_menu = FALSE;  // Reset the update flag after updating the screen
    }

    prev_buttons = buttons;
    vsync();
}