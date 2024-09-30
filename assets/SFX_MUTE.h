/*

	SFX_MUTE

	Sound Effect File.
	
	Info:
		Number			:   00
		Length			:	0
		Framecount		:	0
		Number of lines :	0
		Priority		:	15
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_MUTE_h_INCLUDE
#define __SFX_MUTE_h_INCLUDE
#define PLAY_SFX_MUTE CBTFX_init(&SFX_MUTE[0])
#define SFX_MUTE_framecount 0
extern const unsigned char SFX_MUTE[];
#endif