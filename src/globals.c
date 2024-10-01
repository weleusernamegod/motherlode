
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
uint8_t main_menu_current_y = 0;
uint8_t main_menu_animation_finished = FALSE;

// bank switching
uint8_t current_ram_bank = 0;
uint8_t prev_ram_bank = 0;

// music
uint8_t current_theme_bank = 0;
uint8_t music_paused = FALSE;


// gamestates
BOOLEAN player_alive = TRUE;
BOOLEAN damage_recieved = FALSE;
GameState currentGameState;  // Start with the game loop
BOOLEAN leave_station = FALSE;
BOOLEAN left_shop_area = TRUE;  // Initially true to allow first entry
BOOLEAN update_menu = TRUE;  // Initially set to TRUE to draw the menu the first time
BOOLEAN buildings_loaded = TRUE;  // for checks if buildings need to be loaded or not
BOOLEAN reload_palettes = TRUE;  // for checks if palettes need to be reloaded or not

// movement
uint16_t depth = 0, width = 0;
uint16_t prev_depth, prev_width;
uint16_t depth_offset = 0, width_offset = 0;
uint16_t prev_depth_offset = 0, prev_width_offset = 0;
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
uint8_t last_SFX_played = 0;
fixed move_x_per_frame;
fixed move_y_per_frame;
fixed scroll_x_per_frame;
fixed scroll_y_per_frame;
int8_t velocity = 0;
int8_t prev_velocity = 0;
char direction_now;
char direction_prev;
BOOLEAN is_drilling;
uint8_t rover_state = IDLE;

// player stats
BOOLEAN tile_mined = FALSE;
BOOLEAN ore_mined = FALSE;
BOOLEAN lava_mined = FALSE;
BOOLEAN gas_mined = FALSE;
BOOLEAN display_warning_hull_normal = FALSE;
BOOLEAN display_warning_fuel_normal = FALSE;
BOOLEAN display_warning_fuel_critical = FALSE;
BOOLEAN display_warning_cargo_normal = FALSE;

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
int8_t sky_color_direction = 1;

// fuel menu
uint8_t current_powerup_selection = 0;
uint16_t powerup_cost = 0;
uint16_t fuel_display_y = 0;

// game over screen
uint8_t game_over_animation_frame = 0;
uint8_t game_over_animation_cycle = 0;
BOOLEAN game_over_animation_active = TRUE;

