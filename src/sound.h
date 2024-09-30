#ifndef SOUND_H
#define SOUND_H

#include "../include/hUGEDriver.h"

#include "../assets/motherlode_sfx.h"
#include "../assets/skull_laughing.h"

#include "../music/game_theme.h"
#include "../music/shop_theme.h"




void init_shop_theme(void);
void init_game_theme(void);
void stop_music(void);
void toggle_mute_music(uint8_t toggle_on);

#endif // SOUND_H