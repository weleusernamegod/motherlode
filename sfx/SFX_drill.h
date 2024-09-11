/*

	SFX_drill

	Sound Effect File.
	
	Info:
		Number			:   02
		Length			:	32
		Framecount		:	16
		Number of lines :	8
		Priority		:	4
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_drill_h_INCLUDE
#define __SFX_drill_h_INCLUDE
#define PLAY_SFX_drill CBTFX_init(&SFX_drill[0])
#define SFX_drill_framecount 16
extern const unsigned char SFX_drill[];
#endif