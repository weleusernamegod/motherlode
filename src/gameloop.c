
#include <gb/gb.h>
#include <stdio.h>
#include <stdbool.h>

#include "globals.h"
#include "constants.h"

#include "player.h"
#include "inventory.h"
#include "general.h"
#include "map.h"

#include "level.ba0.h"



void game_loop(void) {

    read_buttons();
    check_surroundings();
    if (animation_frames_left == 0) {
        initiate_movement();
    }

    update_movement();

    if (tile_mined == TRUE) {
        if (ore_mined == TRUE) {
            update_inventory();
            calculate_cargo();
            draw_cargo();
        }
        clear_4bkg_tiles(width, depth);
        tile_mined = FALSE;
        ore_mined = FALSE;
    }

    update_fuel();
    draw_fuel();
    draw_hull();
    calculate_falldamage();
    check_hull();
    check_fuel();
    draw_warning_fuel();
    draw_warning_cargo();
    check_game_over();

    // player has moved one block
    if (prev_depth != depth) {
        spawn_bkg_row();
        draw_depth();
        change_background_color();
        update_palette_based_on_depth();
        swap_tiles_sky_buildings();
    }
    
    proximity_check_station();
    enter_station();


    // Update the previous button state for the next check
    prev_buttons = buttons;
    prev_depth = depth;
    prev_width = width;

    vsync();
}

