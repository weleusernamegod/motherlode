/*

	SFX_menu_tick

	Sound Effect File.
	
	Info:
		Number			:   22
		Length			:	4
		Framecount		:	2
		Number of lines :	2
		Priority		:	2
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_menu_tick_h_INCLUDE
#define __SFX_menu_tick_h_INCLUDE
#define PLAY_SFX_menu_tick CBTFX_init(&SFX_menu_tick[0])
#define SFX_menu_tick_framecount 2
extern const unsigned char SFX_menu_tick[];
#endif