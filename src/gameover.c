#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/console.h>
#include <gbdk/font.h>
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <rand.h>

#include "globals.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "general.h"
#include "palettes.h"
#include "map.h"

#include "../assets/game_over_skull.h"

#include "sound.h"

#pragma bank 2
#ifndef __INTELLISENSE__
BANKREF(bank_gameover)
#endif


void init_game_over(void){
    set_sprite_data(game_over_skull_TILE_ORIGIN, game_over_skull_TILE_COUNT, game_over_skull_tiles);
    set_sprite_palette(GAME_OVER_PALETTE, 1, palette_game_over);
    game_over_animation_active = TRUE;
    game_over_animation_cycle = 0;
    game_over_animation_frame = 0;
}

void draw_game_over(void) {
    // Play skull laughing sound at the start of the animation
    if (game_over_animation_cycle == 0 && game_over_animation_frame == 0 && game_over_animation_active) {
        //PLAY_SFX_explosion_rumble;
    }

    // Animate the skull if animation is active
    if (game_over_animation_active) {
        // Move metasprite with the calculated animation frame
        game_over_animation_frame ++;
        move_metasprite_ex(game_over_skull_metasprites[game_over_animation_frame / GAME_OVER_ANIMATION_DURATION % (sizeof(game_over_skull_metasprites) >> 1)], game_over_skull_TILE_ORIGIN, GAME_OVER_PALETTE, SKULL_START, SCREENWIDTH/2+8, GAME_OVER_Y+16);

        // Check if one cycle of animation is complete
        if (game_over_animation_frame == (sizeof(game_over_skull_metasprites) >> 1) * GAME_OVER_ANIMATION_DURATION) {
            game_over_animation_frame = 0;
            game_over_animation_cycle++;
            
            // Check if desired animation cycles are complete
            if (game_over_animation_cycle >= GAME_OVER_ANIMATION_CYCLES) {
                game_over_animation_active = FALSE;  // Stop animating after completing desired cycles

                // After animation completes, display "GAME OVER"
                draw_text_sprite(72, 116, GAME_OVER_START, "GAME", 4, TRUE, GAME_OVER_PALETTE);
                draw_text_sprite(72, 116 + 10, GAME_OVER_START + 4, "OVER", 4, TRUE, GAME_OVER_PALETTE);
                scroll_sprite(GAME_OVER_START + 3, 1, 0); // move letter E one over, because it looks more nice
            }
        }
    }
}