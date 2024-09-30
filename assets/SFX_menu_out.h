/*

	SFX_menu_out

	Sound Effect File.
	
	Info:
		Number			:   21
		Length			:	7
		Framecount		:	3
		Number of lines :	4
		Priority		:	2
		Channels used	:	Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_menu_out_h_INCLUDE
#define __SFX_menu_out_h_INCLUDE
#define PLAY_SFX_menu_out CBTFX_init(&SFX_menu_out[0])
#define SFX_menu_out_framecount 3
extern const unsigned char SFX_menu_out[];
#endif