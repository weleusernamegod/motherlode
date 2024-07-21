/*

	SFX_money

	Sound Effect File.
	
	Info:
		Length			:	11
		Priority		:	0
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_money_h_INCLUDE
#define __SFX_money_h_INCLUDE
#define PLAY_SFX_money CBTFX_init(&SFX_money[0])
extern const unsigned char SFX_money[];
#endif