#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <gb/gb.h>
#include <stdio.h>

// main menu

#define MENU_ITEMS 3

// shop
#define SHOP_FRAME_START 151
#define SHOP_TILES_START 160
#define UPGRADE_TICK_TILE 12

#define STATION_Y 5
#define STATION_FUEL_X 0
#define STATION_FUEL_DOOR_OFFSET 1
#define STATION_SELL_X 6
#define STATION_SELL_DOOR_OFFSET 1
#define STATION_UPGRADE_X 11
#define STATION_UPGRADE_DOOR_OFFSET 1

// sprite palettes
#define ROVER_PALETTE 0
#define DRILL_PALETTE 1
#define HULL_BAR_PALETTE 2
#define FUEL_BAR_PALETTE 3
#define WARNING_PALETTE 4

#define COLOR_TO_CHANGE 1 // what color of bkg palette 0 is changing with depth

// color palettes
#define PALETTE_DEFAULT 0
#define PALETTE_DIRT 1
#define PALETTE_GRAS 5
#define PALETTE_STONE 1
#define PALETTE_COAL 2
#define PALETTE_IRON 3
#define PALETTE_COPPER 4
#define PALETTE_TIN 5
#define PALETTE_SILVER 6
#define PALETTE_GOLD 7
#define PALETTE_MITHRIL 2
#define PALETTE_PLATINUM 3
#define PALETTE_TITANIUM 4
#define PALETTE_OBSIDIUM 5
#define PALETTE_ELEMENTIUM 6
#define PALETTE_ADAMANTITE 7
#define PALETTE_EMERALD 2
#define PALETTE_RUBY 3
#define PALETTE_DIAMOND 4
#define PALETTE_AQUAMARINE 5
#define PALETTE_LAVA 6
#define PALETTE_GAS 7
#define PALETTE_BONES 2
#define PALETTE_SKULL 3
#define PALETTE_ARTEFACT 4

// game
#define ROWS 256
#define COLS 16

#define MIN_MINABLE_MATERIAL COAL
#define MAX_MINABLE_MATERIAL DIAMOND

#define METATILES_PER_SCREEN 9
#define GROUND 5
#define UNDERGROUND (GROUND + 1)
#define THRESHOLD 2  // How many metatiles away from the screenedge does scrolling start
#define BOTTOM 0    // Offset from the bottom edge of the screen, to account for the nav/window element

#define TILE_START 96
#define NUMBERS_START 4
#define LETTER_START 26
#define SLETTER_START 52
#define CHAR_START 1
#define WARNING_CARGO_START 17
#define WARNING_FUEL_START 24

#define WARNING_CARGO_Y 45
#define WARNING_FUEL_Y 55

#define WIN_X 3
#define WIN_Y 0

#define LEFT 1
#define RIGHT 2
#define UP 3
#define DOWN 4

#define DRILL 1
#define DRIVE 2
#define ACCELERATE 3

#define PROGRESSBAR_TILE_0_8 32    // Tile index for empty sprite
#define PROGRESSBAR_TILE_1_8   (PROGRESSBAR_TILE_0_8 + 1)    // Tile index for 1/8 filled sprite
#define PROGRESSBAR_TILE_2_8   (PROGRESSBAR_TILE_0_8 + 2)
#define PROGRESSBAR_TILE_3_8   (PROGRESSBAR_TILE_0_8 + 3)
#define PROGRESSBAR_TILE_4_8   (PROGRESSBAR_TILE_0_8 + 4)
#define PROGRESSBAR_TILE_5_8   (PROGRESSBAR_TILE_0_8 + 5)
#define PROGRESSBAR_TILE_6_8   (PROGRESSBAR_TILE_0_8 + 6)
#define PROGRESSBAR_TILE_7_8   (PROGRESSBAR_TILE_0_8 + 7)
#define PROGRESSBAR_TILE_8_8   (PROGRESSBAR_TILE_0_8 + 8)

#endif // CONSTANTS_H