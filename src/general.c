#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/font.h>
#include <string.h>


#include "palettes.h"
#include "attributes.h"
#include "globals.h"
#include "constants.h"

#include "../assets/font.h"
#include "../assets/character.h"
#include "../assets/drill_h.h"
#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/prop.h"

void init_font(void){

    set_bkg_data(font_TILE_ORIGIN, font_TILE_COUNT, font_tiles);
    set_bkg_data(character_TILE_ORIGIN, character_TILE_COUNT, character_tiles);
}

void init_screen(void){
    SHOW_BKG;
    SHOW_WIN;
    SHOW_SPRITES;
    DISPLAY_ON;
}

void init_sound(void){
    NR52_REG = 0x80;
    NR51_REG = 0xFF;
    NR50_REG = 0x77;
}

void init_clear_screen(void) {
    // set all palettes to 0
    move_win(7,0);
    move_bkg(0,0);

    uint16_t temparray[2048];
    memset(temparray, COLOR_0, sizeof(temparray)); // color 0 tile
    set_bkg_tiles(0,0,20, 18, temparray);
    set_win_tiles(0,0,20, 18, temparray);
    VBK_REG = 1;
    memset(temparray, 0, sizeof(temparray)); // default palette 0
    set_bkg_tiles(0,0,20, 18, temparray);
    set_win_tiles(0,0,20, 18, temparray);
    VBK_REG = 0;
    
    set_bkg_data(0, 256, temparray);
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



    if (c >= 'a' && c <= 'z') return SLETTER_START + (c - 'a');
    if (c >= 'A' && c <= 'Z') return LETTER_START + (c - 'A');
    if (c >= '0' && c <= '9') return NUMBERS_START + (c - '0');
    switch (c) {

        case '?': return CHAR_START + 0;
        case '.': return CHAR_START + 1;
        case '/': return CHAR_START + 2;
        case '-': return CHAR_START + 3;
        case '$': return CHAR_START + 4;
        case '%': return CHAR_START + 5;
        case '&': return CHAR_START + 6;
        case '*': return CHAR_START + 7;
        case '#': return CHAR_START + 8;
        case '^': return CHAR_START + 9;

        default: return COLOR_0;  // Default to space if character is not handled
    }
}

void draw_text_win(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette) {
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
            VBK_REG = 1;
            set_win_tile_xy(x - length + textLength + i, y, palette);
            VBK_REG = 0;
            set_win_tile_xy(x - length + textLength + i, y, 0);
            set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }

    // Draw the text
    for (uint8_t i = 0; i < textLength; i++) {
        VBK_REG = 1;
        set_win_tile_xy(x + i, y, palette);
        VBK_REG = 0;
        set_win_tile_xy(x + i, y, 0);
        set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
    }

    // If left-aligned and needs padding after text
    if (left_aligned) {
        for (uint8_t i = textLength; i < length; i++) {
            VBK_REG = 1;
            set_win_tile_xy(x + i, y, palette);
            VBK_REG = 0;
            set_win_tile_xy(x + i, y, 0);
            set_vram_byte(vramAddr++, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }
}

void draw_text_bkg(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette) {
    uint8_t textLength = strlen(text);
    uint8_t *vramAddr = get_bkg_xy_addr(x, y);

    if (textLength > length) {
        textLength = length;  // Cap the text length at the defined maximum
    }

    // Calculate starting index for drabkgg text
    if (!left_aligned) {
        // If right-aligned, calculate starting position based on text length
        vramAddr += length - textLength;
        x += length - textLength;
    }

    // Fill in the padding space with empty tiles if the text is shorter than the length
    if (!left_aligned) {
        for (uint8_t i = 0; i < length - textLength; i++) {
            VBK_REG = 1;
            set_bkg_tile_xy(x - length + textLength + i, y, palette);
            VBK_REG = 0;
            set_bkg_tile_xy(x - length + textLength + i, y, 0);
            set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }

    // Draw the text
    for (uint8_t i = 0; i < textLength; i++) {
        VBK_REG = 1;
        set_bkg_tile_xy(x + i, y, palette);
        VBK_REG = 0;
        set_bkg_tile_xy(x + i, y, 0);
        set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
    }

    // If left-aligned and needs padding after text
    if (left_aligned) {
        for (uint8_t i = textLength; i < length; i++) {
            VBK_REG = 1;
            set_bkg_tile_xy(x + i, y, palette);
            VBK_REG = 0;
            set_bkg_tile_xy(x + i, y, 0);
            set_vram_byte(vramAddr++, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }
}

void draw_text_sprite(uint8_t x, uint8_t y, uint8_t hardware_sprite, char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette) {    uint8_t textLength = strlen(text);

    if (length >= 10) length = 10;

    if (textLength > length) {
        textLength = length;  // Cap the text length at the defined maximum
    }

    // Calculate starting position if right-aligned
    if (!left_aligned) {
        x -= (textLength - 1) * 8;  // Assuming each character sprite is 8 pixels wide
    }

    // Draw each character as a sprite
    for (uint8_t i = 0; i < textLength; i++) {
        uint8_t tileIndex = convert_char_to_tile(text[i]);

        // Set sprite tile and position
        set_sprite_tile(hardware_sprite + i, tileIndex);
        move_sprite(hardware_sprite + i, x + i * 8, y);
        set_sprite_prop(hardware_sprite + i, palette);
    }
}

void init_sprite_palettes(void){
    set_sprite_palette(ROVER_PALETTE_0, 1, &rover_palettes[0]); // Rover
    set_sprite_palette(ROVER_PALETTE_1, 1, &rover_palettes[4]); // Rover
    set_sprite_palette(TRACKS_PALETTE, 1, &tracks_palettes[0]); // Tracks
    set_sprite_palette(DRILL_PALETTE, 1, &drill_h_palettes[(player.drill.upgrade_level) * 4]); // Drill
    set_sprite_palette(HULL_BAR_PALETTE, 1, palette_hull_bar); // Hull Bar
    set_sprite_palette(FUEL_BAR_PALETTE, 1, palette_fuel_bar); // Fuel Bar
    set_sprite_palette(ICON_PALETTE, 1, palette_icon); // Eye
    set_sprite_palette(WARNING_PALETTE, 1, palette_warning); // Warning
}

void init_palette_0(void) {
    set_bkg_palette(0, 1, palette_background);
}


void turn_screen_off(void) {
    DISPLAY_OFF;
    hide_sprites_range(0, MAX_HARDWARE_SPRITES);
}

void turn_screen_on(void) {
    DISPLAY_ON;
}

void wait_for_input(void) {
    while (1) {
        uint8_t key = joypad();  // Get the current state of the joypad

        if (key & J_START || key & J_A || key & J_B) {
            break;  // Break the loop if START, A, or B is pressed
        }

        vsync();  // Wait for the vertical blank to reduce CPU usage
    }
}