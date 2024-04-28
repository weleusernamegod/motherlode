#include <gb/gb.h>
#include <gb/cgb.h>


// Define the default grayscale palette
const palette_color_t palette_default[4] = {
    RGB8(255, 255, 255), // White
    RGB8(170, 170, 170), // Light Gray
    RGB8(85, 85, 85),    // Dark Gray
    RGB8(0, 0, 0)        // Black
};
// Define a uniform gray palette
const palette_color_t palette_light_grey[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(230, 230, 230),   // Medium Light Red
    RGB8(230, 230, 230),      // Dark Red
    RGB8(210, 210, 210)      // Dark Red
};

// Define a uniform gray palette
const palette_color_t palette_grey[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(160, 160, 160),   // Medium Light Red
    RGB8(128, 128, 128),      // Dark Red
    RGB8(70, 70, 70)      // Dark Red
};

// Define the active button palette
const palette_color_t palette_button_active[4] = {
    RGB8(255, 255, 255), // Bright White
    RGB8(242, 182, 82),  // Light Orange
    RGB8(217, 157, 40),  // Dark Orange
    RGB8(255, 255, 223)  // Off White
};

// Define the passive button palette
const palette_color_t palette_button_passive[4] = {
    RGB8(255, 255, 255), // White
    RGB8(154, 90, 50),   // Medium Brown
    RGB8(113, 56, 37),   // Dark Brown
    RGB8(0, 1, 11)       // Very Dark Blue
};

// Define palette for Red shades
const palette_color_t palette_red[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(160, 160, 160),   // Medium Light Red
    RGB8(215, 0, 0),   // Medium Dark Red
    RGB8(70, 70, 70)      // Dark Red
};

// Define palette for Red shades
const palette_color_t palette_dark_red[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(160, 160, 160),   // Medium Light Red
    RGB8(160, 40, 40),   // Medium Dark Red
    RGB8(70, 70, 70)      // Dark Red
};

// Define palette for Red shades
const palette_color_t palette_orange[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(160, 160, 160),   // Medium Light Red
    RGB8(255, 95, 0),   // Medium Dark Red
    RGB8(70, 70, 70)      // Dark Red
};

// Define palette for Green shades
const palette_color_t palette_green[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(96, 255, 96),   // Medium Light Green
    RGB8(48, 192, 48),   // Medium Dark Green
    RGB8(70, 70, 70)      // Dark Red
};

// Define palette for Blue shades
const palette_color_t palette_blue[4] = {
    RGB8(255, 255, 255), // Light Red
    RGB8(160, 160, 160),   // Medium Light Red
    RGB8(100, 160, 200),   // Medium Dark Blue
    RGB8(70, 70, 70)      // Dark Red
};

// Define palette for Yellow shades
const palette_color_t palette_yellow[4] = {
    RGB8(255, 255, 192), // Light Yellow
    RGB8(255, 255, 96),  // Medium Light Yellow
    RGB8(192, 192, 48),  // Medium Dark Yellow
    RGB8(128, 128, 0)    // Dark Yellow
};

// Define palette for Purple shades
const palette_color_t palette_purple[4] = {
    RGB8(255, 192, 255), // Light Purple
    RGB8(192, 96, 255),  // Medium Light Purple
    RGB8(128, 48, 192),  // Medium Dark Purple
    RGB8(96, 0, 128)     // Dark Purple
};