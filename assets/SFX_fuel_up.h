/*

	SFX_fuel_up

	Sound Effect File.
	
	Info:
		Number			:   24
		Length			:	40
		Framecount		:	20
		Number of lines :	20
		Priority		:	2
		Channels used	:	Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_fuel_up_h_INCLUDE
#define __SFX_fuel_up_h_INCLUDE
#define PLAY_SFX_fuel_up CBTFX_init(&SFX_fuel_up[0])
#define SFX_fuel_up_framecount 20
extern const unsigned char SFX_fuel_up[];
#endif