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

#include "../assets/fuel_frame.h"
#include "../assets/fuel_highlight_frame.h"

#include "fuel.h"



#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_fuel)
#endif

metasprite_t metasprite_fuel_highlight_frame[] = {
    {.dy=15, .dx=7, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=2, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0b00100000},
    {.dy=2, .dx=0, .dtile=3, .props=0},
    {.dy=8, .dx=0, .dtile=1, .props=0b01100000},
    {.dy=0, .dx=-8, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-8, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-8, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-2, .dtile=2, .props=0b01000000},
    {.dy=0, .dx=-8, .dtile=1, .props=0b01000000},
    {.dy=-2, .dx=0, .dtile=3, .props=0b00100000},
	METASPR_TERM
};

FuelMenu *fuel_menu_numbers[] = {
    &option_fuel_up,
    &option_repair,
    &option_reserve_tank,
    &option_dynamite,
    &option_repair_kit,
    &option_teleporter,
};

FuelMenu option_fuel_up = {0};
FuelMenu option_repair = {0};
FuelMenu option_reserve_tank = {0};
FuelMenu option_dynamite = {0};
FuelMenu option_repair_kit = {0};
FuelMenu option_teleporter = {0};

FuelMenuState currentFuelState = OPTION_DYNAMITE;
FuelMenu *currentFuelMenu = &option_repair;

void init_fuel(void) {
    set_sprite_palette(0, 1, palette_default);
    set_sprite_palette(1, 1, palette_light_grey);

    set_win_data(fuel_frame_TILE_ORIGIN, fuel_frame_TILE_COUNT, fuel_frame_tiles);
    set_win_tiles(0, 0, 20, 18, fuel_frame_map);

    set_bkg_palette(0, 1, palette_default);
    set_bkg_palette(1, 1, palette_light_grey);

    set_sprite_data(1, fuel_highlight_frame_TILE_COUNT, fuel_highlight_frame_tiles); // blank tile in the end
    move_metasprite_ex(metasprite_fuel_highlight_frame, 0, 0, 0, 24, 40);
}

void draw_fuel_menu(void) {
    draw_text(2, 2, "FUEL/REPAIR/SHOP", 16, TRUE, 0);
}

void fuel_up(void) {
    uint16_t fuel_needed = player.fuel.max_value - player.fuel.current_value;
    uint16_t fuel_cost = fuel_needed / 3; // 1 dineros per liter, good price

    if (player.money >= fuel_cost) {
        // Player has enough money to fully fuel up
        player.money -= fuel_cost;
        player.fuel.current_value = player.fuel.max_value;
    } else {
        // Player doesn't have enough money to fully fuel up
        uint16_t affordable_fuel = player.money * 3; // calculate how much fuel they can afford
        player.fuel.current_value += affordable_fuel;
        player.money = 0;
    }
}

void update_fuel_highlight_frame_position(uint8_t selection) {
    uint8_t x, y;
    if (selection < 2) {
        // First row (0 and 1)
        x = 56 + (selection * 6 * 8);
        y = 32;
        metasprite_fuel_highlight_frame[1].dx = 8;
        metasprite_fuel_highlight_frame[2].dx = 8;
        metasprite_fuel_highlight_frame[3].dx = 8;
        metasprite_fuel_highlight_frame[8].dx = -8;
        metasprite_fuel_highlight_frame[9].dx = -8;
        metasprite_fuel_highlight_frame[10].dx = -8;
    } else {
        // Second row (2 to 5), closer spacing
        x = 56 + ((selection - 2) * 3 * 8);  // Adjusted horizontal spacing
        y = 56;
        metasprite_fuel_highlight_frame[1].dx = 0;
        metasprite_fuel_highlight_frame[2].dx = 0;
        metasprite_fuel_highlight_frame[3].dx = 0;
        metasprite_fuel_highlight_frame[8].dx = -0;
        metasprite_fuel_highlight_frame[9].dx = -0;
        metasprite_fuel_highlight_frame[10].dx = -0;
    }
    move_metasprite_ex(metasprite_fuel_highlight_frame, 0, 0, 0, x, y);
}

void display_fuel_menu(FuelMenu *menu) {
    update_fuel_highlight_frame_position(menu->currentFuelSelection);
}

void handle_fuel_input(FuelMenuState *currentFuelState, FuelMenu *currentFuelMenu) {
    if (prev_buttons != buttons) {
        if (buttons & J_UP) {
            if (currentFuelMenu->currentFuelSelection >= 2 && currentFuelMenu->currentFuelSelection <= 3) {
                currentFuelMenu->currentFuelSelection = 0;
            } else if (currentFuelMenu->currentFuelSelection >= 4) {
                currentFuelMenu->currentFuelSelection = 1;
            }
        } else if (buttons & J_DOWN) {
            if (currentFuelMenu->currentFuelSelection == 0) {
                currentFuelMenu->currentFuelSelection = 2;
            } else if (currentFuelMenu->currentFuelSelection == 1) {
                currentFuelMenu->currentFuelSelection = 4;
            }
        } else if (buttons & J_LEFT) {
            if (currentFuelMenu->currentFuelSelection > 0 && currentFuelMenu->currentFuelSelection != 2) {
                currentFuelMenu->currentFuelSelection--;
            }
        } else if (buttons & J_RIGHT) {
            if (currentFuelMenu->currentFuelSelection < 5 && currentFuelMenu->currentFuelSelection != 1) {
                currentFuelMenu->currentFuelSelection++;
            }
        }


            // Selecting an option with 'A'
        if (buttons & J_A) {
            switch (*currentFuelState) {
                case OPTION_FUEL_UP:
                case OPTION_REPAIR:
                case OPTRION_RESERVE_TANK:
                case OPTION_DYNAMITE:
                case OPTION_REPAIR_KIT:
                case OPTION_TELEPORTER:
                    break;
                default:
                break; // Other menus may not have purchasable items
            }
        }
        // Going back with 'B'
        if (buttons & J_B) {
                leave_station = TRUE;
        }
    }
}

void fuel_menu_loop(void) {

    read_buttons();

    // Check if input has changed the state or selection
    if (prev_buttons != buttons) {
        handle_fuel_input(&currentFuelState, currentFuelMenu);
        update_menu = TRUE;  // Set the update flag
    }

    if (update_menu) {
        display_fuel_menu(currentFuelMenu);

        // Update the display and functionality based on the current state
        // if (currentFuelState == MAIN_MENU) {
        //     currentFuelMenu = &main_menu;
        //     change_main_fuel_tile_palettes();
        //     write_main_fuel_text();
        //     load_main_fuel_tiles();
        // } else {
        //     currentFuelMenu = fuel_menu_numbers[currentFuelState];
        //     change_sub_fuel_tile_palettes();
        //     write_sub_fuel_text();
        //     load_sub_fuel_tiles();
        // }

        update_menu = FALSE;  // Reset the update flag after updating the screen
    }

    prev_buttons = buttons;
    vsync();
}
