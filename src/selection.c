#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "../assets/highlight_frame.h"
#include "constants.h"

#define INIT_METASPRITE_ARRAY(i) \
{ \
    {16, 8, (i)*8+0, S_PAL(0)}, \
    \
    {0, 8, (i)*8+1, S_PAL(0)}, \
    {0, 8, (i)*8+1, S_PAL(0)}, \
    {0, 8, (i)*8+1, S_PAL(0)}, \
    {0, 8, (i)*8+1, S_PAL(0)}, \
    \
    {0, 8, (i)*8+2, S_PAL(0)}, \
    \
    {8, 0, (i)*8+4, S_PAL(0)}, \
    {8, 0, (i)*8+4, S_PAL(0)}, \
    {8, 0, (i)*8+4, S_PAL(0)}, \
    \
    {8, 0, (i)*8+7, S_PAL(0)}, \
    \
    {0, -8, (i)*8+6, S_PAL(0)}, \
    {0, -8, (i)*8+6, S_PAL(0)}, \
    {0, -8, (i)*8+6, S_PAL(0)}, \
    {0, -8, (i)*8+6, S_PAL(0)}, \
    \
    {0, -8, (i)*8+5, S_PAL(0)}, \
    \
    {-8, 0, (i)*8+3, S_PAL(0)}, \
    {-8, 0, (i)*8+3, S_PAL(0)}, \
    {-8, 0, (i)*8+3, S_PAL(0)}, \
    METASPR_TERM \
}

metasprite_t dynamic_highlight_frame_metasprite0[] = INIT_METASPRITE_ARRAY(0);
metasprite_t dynamic_highlight_frame_metasprite1[] = INIT_METASPRITE_ARRAY(1);
metasprite_t dynamic_highlight_frame_metasprite2[] = INIT_METASPRITE_ARRAY(2);
metasprite_t dynamic_highlight_frame_metasprite3[] = INIT_METASPRITE_ARRAY(3);

metasprite_t* dynamic_highlight_frame_metasprites[4] = {
    dynamic_highlight_frame_metasprite0,
    dynamic_highlight_frame_metasprite1,
    dynamic_highlight_frame_metasprite2,
    dynamic_highlight_frame_metasprite3
};

void init_highlight_frame(void) {
    set_sprite_data(highlight_frame_TILE_ORIGIN, highlight_frame_TILE_COUNT, highlight_frame_tiles);
    set_sprite_palette(HIGHLIGHT_FRAME_PALETTE, 1, highlight_frame_palettes);
}
