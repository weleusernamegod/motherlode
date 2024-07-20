
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
#include "sfx.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(gameloop)
#endif

void game_loop(void) {

    read_buttons();
    handle_powerups();

    check_surroundings();
    if (animation_frames_left == 0) {
        initiate_movement();
    }
    update_movement();
    switch_ram_bank_based_on_value(depth);

    if (tile_mined == TRUE) {
        if (ore_mined == TRUE) {
            update_inventory();
            handle_cargo();
            if (display_warning_cargo_normal == FALSE) PLAY_SFX_level_up; else PLAY_SFX_hit;
        }
        if (lava_mined == TRUE) {
            
        }
        clear_4bkg_tiles(width, wrapped_depth);
        tile_mined = FALSE;
        ore_mined = FALSE;
    }

    // player has moved one block
    if (prev_depth != depth) {
        calculate_upward_velocity();
        draw_depth();
    }

    // screen has moved one block
    if (prev_depth_offset != depth_offset || reload_palettes == TRUE) {
        spawn_bkg_row();
        swap_tiles_sky_buildings();
        update_palette_based_on_depth();

        if (depth_offset < DEPTH_CHANGE){
            change_sky_color();
            change_background_color();
        } else {
            change_background_color();
        }
        reload_palettes = FALSE;
    }



    if (buttons & J_UP) metasprite_prop(); // have prop moving even if the player is stuck but trying to get up
    
    handle_fuel(TRUE); // reduce CPU work by 59/60% by using optimisation
    handle_hull(TRUE);

    // check if player enters a station
    proximity_check_station();
    enter_station();

    // game over?
    check_game_over();

    // Update the previous button state for the next check
    prev_buttons = buttons;
    prev_depth = depth;
    prev_width = width;
    prev_depth_offset = depth_offset;
    prev_velocity = velocity;

    vsync();
}

