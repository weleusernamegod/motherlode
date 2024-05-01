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

#define STATION_SHOP_X 2
#define STATION_SHOP_Y 5
#define STATION_FUEL_X 10
#define STATION_FUEL_Y 5
#define STATION_REPAIR_X 16
#define STATION_REPAIR_Y 5
#define STATION_SELL_X 10
#define STATION_SELL_Y 5

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

// background color change
#define COLOR_MAX 255
#define TRANSITION_LENGTH (COLOR_MAX * 3)

// game
#define ROWS 100
#define COLS 16


#define EARTH_START 5 // at that level does the digging start
#define THRESHOLD 2  // How many metatiles away from the screenedge does scrolling start
#define BOTTOM 0    // Offset from the bottom edge of the screen, to account for the nav/window element

#define TILESTART 128
#define NUMSTART 1
#define LETTERSTART 25
#define SLETTERSTART 51
#define CHARSTART 1
#define NAVSTART 96

#define LEFT 1
#define RIGHT 2
#define UP 3
#define DOWN 4

#define DRILL 1
#define DRIVE 2
#define ACCELERATE 3

#define SPRITE_TILE_EMPTY 0    // Tile index for empty sprite
#define SPRITE_TILE_1_8   32    // Tile index for 1/8 filled sprite
#define SPRITE_TILE_2_8   33
#define SPRITE_TILE_3_8   34
#define SPRITE_TILE_4_8   35
#define SPRITE_TILE_5_8   36
#define SPRITE_TILE_6_8   37
#define SPRITE_TILE_7_8   38
#define SPRITE_TILE_END   39
#define SPRITE_TILE_MID   40

// Sprite IDs (example values, you need to set these based on your setup)
#define SPRITE_ID_0 35
#define SPRITE_ID_1 36
#define SPRITE_ID_2 37



#endif // CONSTANTS_H