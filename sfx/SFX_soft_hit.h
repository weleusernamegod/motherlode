/*

	SFX_soft_hit

	Sound Effect File.
	
	Info:
		Length			:	20
		Priority		:	0
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/

#ifndef __SFX_soft_hit_h_INCLUDE
#define __SFX_soft_hit_h_INCLUDE
#define PLAY_SFX_soft_hit CBTFX_init(&SFX_soft_hit[0])
extern const unsigned char SFX_soft_hit[];
#endif