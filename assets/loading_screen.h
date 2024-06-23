//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_loading_screen_H
#define METASPRITE_loading_screen_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define loading_screen_TILE_ORIGIN 128
#define loading_screen_TILE_W 8
#define loading_screen_TILE_H 8
#define loading_screen_WIDTH 160
#define loading_screen_HEIGHT 144
#define loading_screen_TILE_COUNT 26
#define loading_screen_PALETTE_COUNT 1
#define loading_screen_COLORS_PER_PALETTE 4
#define loading_screen_TOTAL_COLORS 4
#define loading_screen_MAP_ATTRIBUTES loading_screen_map_attributes
#define loading_screen_MAP_ATTRIBUTES_WIDTH 20
#define loading_screen_MAP_ATTRIBUTES_HEIGHT 18
#define loading_screen_MAP_ATTRIBUTES_PACKED_WIDTH 20
#define loading_screen_MAP_ATTRIBUTES_PACKED_HEIGHT 18

BANKREF_EXTERN(loading_screen)

extern const palette_color_t loading_screen_palettes[4];
extern const uint8_t loading_screen_tiles[416];

extern const unsigned char loading_screen_map[360];
extern const unsigned char loading_screen_map_attributes[360];

#endif
