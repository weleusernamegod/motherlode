
#include <gb/gb.h>
#include <stdio.h>
#include <gbdk/font.h>
#include <string.h>


#include "palettes.h"
#include "globals.h"
#include "constants.h"
#include "../assets/font.h"

void init_font(void){
    set_bkg_data(1, font_TILE_COUNT, font_tiles);
}

void init_screen(void){
    SHOW_BKG;
    SHOW_WIN;
    SHOW_SPRITES;
    DISPLAY_ON;
}

void init_clear_screen(void) {
    // set all palettes to 0
    uint16_t temparray[2048];
    for (uint16_t i = 0; i < 2048; i++){
        temparray[i] = 0;
    }
    VBK_REG = 1;
    set_bkg_tiles(0,0,20, 18, temparray);
    VBK_REG = 0;

    // set all palettes to default
    // for (uint8_t i = 0; i < 8; i++) {
    //     set_sprite_palette(i, 1, palette_default);
    //     set_bkg_palette(i, 1, palette_default);
    // }
    
    // set all sprites to empty
    set_sprite_data(0, 128, temparray);

    // hide all sprites
    for (uint8_t i = 0; i < 40; i++) {
        set_sprite_tile(i, 0);
        hide_sprite(i);
    }
}

void read_buttons(void) {
    buttons = joypad(); // Read current gamepad state
}

unsigned char convert_char_to_tile(char c) {
    if (c >= 'A' && c <= 'Z') return LETTER_START + (c - 'A');
    if (c >= 'a' && c <= 'z') return SLETTER_START + (c - 'a');
    if (c >= '0' && c <= '9') return NUMBERS_START + (c - '0');
    switch (c) {
        case '!': return 15;
        case '?': return 16;
        case '.': return 17;
        case ':': return 18;
        case '/': return 19;
        case '+': return 20;
        case '-': return 21;
        case '$': return 22;
        case '%': return 23;

        default: return 0;  // Default to space if character is not handled
    }
}

void draw_text(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette) {
    uint8_t textLength = strlen(text);
    uint8_t *vramAddr = get_win_xy_addr(x, y);

    if (textLength > length) {
        textLength = length;  // Cap the text length at the defined maximum
    }

    // Calculate starting index for drawing text
    if (!left_aligned) {
        // If right-aligned, calculate starting position based on text length
        vramAddr += length - textLength;
        x += length - textLength;
    }

    // Fill in the padding space with empty tiles if the text is shorter than the length
    if (!left_aligned) {
        for (uint8_t i = 0; i < length - textLength; i++) {
            set_win_tile_xy(x - length + textLength + i, y, palette);
            set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }

    // Draw the text
    for (uint8_t i = 0; i < textLength; i++) {
        set_win_tile_xy(x + i, y, palette);
        set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
    }

    // If left-aligned and needs padding after text
    if (left_aligned) {
        for (uint8_t i = textLength; i < length; i++) {
            set_win_tile_xy(x + i, y, palette);
            set_vram_byte(vramAddr++, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }
}

void init_sprite_palettes(void){
    set_sprite_palette(0, 1, palette_rover); // Rover
    set_sprite_palette(1, 1, palette_drill); // Drill
    set_sprite_palette(2, 1, palette_hull_bar); // Hull Bar
    set_sprite_palette(3, 1, palette_fuel_bar); // Fuel Bar
    set_sprite_palette(4, 1, palette_warnings); // Warnings
    set_sprite_palette(5, 1, palette_default);
    set_sprite_palette(6, 1, palette_default);
    set_sprite_palette(7, 1, palette_default);
}

void init_palette_0(void) {
    set_bkg_palette(0, 1, palette_background);
}


void turn_screen_off(void) {
    DISPLAY_OFF;
}

void turn_screen_on(void) {
    DISPLAY_ON;
}