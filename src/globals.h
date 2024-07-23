#ifndef GLOBALS_H
#define GLOBALS_H

// main menu
extern uint8_t current_menu_index;
extern uint8_t main_menu_current_y;
extern uint8_t main_menu_animation_finished;

// framecounter
extern volatile uint8_t frame_counter;
extern volatile uint8_t second_counter;
extern volatile uint8_t minute_counter;

// bank switching
extern uint8_t current_ram_bank;
extern uint8_t prev_ram_bank;

// gamestates
extern BOOLEAN player_alive;
extern BOOLEAN leave_station;
extern BOOLEAN left_shop_area;  // Initially true to allow first entry
extern BOOLEAN update_menu;  // Initially set to TRUE to draw the menu the first time
extern BOOLEAN buildings_loaded;  // for checks if buildings need to be loaded or not
extern BOOLEAN reload_palettes;  // for checks if palettes need to be reloaded or not

typedef enum {
    GAME_STATE_MAIN_MENU,
    GAME_STATE_UPGRADE_MENU,
    GAME_STATE_SELL_MENU,
    GAME_STATE_FUEL_MENU,
    GAME_STATE_NEW_GAME,
    GAME_STATE_CONTINUE_RELOAD,
    GAME_STATE_CONTINUE,
    GAME_STATE_GAME_OVER,
} GameState;
extern GameState currentGameState;

// movement
extern uint16_t depth, width;
extern uint16_t prev_depth, prev_width;
extern uint16_t depth_offset, width_offset;
extern uint16_t prev_depth_offset, prev_width_offset;
extern uint16_t wrapped_depth;
extern uint16_t current_bkg_color;
extern fixed depth_pixel, width_pixel;
extern fixed scroll_x, scroll_y;
extern fixed vertical_movement_pixel, horizontal_movement_pixel;
extern uint8_t vertical_movement, horizontal_movement, absolute_movement;
extern uint8_t upward_velocity;

// movement animation
extern uint16_t ore_resistance;
extern uint8_t animation_frames_left;
extern uint8_t last_SFX_played;
extern fixed move_x_per_frame;
extern fixed move_y_per_frame;
extern fixed scroll_x_per_frame;
extern fixed scroll_y_per_frame;
extern int8_t velocity;
extern int8_t prev_velocity;
extern char direction_now;
extern char direction_prev;
extern BOOLEAN is_drilling;
extern uint8_t rover_state;

// player stats
extern BOOLEAN tile_mined;
extern BOOLEAN ore_mined;
extern BOOLEAN lava_mined;
extern BOOLEAN gas_mined;
extern BOOLEAN display_warning_hull_normal;
extern BOOLEAN display_warning_fuel_normal;
extern BOOLEAN display_warning_fuel_critical;
extern BOOLEAN display_warning_cargo_normal;

// controlls
extern uint8_t buttons;
extern uint8_t prev_buttons;

// check surroundings
extern uint8_t next_tile;
extern uint8_t next_tile_up;
extern uint8_t next_tile_down;
extern uint8_t next_tile_left;
extern uint8_t next_tile_right; 

// graphics
extern uint8_t sky_color_value;
extern int8_t sky_color_direction;

// fuel menu
extern uint8_t current_powerup_selection;
extern uint16_t powerup_cost;
extern uint16_t fuel_display_y;

// game over screen
extern uint8_t game_over_animation_frame;
extern uint8_t game_over_animation_cycle;
extern BOOLEAN game_over_animation_active;



#endif // GLOBALS_H