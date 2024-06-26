/*

	SFX_blep

	Sound Effect File.
	
	Info:
		Length			:	12
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/

#ifndef __SFX_blep_h_INCLUDE
#define __SFX_blep_h_INCLUDE
#define PLAY_SFX_blep CBTFX_init(&SFX_blep[0])
extern const unsigned char SFX_blep[];
#endif