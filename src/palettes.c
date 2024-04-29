#include <gb/gb.h>
#include <gb/cgb.h>

// Define colors as constants

#define RGB_MEDIUM_WHITE         RGB8(230, 230, 230)
#define RGB_DARK_WHITE           RGB8(210, 210, 210)
#define RGB_VERY_LIGHT_GREY      RGB8(184, 184, 184)
#define RGB_LIGHT_GREY           RGB8(170, 170, 170)
#define RGB_MEDIUM_GREY          RGB8(128, 123, 122)
#define RGB_DARK_GREY            RGB8(85, 85, 85)
#define RGB_VERY_DARK_GREY       RGB8(55, 51, 52)

#define RGB_MEDIUM_BROWN         RGB8(154, 90, 50)
#define RGB_MEDIUM_DARK_BROWN    RGB8(133, 95, 57)
#define RGB_DARK_BROWN           RGB8(113, 56, 37)
#define RGB_VERY_DARK_BROWN      RGB8(76, 61, 46)

#define RGB_LIGHT_RED            RGB8(255, 255, 255)
#define RGB_MEDIUM_LIGHT_RED     RGB8(230, 230, 230)
#define RGB_MEDIUM_DARK_RED      RGB8(255, 95, 0)
#define RGB_DARK_RED             RGB8(160, 40, 40)

#define RGB_MEDIUM_COPPER        RGB8(184, 115, 51)
#define RGB_DARK_COPPER          RGB8(153, 101, 21)

#define RGB_BRIGHT_WHITE         RGB8(255, 255, 255)
#define RGB_LIGHT_ORANGE         RGB8(242, 182, 82)
#define RGB_DARK_ORANGE          RGB8(217, 157, 40)
#define RGB_OFF_WHITE            RGB8(255, 255, 223)

#define RGB_LIGHT_GREEN          RGB8(97, 165, 63)
#define RGB_MEDIUM_GREEN         RGB8(71, 114, 56)
#define RGB_DARK_GREEN           RGB8(41, 63, 33)

#define RGB_MEDIUM_DARK_BLUE     RGB8(100, 160, 200)
#define RGB_VERY_DARK_BLUE       RGB8(0, 1, 11)

#define RGB_LIGHT_YELLOW         RGB8(255, 255, 192)
#define RGB_MEDIUM_LIGHT_YELLOW  RGB8(255, 255, 96)
#define RGB_MEDIUM_DARK_YELLOW   RGB8(192, 192, 48)
#define RGB_DARK_YELLOW          RGB8(128, 128, 0)

#define RGB_LIGHT_PURPLE         RGB8(255, 192, 255)
#define RGB_MEDIUM_LIGHT_PURPLE  RGB8(192, 96, 255)
#define RGB_MEDIUM_DARK_PURPLE   RGB8(128, 48, 192)
#define RGB_DARK_PURPLE          RGB8(96, 0, 128)

palette_color_t palette_sky[4] = {
    RGB_WHITE,
    RGB_LIGHT_GREY,
    RGB_DARK_GREY,
    RGB_BLACK
};

const palette_color_t palette_default[4] = {
    RGB_WHITE,
    RGB_LIGHT_GREY,
    RGB_DARK_GREY,
    RGB_BLACK
};

const palette_color_t palette_gras[4] = {
    RGB_MEDIUM_BROWN,
    RGB_LIGHT_GREEN,
    RGB_MEDIUM_GREEN,
    RGB_DARK_GREEN,
};

const palette_color_t palette_rock[4] = {
    RGB_MEDIUM_BROWN,
    RGB_VERY_DARK_BROWN,
    RGB_MEDIUM_GREY,
    RGB_VERY_DARK_GREY,
};

const palette_color_t palette_iron[4] = {
    RGB_MEDIUM_BROWN,
    RGB_VERY_DARK_BROWN,
    RGB_VERY_LIGHT_GREY,
    RGB_DARK_GREY,
};

const palette_color_t palette_copper[4] = {
    RGB_MEDIUM_BROWN,
    RGB_VERY_DARK_BROWN,
    RGB_MEDIUM_COPPER,
    RGB_DARK_COPPER,
};

// Define a uniform grey palette
const palette_color_t palette_grey[4] = {
    RGB_WHITE,
    RGB_LIGHT_GREY,
    RGB_MEDIUM_GREY,
    RGB_DARK_GREY,
};

// Define a uniform grey palette
const palette_color_t palette_light_grey[4] = {
    RGB_WHITE,
    RGB_MEDIUM_WHITE,
    RGB_MEDIUM_WHITE,
    RGB_DARK_WHITE,
};

// Define the active button palette
const palette_color_t palette_button_active[4] = {
    RGB_BRIGHT_WHITE,
    RGB_LIGHT_ORANGE,
    RGB_DARK_ORANGE,
    RGB_OFF_WHITE
};

// Define the passive button palette
const palette_color_t palette_button_passive[4] = {
    RGB_WHITE,
    RGB_MEDIUM_BROWN,
    RGB_DARK_BROWN,
    RGB_VERY_DARK_BLUE
};

// Define palette for Red shades
const palette_color_t palette_red[4] = {
    RGB_WHITE,
    RGB_MEDIUM_LIGHT_RED,
    RGB_MEDIUM_DARK_RED,
    RGB_DARK_RED
};

const palette_color_t palette_orange[4] = {
    RGB_WHITE,
    RGB_LIGHT_GREY,
    RGB_MEDIUM_DARK_RED,
    RGB_DARK_GREY
};

// Define palette for Green shades
const palette_color_t palette_green[4] = {
    RGB_WHITE,
    RGB_LIGHT_GREEN,
    RGB_MEDIUM_GREEN,
    RGB_DARK_GREEN,
};

// Define palette for Blue shades
const palette_color_t palette_blue[4] = {
    RGB_WHITE,
    RGB_MEDIUM_LIGHT_RED,
    RGB_MEDIUM_DARK_BLUE,
    RGB_DARK_GREY
};

// Define palette for Yellow shades
const palette_color_t palette_yellow[4] = {
    RGB_LIGHT_YELLOW,
    RGB_MEDIUM_LIGHT_YELLOW,
    RGB_MEDIUM_DARK_YELLOW,
    RGB_DARK_YELLOW
};

// Define palette for Purple shades
const palette_color_t palette_purple[4] = {
    RGB_LIGHT_PURPLE,
    RGB_MEDIUM_LIGHT_PURPLE,
    RGB_MEDIUM_DARK_PURPLE,
    RGB_DARK_PURPLE
};
