/*

	SFX_idle

	Sound Effect File.
	
	Info:
		Length			:	6
		Priority		:	1
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_idle_h_INCLUDE
#define __SFX_idle_h_INCLUDE
#define PLAY_SFX_idle CBTFX_init(&SFX_idle[0])
extern const unsigned char SFX_idle[];
#endif