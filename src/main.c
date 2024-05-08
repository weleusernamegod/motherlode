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
#include "menuloop.h"
#include "mainmenu.h"
#include "shop.h"

#include "../assets/rover.h"
#include "../assets/nav.h"
#include "../assets/tile.h"
#include "../assets/progressbar.h"

BANKREF_EXTERN(warnings)
BANKREF_EXTERN(bank_main_menu)
BANKREF_EXTERN(splashscreen)
BANKREF_EXTERN(bank_map)
BANKREF_EXTERN(bank_player)
BANKREF_EXTERN(bank_shop)
BANKREF_EXTERN(stationfuel)
BANKREF_EXTERN(stationsell)
BANKREF_EXTERN(stationupgrade)


void main(void) {
    ENABLE_RAM;
    SWITCH_RAM(0);
    init_framecounter();
    initrand(DIV_REG);
    generateMap();
    init_attributes();
    init_speed();
    init_depth();

    while (1) {
        switch (currentGameState) {
            case GAME_STATE_MAIN_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_main_menu();
                while (currentGameState == GAME_STATE_MAIN_MENU){
                    draw_main_menu();
                    if (joypad() & J_START || joypad() & J_A) {
                        if (current_menu_index == 0) currentGameState = GAME_STATE_CONTINUE_RELOAD;
                        else if (current_menu_index == 1) currentGameState = GAME_STATE_CONTINUE_RELOAD;
                        else if (current_menu_index >= 2) currentGameState = GAME_STATE_CONTINUE_RELOAD;
                    }
                    
                    wait_vbl_done();
                }
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
                init_warning();
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
                init_shop();
                init_shop_tiles_palettes();
                turn_screen_on();
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    shop_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_CONTINUE_RELOAD; leave_station = FALSE;
                }
                turn_screen_off();
                break;
            case GAME_STATE_SELL_MENU:
                turn_screen_on();
                sell_all_ores();
                handle_cargo();
                display_warning_cargo = FALSE;
                currentGameState = GAME_STATE_CONTINUE;
                break;
            case GAME_STATE_FUEL_MENU:
                turn_screen_on();
                fuel_up();
                handle_fuel();
                currentGameState = GAME_STATE_CONTINUE;
                break;

            case GAME_STATE_GAME_OVER:
                turn_screen_on();
                waitpad(J_START);
                reset_player();
                currentGameState = GAME_STATE_CONTINUE;
                break;
        }
    }
}