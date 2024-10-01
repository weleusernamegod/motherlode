#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <gb/gb.h>
#include <stdio.h>

// general
#define ROWS 2048
#define COLS 16

#define START_DEPTH 2
#define START_WIDTH 4

#define MAX_PALETTES 8
#define BYTE_PER_PALETTE 4
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

#define BKG 0
#define WIN 1

// music
#define GAME_THEME_BANK_NR 5
#define SHOP_THEME_BANK_NR 6


// main menu
#define MAIN_MENU_ITEMS 3
#define MAIN_MENU_X 49
#define MAIN_MENU_Y 133

// shop
#define UPGRADE_TICK_TILE 39

#define POWERUP_EXTRA_TANK 2
#define POWERUP_REPAIR_KIT 3
#define POWERUP_DYNAMITE 4
#define POWERUP_TELEPORTER 5

#define STATION_Y 5
#define STATION_POWERUP_X 0
#define STATION_POWERUP_DOOR_OFFSET 2
#define STATION_SELL_X 5
#define STATION_SELL_DOOR_OFFSET 1
#define STATION_UPGRADE_X 11
#define STATION_UPGRADE_DOOR_OFFSET 1
#define STATION_SAVE_X 8.5
#define STATION_SAVE_Y 3
#define STATION_SAVE_DOOR_OFFSET 0

// nav
#define FUEL_ICON ((uint8_t)(LETTER_START + 5))
#define HULL_ICON ((uint8_t)(LETTER_START + 7))
#define CARGO_ICON ((uint8_t)(NUMBERS_START - 2))
#define DEPTH_ICON ((uint8_t)(NUMBERS_START - 1))

#define ICON_Y 24
#define ICON_HULL_X 31
#define ICON_FUEL_X 71
#define ICON_CARGO_X 110
#define ICON_DEPTH_X 158

#define PERCENTAGE_NORMAL 30
#define PERCENTAGE_CRITICAL 10


// sprite palettes
#define ROVER_PALETTE_0 0
#define ROVER_PALETTE_1 1
#define TRACKS_PALETTE 2
#define DRILL_PALETTE 3
#define HULL_BAR_PALETTE 4
#define FUEL_BAR_PALETTE 5
#define ICON_PALETTE 6
#define WARNING_PALETTE 7
#define GAME_OVER_PALETTE 7

#define COLOR_TO_CHANGE_BKG 0 // what color of bkg palette 0 is changing with depth
#define COLOR_TO_CHANGE_SKY 0 // what color of sky to change

#define HIGHLIGHT_FRAME_PALETTE 1
#define FUEL_DISPLAY_PALETTE 2
#define TICK_PALETTE 2

#define WIN_X 4
#define WIN_Y 0

#define MIN_MINABLE_MATERIAL COAL
#define MAX_MINABLE_MATERIAL DIAMOND
#define MATERIAL_COUNT ARTEFACT + 1

// optimises, at what framecounter to do what task
#define TICK_FUEL 15
#define TICK_HULL 45

// color palettes
#define PALETTE_SKY 7

// movement
#define METATILES_VISIBLE 8
#define METATILES_TOTAL 10
#define GROUND 5
#define UNDERGROUND (GROUND + 1)
#define CLOSE_TO_SURFACE 7 // use this together with depth_offset for start of mining mode

#define DEPTH_CHANGE 12

#define THRESHOLD 2  // How many metatiles away from the screenedge does scrolling start
#define BOTTOM 0    // Offset from the bottom edge of the screen
#define TOP 0    // Offset from the top edge of the screen, to account for the nav/window element
#define LEFT 1
#define RIGHT 2
#define UP 3
#define DOWN 4
#define MAX_HEIGHT 2

#define BASE_DRILLTIME 15
#define TERMINAL_VELOCITY 14
#define FALL_DAMAGE_THRESHOLD 6
#define LAVA_DAMAGE 100
#define GAS_DAMAGE 100

#define IDLE 0
#define DRILL 1
#define DRIVE 2
#define ACCELERATE 3
#define PIXEL_FROM_CENTER 12

#define SFX_MULTIPLIER 2

#define FUEL_PRICE 3
#define REPAIR_PRICE 20

#define ATTRIBUTE_DRILL 0
#define ATTRIBUTE_HULL 1
#define ATTRIBUTE_ENGINE 2
#define ATTRIBUTE_FUEL 3
#define ATTRIBUTE_RADIATOR 4
#define ATTRIBUTE_CARGO 5

// sprites
#define ROVER_START 0
#define TRACKS_START 4
#define DRILL_H_START 6
#define DRILL_V_START 8
#define PROP_START 10
#define EYE_START 12
#define SKULL_START 10
#define GAME_OVER_START 30
#define A_BUTTON_START 19
#define ICON_HULL_START 13
#define ICON_FUEL_START ((uint8_t)(ICON_HULL_START + 1))
#define ICON_CARGO_START ((uint8_t)(ICON_HULL_START + 2))
#define ICON_DEPTH_START ((uint8_t)(ICON_HULL_START + 3))
#define PROGRESSBAR_HULL_START 35
#define PROGRESSBAR_FUEL_START 37
#define FUEL_DISPLAY_START 18

#define NUMBERS_START font_TILE_ORIGIN
#define LETTER_START ((uint8_t)(font_TILE_ORIGIN + 10))
#define SLETTER_START ((uint8_t)(font_TILE_ORIGIN + 10 + 26))
#define CHAR_START ((uint8_t)(character_TILE_ORIGIN + 10))
#define COLOR_0 ((uint8_t)(character_TILE_ORIGIN))
#define COLOR_1 ((uint8_t)(character_TILE_ORIGIN + 1))

// progressbar and warnings
#define GAME_OVER_Y (SCREENHEIGHT/2)
#define PROGRESSBAR_TILE_0_8 32    // Tile index for empty sprite
#define PROGRESSBAR_TILE_1_8   (PROGRESSBAR_TILE_0_8 + 1)    // Tile index for 1/8 filled sprite
#define PROGRESSBAR_TILE_2_8   (PROGRESSBAR_TILE_0_8 + 2)
#define PROGRESSBAR_TILE_3_8   (PROGRESSBAR_TILE_0_8 + 3)
#define PROGRESSBAR_TILE_4_8   (PROGRESSBAR_TILE_0_8 + 4)
#define PROGRESSBAR_TILE_5_8   (PROGRESSBAR_TILE_0_8 + 5)
#define PROGRESSBAR_TILE_6_8   (PROGRESSBAR_TILE_0_8 + 6)
#define PROGRESSBAR_TILE_7_8   (PROGRESSBAR_TILE_0_8 + 7)
#define PROGRESSBAR_TILE_8_8   (PROGRESSBAR_TILE_0_8 + 8)
#define PROGRESSBAR_TILE_END   (PROGRESSBAR_TILE_0_8 + 9)

// game over screen

#define GAME_OVER_ANIMATION_CYCLES 3
#define GAME_OVER_ANIMATION_DURATION 8

#define isGBC (_cpu == CGB_TYPE)

// music

#define PLAY_SHOP_THEME music_load(BANK(shop_theme), &shop_theme)
#define PLAY_GAME_THEME music_load(BANK(game_theme), &game_theme)

#define STOP_MUSIC music_stop();
#define PAUSE_MUSIC music_pause(music_paused = TRUE);
#define PLAY_MUSIC music_pause(music_paused = FALSE);


#define PLAY_SFX_drill              music_PLAY_SFX(BANK(motherlode_sfx_00), motherlode_sfx_00, SFX_MUTE_MASK(motherlode_sfx_00), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_prop               music_PLAY_SFX(BANK(motherlode_sfx_01), motherlode_sfx_01, SFX_MUTE_MASK(motherlode_sfx_01), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_hurt               music_PLAY_SFX(BANK(motherlode_sfx_02), motherlode_sfx_02, SFX_MUTE_MASK(motherlode_sfx_02), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_explosion_rumble   music_PLAY_SFX(BANK(motherlode_sfx_03), motherlode_sfx_03, SFX_MUTE_MASK(motherlode_sfx_03), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_explosion          music_PLAY_SFX(BANK(motherlode_sfx_04), motherlode_sfx_04, SFX_MUTE_MASK(motherlode_sfx_04), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_ore_mined          music_PLAY_SFX(BANK(motherlode_sfx_05), motherlode_sfx_05, SFX_MUTE_MASK(motherlode_sfx_05), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_ore_mined2         music_PLAY_SFX(BANK(motherlode_sfx_06), motherlode_sfx_06, SFX_MUTE_MASK(motherlode_sfx_06), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_special_mined      music_PLAY_SFX(BANK(motherlode_sfx_07), motherlode_sfx_07, SFX_MUTE_MASK(motherlode_sfx_07), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_low_fuel           music_PLAY_SFX(BANK(motherlode_sfx_08), motherlode_sfx_08, SFX_MUTE_MASK(motherlode_sfx_08), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_low_fuel_alt       music_PLAY_SFX(BANK(motherlode_sfx_09), motherlode_sfx_09, SFX_MUTE_MASK(motherlode_sfx_09), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_cargo_full         music_PLAY_SFX(BANK(motherlode_sfx_0a), motherlode_sfx_0a, SFX_MUTE_MASK(motherlode_sfx_0a), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_menu_in            music_PLAY_SFX(BANK(motherlode_sfx_0b), motherlode_sfx_0b, SFX_MUTE_MASK(motherlode_sfx_0b), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_menu_out           music_PLAY_SFX(BANK(motherlode_sfx_0c), motherlode_sfx_0c, SFX_MUTE_MASK(motherlode_sfx_0c), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_menu_tick          music_PLAY_SFX(BANK(motherlode_sfx_0d), motherlode_sfx_0d, SFX_MUTE_MASK(motherlode_sfx_0d), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_money              music_PLAY_SFX(BANK(motherlode_sfx_0e), motherlode_sfx_0e, SFX_MUTE_MASK(motherlode_sfx_0e), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_fuel_up            music_PLAY_SFX(BANK(motherlode_sfx_0f), motherlode_sfx_0f, SFX_MUTE_MASK(motherlode_sfx_0f), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_buy_powerup        music_PLAY_SFX(BANK(motherlode_sfx_10), motherlode_sfx_10, SFX_MUTE_MASK(motherlode_sfx_10), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_buy_upgrade        music_PLAY_SFX(BANK(motherlode_sfx_11), motherlode_sfx_11, SFX_MUTE_MASK(motherlode_sfx_11), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_buy_nothing        music_PLAY_SFX(BANK(motherlode_sfx_12), motherlode_sfx_12, SFX_MUTE_MASK(motherlode_sfx_12), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_enter              music_PLAY_SFX(BANK(motherlode_sfx_13), motherlode_sfx_13, SFX_MUTE_MASK(motherlode_sfx_13), MUSIC_SFX_PRIORITY_NORMAL);
#define PLAY_SFX_exit               music_PLAY_SFX(BANK(motherlode_sfx_14), motherlode_sfx_14, SFX_MUTE_MASK(motherlode_sfx_14), MUSIC_SFX_PRIORITY_NORMAL);



#endif // CONSTANTS_H