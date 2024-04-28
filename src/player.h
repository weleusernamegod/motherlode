#ifndef GAME_H
#define GAME_H

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>

BANKREF_EXTERN(bank_player)

// Declaration of global structures and variables
extern const metasprite_t rover_metasprite[];
extern const metasprite_t drill_horizontal_metasprite[];
extern const metasprite_t drill_vertical_metasprite[];
extern struct Player player;

// Function declarations
void init_character(void);
void init_speed(void);
void check_surroundings(void);
void metasprite_drill_horizontal(char direction);
void metasprite_drill_vertical(char direction);
void metasprite_rover(char direction);
void draw_metasprite(char direction);
void update_movement(void);
uint8_t calculate_frames(void);
fixed calculate_speed(uint8_t frames);
void move_left(uint8_t frames);
void move_right(uint8_t frames);
void move_up(uint8_t frames);
void move_down(uint8_t frames);
void move(char direction, char mode);
void initiate_movement(void);
void calculate_falldamage(void);
void check_hull(void);
void check_fuel(void);
void update_fuel(void);
void check_enter_buildings(void);
void check_game_over(void);
void reset_player(void);

#endif // GAME_H
