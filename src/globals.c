
#include <gb/gb.h>
#include <stdio.h>

#include "globals.h"
#include "constants.h"

// framecounter
volatile uint8_t frame_counter = 0;

// main menu
uint8_t current_menu_index = 0;

// shop
BOOLEAN update_menu = TRUE;  // Initially set to TRUE to draw the menu the first time
BOOLEAN left_shop_area = TRUE;  // Initially true to allow first entry
BOOLEAN left_sell_area = TRUE;  // Initially true to allow first entry

// bank switching
uint8_t saved_bank;

// gamestates
BOOLEAN player_alive = TRUE;
GameState currentGameState = GAME_STATE_MAIN_MENU;  // Start with the game loop

// movement
uint8_t depth = 2, width = 6;
uint8_t depth_offset = 0, width_offset = 0;
uint8_t prev_depth, prev_width;
fixed depth_pixel, width_pixel;
fixed scroll_x, scroll_y;

// movement animation
uint16_t ore_resistance;
uint8_t animation_frames_left = 0;
fixed move_x_per_frame;
fixed move_y_per_frame;
fixed scroll_x_per_frame;
fixed scroll_y_per_frame;
int8_t velocity = 0;
char direction_now;
char direction_prev;
BOOLEAN is_drilling;

// player stats
uint8_t base_drilltime = 16;
BOOLEAN tile_mined = FALSE;

// controlls
uint8_t buttons;
uint8_t prev_buttons = 0;

// check surroundings
uint8_t next_tile;
uint8_t next_tile_up;
uint8_t next_tile_down;
uint8_t next_tile_left;
uint8_t next_tile_right; 