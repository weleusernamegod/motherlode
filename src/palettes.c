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

#define RGB_MEDIUM_BROWN			RGB8(84, 63, 51)
#define RGB_VIVID_GREEN				RGB8(110, 159, 69)
#define RGB_DARK_GREEN				RGB8(72, 109, 59)
#define RGB_VERY_DARK_GREEN			RGB8(38, 52, 29)
#define RGB_DARK_BROWN				RGB8(62, 43, 33)
#define RGB_MEDIUM_GREY				RGB8(127, 120, 120)
#define RGB_VERY_DARK_GREY			RGB8(42, 42, 42)
#define RGB_DARK_GREY				RGB8(99, 93, 96)
#define RGB_DARKER_GREY				RGB8(56, 54, 55)
#define RGB_STEEL_GREY				RGB8(115, 124, 120)
#define RGB_IRON_GREY				RGB8(87, 95, 94)
#define RGB_COPPER_ORANGE			RGB8(171, 94, 35)
#define RGB_DEEP_COPPER				RGB8(135, 63, 29)
#define RGB_TIN_GREY				RGB8(194, 197, 201)
#define RGB_DULL_GREY				RGB8(127, 129, 141)
#define RGB_SILVER_GREY				RGB8(221, 211, 208)
#define RGB_GREYISH_SILVER			RGB8(181, 177, 174)
#define RGB_GOLD_YELLOW				RGB8(223, 179, 101)
#define RGB_GOLDEN_BROWN			RGB8(210, 150, 71)
#define RGB_LIGHT_YELLOW			RGB8(255, 254, 232)
#define RGB_LIGHT_GREEN				RGB8(205, 221, 157)
#define RGB_PLATINUM_PURPLE			RGB8(142, 132, 190)
#define RGB_DARK_PURPLE				RGB8(96, 86, 135)
#define RGB_PALE_GREY				RGB8(222, 217, 219)
#define RGB_DULL_PINK				RGB8(164, 141, 146)
#define RGB_DARK_BLUE_GREY			RGB8(65, 79, 86)
#define RGB_VERY_DARK_BLUE_GREY		RGB8(35, 45, 52)
#define RGB_BLUEISH_GREY			RGB8(79, 93, 106)
#define RGB_DARK_BLUEISH_GREY		RGB8(64, 75, 89)
#define RGB_ALMOST_WHITE			RGB8(255, 253, 255)
#define RGB_METALLIC_GREY			RGB8(163, 164, 168)
#define RGB_BRIGHT_GREEN			RGB8(118, 183, 95)
#define RGB_DEEP_GREEN				RGB8(63, 93, 53)
#define RGB_DARK_ROSE				RGB8(184, 108, 96)
#define RGB_BURNED_RED				RGB8(157, 71, 50)
#define RGB_GREYISH_BROWN			RGB8(108, 103, 99)
#define RGB_LIGHT_BLUE_GREEN		RGB8(149, 180, 177)
#define RGB_VERY_DARK_BLUE_GREEN	RGB8(37, 53, 49)
#define RGB_BRIGHT_ORANGE			RGB8(239, 137, 54)
#define RGB_STRONG_RED				RGB8(214, 56, 33)
#define RGB_DEEP_RED				RGB8(185, 40, 26)
#define RGB_LIGHT_PURPLE			RGB8(205, 196, 203)
#define RGB_COOL_GREY				RGB8(103, 97, 96)
#define RGB_LIGHT_BROWN				RGB8(208, 192, 169)
#define RGB_WARM_BROWN				RGB8(115, 93, 83)


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



const palette_color_t palette_sky[4] = {
	RGB_LIGHT_BLUE,
	RGB_LIGHT_GREY,
	RGB_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_station[4] = {
	RGB_LIGHT_BLUE,
	RGB_LIGHT_GREY,
	RGB_MEDIUM_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_default[4] = {
	RGB_WHITE,
	RGB_LIGHT_GREY,
	RGB_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_rover[4] = {
	RGB_WHITE,
	RGB_LIGHT_GREY,
	RGB_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_drill[4] = {
	RGB_WHITE,
	RGB_LIGHT_GREY,
	RGB_DARK_GREY,
	RGB_BLACK
};

const palette_color_t palette_warnings[4] = {
	RGB_WHITE,
	RGB_RED,
	RGB_DEEP_RED,
	RGB_BLACK
};




const palette_color_t palette_gras[4] = {
	RGB_MEDIUM_BROWN,
	RGB_VIVID_GREEN,
	RGB_DARK_GREEN,
	RGB_VERY_DARK_GREEN,
	};

const palette_color_t palette_stone[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_MEDIUM_GREY,
	RGB_VERY_DARK_GREY,
	};

const palette_color_t palette_coal[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_DARK_GREY,
	RGB_DARKER_GREY,
	};

const palette_color_t palette_iron[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_STEEL_GREY,
	RGB_IRON_GREY,
	};

const palette_color_t palette_copper[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_COPPER_ORANGE,
	RGB_DEEP_COPPER,
	};

const palette_color_t palette_tin[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_TIN_GREY,
	RGB_DULL_GREY,
	};

const palette_color_t palette_silver[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_GREYISH_SILVER,
	RGB_SILVER_GREY,
	};

const palette_color_t palette_gold[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_GOLD_YELLOW,
	RGB_GOLDEN_BROWN, 
};

const palette_color_t palette_mithril[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_YELLOW, 
RGB_LIGHT_GREEN, 
};

const palette_color_t palette_platinum[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_PLATINUM_PURPLE,
	RGB_DARK_PURPLE,
	};

const palette_color_t palette_titanium[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_PALE_GREY,
	RGB_DULL_PINK,
	};

const palette_color_t palette_obsidium[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_DARK_BLUE_GREY,
	RGB_VERY_DARK_BLUE_GREY,
	};

const palette_color_t palette_elementium[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_BLUEISH_GREY,
	RGB_DARK_BLUEISH_GREY,
	};

const palette_color_t palette_adamantite[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_ALMOST_WHITE,
	RGB_METALLIC_GREY,
	};

const palette_color_t palette_emerald[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_BRIGHT_GREEN, 
RGB_DEEP_GREEN, 
};

const palette_color_t palette_ruby[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_DARK_ROSE,
	RGB_BURNED_RED,
	};

const palette_color_t palette_diamond[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_MEDIUM_WHITE, 
RGB_GREYISH_BROWN, 
};

const palette_color_t palette_aquamarine[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_BLUE_GREEN,
	RGB_VERY_DARK_BLUE_GREEN,
	};

const palette_color_t palette_lava[4] = {
	RGB_MEDIUM_BROWN,
	RGB_BRIGHT_ORANGE,
	RGB_STRONG_RED,
	RGB_DEEP_RED,
	};

const palette_color_t palette_gas[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_PURPLE,
	RGB_COOL_GREY, 
};

const palette_color_t palette_bones[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_BROWN, 
RGB_WARM_BROWN, 
};

const palette_color_t palette_skull[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_BROWN, 
RGB_WARM_BROWN, 
};

const palette_color_t palette_artefact[4] = {
	RGB_MEDIUM_BROWN,
	RGB_DARK_BROWN,
	RGB_LIGHT_BROWN, 
RGB_WARM_BROWN, 
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