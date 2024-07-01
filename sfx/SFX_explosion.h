/*

	SFX_explosion

	Sound Effect File.
	
	Info:
		Length			:	15
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_explosion_h_INCLUDE
#define __SFX_explosion_h_INCLUDE
#define PLAY_SFX_explosion CBTFX_init(&SFX_explosion[0])
extern const unsigned char SFX_explosion[];
#endif