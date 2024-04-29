#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include <rand.h>

#include "map.h"
#include "player.h"
#include "general.h"
#include "interrupt.h"
#include "gameloop.h"
#include "inventory.h"
#include "attributes.h"

#include "../assets/rover.h"
#include "../assets/nav.h"
#include "../assets/tile.h"
#include "../assets/progressbar.h"

#include "globals.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "palettes.h"

BANKREF_EXTERN(bank_map)
BANKREF_EXTERN(bank_player)
BANKREF_EXTERN(bank_shop)

void main(void) {
    init_framecounter();
    initrand(DIV_REG);
    init_attributes();
    init_font();
    init_speed();
    init_character();
    init_screen();

    uint8_t saved_bank;
    saved_bank = CURRENT_BANK;

    while (1) {
        switch (currentGameState) {
            case GAME_STATE_PLAY:

                SWITCH_ROM(1);
                init_enable_lcd_interrupt();
                init_clear_screen();
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
                set_bkg_palette(1, 1, palette_gras);
                set_bkg_palette(2, 1, palette_rock);
                set_bkg_palette(3, 1, palette_iron);
                set_bkg_palette(4, 1, palette_copper);
                set_bkg_palette(5, 1, palette_iron);
                set_bkg_palette(6, 1, palette_yellow);
                set_bkg_palette(7, 1, palette_yellow);


                while (player_alive == TRUE && currentGameState == GAME_STATE_PLAY) {
                    game_loop();
                }
                break;

            case GAME_STATE_UPGRADE_MENU:
                SWITCH_ROM(2);

                init_disable_lcd_interrupt();
                init_clear_screen();
                init_shop();
                init_shop_tiles_palettes();
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    shop_menu_loop();
                }
                break;
            case GAME_STATE_SELL_MENU:
                init_disable_lcd_interrupt();
                sell_all_ores();
                break;

            case GAME_STATE_GAME_OVER:
                init_disable_lcd_interrupt();
                waitpad(J_START);
                reset_player();
                currentGameState = GAME_STATE_PLAY;
                break;

        }
    }
}