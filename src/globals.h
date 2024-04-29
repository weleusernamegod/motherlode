#ifndef GLOBALS_H
#define GLOBALS_H



// framecounter
extern volatile uint8_t frame_counter;

// shop menu
extern BOOLEAN update_menu;  // Initially set to TRUE to draw the menu the first time
extern BOOLEAN left_shop_area;  // Initially true to allow first entry
extern BOOLEAN left_sell_area;  // Initially true to allow first entry

// bank switching
extern uint8_t saved_bank;

// gamestates
extern BOOLEAN player_alive;
typedef enum {
    GAME_STATE_MAIN_MENU,
    GAME_STATE_UPGRADE_MENU,
    GAME_STATE_SELL_MENU,
    GAME_STATE_PLAY,
    GAME_STATE_GAME_OVER,
} GameState;
extern GameState currentGameState;

// movement
extern uint8_t depth, width;
extern uint8_t depth_offset, width_offset;
extern uint8_t prev_depth, prev_width;
extern fixed depth_pixel, width_pixel;
extern fixed scroll_x, scroll_y;

// movement animation
extern uint16_t ore_resistance;
extern uint8_t animation_frames_left;
extern fixed move_x_per_frame;
extern fixed move_y_per_frame;
extern fixed scroll_x_per_frame;
extern fixed scroll_y_per_frame;
extern int8_t velocity;
extern char direction_now;
extern char direction_prev;
extern BOOLEAN is_drilling;

// player stats
extern uint8_t base_drilltime;
extern BOOLEAN tile_mined;


// controlls
extern uint8_t buttons;
extern uint8_t prev_buttons;

// check surroundings
extern uint8_t next_tile;
extern uint8_t next_tile_up;
extern uint8_t next_tile_down;
extern uint8_t next_tile_left;
extern uint8_t next_tile_right; 

// shop
extern uint8_t shop_selection;

#endif // GLOBALS_H