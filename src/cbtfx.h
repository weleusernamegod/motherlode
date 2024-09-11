#ifndef CBTFX_H_INCLUDE
#define CBTFX_H_INCLUDE

#include <gb/gb.h>

void CBTFX_update(void) NONBANKED;
void CBTFX_init(const unsigned char * SFX) NONBANKED;

#define MUSIC_DRIVER_CH2_ON hUGE_mute_channel(HT_CH2, 0);
#define MUSIC_DRIVER_CH2_OFF hUGE_mute_channel(HT_CH2, 1);
#define MUSIC_DRIVER_CH4_ON hUGE_mute_channel(HT_CH4, 0);
#define MUSIC_DRIVER_CH4_OFF hUGE_mute_channel(HT_CH4, 1);

// 0 = Panning won't be reset after an SFX, 1 = Panning will be set to 0XFF after an SFX plays.
#define MONO_MUSIC 0

#endif
