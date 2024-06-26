/*

	SFX_hit

	Sound Effect File.
	
	Info:
		Length			:	20
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/

#ifndef __SFX_hit_h_INCLUDE
#define __SFX_hit_h_INCLUDE
#define PLAY_SFX_hit CBTFX_init(&SFX_hit[0])
extern const unsigned char SFX_hit[];
#endif