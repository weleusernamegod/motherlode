#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <gb/gb.h>
#include <stdio.h>

typedef uint8_t int8;
typedef uint16_t int16;
typedef int8_t int8_t;
typedef int16_t sint16;

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

// game
#define ROWS 96
#define COLS 16

#define THRESHOLD 2  // How many metatiles away from the screenedge does scrolling start
#define BOTTOM 0    // Offset from the bottom edge of the screen, to account for the nav/window element

#define TILESTART 0x5C
#define NUMSTART 0x10
#define LETTERSTART 0x21
#define SLETTERSTART 0x41
#define CHARSTART 1
#define NUMTILESTART 17
#define NAVSTART 128
#define MAX_FRAMES 16

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