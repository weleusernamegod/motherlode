//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_splashscreen_H
#define METASPRITE_splashscreen_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define splashscreen_TILE_ORIGIN 0
#define splashscreen_TILE_W 8
#define splashscreen_TILE_H 8
#define splashscreen_WIDTH 160
#define splashscreen_HEIGHT 144
#define splashscreen_TILE_COUNT 254
#define splashscreen_PALETTE_COUNT 8
#define splashscreen_COLORS_PER_PALETTE 4
#define splashscreen_TOTAL_COLORS 32
#define splashscreen_MAP_ATTRIBUTES splashscreen_map_attributes
#define splashscreen_MAP_ATTRIBUTES_WIDTH 20
#define splashscreen_MAP_ATTRIBUTES_HEIGHT 18
#define splashscreen_MAP_ATTRIBUTES_PACKED_WIDTH 20
#define splashscreen_MAP_ATTRIBUTES_PACKED_HEIGHT 18
extern const unsigned char splashscreen_map[360];
extern const unsigned char splashscreen_map_attributes[360];

BANKREF_EXTERN(splashscreen)

extern const palette_color_t splashscreen_palettes[32];
extern const uint8_t splashscreen_tiles[4064];

#endif
