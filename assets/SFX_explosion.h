/*

	SFX_explosion

	Sound Effect File.
	
	Info:
		Number			:   0C
		Length			:	42
		Framecount		:	21
		Number of lines :	15
		Priority		:	3
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_explosion_h_INCLUDE
#define __SFX_explosion_h_INCLUDE
#define PLAY_SFX_explosion CBTFX_init(&SFX_explosion[0])
#define SFX_explosion_framecount 21
extern const unsigned char SFX_explosion[];
#endif