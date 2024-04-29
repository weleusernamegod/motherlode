
#include <gb/gb.h>
#include <stdio.h>
#include <stdbool.h>

#include "globals.h"
#include "constants.h"

#include "player.h"
#include "inventory.h"
#include "general.h"
#include "map.h"

#include "level.h"



void game_loop(void) {

    read_buttons();
    check_surroundings();

    if (animation_frames_left == 0) {
        initiate_movement();
    }

    update_movement();

    if (tile_mined == TRUE) {
        if (depth >= EARTH_START) clear_4bkg_tiles(level_array, width, depth);
        update_inventory();
        calculate_cargo();
        draw_cargo();
        tile_mined = FALSE;
    }

    update_fuel();
    draw_fuel();
    draw_hull();
    calculate_falldamage();
    check_hull();
    check_fuel();
    check_game_over();

    if (prev_depth != depth) {
        spawn_bkg_row();
        draw_depth();
        change_background_color();
    }
    
    check_enter_buildings();

    // Update the previous button state for the next check
    prev_buttons = buttons;
    prev_depth = depth;
    prev_width = width;

    wait_vbl_done();
}

