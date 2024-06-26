/*

	SFX_down

	Sound Effect File.
	
	Info:
		Length			:	14
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/

#ifndef __SFX_down_h_INCLUDE
#define __SFX_down_h_INCLUDE
#define PLAY_SFX_down CBTFX_init(&SFX_down[0])
extern const unsigned char SFX_down[];
#endif