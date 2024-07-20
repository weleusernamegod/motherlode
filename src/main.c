#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include <rand.h>

#include "globals.h"
#include "constants.h"
#include "palettes.h"
#include "inventory.h"
#include "attributes.h"

#include "map.h"
#include "player.h"
#include "general.h"
#include "interrupt.h"
#include "gameloop.h"
#include "mainmenu.h"
#include "upgrade.h"
#include "sell.h"
#include "powerup.h"
#include "gameover.h"
#include "loading.h"

#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/nav.h"
#include "../assets/ore_tiles.h"
#include "../assets/progressbar.h"

void main(void) {
    ENABLE_RAM;
    SWITCH_RAM(0);
    init_VBL_interrupts();
    init_sound();
    initrand(DIV_REG);
    currentGameState = GAME_STATE_NEW_GAME;
    while (1) {
        switch (currentGameState) {
            case GAME_STATE_MAIN_MENU:
                SWITCH_ROM(4);
                init_clear_screen();
                init_sound();
                init_main_menu();
                while (currentGameState == GAME_STATE_MAIN_MENU){
                    if (frame_counter % 3 == 0) show_main_menu(); // animate the menu in frame
                    if (main_menu_animation_finished) {
                    draw_main_menu(); // wait untill the animation has finished, then draw menu
                        if (joypad() & J_START || joypad() & J_A) {
                            if (current_menu_index == 0) currentGameState = GAME_STATE_NEW_GAME;
                            else if (current_menu_index == 1) currentGameState = GAME_STATE_NEW_GAME;
                            else if (current_menu_index >= 2) currentGameState = GAME_STATE_NEW_GAME;
                        }
                    }
                    vsync();
                }
                mute_sound();
                turn_screen_off();
                break;

            case GAME_STATE_NEW_GAME:
                SWITCH_ROM(4);
                init_screen();
                init_progressbar();
                init_loading_screen();
                init_font();
                init_loading_screen();
                generate_map(ROWS);
                done_loading();
                turn_screen_off();
                init_attributes();
                SWITCH_ROM(1);
                init_speed();
                calculate_upward_velocity();
                init_depth(START_WIDTH, START_DEPTH);
                currentGameState = GAME_STATE_CONTINUE_RELOAD;
                break;

            case GAME_STATE_CONTINUE_RELOAD:
                SWITCH_ROM(1);
                init_screen();
                init_clear_screen();
                init_sprite_palettes();
                init_palette_0();
                init_palette_based_on_depth();
                update_palette_based_on_depth();
                init_font();
                init_tiles();
                draw_tiles();
                init_progressbar();
                init_nav();
                draw_nav();
                init_icon();
                init_character();
                draw_character();
                move_or_scroll_character();
                // init_a_button();
                calculate_cargo();
                draw_cargo();
                draw_depth();
                draw_sky();
                init_buildings();
                draw_buildings();
                change_background_color();
                turn_screen_on();
                currentGameState = GAME_STATE_CONTINUE;
                break;

            case GAME_STATE_CONTINUE:
                SWITCH_ROM(1);
                handle_fuel(FALSE);
                handle_hull(FALSE);
                init_sound();
                init_enable_lcd_interrupt();
                while (player_alive == TRUE && currentGameState == GAME_STATE_CONTINUE) {
                    game_loop();
                }
                mute_sound();
                turn_screen_off();
                init_disable_lcd_interrupt();
                break;

            case GAME_STATE_UPGRADE_MENU:
                SWITCH_ROM(2);
                init_clear_screen();
                init_font();
                init_upgrade();
                init_upgrade_tiles_palettes();
                turn_screen_on();
                init_sound();
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    upgrade_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE;
                }
                mute_sound();
                turn_screen_off();
                break;
            case GAME_STATE_SELL_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_font();
                init_sell();
                draw_sell_menu();
                init_sound();
                turn_screen_on();
                while (currentGameState == GAME_STATE_SELL_MENU){
                    sell_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE;
                }
                display_warning_cargo_normal = FALSE;
                mute_sound();
                turn_screen_off();
                currentGameState = GAME_STATE_CONTINUE_RELOAD;
                break;
            case GAME_STATE_FUEL_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_font();
                init_powerup();
                set_fuel_display_y();
                draw_powerup_menu();
                init_sound();
                turn_screen_on();
                while (currentGameState == GAME_STATE_FUEL_MENU){
                    if (check_fuel_display_y() <= fuel_display_y && fuel_display_y > 0) fuel_display_y --;
                    draw_fuel_display();
                    powerup_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE; hide_fuel_display();
                }
                mute_sound();
                turn_screen_off();
                break;
            case GAME_STATE_GAME_OVER:
                SWITCH_ROM(2);
                turn_screen_on();
                init_sound();
                move_win(7, 144);
                init_game_over();
                while (buttons != J_START) {
                    draw_game_over();
                    read_buttons();
                    vsync();
                }
                SWITCH_ROM(1);
                hide_sprites_range(SKULL_START, MAX_HARDWARE_SPRITES);
                reset_player();
                draw_character();
                init_icon();
                init_sprite_palettes();
                prev_buttons = buttons;
                currentGameState = GAME_STATE_CONTINUE;
                break;
        }
    }
}