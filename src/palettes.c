#include <gb/gb.h>
#include <gb/cgb.h>

#include "palettes.h"

#define RGB_MEDIUM_WHITE			RGB8(230, 230, 230)
#define RGB_DARK_WHITE				RGB8(210, 210, 210)
#define RGB_VERY_LIGHT_GREY			RGB8(184, 184, 184)
#define RGB_LIGHT_GREY				RGB8(170, 170, 170)
#define RGB_MEDIUM_DARK_GREY		RGB8(50, 50, 50)

#define RGB_BRIGHT_WHITE			RGB8(255, 255, 255)
#define RGB_LIGHT_ORANGE			RGB8(242, 182, 82)
#define RGB_DARK_ORANGE				RGB8(217, 157, 40)
#define RGB_OFF_WHITE				RGB8(255, 255, 223)

#define RGB_GREEN_UNSELECTED		RGB8(60, 150, 50)
#define RGB_GREEN_SELECTED			RGB8(112, 190, 90)

#define RGB_LIGHT_BLUE				RGB8(232, 252, 255)
#define RGB_VERY_DARK_BLUE			RGB8(0, 1, 11)
#define RGB_MEDIUM_GREY				RGB8(127, 120, 120)
#define RGB_DARK_GREY				RGB8(96, 96, 96)
#define RGB_DEEP_RED				RGB8(185, 40, 26)

palette_color_t palette_background[4] = {
	RGB_MEDIUM_DARK_GREY,
	RGB_WHITE,
	RGB_BLACK,
	RGB_VERY_LIGHT_GREY,

};

palette_color_t palette_fuel_bar[4] = {
	RGB_WHITE,
	RGB_MEDIUM_WHITE,
	RGB_WHITE,
	RGB_BLACK
};

palette_color_t palette_hull_bar[4] = {
	RGB_WHITE,
	RGB_MEDIUM_WHITE,
	RGB_WHITE,
	RGB_BLACK
};

const palette_color_t palette_default[4] = {
	RGB_WHITE,
	RGB_LIGHT_GREY,
	RGB_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_icon[4] = {
	RGB_WHITE,
	RGB_WHITE,
	RGB_BLACK,
	RGB_VERY_LIGHT_GREY
};

const palette_color_t palette_warning[4] = {
	RGB_WHITE,
	RGB_DEEP_RED,
	RGB_BLACK,
	RGB_DEEP_RED
};

const palette_color_t palette_game_over[4] = {
	RGB_WHITE,
	RGB_WHITE,
	RGB_WHITE,
	RGB_WHITE
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
	RGB_GREEN_SELECTED,
	RGB_GREEN_SELECTED,
	RGB_GREEN_SELECTED
};

// Define the passive button palette
const palette_color_t palette_button_passive[4] = {
	RGB_WHITE,
	RGB_GREEN_UNSELECTED,
	RGB_GREEN_UNSELECTED,
	RGB_GREEN_UNSELECTED
};