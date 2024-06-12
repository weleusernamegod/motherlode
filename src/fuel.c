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
#include "../assets/fuel_display.h"
#include "../assets/fuel_highlight_frame.h"

#include "fuel.h"



#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_fuel)
#endif

metasprite_t metasprite_fuel_highlight_frame[] = {
    {.dy=15, .dx=7, .dtile=0, .props=0},
    {.dy=0, .dx=2, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=2, .dx=0, .dtile=5, .props=0},
    {.dy=8, .dx=0, .dtile=8, .props=0},
    {.dy=0, .dx=-2, .dtile=7, .props=0},
    {.dy=0, .dx=-8, .dtile=7, .props=0},
    {.dy=0, .dx=-8, .dtile=7, .props=0},
    {.dy=0, .dx=-8, .dtile=7, .props=0},
    {.dy=0, .dx=-8, .dtile=6, .props=0},
    {.dy=-2, .dx=0, .dtile=3, .props=0},
	METASPR_TERM
};

void init_fuel(void) {
    set_win_data(fuel_frame_TILE_ORIGIN, fuel_frame_TILE_COUNT, fuel_frame_tiles);
    set_win_tiles(0, 0, 20, 18, fuel_frame_map);
    VBK_REG = 1;
    set_win_tiles(0, 0, 20, 18, fuel_frame_map_attributes);    
    VBK_REG = 0;


    set_bkg_palette(0, 7, fuel_frame_palettes); 
    set_bkg_palette(0, 1, palette_default); // overwrite the palette 0 again

    set_sprite_data(fuel_display_TILE_ORIGIN, fuel_display_TILE_COUNT, fuel_display_tiles);
    set_sprite_palette(FUEL_DISPLAY_PALETTE, 1, fuel_display_palettes);

    set_sprite_data(fuel_highlight_frame_TILE_ORIGIN, fuel_highlight_frame_TILE_COUNT, fuel_highlight_frame_tiles); // blank tile in the end
}

void draw_fuel_display(void) {
    move_metasprite_ex(fuel_display_metasprites[0], fuel_display_TILE_ORIGIN, 0b10000000 | FUEL_DISPLAY_PALETTE, FUEL_DISPLAY_START, 40, 50 + fuel_display_y);
}

void hide_fuel_display(void) {
    hide_metasprite(fuel_display_metasprites[0], FUEL_DISPLAY_START);
}

void draw_fuel_menu(void) {
    // Title
    draw_text(2, 2, "SERVICE STATION", 16, TRUE, 0);

    char money_string[16];
    char cost_string[8];
    char inventory_string[6];
    char max_value_string[10];
    char current_value_string[10];
    char missing_value_string[10];

    ultoa(player.money, money_string, 10);
    strcat(money_string, "$");
    // Line 1
    draw_text(7, 10, powerup[current_powerup_selection].name, 11, TRUE, 0);

    if (current_powerup_selection > OPTION_REPAIR){
        powerup_cost = powerup[current_powerup_selection].cost;
        ultoa(powerup_cost, cost_string, 10);
        strcat("-", cost_string);
        strcat(cost_string, "$");

        ultoa(powerup[current_powerup_selection].inventory, inventory_string, 10);
        strcat(inventory_string, "*");
        
        // Line 2
        //draw_text(7, 11, powerup[current_powerup_selection].description, 11, TRUE, 0);

        // Line 3
        draw_text(7, 12, inventory_string, 6, TRUE, 0);
        draw_text(12, 12, "in bag", 6, FALSE, 0);

        // Line 4
        draw_text(7, 13, "1*", 5, TRUE, 0);
        draw_text(12, 13, cost_string, 6, FALSE, 0);

    } else {
        uint8_t current_attribute = 0;
        if (current_powerup_selection == OPTION_FUEL_UP) {
            current_attribute = ATTRIBUTE_FUEL;
            powerup_cost = calculate_fuel_cost();
            ultoa(powerup_cost, cost_string, 10);
        }
        else if (current_powerup_selection == OPTION_REPAIR) {
            current_attribute = ATTRIBUTE_HULL;
            powerup_cost = calculate_hull_cost();
            ultoa(powerup_cost, cost_string, 10);
        }
        strcat(cost_string, "$");

        ultoa(attributes_numbers[current_attribute]->max_value, max_value_string, 10);
        ultoa(attributes_numbers[current_attribute]->current_value, current_value_string, 10);
        ultoa(attributes_numbers[current_attribute]->max_value - attributes_numbers[current_attribute]->current_value, missing_value_string, 10);

        // Line 2
        // draw_text(7, 11, powerup[current_powerup_selection].description, 11, TRUE, 0);
        // Line 3
        draw_text(7, 12, current_value_string, 3, FALSE, 0);
        draw_text(10, 12, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);
        draw_text(11, 12, " / ", 3, TRUE, 0);
        draw_text(14, 12, max_value_string, 3, FALSE, 0);
        draw_text(17, 12, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);

        // Line 4
        if (attributes_numbers[current_attribute]->max_value - attributes_numbers[current_attribute]->current_value != 0) {
            draw_text(7, 13, missing_value_string, 3, FALSE, 0);
            draw_text(10, 13, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);
            // Line 7
            draw_text(12, 13, cost_string, 6, FALSE, 0);

        } else {
            draw_text(7, 13, "full", 11, FALSE, 0);
        }

    }

    draw_text(7, 15, "CASH", 4, TRUE, 0);
    draw_text(11, 15, money_string, 7, FALSE, 0);
}

uint16_t calculate_fuel_cost(void) {
    uint16_t fuel_needed = player.fuel.max_value - player.fuel.current_value;
    uint16_t fuel_cost = fuel_needed / FUEL_PRICE; // 1 dineros per liter, good price
    return fuel_cost;
}
void set_fuel_display_y(void) {
    fuel_display_y = check_fuel_display_y();
}

uint8_t check_fuel_display_y(void) {
    uint32_t current_value_32 = player.fuel.current_value;
    return (80 - (current_value_32 * 80 / player.fuel.max_value));
}

void fuel_up(void) {
    uint16_t fuel_cost = calculate_fuel_cost();
    // 80 is the length of the bar, so if the fuel is full, it should be at the top
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

uint16_t calculate_hull_cost(void) {
    uint16_t hull_needed = player.hull.max_value - player.hull.current_value;
    uint16_t hull_cost = hull_needed * REPAIR_PRICE;
    return hull_cost;
}

void repair_hull(void) {
    uint16_t hull_cost = calculate_hull_cost();
    if (player.money >= hull_cost) {
        // Player has enough money to fully fuel up
        player.money -= hull_cost;
        player.hull.current_value = player.hull.max_value;
    } else {
        // Player doesn't have enough money to fully fuel up
        uint16_t affordable_hull = player.money * 3; // calculate how much fuel they can afford
        player.hull.current_value += affordable_hull;
        player.money = 0;
    }
}


void purchase_powerup(void) {
    uint16_t powerup_cost = powerup[current_powerup_selection].cost;
    if (player.money >= powerup_cost) {
        // Player has enough money to fully fuel up
        player.money -= powerup_cost;
        powerup[current_powerup_selection].inventory ++;
    }
}

void update_fuel_highlight_frame_position(void) {
    uint8_t x, y;
    if (current_powerup_selection < 2) {
        // First row (0 and 1)
        x = 56 + (current_powerup_selection * 6 * 8) -1;
        y = 32 -1;
        // metasprite_fuel_highlight_frame[2].dx = 8;
        // metasprite_fuel_highlight_frame[3].dx = 8;
        // metasprite_fuel_highlight_frame[4].dx = 8;
        // metasprite_fuel_highlight_frame[9].dx = -8;
        // metasprite_fuel_highlight_frame[10].dx = -8;
        // metasprite_fuel_highlight_frame[11].dx = -8;
    } else {
        // Second row (2 to 5), closer spacing
        x = 56 + ((current_powerup_selection - 2) * 3 * 8) -1;  // Adjusted horizontal spacing
        y = 56 -1;
        // metasprite_fuel_highlight_frame[2].dx = 0;
        // metasprite_fuel_highlight_frame[3].dx = 0;
        // metasprite_fuel_highlight_frame[4].dx = 0;
        // metasprite_fuel_highlight_frame[9].dx = -0;
        // metasprite_fuel_highlight_frame[10].dx = -0;
        // metasprite_fuel_highlight_frame[11].dx = -0;
    }
    move_metasprite_ex(fuel_highlight_frame_metasprites[(frame_counter >> 2) % 4], fuel_highlight_frame_TILE_ORIGIN, 0, 0, x, y);
}
// void draw_a_button(void){
//     if (animation_frames_left == 0 && (frame_counter % (60 / (sizeof(a_button_metasprites) >> 1)) == 0)) {
//             move_metasprite_ex(a_button_metasprites[], a_button_TILE_ORIGIN, RESERVE_PALETTE, A_BUTTON_START, width_pixel.h, depth_pixel.h + 16);
//     }
// }

void handle_fuel_input(void) {
    if (prev_buttons != buttons) {
        if (buttons & J_UP) {
            if (current_powerup_selection >= 2 && current_powerup_selection <= 3) {
                current_powerup_selection = 0;
            } else if (current_powerup_selection >= 4) {
                current_powerup_selection = 1;
            }
        } else if (buttons & J_DOWN) {
            if (current_powerup_selection == 0) {
                current_powerup_selection = 2;
            } else if (current_powerup_selection == 1) {
                current_powerup_selection = 4;
            }
        } else if (buttons & J_LEFT) {
            if (current_powerup_selection > 0 && current_powerup_selection != 2) {
                current_powerup_selection--;
            }
        } else if (buttons & J_RIGHT) {
            if (current_powerup_selection < 5 && current_powerup_selection != 1) {
                current_powerup_selection++;
            }
        }


            // Selecting an option with 'A'
        if (buttons & J_A) {
            switch (current_powerup_selection) {
                case OPTION_FUEL_UP:
                    fuel_up();
                    display_warning_cargo = FALSE;
                    break;
                case OPTION_REPAIR:
                    repair_hull();
                    break;
                case OPTION_EXTRA_TANK:
                case OPTION_REPAIR_KIT:
                case OPTION_DYNAMITE:
                case OPTION_TELEPORTER:
                    purchase_powerup();
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
        handle_fuel_input();
        update_menu = TRUE;  // Set the update flag
    }

    if (update_menu) {
        draw_fuel_menu();
        update_menu = FALSE;  // Reset the update flag after updating the screen
    }

    update_fuel_highlight_frame_position();
    prev_buttons = buttons;
    vsync();
}
