/*

	SFX_prop

	Sound Effect File.
	
	Info:
		Number			:   04
		Length			:	14
		Framecount		:	7
		Number of lines :	7
		Priority		:	0
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_prop_h_INCLUDE
#define __SFX_prop_h_INCLUDE
#define PLAY_SFX_prop CBTFX_init(&SFX_prop[0])
#define SFX_prop_framecount 7
extern const unsigned char SFX_prop[];
#endif