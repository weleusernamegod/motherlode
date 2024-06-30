#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/font.h>
#include <stdio.h>


#include "constants.h"
#include "globals.h"
#include "palettes.h"

#include "../assets/splashscreen_screen.h"
#include "../assets/splashscreen.h"

#pragma bank 4
#ifndef __INTELLISENSE__
BANKREF(bank_main_menu)
#endif

void draw_menu_buttons(void) {
    for (uint8_t i = 0; i < MENU_ITEMS; i++) {
        if (i == current_menu_index) {
            set_sprite_palette(i, 1, &splashscreen_screen_palettes[0 * 4]); // Access first palette set
        } else {
            set_sprite_palette(i, 1, &splashscreen_screen_palettes[1 * 4]); // Access second palette set
        }
    }
}

void draw_main_menu(void){
    if (joypad() & J_UP) {
        if (current_menu_index > 0) {
            current_menu_index--;
            draw_menu_buttons();
            delay(200);  // Debounce delay
        }
    } else if (joypad() & J_DOWN) {
        if (current_menu_index < MENU_ITEMS - 1) {
            current_menu_index++;
            draw_menu_buttons();
            delay(200);  // Debounce delay
        }
    }
}

void hide_main_menu(void){
    hide_metasprite(splashscreen_screen_metasprites[0], 0);
}

void init_main_menu(void) {
    uint8_t x = 20, y = 117;
    uint8_t distance_between_buttons = 1;

    // load sprites
    set_bkg_data(0, splashscreen_TILE_COUNT, splashscreen_tiles);
    set_sprite_data(0, splashscreen_screen_TILE_COUNT, splashscreen_screen_tiles);
    
    // palettes
    set_bkg_palette(0, splashscreen_PALETTE_COUNT, splashscreen_palettes);
    set_sprite_palette(0, splashscreen_screen_PALETTE_COUNT, splashscreen_screen_palettes);

    // set hardwaretiles
    for (uint8_t i = 0; i <= splashscreen_screen_TILE_COUNT; i++){
        set_sprite_tile(i, i);
    }

    // write splashscreen tiles and attributes
    VBK_REG = 1;
    set_bkg_tiles(0,0,20, 18, splashscreen_map_attributes);
    VBK_REG = 0;
    set_bkg_tiles(0,0,20, 18, splashscreen_map);

    current_menu_index = 0;
    move_metasprite_ex(splashscreen_screen_metasprites[0], splashscreen_screen_TILE_ORIGIN, 0, 0, 49, 133);
    draw_menu_buttons(); // initialise palettes

    SHOW_BKG;
    SHOW_SPRITES;
    HIDE_WIN;
    DISPLAY_ON;

}







