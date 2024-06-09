#pragma bank 3

//AUTOGENERATED FILE FROM png2asset

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

BANKREF(fuel_display)

const palette_color_t fuel_display_palettes[4] = {
	RGB8( 81, 91, 82), RGB8(177,156, 85), RGB8(159,139, 76), RGB8(128,107, 55)
	
};

const uint8_t fuel_display_tiles[64] = {
	0x07,0x07,0x3f,0x38,
	0x7f,0x40,0xff,0x80,
	0xff,0x80,0xff,0xc0,
	0xbf,0xf8,0xc7,0xff,
	
0xe0,0xe0,0xfc,0x1c,
	0xfe,0x02,0xff,0x01,
	0xff,0x01,0xfe,0x03,
	0xfc,0x1f,0xfa,0xe5,
	
0xab,0xf4,0xc7,0xf8,
	0xab,0xf4,0xc7,0xf8,
	0xab,0xf4,0xc7,0xf8,
	0xab,0xf4,0xc7,0xf8,
	
0xfc,0x03,0xfa,0x05,
	0xfc,0x03,0xfa,0x05,
	0xfc,0x03,0xfa,0x05,
	0xfc,0x03,0xfa,0x05
	
};

const metasprite_t fuel_display_metasprite0[] = {
	METASPR_ITEM(0, -8, 0, S_PAL(0)),
	METASPR_ITEM(0, 8, 1, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_ITEM(8, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t* const fuel_display_metasprites[1] = {
	fuel_display_metasprite0
};
