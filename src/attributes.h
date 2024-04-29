#ifndef ATTRIBUTES_H
#define ATTRIBUTES_H

#include <gb/gb.h>
#include <gb/cgb.h>
#include <stdio.h>


/**
 * Define a structure for player attributes
 * 
 * @param current_value the current value during gameplay
 * @param max_value the max value of the attribute
 * @param upgrade_level range from 0 to 5
 * @param upgrade1 cost of upgrade 1?
 * @param upgrade2 
 */

typedef const palette_color_t* PalettePtr;

typedef struct player_attributes {
    const char *upgrade_name[6];
    const char *attribute_name;
    const char *attribute_unit;
    int16_t current_value;
    int16_t max_value;
    uint8_t upgrade_level;
    int16_t upgrade_value[6];
    int16_t upgrade_cost[6];
    PalettePtr color_palette[6]; // array of pointers to color palettes
} player_attributes;

typedef struct Player{
    player_attributes fuel;
    player_attributes hull;
    player_attributes drill;
    player_attributes cargo;
    player_attributes radiator;
    player_attributes engine;
    int16_t money;
    fixed speed;
    fixed prev_speed;

} Player;

extern struct Player player;
extern player_attributes *attributes_numbers[];

void init_attributes(void);

#endif // ATTRIBUTES_H