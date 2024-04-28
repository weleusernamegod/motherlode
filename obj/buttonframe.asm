;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module buttonframe
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _buttonframe_tiles
	.globl b___func_buttonframe
	.globl ___func_buttonframe
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_2
	G$__func_buttonframe$0$0	= .
	.globl	G$__func_buttonframe$0$0
	C$buttonframe.c$9$0_0$161	= .
	.globl	C$buttonframe.c$9$0_0$161
;assets/buttonframe.c:9: BANKREF(buttonframe)
;	---------------------------------
; Function __func_buttonframe
; ---------------------------------
	b___func_buttonframe	= 2
___func_buttonframe::
	.local b___func_buttonframe 
	___bank_buttonframe = b___func_buttonframe 
	.globl ___bank_buttonframe 
	.area _CODE_2
G$buttonframe_tiles$0_0$0 == .
_buttonframe_tiles:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x8c	; 140
	.db #0x04	; 4
	.db #0xd8	; 216
	.db #0x88	; 136
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
