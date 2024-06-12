//AUTOGENERATED FILE FROM png2asset
#ifndef METASPRITE_fuel_display_H
#define METASPRITE_fuel_display_H

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

#define fuel_display_TILE_ORIGIN 0
#define fuel_display_TILE_W 8
#define fuel_display_TILE_H 8
#define fuel_display_WIDTH 16
#define fuel_display_HEIGHT 96
#define fuel_display_TILE_COUNT 4
#define fuel_display_PALETTE_COUNT 1
#define fuel_display_COLORS_PER_PALETTE 4
#define fuel_display_TOTAL_COLORS 4
#define fuel_display_PIVOT_X 8
#define fuel_display_PIVOT_Y 0
#define fuel_display_PIVOT_W 16
#define fuel_display_PIVOT_H 96

BANKREF_EXTERN(fuel_display)

extern const palette_color_t fuel_display_palettes[4];
extern const uint8_t fuel_display_tiles[64];

extern const metasprite_t* const fuel_display_metasprites[1];

#endif