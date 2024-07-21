/*

	SFX_hurt

	Sound Effect File.
	
	Info:
		Length			:	8
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_hurt_h_INCLUDE
#define __SFX_hurt_h_INCLUDE
#define PLAY_SFX_hurt CBTFX_init(&SFX_hurt[0])
extern const unsigned char SFX_hurt[];
#endif