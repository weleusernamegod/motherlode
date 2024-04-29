;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module rover
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rover_tiles
	.globl b___func_rover
	.globl ___func_rover
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
	.area _CODE_1
	G$__func_rover$0$0	= .
	.globl	G$__func_rover$0$0
	C$rover.c$9$0_0$161	= .
	.globl	C$rover.c$9$0_0$161
;assets/rover.c:9: BANKREF(rover)
;	---------------------------------
; Function __func_rover
; ---------------------------------
	b___func_rover	= 1
___func_rover::
	.local b___func_rover 
	___bank_rover = b___func_rover 
	.globl ___bank_rover 
	.area _CODE_1
G$rover_tiles$0_0$0 == .
_rover_tiles:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x73	; 115	's'
	.db #0xff	; 255
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x80	; 128
	.db #0xf6	; 246
	.db #0xe0	; 224
	.db #0x04	; 4
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7b	; 123
	.db #0x6e	; 110	'n'
	.db #0x7b	; 123
	.db #0x44	; 68	'D'
	.db #0x7b	; 123
	.db #0x6e	; 110	'n'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6c	; 108	'l'
	.db #0x92	; 146
	.db #0x37	; 55	'7'
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xbb	; 187
	.db #0xef	; 239
	.db #0xb9	; 185
	.db #0x47	; 71	'G'
	.db #0xbb	; 187
	.db #0xef	; 239
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x7f	; 127
	.db #0x5d	; 93
	.db #0x62	; 98	'b'
	.db #0x6a	; 106	'j'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6c	; 108	'l'
	.db #0x93	; 147
	.db #0x37	; 55	'7'
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0xdd	; 221
	.db #0x23	; 35
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x6e	; 110	'n'
	.db #0x7b	; 123
	.db #0x4e	; 78	'N'
	.db #0x71	; 113	'q'
	.db #0x6e	; 110	'n'
	.db #0x7b	; 123
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6c	; 108	'l'
	.db #0x93	; 147
	.db #0x37	; 55	'7'
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xef	; 239
	.db #0xbb	; 187
	.db #0xef	; 239
	.db #0x11	; 17
	.db #0xef	; 239
	.db #0xbb	; 187
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x6a	; 106	'j'
	.db #0x7f	; 127
	.db #0x77	; 119	'w'
	.db #0x48	; 72	'H'
	.db #0x6a	; 106	'j'
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x6c	; 108	'l'
	.db #0x93	; 147
	.db #0x37	; 55	'7'
	.db #0xc8	; 200
	.db #0x1b	; 27
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0x89	; 137
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x1f	; 31
	.db #0x05	; 5
	.db #0x0f	; 15
	.db #0x02	; 2
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x15	; 21
	.db #0x1f	; 31
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2b	; 43
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd4	; 212
	.db #0x7c	; 124
	.db #0xa8	; 168
	.db #0xf8	; 248
	.db #0xd0	; 208
	.db #0x70	; 112	'p'
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
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
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
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
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xf9	; 249
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
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
	.db #0x27	; 39
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe4	; 228
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
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
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
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
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.area _INITIALIZER
	.area _CABS (ABS)
