#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <gb/gb.h>
#include <stdio.h>

// general
#define ROWS 64
#define COLS 16

#define START_DEPTH 2
#define START_WIDTH 4

// main menu
#define MENU_ITEMS 3

// shop
#define UPGRADE_TICK_TILE 39

#define POWERUP_EXTRA_TANK 2
#define POWERUP_REPAIR_KIT 3
#define POWERUP_DYNAMITE 4
#define POWERUP_TELEPORTER 5

#define STATION_Y 5
#define STATION_POWERUP_X 0
#define STATION_POWERUP_DOOR_OFFSET 2
#define STATION_SELL_X 5
#define STATION_SELL_DOOR_OFFSET 1
#define STATION_UPGRADE_X 11
#define STATION_UPGRADE_DOOR_OFFSET 1

// sprite palettes
#define ROVER_PALETTE_0 0
#define ROVER_PALETTE_1 1
#define ROVER_EYE_PALETTE 2
#define TRACKS_PALETTE 3
#define DRILL_PALETTE 4
#define HULL_BAR_PALETTE 5
#define FUEL_BAR_PALETTE 6
#define WARNING_PALETTE 7

#define COLOR_TO_CHANGE_BKG 1 // what color of bkg palette 0 is changing with depth
#define COLOR_TO_CHANGE_SKY 0 // what color of sky to change

#define HIGHLIGHT_FRAME_PALETTE 1
#define FUEL_DISPLAY_PALETTE 2
#define TICK_PALETTE 2

// color palettes
#define PALETTE_DEFAULT 0
#define PALETTE_DIRT 2
#define PALETTE_SKY 7

// DEPTH_LEVEL_0
// default 0
#define PALETTE_GRAS 1
#define PALETTE_COAL 2
#define PALETTE_IRON 3
// palette station 4
// palette station 5
// palette station 6
// palette station 7

// DEPTH_LEVEL_1
// default 0
#define PALETTE_STONE 1
// coal 2
// iron 3
#define PALETTE_TIN 4
#define PALETTE_COPPER 5
#define PALETTE_SILVER 6
#define PALETTE_GOLD 7

// DEPTH_LEVEL_2
// default 0
// stone 1
#define PALETTE_MITHRIL 2
#define PALETTE_PLATINUM 3
// tin 4
// copper 5
// silver 6
// gold 7

// DEPTH_LEVEL_3
// default 0
// stone 1
// mithril 2
// platinum 3
#define PALETTE_EMERALD 4
#define PALETTE_BONES 5
// silver 6
// gold 7

// DEPTH_LEVEL_4
// default 0
// stone 1
#define PALETTE_TITANIUM 2
#define PALETTE_OBSIDIUM 3
// emerald 4
// bones 5
#define PALETTE_LAVA 6
// gold 7

// DEPTH_LEVEL_5
// default 0
// stone 1
// titanium 2
// obsidium 3
#define PALETTE_RUBY 4
// bones 5
// lava 6
#define PALETTE_GAS 7

#define PALETTE_ELEMENTIUM 0
#define PALETTE_ADAMANTITE 0
#define PALETTE_DIAMOND 0
#define PALETTE_AQUAMARINE 0
#define PALETTE_SKULL 0
#define PALETTE_ARTEFACT 0


#define WIN_X 3
#define WIN_Y 0

#define MIN_MINABLE_MATERIAL COAL
#define MAX_MINABLE_MATERIAL DIAMOND

// movement
#define METATILES_VISIBLE 8
#define METATILES_TOTAL 10
#define GROUND 5
#define UNDERGROUND (GROUND + 1)
#define CLOSE_TO_SURFACE 7 // use this together with depth_offset for start of mining mode

#define DEPTH_LEVEL_1 30
#define DEPTH_LEVEL_2 60
#define DEPTH_LEVEL_3 100
#define DEPTH_LEVEL_4 150
#define DEPTH_LEVEL_5 300

#define THRESHOLD 2  // How many metatiles away from the screenedge does scrolling start
#define BOTTOM 0    // Offset from the bottom edge of the screen
#define TOP 0    // Offset from the top edge of the screen, to account for the nav/window element
#define LEFT 1
#define RIGHT 2
#define UP 3
#define DOWN 4
#define MAX_HEIGHT 2

#define TERMINAL_VELOCITY 14
#define FALL_DAMAGE_THRESHOLD 6

#define DRILL 1
#define DRIVE 2
#define ACCELERATE 3
#define PIXEL_FROM_CENTER 12

#define FUEL_PRICE 3
#define REPAIR_PRICE 20

#define ATTRIBUTE_DRILL 0
#define ATTRIBUTE_HULL 1
#define ATTRIBUTE_ENGINE 2
#define ATTRIBUTE_FUEL 3
#define ATTRIBUTE_RADIATOR 4
#define ATTRIBUTE_CARGO 5

// sprites
#define ROVER_START 0
#define TRACKS_START 4
#define DRILL_H_START 6
#define DRILL_V_START 8
#define PROP_START 10
#define EYE_START 12
#define GAME_OVER_START 8
#define A_BUTTON_START 19
#define WARNING_CARGO_START 23
#define WARNING_FUEL_START 30
#define PROGRESSBAR_HULL_START 35
#define PROGRESSBAR_FUEL_START 37
#define FUEL_DISPLAY_START 18

// tiles
#define ORE_TILE_START 96
#define NUMBERS_START 4
#define LETTER_START 26
#define SLETTER_START 52

// progressbar and warnings
#define GAME_OVER_Y (SCREENHEIGHT/2)
#define WARNING_CARGO_Y 45
#define WARNING_FUEL_Y 55
#define PROGRESSBAR_TILE_0_8 32    // Tile index for empty sprite
#define PROGRESSBAR_TILE_1_8   (PROGRESSBAR_TILE_0_8 + 1)    // Tile index for 1/8 filled sprite
#define PROGRESSBAR_TILE_2_8   (PROGRESSBAR_TILE_0_8 + 2)
#define PROGRESSBAR_TILE_3_8   (PROGRESSBAR_TILE_0_8 + 3)
#define PROGRESSBAR_TILE_4_8   (PROGRESSBAR_TILE_0_8 + 4)
#define PROGRESSBAR_TILE_5_8   (PROGRESSBAR_TILE_0_8 + 5)
#define PROGRESSBAR_TILE_6_8   (PROGRESSBAR_TILE_0_8 + 6)
#define PROGRESSBAR_TILE_7_8   (PROGRESSBAR_TILE_0_8 + 7)
#define PROGRESSBAR_TILE_8_8   (PROGRESSBAR_TILE_0_8 + 8)
#define PROGRESSBAR_TILE_END   (PROGRESSBAR_TILE_0_8 + 9)

#endif // CONSTANTS_H