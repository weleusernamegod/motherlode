/*

	SFX_enter

	Sound Effect File.
	
	Info:
		Number			:   28
		Length			:	9
		Framecount		:	4
		Number of lines :	5
		Priority		:	2
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_enter_h_INCLUDE
#define __SFX_enter_h_INCLUDE
#define PLAY_SFX_enter CBTFX_init(&SFX_enter[0])
#define SFX_enter_framecount 4
extern const unsigned char SFX_enter[];
#endif