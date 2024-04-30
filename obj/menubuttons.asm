;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module menubuttons
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _menubuttons_metasprites
	.globl _menubuttons_metasprite0
	.globl _menubuttons_tiles
	.globl b___func_menubuttons
	.globl ___func_menubuttons
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
	.area _CODE_3
	G$__func_menubuttons$0$0	= .
	.globl	G$__func_menubuttons$0$0
	C$menubuttons.c$9$0_0$161	= .
	.globl	C$menubuttons.c$9$0_0$161
;assets/menubuttons.c:9: BANKREF(menubuttons)
;	---------------------------------
; Function __func_menubuttons
; ---------------------------------
	b___func_menubuttons	= 3
___func_menubuttons::
	.local b___func_menubuttons 
	___bank_menubuttons = b___func_menubuttons 
	.globl ___bank_menubuttons 
	.area _CODE_3
G$menubuttons_tiles$0_0$0 == .
_menubuttons_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x65	; 101	'e'
	.db #0xff	; 255
	.db #0x46	; 70	'F'
	.db #0x74	; 116	't'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0xff	; 255
	.db #0x4b	; 75	'K'
	.db #0xff	; 255
	.db #0xc9	; 201
	.db #0x47	; 71	'G'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x56	; 86	'V'
	.db #0xff	; 255
	.db #0x75	; 117	'u'
	.db #0xff	; 255
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xd0	; 208
	.db #0xff	; 255
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x5f	; 95
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0xff	; 255
	.db #0x11	; 17
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc9	; 201
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x5d	; 93
	.db #0xff	; 255
	.db #0x55	; 85	'U'
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x48	; 72	'H'
	.db #0xff	; 255
	.db #0x4b	; 75	'K'
	.db #0xff	; 255
	.db #0x49	; 73	'I'
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x56	; 86	'V'
	.db #0xff	; 255
	.db #0x75	; 117	'u'
	.db #0xff	; 255
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xd0	; 208
	.db #0xff	; 255
	.db #0x58	; 88	'X'
	.db #0xff	; 255
	.db #0x50	; 80	'P'
	.db #0x5c	; 92
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x5f	; 95
	.db #0x22	; 34
	.db #0x5f	; 95
	.db #0x22	; 34
	.db #0x5f	; 95
	.db #0x22	; 34
	.db #0x42	; 66	'B'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x93	; 147
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xd4	; 212
	.db #0xff	; 255
	.db #0xb7	; 183
	.db #0xff	; 255
	.db #0x91	; 145
	.db #0x96	; 150
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xff	; 255
	.db #0x26	; 38
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x53	; 83	'S'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x54	; 84	'T'
	.db #0xff	; 255
	.db #0x54	; 84	'T'
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x75	; 117	'u'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0xff	; 255
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd2	; 210
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x5a	; 90	'Z'
	.db #0xff	; 255
	.db #0x56	; 86	'V'
	.db #0xff	; 255
	.db #0x52	; 82	'R'
	.db #0xd2	; 210
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x62	; 98	'b'
	.db #0xfc	; 252
	.db #0xfa	; 250
	.db #0x84	; 132
	.db #0xfa	; 250
	.db #0xe4	; 228
	.db #0xfa	; 250
	.db #0x24	; 36
	.db #0xc2	; 194
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
G$menubuttons_metasprite0$0_0$0 == .
_menubuttons_metasprite0:
	.db #0xf4	; -12
	.db #0xe4	; -28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0xd0	; -48
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0a	; 10
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0xd0	; -48
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x13	; 19
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
G$menubuttons_metasprites$0_0$0 == .
_menubuttons_metasprites:
	.dw _menubuttons_metasprite0
	.area _INITIALIZER
	.area _CABS (ABS)
