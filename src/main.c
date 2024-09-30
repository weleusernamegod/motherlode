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
#include "sound.h"
#include "musicmanager.h"

#include "../assets/rover.h"
#include "../assets/rover_eye.h"
#include "../assets/tracks.h"
#include "../assets/nav.h"
#include "../assets/ore_tiles.h"
#include "../assets/progressbar.h"

#include "../assets/motherlode_sfx.h"

void main(void) {
    ENABLE_RAM;
    SWITCH_RAM(0);
    init_VBL_interrupts();
    // init_sound();



    static uint8_t music_paused = FALSE;

    // initialize the music and SFX driver
    music_init();

    CRITICAL {
        // set up the game boy timer
        music_setup_timer();
        // add music and SFX driver ISR to the low priority timer chain
        add_low_priority_TIM(music_play_isr);
    }
    // enable the timer interrupt
    set_interrupts(IE_REG | TIM_IFLAG);





    initrand(DIV_REG);
    currentGameState = GAME_STATE_MAIN_MENU;
    while (1) {
        switch (currentGameState) {
            case GAME_STATE_MAIN_MENU:
                SWITCH_ROM(4);
                init_clear_screen();
                init_main_menu();

                music_load(BANK(shop_theme), &shop_theme);

                while (currentGameState == GAME_STATE_MAIN_MENU){
                    if (frame_counter % 3 == 0) show_main_menu(); // animate the menu in frame
                    if (main_menu_animation_finished) {
                    draw_main_menu(); // wait untill the animation has finished, then draw menu

                        if (joypad() & J_DOWN)   music_PLAY_SFX(BANK(motherlode_sfx_01), motherlode_sfx_01, SFX_MUTE_MASK(motherlode_sfx_01), MUSIC_SFX_PRIORITY_NORMAL);
                        if (joypad() & J_UP)   music_PLAY_SFX(BANK(motherlode_sfx_02), motherlode_sfx_02, SFX_MUTE_MASK(motherlode_sfx_02), MUSIC_SFX_PRIORITY_NORMAL);
                        if (joypad() & J_RIGHT)   music_PLAY_SFX(BANK(skull_laughing), skull_laughing, SFX_MUTE_MASK(skull_laughing), MUSIC_SFX_PRIORITY_NORMAL);

                        if (joypad() & J_START || joypad() & J_A) {
                            if (current_menu_index == 0) currentGameState = GAME_STATE_NEW_GAME;
                            else if (current_menu_index == 1) currentGameState = GAME_STATE_NEW_GAME;
                            else if (current_menu_index >= 2) currentGameState = GAME_STATE_NEW_GAME;
                            //PLAY_SFX_menu_in;
                        }
                    }
                    vsync();
                }
                turn_screen_off();
                break;

            case GAME_STATE_NEW_GAME:
                music_stop();
                SWITCH_ROM(4);
                init_screen();
                init_progressbar();
                init_loading_screen();
                init_font();
                generate_map(256);
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
                music_load(BANK(game_theme), &game_theme);
                init_enable_lcd_interrupt();
                while (player_alive == TRUE && currentGameState == GAME_STATE_CONTINUE) {
                    game_loop();
                }
                init_disable_lcd_interrupt();
                turn_screen_off();
                break;

            case GAME_STATE_UPGRADE_MENU:
                SWITCH_ROM(2);
                init_clear_screen();
                init_font();
                init_upgrade();
                init_upgrade_tiles_palettes();
                turn_screen_on();
                music_load(BANK(shop_theme), &shop_theme);
                //PLAY_SFX_enter;
                while (currentGameState == GAME_STATE_UPGRADE_MENU){
                    upgrade_menu_loop();
                    if (leave_station) {
                        currentGameState = GAME_STATE_CONTINUE_RELOAD;
                        leave_station = FALSE;
                        //PLAY_SFX_exit;
                    }
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
                music_load(BANK(shop_theme), &shop_theme);
                //PLAY_SFX_enter;
                while (currentGameState == GAME_STATE_SELL_MENU){
                    sell_menu_loop();
                    if (leave_station) {
                        currentGameState = GAME_STATE_CONTINUE_RELOAD;
                        leave_station = FALSE;
                        //PLAY_SFX_exit;
                    }
                }
                display_warning_cargo_normal = FALSE;
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
                turn_screen_on();
                music_load(BANK(shop_theme), &shop_theme);
                //PLAY_SFX_enter;
                while (currentGameState == GAME_STATE_FUEL_MENU){
                    if (check_fuel_display_y() <= fuel_display_y && fuel_display_y > 0) fuel_display_y --;
                    if (check_fuel_display_y() == fuel_display_y - 1) //PLAY_SFX_MUTE;  // Stop the sound effect if it is already full (stop it 1 frame early)
                    draw_fuel_display();
                    powerup_menu_loop();
                    if (leave_station) {
                        currentGameState = GAME_STATE_CONTINUE_RELOAD;
                        leave_station = FALSE;
                        hide_fuel_display();
                        //PLAY_SFX_exit;
                    }
                }
                turn_screen_off();
                break;
            case GAME_STATE_GAME_OVER:
                SWITCH_ROM(2);
                turn_screen_on();
                // init_sound();
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