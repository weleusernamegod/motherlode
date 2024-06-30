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

#include "../assets/powerup_frame.h"
#include "../assets/fuel_display.h"
#include "../assets/highlight_frame.h"

#include "powerup.h"
#include "selection.h"

#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_powerup)
#endif

void init_powerup(void) {
    set_win_data(powerup_frame_TILE_ORIGIN, powerup_frame_TILE_COUNT, powerup_frame_tiles);
    set_win_tiles(0, 0, 20, 18, powerup_frame_map);
    VBK_REG = 1;
    set_win_tiles(0, 0, 20, 18, powerup_frame_map_attributes);    
    VBK_REG = 0;

    set_bkg_palette(0, 7, powerup_frame_palettes); 
    set_bkg_palette(0, 1, palette_default); // overwrite the palette 0 again

    set_sprite_data(fuel_display_TILE_ORIGIN, fuel_display_TILE_COUNT, fuel_display_tiles);
    set_sprite_palette(FUEL_DISPLAY_PALETTE, 1, fuel_display_palettes);

    init_highlight_frame();
}

void draw_fuel_display(void) {
    move_metasprite_ex(fuel_display_metasprites[0], fuel_display_TILE_ORIGIN, 0b10000000 | FUEL_DISPLAY_PALETTE, FUEL_DISPLAY_START, 40, 50 + fuel_display_y);
}

void hide_fuel_display(void) {
    hide_metasprite(fuel_display_metasprites[0], FUEL_DISPLAY_START);
}

void draw_powerup_menu(void) {
    // Title
    draw_text_win(2, 2, "SERVICE STATION", 16, TRUE, 0);

    char money_string[16];
    char cost_string[8];
    char inventory_string[6];
    char max_value_string[10];
    char current_value_string[10];
    char missing_value_string[10];

    ultoa(player.money, money_string, 10);
    strcat(money_string, "$");
    // Line 1
    draw_text_win(7, 10, powerup[current_powerup_selection].name, 11, TRUE, 0);

    if (current_powerup_selection > OPTION_REPAIR){
        powerup_cost = powerup[current_powerup_selection].cost;
        ultoa(powerup_cost, cost_string, 10);
        strcat("-", cost_string);
        strcat(cost_string, "$");

        ultoa(powerup[current_powerup_selection].inventory, inventory_string, 10);
        strcat(inventory_string, "*");
        
        // Line 2
        //draw_text_win(7, 11, powerup[current_powerup_selection].description, 11, TRUE, 0);

        // Line 3
        draw_text_win(7, 12, inventory_string, 6, TRUE, 0);
        draw_text_win(12, 12, "in bag", 6, FALSE, 0);

        // Line 4
        draw_text_win(7, 13, "1*", 5, TRUE, 0);
        draw_text_win(12, 13, cost_string, 6, FALSE, 0);

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
        // draw_text_win(7, 11, powerup[current_powerup_selection].description, 11, TRUE, 0);
        // Line 3
        draw_text_win(7, 12, current_value_string, 3, FALSE, 0);
        draw_text_win(10, 12, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);
        draw_text_win(11, 12, " / ", 3, TRUE, 0);
        draw_text_win(14, 12, max_value_string, 3, FALSE, 0);
        draw_text_win(17, 12, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);

        // Line 4
        if (attributes_numbers[current_attribute]->max_value - attributes_numbers[current_attribute]->current_value != 0) {
            draw_text_win(7, 13, missing_value_string, 3, FALSE, 0);
            draw_text_win(10, 13, attributes_numbers[current_attribute]->attribute_unit_short, 1, TRUE, 0);
            // Line 7
            draw_text_win(12, 13, cost_string, 6, FALSE, 0);

        } else {
            draw_text_win(7, 13, "full", 11, FALSE, 0);
        }

    }

    draw_text_win(7, 15, "CASH", 4, TRUE, 0);
    draw_text_win(11, 15, money_string, 7, FALSE, 0);
}

uint16_t calculate_fuel_cost(void) {
    uint16_t fuel_needed = player.fuel.max_value - player.fuel.current_value;
    uint16_t fuel_cost = (fuel_needed + (FUEL_PRICE - 1)) / FUEL_PRICE; // Round up fuel cost
    
    // If the fuel is not full and the cost is 0, set the minimum cost to 1
    if (player.fuel.current_value != player.fuel.max_value && fuel_cost == 0) {
        fuel_cost = 1;
    }

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
        uint16_t affordable_fuel = player.money * FUEL_PRICE; // calculate how much fuel they can afford
        player.fuel.current_value += affordable_fuel;
        player.money = 0;
    }
    
    // Ensure the fuel doesn't exceed max value
    if (player.fuel.current_value > player.fuel.max_value) {
        player.fuel.current_value = player.fuel.max_value;
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

void update_powerup_highlight_frame_position(void) {
    uint8_t x, y;
    uint8_t current_animation_frame = (frame_counter >> 2) % 4;
    metasprite_t* frame_metasprite = dynamic_highlight_frame_metasprites[current_animation_frame];

    if (current_powerup_selection < 2) {
        // First row (0 and 1)
        x = 56 + (current_powerup_selection * 6 * 8) - 1;
        y = 32 - 1;

        // Expand metasprite
        frame_metasprite[1].dx = 8;
        frame_metasprite[2].dx = 8;
        frame_metasprite[3].dx = 8;
        frame_metasprite[4].dx = 8;

        frame_metasprite[6].dy = 8;
        frame_metasprite[7].dy = 0;
        frame_metasprite[8].dy = 0;

        frame_metasprite[10].dx = -8;
        frame_metasprite[11].dx = -8;
        frame_metasprite[12].dx = -8;
        frame_metasprite[13].dx = -8;

        frame_metasprite[15].dy = -8;
        frame_metasprite[16].dy = 0;
        frame_metasprite[17].dy = 0;
    } else {
        // Second row (2 to 5), closer spacing
        x = 56 + ((current_powerup_selection - 2) * 3 * 8) - 1;  // Adjusted horizontal spacing
        y = 56 - 1;

        // Shrink metasprite
        frame_metasprite[1].dx = 8;
        frame_metasprite[2].dx = 0;
        frame_metasprite[3].dx = 0;
        frame_metasprite[4].dx = 0;

        frame_metasprite[6].dy = 8;
        frame_metasprite[7].dy = 0;
        frame_metasprite[8].dy = 0;

        frame_metasprite[10].dx = -8;
        frame_metasprite[11].dx = 0;
        frame_metasprite[12].dx = 0;
        frame_metasprite[13].dx = 0;

        frame_metasprite[15].dy = -8;
        frame_metasprite[16].dy = 0;
        frame_metasprite[17].dy = 0;
    }

    move_metasprite_ex(dynamic_highlight_frame_metasprites[current_animation_frame], highlight_frame_TILE_ORIGIN, HIGHLIGHT_FRAME_PALETTE, 0, x, y);
}

void handle_powerup_input(void) {
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
                    display_warning_fuel_normal = FALSE;
                    break;
                case OPTION_REPAIR:
                    repair_hull();
                    display_warning_hull_normal = FALSE;
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

void powerup_menu_loop(void) {
    read_buttons();

    // Check if input has changed the state or selection
    if (prev_buttons != buttons) {
        handle_powerup_input();
        update_menu = TRUE;  // Set the update flag
    }

    if (update_menu) {
        draw_powerup_menu();
        update_menu = FALSE;  // Reset the update flag after updating the screen
    }

    update_powerup_highlight_frame_position();
    prev_buttons = buttons;
    vsync();
}
