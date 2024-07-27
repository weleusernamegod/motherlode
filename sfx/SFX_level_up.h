/*

	SFX_level_up

	Sound Effect File.
	
	Info:
		Length			:	12
		Priority		:	1
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_level_up_h_INCLUDE
#define __SFX_level_up_h_INCLUDE
#define PLAY_SFX_level_up CBTFX_init(&SFX_level_up[0])
extern const unsigned char SFX_level_up[];
#endif