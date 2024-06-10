
#include <gb/gb.h>
#include <stdio.h>

#include "globals.h"
#include "constants.h"

// framecounter
volatile uint8_t frame_counter = 0;
volatile uint8_t second_counter = 0;
volatile uint8_t minute_counter = 0;

// main menu
uint8_t current_menu_index = 0;

// bank switching
uint8_t current_ram_bank = 0;
uint8_t prev_ram_bank = 0;

// gamestates
BOOLEAN player_alive = TRUE;
GameState currentGameState;  // Start with the game loop
BOOLEAN leave_station = FALSE;
BOOLEAN left_shop_area = TRUE;  // Initially true to allow first entry
BOOLEAN update_menu = TRUE;  // Initially set to TRUE to draw the menu the first time
BOOLEAN buildings_loaded = TRUE;  // for checks if buildings need to be loaded or not

// movement
uint16_t depth = 2, width = 4;
uint16_t depth_offset = 0, width_offset = 0;
uint16_t prev_depth, prev_width;
uint16_t wrapped_depth;
uint16_t current_bkg_color;
fixed depth_pixel, width_pixel;
fixed scroll_x, scroll_y;
fixed vertical_movement_pixel, horizontal_movement_pixel;
uint8_t vertical_movement, horizontal_movement, absolute_movement;
uint8_t upward_velocity;

// movement animation
uint16_t ore_resistance;
uint8_t animation_frames_left = 0;
fixed move_x_per_frame;
fixed move_y_per_frame;
fixed scroll_x_per_frame;
fixed scroll_y_per_frame;
int8_t velocity = 0;
int8_t prev_velocity = 0;
char direction_now;
char direction_prev;
BOOLEAN is_drilling;

// player stats
uint8_t base_drilltime = 16;
BOOLEAN tile_mined = FALSE;
BOOLEAN ore_mined = FALSE;
BOOLEAN display_warning_cargo = FALSE;
BOOLEAN display_warning_fuel = FALSE;

// controlls
uint8_t buttons;
uint8_t prev_buttons = 0;

// check surroundings
uint8_t next_tile;
uint8_t next_tile_up;
uint8_t next_tile_down;
uint8_t next_tile_left;
uint8_t next_tile_right; 

// graphics
uint8_t sky_color_value;

// fuel menu
uint8_t current_powerup_selection = 0;
uint16_t powerup_cost = 0;
uint8_t fuel_display_y = 50;
