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

BANKREF_EXTERN(bank_main_menu)
BANKREF_EXTERN(splashscreen)
BANKREF_EXTERN(bank_map)
BANKREF_EXTERN(bank_player)
BANKREF_EXTERN(bank_shop)

void main(void) {
    ENABLE_RAM;
    SWITCH_RAM(0);
    init_framecounter();
    initrand(DIV_REG);
    generateMap();
    init_attributes();
    init_speed();
    init_character();
    init_screen();

    while (1) {
        switch (currentGameState) {
            case GAME_STATE_MAIN_MENU:
                SWITCH_ROM(3);
                init_clear_screen();
                init_main_menu();
                while (currentGameState == GAME_STATE_MAIN_MENU){
                    draw_main_menu();
                    if (joypad() & J_START) {
                        if (current_menu_index == 0) currentGameState = GAME_STATE_NEW_GAME;
                        else if (current_menu_index == 1) currentGameState = GAME_STATE_NEW_GAME;
                        else if (current_menu_index >= 2) currentGameState = GAME_STATE_NEW_GAME;
                    }
                    
                    wait_vbl_done();
                }
                init_screen();
                break;
            case GAME_STATE_NEW_GAME:

                SWITCH_ROM(1);
                init_clear_screen();
                init_font();
                init_tiles();
                init_progressbar();
                init_nav();

                draw_character();
                draw_fuel();
                draw_hull();
                calculate_cargo();
                draw_cargo();
                draw_depth();

                set_bkg_palette(0, 1, palette_default);
                set_bkg_palette(1, 1, palette_stone);
                set_bkg_palette(2, 1, palette_coal);
                set_bkg_palette(3, 1, palette_iron);
                set_bkg_palette(4, 1, palette_copper);
                set_bkg_palette(5, 1, palette_gras);
                set_bkg_palette(6, 1, palette_default);
                set_bkg_palette(7, 1, palette_default);
                draw_buildings();
                currentGameState = GAME_STATE_CONTINUE_GAME;
                break;

            case GAME_STATE_CONTINUE_GAME:
                SWITCH_ROM(1);
                init_enable_lcd_interrupt();
                while (player_alive == TRUE && currentGameState == GAME_STATE_CONTINUE_GAME) {
                    game_loop();
                    if (depth >= 15) {
                        set_bkg_palette(1, 1, palette_stone);
                        set_bkg_palette(2, 1, palette_coal);
                        set_bkg_palette(3, 1, palette_iron);
                        set_bkg_palette(4, 1, palette_copper);
                        set_bkg_palette(5, 1, palette_tin);
                        set_bkg_palette(6, 1, palette_silver);
                        set_bkg_palette(7, 1, palette_gold);
                    }


                }
                init_disable_lcd_interrupt();
                break;

            case GAME_STATE_UPGRADE_MENU:
                SWITCH_ROM(2);

                init_clear_screen();
                init_shop();
                init_shop_tiles_palettes();
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    shop_menu_loop();
                    if (leave_station) currentGameState = GAME_STATE_NEW_GAME;
                }
                break;
            case GAME_STATE_SELL_MENU:
                sell_all_ores();
                currentGameState = GAME_STATE_CONTINUE_GAME;
                break;

            case GAME_STATE_GAME_OVER:
                waitpad(J_START);
                reset_player();
                currentGameState = GAME_STATE_CONTINUE_GAME;
                break;
        }
    }
}