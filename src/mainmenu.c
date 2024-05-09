#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/font.h>
#include <stdio.h>


#include "constants.h"
#include "globals.h"
#include "palettes.h"

#include "../assets/main_menu_buttons.h"
#include "../assets/splashscreen.h"

#pragma bank 3
#ifndef __INTELLISENSE__
BANKREF(bank_main_menu)
#endif

const metasprite_t metasprite_menu_button[] = {
    {.dy=0, .dx=0, .dtile=0, .props=0},
    {.dy=0, .dx=8, .dtile=1, .props=0},
    {.dy=0, .dx=8, .dtile=2, .props=0},
    {.dy=0, .dx=8, .dtile=3, .props=0},
    {.dy=0, .dx=8, .dtile=4, .props=0},
    {.dy=0, .dx=8, .dtile=5, .props=0},
    {.dy=0, .dx=8, .dtile=6, .props=0},
    METASPR_TERM
};

void draw_menu_buttons(void) {
    uint8_t i;
    VBK_REG = 1;
    for (i = 0; i < MENU_ITEMS; i++) {
        if (i == current_menu_index) {
            set_sprite_palette(i, 1, palette_button_active);
        } else {
            set_sprite_palette(i, 1, palette_button_passive);
        }
    }
    VBK_REG = 0;
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

void init_main_menu(void) {
    uint8_t x = 20, y = 117;
    uint8_t distance_between_buttons = 1;

    // load sprites
    set_bkg_data(0, splashscreen_TILE_COUNT, splashscreen_tiles);
    set_bkg_palette(0, splashscreen_PALETTE_COUNT, splashscreen_palettes);
    set_sprite_data(0, main_menu_buttons_TILE_COUNT, main_menu_buttons_tiles);

    // set hardwaretiles
    for (uint8_t i = 0; i <= main_menu_buttons_TILE_COUNT; i++){
        set_sprite_tile(i, i);
    }

    // write splashscreen tiles and attributes
    VBK_REG = 1;
    set_bkg_tiles(0,0,20, 18, splashscreen_map_attributes);
    VBK_REG = 0;
    set_bkg_tiles(0,0,20, 18, splashscreen_map);

    current_menu_index = 0;

    // draw the buttons as metasprites
    for (uint8_t i = 0; i < MENU_ITEMS; i++) {
        move_metasprite_ex(metasprite_menu_button, i * (main_menu_buttons_TILE_COUNT / MENU_ITEMS), i, i * (main_menu_buttons_TILE_COUNT / MENU_ITEMS), x, (y + i * distance_between_buttons + i * main_menu_buttons_TILE_H));
    }

    // initialize button palettes

    draw_menu_buttons();

    SHOW_BKG;
    SHOW_SPRITES;
    HIDE_WIN;
    DISPLAY_ON;

}







