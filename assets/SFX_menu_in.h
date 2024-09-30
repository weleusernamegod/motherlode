/*

	SFX_menu_in

	Sound Effect File.
	
	Info:
		Number			:   20
		Length			:	11
		Framecount		:	5
		Number of lines :	6
		Priority		:	2
		Channels used	:	Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_menu_in_h_INCLUDE
#define __SFX_menu_in_h_INCLUDE
#define PLAY_SFX_menu_in CBTFX_init(&SFX_menu_in[0])
#define SFX_menu_in_framecount 5
extern const unsigned char SFX_menu_in[];
#endif