#ifndef SOUND_H
#define SOUND_H

#include "cbtfx.h"
#include "../include/hUGEDriver.h"

#include "../assets/SFX_MUTE.h"
#include "../assets/SFX_drive.h"
#include "../assets/SFX_drill.h"
#include "../assets/SFX_fly.h"
#include "../assets/SFX_prop.h"
#include "../assets/SFX_drive_old.h"
#include "../assets/SFX_6.h"
#include "../assets/SFX_7.h"
#include "../assets/SFX_8.h"
#include "../assets/SFX_9.h"
#include "../assets/SFX_hurt.h"
#include "../assets/SFX_explosion_rumble.h"
#include "../assets/SFX_explosion.h"
#include "../assets/SFX_13.h"
#include "../assets/SFX_14.h"
#include "../assets/SFX_ore_mined_old.h"
#include "../assets/SFX_ore_mined.h"
#include "../assets/SFX_special_mined.h"
#include "../assets/SFX_low_fuel.h"
#include "../assets/SFX_low_fuel_old.h"
#include "../assets/SFX_cargo_full.h"
#include "../assets/SFX_21.h"
#include "../assets/SFX_22.h"
#include "../assets/SFX_23.h"
#include "../assets/SFX_24.h"
#include "../assets/SFX_25.h"
#include "../assets/SFX_26.h"
#include "../assets/SFX_27.h"
#include "../assets/SFX_28.h"
#include "../assets/SFX_29.h"
#include "../assets/SFX_30.h"
#include "../assets/SFX_31.h"
#include "../assets/SFX_menu_in.h"
#include "../assets/SFX_menu_out.h"
#include "../assets/SFX_menu_tick.h"
#include "../assets/SFX_money.h"
#include "../assets/SFX_fuel_up.h"
#include "../assets/SFX_buy_powerup.h"
#include "../assets/SFX_buy_upgrade.h"
#include "../assets/SFX_buy_nothing.h"
#include "../assets/SFX_enter.h"
#include "../assets/SFX_exit.h"

#include "../music/game_theme.h"
#include "../music/shop_theme.h"

void init_shop_theme(void);
void init_game_theme(void);
void stop_music(void);
void toggle_mute_music(uint8_t toggle_on);

#endif // SOUND_H