//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_shopframe_H
#define METASPRITE_shopframe_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define shopframe_TILE_ORIGIN 151
#define shopframe_TILE_W 8
#define shopframe_TILE_H 8
#define shopframe_WIDTH 160
#define shopframe_HEIGHT 144
#define shopframe_TILE_COUNT 9
#define shopframe_PALETTE_COUNT 1
#define shopframe_COLORS_PER_PALETTE 4
#define shopframe_TOTAL_COLORS 4
#define shopframe_MAP_ATTRIBUTES 0

BANKREF_EXTERN(shopframe)

extern const palette_color_t shopframe_palettes[4];
extern const uint8_t shopframe_tiles[144];

extern const unsigned char shopframe_map[360];
#define shopframe_map_attributes shopframe_map

#endif
