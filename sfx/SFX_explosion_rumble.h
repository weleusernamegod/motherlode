/*

	SFX_explosion_rumble

	Sound Effect File.
	
	Info:
		Length			:	23
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_explosion_rumble_h_INCLUDE
#define __SFX_explosion_rumble_h_INCLUDE
#define PLAY_SFX_explosion_rumble CBTFX_init(&SFX_explosion_rumble[0])
extern const unsigned char SFX_explosion_rumble[];
#endif