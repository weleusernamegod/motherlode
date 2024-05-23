#pragma bank 1

//AUTOGENERATED FILE FROM png2asset

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

BANKREF(tracks)

const palette_color_t tracks_palettes[4] = {
	RGB8(255,255,255), RGB8(110,110,110), RGB8( 69, 69, 69), RGB8( 38, 38, 38)
	
};

const uint8_t tracks_tiles[96] = {
	0x00,0x00,0x00,0x00,
	0x00,0x00,0x3f,0x3f,
	0x5b,0x6d,0xed,0x92,
	0xff,0x92,0x7f,0x7f,
	
0x00,0x00,0x00,0x00,
	0x00,0x00,0xfc,0xfc,
	0x6e,0xb6,0xb7,0x49,
	0xff,0x49,0xfe,0xfe,
	
0x00,0x00,0x00,0x00,
	0x00,0x00,0x3f,0x3f,
	0x52,0x7f,0xed,0x92,
	0xed,0xdb,0x7f,0x7f,
	
0x00,0x00,0x00,0x00,
	0x00,0x00,0xfc,0xfc,
	0x4a,0xfe,0xb7,0x49,
	0xb7,0x6d,0xfe,0xfe,
	
0x00,0x00,0x00,0x00,
	0x00,0x00,0x3f,0x3f,
	0x76,0x6d,0xed,0x92,
	0xed,0xb6,0x7f,0x7f,
	
0x00,0x00,0x00,0x00,
	0x00,0x00,0xfc,0xfc,
	0xda,0xb6,0xb7,0x49,
	0xb7,0xdb,0xfe,0xfe
	
};

const metasprite_t tracks_metasprite0[] = {
	METASPR_ITEM(-4, -8, 0, S_PAL(0)),
	METASPR_ITEM(0, 8, 1, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t tracks_metasprite1[] = {
	METASPR_ITEM(-4, -8, 2, S_PAL(0)),
	METASPR_ITEM(0, 8, 3, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t tracks_metasprite2[] = {
	METASPR_ITEM(-4, -8, 4, S_PAL(0)),
	METASPR_ITEM(0, 8, 5, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t* const tracks_metasprites[3] = {
	tracks_metasprite0, tracks_metasprite1, tracks_metasprite2
};
