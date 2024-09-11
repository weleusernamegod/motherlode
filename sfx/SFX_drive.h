/*

	SFX_drive

	Sound Effect File.
	
	Info:
		Number			:   01
		Length			:	1
		Framecount		:	0
		Number of lines :	1
		Priority		:	4
		Channels used	:	Duty channel 2 & Noise channel
		SGB Support		:	No
*/


#ifndef __SFX_drive_h_INCLUDE
#define __SFX_drive_h_INCLUDE
#define PLAY_SFX_drive CBTFX_init(&SFX_drive[0])
#define SFX_drive_framecount 0
extern const unsigned char SFX_drive[];
#endif