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
#include "fuel.h"

#include "../assets/rover.h"
#include "../assets/tracks.h"
#include "../assets/nav.h"
#include "../assets/ore_tiles.h"
#include "../assets/progressbar.h"

#include "bankref.h"

void main(void) {
    ENABLE_RAM;
    SWITCH_RAM(0);
    init_framecounter();
    initrand(DIV_REG);
    currentGameState = GAME_STATE_NEW_GAME;

    while (1) {
        switch (currentGameState) {
            case GAME_STATE_MAIN_MENU:
                SWITCH_ROM(4);
                init_clear_screen();
                init_main_menu();
                while (currentGameState == GAME_STATE_MAIN_MENU){
                    draw_main_menu();
                    if (joypad() & J_START || joypad() & J_A) {
                        if (current_menu_index == 0) currentGameState = GAME_STATE_NEW_GAME;
                        else if (current_menu_index == 1) currentGameState = GAME_STATE_NEW_GAME;
                        else if (current_menu_index >= 2) currentGameState = GAME_STATE_NEW_GAME;
                    }
                    
                    vsync();
                }
                break;

            case GAME_STATE_NEW_GAME:
                SWITCH_ROM(1);
                generate_map(1024);
                init_attributes();
                init_speed();
                calculate_upward_velocity();
                init_depth();
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
                draw_fuel();
                draw_hull();
                init_nav();
                draw_nav();
                init_character();
                draw_character();
                move_or_scroll_character();
                init_a_button();
                init_game_over();
                init_warning();
                calculate_cargo();
                draw_cargo();
                handle_fuel();
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
                init_enable_lcd_interrupt();
                while (player_alive == TRUE && currentGameState == GAME_STATE_CONTINUE) {
                    game_loop();
                }
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
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    upgrade_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE;
                }
                turn_screen_off();
                break;
            case GAME_STATE_SELL_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_font();
                init_sell();
                draw_sell_menu();
                turn_screen_on();
                wait_for_input(); // only break if player presses A, B or Start
                sell_all_ores();
                display_warning_cargo = FALSE;
                turn_screen_off();
                currentGameState = GAME_STATE_CONTINUE_RELOAD;
                break;
            case GAME_STATE_FUEL_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_font();
                init_fuel();
                set_fuel_display_y();
                draw_fuel_menu();
                turn_screen_on();
                while (currentGameState == GAME_STATE_FUEL_MENU){
                    if (check_fuel_display_y() <= fuel_display_y && fuel_display_y > 0) fuel_display_y --;
                    draw_fuel_display();
                    fuel_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE; hide_fuel_display();
                }
                turn_screen_off();
                break;
            case GAME_STATE_GAME_OVER:
                turn_screen_on();
                move_win(7, 144);
                draw_game_over();
                waitpad(J_START);
                hide_sprites_range(GAME_OVER_START, MAX_HARDWARE_SPRITES);
                reset_player();
                currentGameState = GAME_STATE_CONTINUE;
                break;
        }
    }
}