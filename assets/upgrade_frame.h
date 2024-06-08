//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_upgrade_frame_H
#define METASPRITE_upgrade_frame_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define upgrade_frame_TILE_ORIGIN 144
#define upgrade_frame_TILE_W 8
#define upgrade_frame_TILE_H 8
#define upgrade_frame_WIDTH 160
#define upgrade_frame_HEIGHT 144
#define upgrade_frame_TILE_COUNT 10
#define upgrade_frame_PALETTE_COUNT 1
#define upgrade_frame_COLORS_PER_PALETTE 4
#define upgrade_frame_TOTAL_COLORS 4
#define upgrade_frame_MAP_ATTRIBUTES 0

BANKREF_EXTERN(upgrade_frame)

extern const palette_color_t upgrade_frame_palettes[4];
extern const uint8_t upgrade_frame_tiles[160];

extern const unsigned char upgrade_frame_map[360];
#define upgrade_frame_map_attributes upgrade_frame_map

#endif