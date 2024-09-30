/*

	SFX_money

	Sound Effect File.
	
	Info:
		Number			:   23
		Length			:	28
		Framecount		:	14
		Number of lines :	11
		Priority		:	2
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_money_h_INCLUDE
#define __SFX_money_h_INCLUDE
#define PLAY_SFX_money CBTFX_init(&SFX_money[0])
#define SFX_money_framecount 14
extern const unsigned char SFX_money[];
#endif