
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
        }
        clear_4bkg_tiles(width, wrapped_depth);
        tile_mined = FALSE;
        ore_mined = FALSE;
    }

    // player has moved one block
    if (prev_depth != depth) {
        spawn_bkg_row();
        draw_depth();
        change_background_color();
        update_palette_based_on_depth();
        swap_tiles_sky_buildings();
        calculate_upward_velocity();
    }

    if (depth_offset < UNDERGROUND && frame_counter == 1) change_sky_color();

    if (buttons & J_UP) metasprite_prop(); // have prop moving even if the player is stuck but trying to get up


    handle_fuel();
    handle_hull();

    // check if player enters a station
    proximity_check_station();
    enter_station();

    // game over?
    check_game_over();

    // Update the previous button state for the next check
    prev_buttons = buttons;
    prev_depth = depth;
    prev_width = width;
    prev_velocity = velocity;

    vsync();
}

