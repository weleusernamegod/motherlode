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

#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_fuel)
#endif

void init_fuel(void) {
    set_sprite_palette(0, 1, palette_default);
    set_sprite_palette(1, 1, palette_light_grey);

    set_win_data(fuel_frame_TILE_ORIGIN, fuel_frame_TILE_COUNT, fuel_frame_tiles);
    set_win_tiles(0, 0, 20, 18, fuel_frame_map);

    set_bkg_palette(0, 1, palette_default);
    set_bkg_palette(1, 1, palette_light_grey);
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
