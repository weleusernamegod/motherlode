//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_character_H
#define METASPRITE_character_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define character_TILE_ORIGIN 174
#define character_TILE_W 8
#define character_TILE_H 8
#define character_WIDTH 160
#define character_HEIGHT 8
#define character_TILE_COUNT 20
#define character_PALETTE_COUNT 1
#define character_COLORS_PER_PALETTE 4
#define character_TOTAL_COLORS 4
#define character_MAP_ATTRIBUTES 0

BANKREF_EXTERN(character)

extern const palette_color_t character_palettes[4];
extern const uint8_t character_tiles[320];

extern const unsigned char character_map[20];
#define character_map_attributes character_map

#endif
