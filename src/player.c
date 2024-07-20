#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/console.h>
#include <gbdk/font.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "globals.h"
#include "general.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "map.h"

#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/drill_h.h"
#include "../assets/drill_v.h"
#include "../assets/prop.h"

#include "level.h"
#include "sfx.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(bank_player)
#endif

struct Player player;

void init_depth(uint16_t start_width, uint16_t start_depth){
    direction_prev = RIGHT;    // start with the rover facing right
    width = prev_width = start_width;
    depth = prev_depth = wrapped_depth = start_depth;
    width_offset = depth_offset = 0;
    width_pixel.h = 16 + ((width - width_offset) * 16);
    depth_pixel.h = 16 + 8 + ((depth - depth_offset) * 16);
    scroll_x.h = width_offset * 16;
    scroll_y.h = depth_offset * 16;
}

void init_speed(void){
    move_x_per_frame.w = 0;
    move_y_per_frame.w = 0;
    scroll_x_per_frame.w = 0;
    scroll_y_per_frame.w = 0;
    scroll_x.w = 0;
    scroll_y.w = 0;
}

void check_surroundings(void) {
next_tile_down = (depth < ROWS - 1) ? get_tile_from_array(depth + 1, width) : STONE;
next_tile_up = (depth > 0) ? get_tile_from_array(depth - 1, width) : STONE;
next_tile_right = (width < 15) ? get_tile_from_array(depth, width + 1) : STONE;
next_tile_left = (width > 0) ? get_tile_from_array(depth, width - 1) : STONE;
}

void metasprite_drill_horizontal(char direction){
    if (direction == LEFT) move_metasprite_ex (
        drill_h_metasprites[(absolute_movement / 3) % (sizeof(drill_h_metasprites) >> 1)],
        drill_h_TILE_ORIGIN,
        DRILL_PALETTE,
        DRILL_H_START,
        width_pixel.h - PIXEL_FROM_CENTER,
        depth_pixel.h);
    else if (direction == RIGHT) move_metasprite_flipx (
        drill_h_metasprites[(absolute_movement / 3) % (sizeof(drill_h_metasprites) >> 1)],
        drill_h_TILE_ORIGIN,
        DRILL_PALETTE,
        DRILL_H_START,
        width_pixel.h + PIXEL_FROM_CENTER,
        depth_pixel.h);
}
void metasprite_drill_vertical(char direction){
    if (direction == DOWN) move_metasprite_ex(
        drill_v_metasprites[(absolute_movement / 3) % (sizeof(drill_v_metasprites) >> 1)],
        drill_v_TILE_ORIGIN,
        DRILL_PALETTE,
        DRILL_V_START,
        width_pixel.h,
        depth_pixel.h + PIXEL_FROM_CENTER);

}
void metasprite_prop(void){
    if (velocity != 0) move_metasprite_ex(
        prop_metasprites[frame_counter % (sizeof(prop_metasprites) >> 1)],
        prop_TILE_ORIGIN,
        ROVER_PALETTE_0,
        PROP_START,
        width_pixel.h,
        depth_pixel.h - PIXEL_FROM_CENTER);
}

void metasprite_rover(char direction, BOOLEAN animate){
    hide_metasprite(drill_h_metasprites[0], DRILL_H_START);
    hide_metasprite(drill_v_metasprites[0], DRILL_V_START);
    hide_metasprite(prop_metasprites[0], PROP_START);

    fixed drill_wiggle; // add some wiggle if drilling
    drill_wiggle.h = depth_pixel.h - is_drilling * absolute_movement / 2 % 2;


    if (direction == LEFT) {
        // rover
        move_metasprite_ex(
        rover_metasprites[0],
        rover_TILE_ORIGIN,
        ROVER_PALETTE_0,
        ROVER_START,
        width_pixel.h,
        drill_wiggle.h); 

        // eye
        move_metasprite_ex(
        rover_eye_metasprites[0],
        rover_eye_TILE_ORIGIN,
        ICON_PALETTE,
        EYE_START,
        width_pixel.h,
        drill_wiggle.h);

        // tracks
        move_metasprite_ex(
        tracks_metasprites[animate * (absolute_movement % (sizeof(tracks_metasprites) >> 1))],
        tracks_TILE_ORIGIN,
        TRACKS_PALETTE,
        TRACKS_START,
        width_pixel.h,
        depth_pixel.h + tracks_PIVOT_Y); // offset because the metasprite is centered
    } else if (direction == RIGHT) {

        // rover
        move_metasprite_flipx(
        rover_metasprites[0],
        rover_TILE_ORIGIN,
        ROVER_PALETTE_0,
        ROVER_START,
        width_pixel.h,
        drill_wiggle.h);

        // eye
        move_metasprite_flipx(
        rover_eye_metasprites[0],
        rover_eye_TILE_ORIGIN,
        ICON_PALETTE,
        EYE_START,
        width_pixel.h,
        drill_wiggle.h);

        // tracks
        move_metasprite_flipx(
        tracks_metasprites[animate * (absolute_movement % (sizeof(tracks_metasprites) >> 1))],
        tracks_TILE_ORIGIN,
        TRACKS_PALETTE,
        TRACKS_START,
        width_pixel.h,
        depth_pixel.h + tracks_PIVOT_Y); // offset because the metasprite is centered
    }
}

void draw_metasprite(char direction){
    if (direction == LEFT || direction == RIGHT){
        metasprite_rover(direction, TRUE);
        if (is_drilling == TRUE) metasprite_drill_horizontal(direction);
    } else if (direction == UP || direction == DOWN) {
        metasprite_rover(direction_prev, FALSE);
        //if (direction == UP) metasprite_prop();
        if (is_drilling == TRUE) metasprite_drill_vertical(direction);
    }
}

void move_or_scroll_character(void){
    draw_metasprite(direction_now);
    move_bkg(scroll_x.h, scroll_y.h);
}

void update_movement(void) {
    if (animation_frames_left > 0) {

        // incrementally add to the x and y values
        scroll_x.w += scroll_x_per_frame.w;
        scroll_y.w += scroll_y_per_frame.w;
        width_pixel.w += move_x_per_frame.w;
        depth_pixel.w += move_y_per_frame.w;

        // Update vertical and horizontal pixel counts with absolute movements
        vertical_movement_pixel.w += abs(scroll_y_per_frame.w) + abs(move_y_per_frame.w);
        horizontal_movement_pixel.w += abs(scroll_x_per_frame.w) + abs(move_x_per_frame.w);

        // Convert word to higher precision signed values
        vertical_movement = vertical_movement_pixel.h;
        horizontal_movement = horizontal_movement_pixel.h;

        // Calculate absolute movement by summing vertical and horizontal components
        absolute_movement = vertical_movement + horizontal_movement;

        // move or scroll background
        move_or_scroll_character();

        // increment frame counter
        animation_frames_left--;

        // Check if it's time to decrement fuel
        if (animation_frames_left % 20 == 0) {  // Every 20 frames
            player.fuel.current_value -= 1;
        }

        // Reset movement and input when animation is complete
        if (animation_frames_left == 0) {
            move_x_per_frame.w = 0;
            move_y_per_frame.w = 0;
            scroll_x_per_frame.w = 0;
            scroll_y_per_frame.w = 0;
            vertical_movement_pixel.w = 0;
            vertical_movement = 0;
            horizontal_movement_pixel.w = 0;
            horizontal_movement = 0;
            current_bkg_color = depth * 16;
            absolute_movement = 0;

            // reset position (h and l) to account for rounding errors
            width_pixel.h = 16 + (width - width_offset) * 16, width_pixel.l = 0;
            depth_pixel.h = 24 + (depth - depth_offset) * 16, depth_pixel.l = 0;
            scroll_x.h = width_offset * 16, scroll_x.l = 0;
            scroll_y.h = depth_offset * 16, scroll_y.l = 0;  

            prev_depth = depth;
            wrapped_depth = depth % 256;
            width_pixel.h = 16 + ((width - width_offset) * 16);
            depth_pixel.h = 16 + 8 + (depth - depth_offset) * 16;
            scroll_x.h = width_offset * 16;
            scroll_y.h = depth_offset * 16;
            
            // animation has ended, so the rover has stopped drilling
            is_drilling = FALSE;
            // the player has cleared a tile, so set flag to update inventory
            if (level_array[wrapped_depth][width] != EMPTY && depth >= UNDERGROUND) {
                tile_mined = TRUE;
                uint8_t tile = level_array[wrapped_depth][width];

                switch (tile) {
                    case LAVA:
                        lava_mined = TRUE;
                        break;

                    case GAS:
                        gas_mined = TRUE;
                        break;

                    default:
                        if (tile >= MIN_MINABLE_MATERIAL && tile <= MAX_MINABLE_MATERIAL) {
                            ore_mined = TRUE;
                        }
                        break;
                }
            }

            // redraw character / scroll again to make sure the rounding errors are gone
            draw_metasprite(direction_now);
            //update_sprite_character(width_pixel, depth_pixel);
            move_bkg(scroll_x.h, scroll_y.h);

        }
    }
}

uint8_t calculate_frames(void){
    uint8_t frames;
    frames = base_drilltime + (materials[next_tile].ore_resistance / player.drill.max_value);
    return frames;
}

fixed calculate_speed(uint8_t frames){
    fixed speed;
    speed.w = 4096 / frames;
    return speed;
}

void move_left(uint8_t frames){
    player.speed = calculate_speed(frames);
    if (width - width_offset == THRESHOLD && width > THRESHOLD) {
        width_offset--;
        width--;
        scroll_x_per_frame.w = - player.speed.w;
    } else if (width > 0) {
        width--;
        move_x_per_frame.w = - player.speed.w;
    } else return;
    animation_frames_left = frames;
}

void move_right(uint8_t frames){
    player.speed = calculate_speed(frames);
    if (width - width_offset == (METATILES_VISIBLE - THRESHOLD) + 1 && width < (METATILES_VISIBLE - THRESHOLD) + 7) {
        width_offset++;
        width++;
        scroll_x_per_frame.w = player.speed.w;
    } else if (width < 15) {
        width++;
        move_x_per_frame.w = player.speed.w;
    } else return;
    animation_frames_left = frames;
}

void move_up(uint8_t frames){
    player.speed = calculate_speed(frames);
    if (depth - depth_offset == THRESHOLD + TOP && depth > THRESHOLD + TOP) {
        depth_offset--;
        depth--;
        scroll_y_per_frame.w = - player.speed.w;
    } else if (depth > MAX_HEIGHT) {
        depth--;
        move_y_per_frame.w = - player.speed.w;
    } else return;
    animation_frames_left = frames;
}

void move_down(uint8_t frames){
    player.speed = calculate_speed(frames);
    if (depth - depth_offset == (METATILES_VISIBLE - THRESHOLD - BOTTOM) && depth < ROWS - THRESHOLD - BOTTOM - 1) {
        depth_offset++;
        depth++;
        scroll_y_per_frame.w = player.speed.w;
    } else if (depth < ROWS - 1) {
        depth++;
        move_y_per_frame.w = player.speed.w;
    } else return;
    animation_frames_left = frames;
}

void move(char direction, char mode){
    direction_now = direction;
    if (direction == LEFT || direction == RIGHT) direction_prev = direction;

    uint8_t frames = 0;
    if (animation_frames_left == 0){
        if (mode == DRILL) {
            PLAY_SFX_down;
            is_drilling = TRUE;
            velocity = 0;
            if (direction == LEFT) next_tile = next_tile_left;
            if (direction == RIGHT) next_tile = next_tile_right;
            if (direction == UP) next_tile = next_tile_up;
            if (direction == DOWN) next_tile = next_tile_down;
            frames = calculate_frames();
        } else if (mode == DRIVE) {
            // if (next_tile_down != EMPTY) velocity = 0; // attempt to keep velocity when flying
            PLAY_SFX_soft_hit;
            velocity = 0;
            frames = 16;
        } else if (mode == ACCELERATE) {
            if (next_tile_up != EMPTY) velocity = 0;
            if (direction == DOWN) {
                if (velocity < 0) {
                    direction = UP;
                    velocity++;
                    velocity++;
                    velocity++;
                } else {
                velocity++;
                }
            } else if (direction == UP) {
                if (velocity > 0) {
                    direction = DOWN;
                    velocity--;
                    velocity--;
                } else {
                velocity--;
                }
            }
            if (velocity >= TERMINAL_VELOCITY) velocity = TERMINAL_VELOCITY;
            if (velocity <= - upward_velocity) velocity = - upward_velocity;
            frames = 16 - abs(velocity);
        }

        if (direction == LEFT) move_left(frames);
        if (direction == RIGHT) move_right(frames);
        if (direction == UP) move_up(frames);
        if (direction == DOWN) move_down(frames);
    }
}

void initiate_movement(void) {
    if (buttons & J_LEFT) {
        if (next_tile_left != EMPTY && next_tile_left != STONE && next_tile_down != EMPTY) {
            move(LEFT, DRILL);
        } else if (next_tile_left == EMPTY) {
            move(LEFT, DRIVE);
        } else direction_prev = LEFT;
    }
    else if (buttons & J_RIGHT) { 
        if (next_tile_right != EMPTY && next_tile_right != STONE && next_tile_down != EMPTY) {
            move(RIGHT, DRILL);
        } else if (next_tile_right == EMPTY) {
            move(RIGHT, DRIVE);
        } else direction_prev = RIGHT;
    }
    else if (buttons & J_DOWN) { 
        if (next_tile_down != EMPTY && next_tile_down != STONE){
            move(DOWN, DRILL);
        }
    }
    if (next_tile_up == EMPTY && (buttons & J_UP )) {
        move(UP, ACCELERATE);
    }
    else if (next_tile_down == EMPTY && !(buttons & J_UP)) {
        move(DOWN, ACCELERATE);
    }
}
void apply_lava_damage(void){
    player.hull.current_value -= LAVA_DAMAGE;
    PLAY_SFX_hit;
}

void apply_gas_damage(void){
    player.hull.current_value -= GAS_DAMAGE;
    PLAY_SFX_hit;
}
void apply_fall_damage(void){
    uint8_t damage = ((prev_velocity - FALL_DAMAGE_THRESHOLD) * 2) + 1;
    player.hull.current_value -= damage;
    PLAY_SFX_hit;
}

void calculate_hazard_damage(void){
    if (lava_mined == TRUE) {
        apply_lava_damage();
    } else if (gas_mined == TRUE) {
        apply_gas_damage();
    }
}

void calculate_fall_damage(void){
    if (velocity == 0 && prev_velocity > FALL_DAMAGE_THRESHOLD) {
        apply_fall_damage();
        prev_velocity = 0;
    } else if (next_tile_down != EMPTY && velocity > FALL_DAMAGE_THRESHOLD) {
        apply_fall_damage();
        velocity = 0;
    } else if (next_tile_down != EMPTY && velocity <= FALL_DAMAGE_THRESHOLD && velocity > 0){
        velocity = 0;
    }
}

void calculate_upward_velocity(void){
    // divide both by 8 and subtract, the cap at 8
    upward_velocity = (player.engine.max_value >> 3) - (player.cargo.current_value >> 3);
    if (upward_velocity >= 12) upward_velocity = 12;
}

void check_hull(void){
    if (player.hull.current_value <= 0 && animation_frames_left == 0) {
        player_alive = FALSE;
        player.hull.current_value = 0;
    }
    // warn if hull very low
    if (player.hull.current_value * (100 / PERCENTAGE_NORMAL) <= player.hull.max_value) {
        display_warning_hull_normal = TRUE;
    } else {
        display_warning_hull_normal = FALSE;
    }
}

void check_fuel(void){
    if (player.fuel.current_value <= 0 && animation_frames_left == 0) {
        player_alive = FALSE;
        player.fuel.current_value = 0;
    }
    // warn if fuel is very low
    if (player.fuel.current_value * (100 / PERCENTAGE_CRITICAL) <= player.fuel.max_value) {
        display_warning_fuel_critical = TRUE;
        display_warning_fuel_normal = TRUE;
    // warn if fuel low
    } else if (player.fuel.current_value * (100 / PERCENTAGE_NORMAL) <= player.fuel.max_value) {
        display_warning_fuel_critical = FALSE;
       display_warning_fuel_normal = TRUE;
    // clear warnings
    } else {
        display_warning_fuel_critical = FALSE;
        display_warning_fuel_normal = FALSE;
    }
}
void update_fuel(void){
    if (frame_counter == 0) {
        player.fuel.current_value --;   // only once every 60 frames
    }
}

void handle_fuel(BOOLEAN optimise) {
    // total CPU usage around 22-24%
    check_fuel(); // 2% CPU
    update_fuel(); // 0% CPU
    if (frame_counter == TICK_FUEL || optimise == FALSE){ // reduce CPU work by 59/60%
        update_progressbar_palette(&player.fuel, FUEL_BAR_PALETTE); // 11% CPU
        draw_fuel_bar(); // 10% CPU
    }
    update_icon_fuel(); // 1% CPU
}

void handle_hull(BOOLEAN optimise) {
    // total CPU usage around 19-20%
    check_hull();
    calculate_fall_damage();
    if (frame_counter == TICK_HULL || optimise == FALSE){ // reduce CPU work
        update_progressbar_palette(&player.hull, HULL_BAR_PALETTE);
        draw_hull_bar();
    }
    update_icon_hull();
}

void handle_cargo(void) {
    calculate_cargo();
    draw_cargo();
    update_icon_cargo();
}


// check if player has entered a building
typedef enum {
    ENTER_NO_STATION,
    ENTER_UPGRADE_STATION,
    ENTER_FUEL_STATION,
    ENTER_SELL_STATION
} Station_proximity;

Station_proximity station_proximity = ENTER_NO_STATION;

void proximity_check_station(void) {
    // Check for entering the upgrade station
    if (depth == STATION_Y && width == STATION_UPGRADE_X + STATION_UPGRADE_DOOR_OFFSET) {
        station_proximity = ENTER_UPGRADE_STATION;
        // draw_a_button();
    } else if (depth == STATION_Y && width == STATION_SELL_X + STATION_SELL_DOOR_OFFSET) {
        station_proximity = ENTER_SELL_STATION;
        // draw_a_button();
    } else if (depth == STATION_Y && width == STATION_POWERUP_X + STATION_POWERUP_DOOR_OFFSET) {
        station_proximity = ENTER_FUEL_STATION;
        // draw_a_button();
    } else {
        station_proximity = ENTER_NO_STATION;
        // hide_a_button();
    }
}

void enter_station(void) {
    if (buttons & J_A && !(prev_buttons & J_A)) {
        if (station_proximity == ENTER_SELL_STATION) {
            currentGameState = GAME_STATE_SELL_MENU;
        } else if (station_proximity == ENTER_UPGRADE_STATION) {
            currentGameState = GAME_STATE_UPGRADE_MENU;
        } else if (station_proximity == ENTER_FUEL_STATION) {
            currentGameState = GAME_STATE_FUEL_MENU;
        }
        velocity = 0;
    }
}

void powerup_extra_tank(void) {
    uint16_t extra_tank_volume = 500;
    if (powerup[POWERUP_EXTRA_TANK].inventory > 0) {

        player.fuel.current_value += extra_tank_volume; // add to tank
        if (player.fuel.current_value > player.fuel.max_value) {
            player.fuel.current_value = player.fuel.max_value;  // check if the tank is now more than full and cap it at max
        }
        // Subtract 1 from inventory
        powerup[POWERUP_EXTRA_TANK].inventory -= 1;
    }
}

void powerup_repair_kit(void) {
    uint16_t repair_kit_amount = 50;
    if (powerup[POWERUP_REPAIR_KIT].inventory > 0) {

        player.hull.current_value += repair_kit_amount; // add to tank
        if (player.hull.current_value > player.hull.max_value) {
            player.hull.current_value = player.hull.max_value;  // check if the tank is now more than full and cap it at max
        }
        // Subtract 1 from inventory
        powerup[POWERUP_REPAIR_KIT].inventory -= 1;
    }
}

void powerup_dynamite(void) {
    if (powerup[POWERUP_DYNAMITE].inventory > 0) {
        // Clear one tile to the left, right, top, and bottom
        clear_4bkg_tiles(width, wrapped_depth + 1);     // top
        clear_4bkg_tiles(width+1, wrapped_depth + 1);     // top right
        clear_4bkg_tiles(width-1, wrapped_depth + 1);     // top left
        clear_4bkg_tiles(width, wrapped_depth - 1);     // bottom
        clear_4bkg_tiles(width+1, wrapped_depth - 1);     // bottom right
        clear_4bkg_tiles(width-1, wrapped_depth - 1);     // bottom left
        clear_4bkg_tiles(width + 1, wrapped_depth);     // right
        clear_4bkg_tiles(width - 1, wrapped_depth);     // left

        // Subtract 1 from inventory
        powerup[POWERUP_DYNAMITE].inventory -= 1;

        // play SFX
        PLAY_SFX_explosion;
    }
}

void powerup_teleporter(void) {
    if (powerup[POWERUP_TELEPORTER].inventory > 0) {
        init_speed();
        init_depth(STATION_POWERUP_X + STATION_POWERUP_DOOR_OFFSET, GROUND);
        currentGameState = GAME_STATE_CONTINUE_RELOAD;
        
        // Subtract 1 from inventory
        powerup[POWERUP_TELEPORTER].inventory -= 1;
    }
}



void handle_powerups(void) {
    if (animation_frames_left <= 0 && prev_buttons != buttons && depth > UNDERGROUND + 1) {
        if (buttons & J_START) {
            powerup_dynamite();
        }
        if (buttons & J_A) {
            powerup_extra_tank();
        }
        if (buttons & J_B) {
            powerup_repair_kit();
        }
        if (buttons & J_SELECT) {
            powerup_teleporter();
        }
    }
}

void check_game_over(void){
    if (player_alive == FALSE) {
        currentGameState = GAME_STATE_GAME_OVER;
    }
}

void reset_player(void){
    player_alive = TRUE; // Reset player alive status
    player.hull.current_value = player.hull.max_value;
    player.fuel.current_value = player.fuel.max_value;
}