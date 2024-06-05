#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <gb/gb.h>
#include <stdio.h>

// main menu

#define MENU_ITEMS 3

// shop
#define UPGRADE_TICK_TILE 39

#define STATION_Y 5
#define STATION_FUEL_X 0
#define STATION_FUEL_DOOR_OFFSET 2
#define STATION_SELL_X 6
#define STATION_SELL_DOOR_OFFSET 1
#define STATION_UPGRADE_X 11
#define STATION_UPGRADE_DOOR_OFFSET 1

// sprite palettes
#define ROVER_PALETTE_0 0
#define ROVER_PALETTE_1 1
#define TRACKS_PALETTE 2
#define DRILL_PALETTE 3
#define HULL_BAR_PALETTE 4
#define FUEL_BAR_PALETTE 5
#define WARNING_PALETTE 6
#define RESERVE_PALETTE 7

#define COLOR_TO_CHANGE_BKG 1 // what color of bkg palette 0 is changing with depth
#define COLOR_TO_CHANGE_SKY 0 // what color of sky to change

// color palettes
#define PALETTE_DEFAULT 0
#define PALETTE_DIRT 2
#define PALETTE_SKY 7

// group 1
// default 0
#define PALETTE_GRAS 1
#define PALETTE_COAL 2
#define PALETTE_IRON 3
// palette sky 4
// palette station 5
// palette station 6
// palette station 7

// group 2
// default 0
#define PALETTE_STONE 1
// coal 2
// iron 3
#define PALETTE_COPPER 4
#define PALETTE_TIN 5
#define PALETTE_SILVER 6
#define PALETTE_GOLD 7

// group 3
#define PALETTE_MITHRIL 2
#define PALETTE_PLATINUM 3
#define PALETTE_TITANIUM 4
#define PALETTE_OBSIDIUM 5
#define PALETTE_ELEMENTIUM 6
#define PALETTE_ADAMANTITE 7

// group 4
#define PALETTE_EMERALD 2
#define PALETTE_RUBY 3
#define PALETTE_DIAMOND 4
//
#define PALETTE_LAVA 6
#define PALETTE_GAS 7


// group 5
#define PALETTE_BONES 2
#define PALETTE_SKULL 3
#define PALETTE_ARTEFACT 4
#define PALETTE_AQUAMARINE 5
// lava 6
// gas 7


// general
#define ROWS 256
#define COLS 16

#define WIN_X 3
#define WIN_Y 0

#define MIN_MINABLE_MATERIAL COAL
#define MAX_MINABLE_MATERIAL DIAMOND

// movement
#define METATILES_PER_SCREEN 8
#define GROUND 5
#define UNDERGROUND (GROUND + 1)
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

// sprites
#define ROVER_START 0
#define TRACKS_START 4
#define DRILL_H_START 6
#define DRILL_V_START 8
#define PROP_START 10
#define GAME_OVER_START 8
#define A_BUTTON_START 19
#define WARNING_CARGO_START 23
#define WARNING_FUEL_START 30
#define PROGRESSBAR_HULL_START 35
#define PROGRESSBAR_FUEL_START 37

// tiles
#define TILE_START 96
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