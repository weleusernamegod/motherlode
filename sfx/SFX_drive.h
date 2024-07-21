/*

	SFX_drive

	Sound Effect File.
	
	Info:
		Length			:	4
		Priority		:	0
		Channels used	:	Duty channel 2
		SGB Support		:	No
*/


#ifndef __SFX_drive_h_INCLUDE
#define __SFX_drive_h_INCLUDE
#define PLAY_SFX_drive CBTFX_init(&SFX_drive[0])
extern const unsigned char SFX_drive[];
#endif