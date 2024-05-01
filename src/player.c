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
#include "constants.h"
#include "attributes.h"
#include "inventory.h"

#include "level.ba0.h"

#pragma bank 1
#ifndef __INTELLISENSE__
BANKREF(bank_player)
#endif

const metasprite_t rover_metasprite[] = {
    {.dy=-8, .dx=-8, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=8, .dx=-8, .dtile=3, .props=0},
    {.dy=0, .dx=8, .dtile=4, .props=0},
	METASPR_TERM
};

const metasprite_t drill_horizontal_metasprite[] = {
    {.dy=-8, .dx=-16, .dtile=11, .props=0},
    {.dy=8, .dx=0, .dtile=12, .props=0},
	METASPR_TERM
};

const metasprite_t drill_vertical_metasprite[] = {
    {.dy=8, .dx=-8, .dtile=15, .props=0},
    {.dy=0, .dx=8, .dtile=16, .props=0},
	METASPR_TERM
};

struct Player player;

void init_character(void){
    direction_prev = RIGHT;    // start with the rover facing right
    prev_depth = depth;
    width_pixel.h = 16 + ((width - width_offset) * 16);
    depth_pixel.h = 16 + 8 + (depth - depth_offset) * 16;
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

void check_surroundings(void){
    next_tile_down = level_array[depth + 1][width];
    next_tile_up = level_array[depth - 1][width];
    next_tile_right = level_array[depth][width + 1];
    next_tile_left = level_array[depth][width - 1];
}

void metasprite_drill_horizontal(char direction){
    hide_metasprite(drill_vertical_metasprite, 15);
    if (direction == LEFT) move_metasprite_ex (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
    if (direction == RIGHT) move_metasprite_flipx (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
}
void metasprite_drill_vertical(char direction){
    hide_metasprite(drill_horizontal_metasprite, 11);
    if (direction == DOWN) move_metasprite_ex(drill_vertical_metasprite,0,0,15,width_pixel.h,depth_pixel.h);
}
void metasprite_rover(char direction){
    hide_metasprite(drill_horizontal_metasprite, 15);
    hide_metasprite(drill_horizontal_metasprite, 11);
    if (direction == LEFT) move_metasprite_ex(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
    if (direction == RIGHT) move_metasprite_flipx(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
}

void draw_metasprite(char direction){
    if (direction == LEFT || direction == RIGHT){
        metasprite_rover(direction);
        if (is_drilling == TRUE) metasprite_drill_horizontal(direction);
    } else if (direction == UP || direction == DOWN) {
        metasprite_rover(direction_prev);
        if (is_drilling == TRUE) metasprite_drill_vertical(direction);
    }
}

void update_movement(void) {
    if (animation_frames_left > 0) {
        // incrementally add to the x and y values
        scroll_x.w += scroll_x_per_frame.w;
        scroll_y.w += scroll_y_per_frame.w;
        width_pixel.w += move_x_per_frame.w;
        depth_pixel.w += move_y_per_frame.w;

        // move or scroll background
        draw_metasprite(direction_now);

        //update_sprite_character(width_pixel, depth_pixel);
        move_bkg(scroll_x.h, scroll_y.h);

        // increment frame counter
        animation_frames_left--;

        // Check if it's time to decrement fuel
        if (animation_frames_left % 15 == 0) {  // Every 15 frames
            player.fuel.current_value -= 1;
        }

        // Reset movement and input when animation is complete
        if (animation_frames_left == 0) {
            move_x_per_frame.w = 0;
            move_y_per_frame.w = 0;
            scroll_x_per_frame.w = 0;
            scroll_y_per_frame.w = 0;

            // reset position (h and l) to account for rounding errors
            width_pixel.h = 16 + (width - width_offset) * 16, width_pixel.l = 0;
            depth_pixel.h = 24 + (depth - depth_offset) * 16, depth_pixel.l = 0;
            scroll_x.h = width_offset * 16, scroll_x.l = 0;
            scroll_y.h = depth_offset * 16, scroll_y.l = 0;  

            prev_depth = depth;
            width_pixel.h = 16 + ((width - width_offset) * 16);
            depth_pixel.h = 16 + 8 + (depth - depth_offset) * 16;
            scroll_x.h = width_offset * 16;
            scroll_y.h = depth_offset * 16;
            
            // animation has ended, so the rover has stopped drilling
            is_drilling = FALSE;
            // the player has cleared a tile, so set flag to update inventory
            if (level_array[depth][width] != 0){
                tile_mined = TRUE;
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
    if (width - width_offset == (8 - THRESHOLD) + 1 && width < (8 - THRESHOLD) + 7) {
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
    if (depth - depth_offset == THRESHOLD && depth > THRESHOLD) {
        depth_offset--;
        depth--;
        scroll_y_per_frame.w = - player.speed.w;
    } else if (depth > 1) {
        depth--;
        move_y_per_frame.w = - player.speed.w;
    } else return;
    animation_frames_left = frames;
}

void move_down(uint8_t frames){
    player.speed = calculate_speed(frames);
    if (depth - depth_offset == (8 - THRESHOLD - BOTTOM) && depth < ROWS - THRESHOLD - BOTTOM - 1) {
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
            is_drilling = TRUE;
            velocity = 0;
            if (direction == LEFT) next_tile = next_tile_left;
            if (direction == RIGHT) next_tile = next_tile_right;
            if (direction == UP) next_tile = next_tile_up;
            if (direction == DOWN) next_tile = next_tile_down;
            frames = calculate_frames();
        } else if (mode == DRIVE) {
            velocity = 0;
            frames = 16;
        } else if (mode == ACCELERATE) {
            if (next_tile_up != EMPTY) velocity = 0;
            if (direction == DOWN) {
                if (velocity < 0) {
                    direction = UP;
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
            if (velocity >= 12) velocity = 12;
            if (velocity <= -6) velocity = -6;
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
    if (buttons & J_RIGHT) { 
        if (next_tile_right != EMPTY && next_tile_right != STONE && next_tile_down != EMPTY) {
            move(RIGHT, DRILL);
        } else if (next_tile_right == EMPTY) {
            move(RIGHT, DRIVE);
        } else direction_prev = RIGHT;
    }
    if (buttons & J_DOWN) { 
        if (next_tile_down != EMPTY && next_tile_down != STONE){
            move(DOWN, DRILL);
        }
    }
    if (next_tile_up == EMPTY && (buttons & J_UP )) {
        move(UP, ACCELERATE);
    }
    if (next_tile_down == EMPTY && !(buttons & J_UP)) {
        move(DOWN, ACCELERATE);
    }
}

void calculate_falldamage(void){
    if (next_tile_down != EMPTY && velocity > 4) {
        player.hull.current_value -= velocity;
        velocity = 0;
    } else if (next_tile_down != EMPTY && velocity <= 4 && velocity > 0){
        velocity = 0;
    }
}

void check_hull(void){
    if (player.hull.current_value <= 0 && animation_frames_left == 0) {
        player_alive = FALSE;
        player.hull.current_value = 0;
    }
}

void check_fuel(void){
    if (player.fuel.current_value <= 0 && animation_frames_left == 0) {
        player_alive = FALSE;
        player.fuel.current_value = 0;
    }
}
void update_fuel(void){
    if (frame_counter == 0) {
        player.fuel.current_value --;   // only once every 60 frames
    }
    if (depth <= EARTH_START) player.fuel.current_value = player.fuel.max_value;
}

void check_enter_buildings(void){
    // Check for entering the shop
    if (depth == STATION_SHOP_Y && width == STATION_SHOP_X && animation_frames_left == 0 && left_shop_area) {
        currentGameState = GAME_STATE_UPGRADE_MENU;
        velocity = 0;
        left_shop_area = FALSE;  // Player enters the shop, set flag to false
    } else if (depth != STATION_SHOP_Y || width != STATION_SHOP_X) {
        left_shop_area = TRUE;  // Player moves away from the shop trigger location
    }

    // Check for entering the sell station
    if (depth == STATION_SELL_Y && width == STATION_SELL_X && animation_frames_left == 0 && left_sell_area) {
        currentGameState = GAME_STATE_SELL_MENU;
        velocity = 0;
        left_sell_area = FALSE;  // Player enters the sell station, set flag to false
    } else if (depth != STATION_SELL_Y || width != STATION_SELL_X) {
        left_sell_area = TRUE;  // Player moves away from the sell station trigger location
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