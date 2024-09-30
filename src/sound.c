#include "general.h"
#include "globals.h"
#include "constants.h"
#include "attributes.h"
#include "inventory.h"
#include "palettes.h"
#include "sound.h"
#include "interrupt.h"

void init_shop_theme(void) {
    CRITICAL {
        SWITCH_ROM(SHOP_THEME_BANK_NR);
        current_theme_bank = SHOP_THEME_BANK_NR;
        hUGE_init(&shop_theme);
        // add_VBL(test); 
    }
}

void init_game_theme(void) {
    CRITICAL {
        SWITCH_ROM(GAME_THEME_BANK_NR);
        current_theme_bank = GAME_THEME_BANK_NR;
        hUGE_init(&game_theme);
        // add_VBL(test); 
    }
}

void stop_music(void) {
    CRITICAL {
        // remove_VBL(test); 
    }
}

void toggle_mute_music(uint8_t toggle_on) {
    hUGE_mute_channel(HT_CH1, toggle_on);
    hUGE_mute_channel(HT_CH2, toggle_on);
    hUGE_mute_channel(HT_CH3, toggle_on);
    hUGE_mute_channel(HT_CH4, toggle_on);
}