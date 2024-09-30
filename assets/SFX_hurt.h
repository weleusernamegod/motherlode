/*

	SFX_hurt

	Sound Effect File.
	
	Info:
		Number			:   0A
		Length			:	16
		Framecount		:	8
		Number of lines :	8
		Priority		:	3
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_hurt_h_INCLUDE
#define __SFX_hurt_h_INCLUDE
#define PLAY_SFX_hurt CBTFX_init(&SFX_hurt[0])
#define SFX_hurt_framecount 8
extern const unsigned char SFX_hurt[];
#endif