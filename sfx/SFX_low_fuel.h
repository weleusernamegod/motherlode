/*

	SFX_low_fuel

	Sound Effect File.
	
	Info:
		Number			:   12
		Length			:	14
		Framecount		:	7
		Number of lines :	14
		Priority		:	3
		Channels used	:	Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_low_fuel_h_INCLUDE
#define __SFX_low_fuel_h_INCLUDE
#define PLAY_SFX_low_fuel CBTFX_init(&SFX_low_fuel[0])
#define SFX_low_fuel_framecount 7
extern const unsigned char SFX_low_fuel[];
#endif