/*

	SFX_secret

	Sound Effect File.
	
	Info:
		Length			:	31
		Priority		:	0
		Channels used	:	Noise channel
		SGB Support		:	No
*/

#ifndef __SFX_secret_h_INCLUDE
#define __SFX_secret_h_INCLUDE
#define PLAY_SFX_secret CBTFX_init(&SFX_secret[0])
extern const unsigned char SFX_secret[];
#endif