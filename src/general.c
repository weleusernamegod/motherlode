#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <gbdk/font.h>
#include <string.h>
#include <rand.h>


#include "palettes.h"
#include "attributes.h"
#include "globals.h"
#include "constants.h"
#include "level.h"

#include "../assets/font.h"
#include "../assets/character.h"
#include "../assets/drill_h.h"
#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/prop.h"
#include "../assets/progressbar.h"

void init_font(void){

    set_bkg_data(font_TILE_ORIGIN, font_TILE_COUNT, font_tiles);
    set_bkg_data(character_TILE_ORIGIN, character_TILE_COUNT, character_tiles);
}

void init_progressbar(void){
    set_sprite_data(PROGRESSBAR_TILE_0_8, progressbar_TILE_COUNT, progressbar_tiles);
}

void init_screen(void){
    SHOW_BKG;
    SHOW_WIN;
    SHOW_SPRITES;
    DISPLAY_ON;
}

void init_sound(void){  
    NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
    NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
    NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
}

void mute_sound(void){
    NR52_REG = 0x00;
}

void init_clear_screen(void) {
    // set all palettes to 0
    move_win(7,0);
    move_bkg(0,0);

    uint16_t temparray[2048];
    memset(temparray, COLOR_0, sizeof(temparray)); // color 0 tile
    set_bkg_tiles(0,0,20, 18, temparray);
    set_win_tiles(0,0,20, 18, temparray);
    memset(temparray, 0, sizeof(temparray)); // default palette 0

    if (isGBC) {
        VBK_REG = 1;
        set_bkg_tiles(0,0,20, 18, temparray);
        set_win_tiles(0,0,20, 18, temparray);
        VBK_REG = 0;
    }
    
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
            if (isGBC) {
                VBK_REG = 1;
                set_win_tile_xy(x - length + textLength + i, y, palette);
                VBK_REG = 0;
            }
            set_win_tile_xy(x - length + textLength + i, y, 0);
            set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }

    // Draw the text
    for (uint8_t i = 0; i < textLength; i++) {
        if (isGBC) {
            VBK_REG = 1;
            set_win_tile_xy(x + i, y, palette);
            VBK_REG = 0;
        }
        set_win_tile_xy(x + i, y, 0);
        set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
    }

    // If left-aligned and needs padding after text
    if (left_aligned) {
        for (uint8_t i = textLength; i < length; i++) {
            if (isGBC) {
                VBK_REG = 1;
                set_win_tile_xy(x + i, y, palette);
                VBK_REG = 0;
            }
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
            if (isGBC) {
                VBK_REG = 1;
                set_bkg_tile_xy(x - length + textLength + i, y, palette);
                VBK_REG = 0;
            }
            set_bkg_tile_xy(x - length + textLength + i, y, 0);
            set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
        }
    }

    // Draw the text
    for (uint8_t i = 0; i < textLength; i++) {
        if (isGBC) {
            VBK_REG = 1;
            set_bkg_tile_xy(x + i, y, palette);
            VBK_REG = 0;
        }
        set_bkg_tile_xy(x + i, y, 0);
        set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
    }

    // If left-aligned and needs padding after text
    if (left_aligned) {
        for (uint8_t i = textLength; i < length; i++) {
        if (isGBC) {
            VBK_REG = 1;
            set_bkg_tile_xy(x + i, y, palette);
            VBK_REG = 0;
        }
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

void switch_ram_bank_back_to_prev(void) {
    current_ram_bank = prev_ram_bank;
    SWITCH_RAM(prev_ram_bank);
}

void switch_ram_bank_based_on_value(uint16_t value) {
    prev_ram_bank = current_ram_bank;
    current_ram_bank = value / 256; // Determine which bank to switch to
    SWITCH_RAM(current_ram_bank); // Switch to the appropriate bank
}

uint8_t get_tile_from_array(uint16_t depth, uint16_t width) {
    switch_ram_bank_based_on_value(depth);
    uint8_t tile = level_array[depth % 256][width];
    switch_ram_bank_back_to_prev();
    return tile;
}

void shuffle(uint8_t array[4]) {
    uint16_t seed = LY_REG;
    seed |= (uint16_t)DIV_REG << 8;
    initrand(seed);
    // Get two random numbers for swapping
    uint8_t firstSwapIndex = rand() % 4;
    uint8_t secondSwapIndex;
    do {
        secondSwapIndex = rand() % 4;
    } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index

    // Perform the first swap
    uint8_t temp = array[firstSwapIndex];
    array[firstSwapIndex] = array[secondSwapIndex];
    array[secondSwapIndex] = temp;

    // Optional: A second swap to increase randomness without full loop
    firstSwapIndex = rand() % 4;
    do {
        secondSwapIndex = rand() % 4;
    } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index

    temp = array[firstSwapIndex];
    array[firstSwapIndex] = array[secondSwapIndex];
    array[secondSwapIndex] = temp;
}

/**
 * @param current_value the current value for the progressbar
 * @param max_value the max value / range of the bar
 * @param digits how many 8x8 sprites the bar should be long
 * @param tilestart what hardware sprite to use
 * @param palette what palette to use
 * @param x x-coordinate of first tile
 * @param y y-coordinate of first tile
 */
void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t palette, uint8_t x, uint8_t y) {
    // Calculate percentage of progress in terms of total available width in pixels (digits * 8)
    uint8_t total_pixels = digits * 8;
    uint16_t pixels_to_fill;

    // For large values use 32-bit value
    if (digits > 3) {
        uint32_t scaled_value = (uint32_t)current_value * total_pixels; // Use uint32_t for the intermediate result
        pixels_to_fill = scaled_value / max_value;
    } else {
        pixels_to_fill = (current_value * total_pixels) / max_value;
    }

    for (uint8_t i = 0; i < digits; i++) {
        uint8_t tile_index = PROGRESSBAR_TILE_0_8; // Default to empty
        uint8_t sprite_pixels = 8; // Each sprite can show up to 8 pixels (full sprite width)
        uint8_t effective_pixels = (pixels_to_fill > sprite_pixels) ? sprite_pixels : pixels_to_fill;

        // Adjust pixel count for next sprite
        pixels_to_fill -= effective_pixels;

        // Handle the special case for effective_pixels == 8
        if (effective_pixels == 8) {
            if (i == digits - 1 || pixels_to_fill == 0) { // Last sprite or no more pixels to fill
                tile_index = PROGRESSBAR_TILE_8_8;
            } else {
                tile_index = PROGRESSBAR_TILE_END;
            }
        } else {
            // Map effective pixels to sprite tiles
            switch (effective_pixels) {
                case 0: tile_index = PROGRESSBAR_TILE_0_8; break;
                case 1: tile_index = PROGRESSBAR_TILE_1_8; break;
                case 2: tile_index = PROGRESSBAR_TILE_2_8; break;
                case 3: tile_index = PROGRESSBAR_TILE_3_8; break;
                case 4: tile_index = PROGRESSBAR_TILE_4_8; break;
                case 5: tile_index = PROGRESSBAR_TILE_5_8; break;
                case 6: tile_index = PROGRESSBAR_TILE_6_8; break;
                case 7: tile_index = PROGRESSBAR_TILE_7_8; break;
            }
        }

        // Set the sprite tile and move it into position
        set_sprite_tile(tilestart + i, tile_index);
        set_sprite_prop(tilestart + i, 0b10000000 | palette); // Set it to background and OR it with palette
        move_sprite(tilestart + i, x + i * 8, y);
    }
}
