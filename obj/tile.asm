;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module tile
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tile_tiles
	.globl b___func_tile
	.globl ___func_tile
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
	G$__func_tile$0$0	= .
	.globl	G$__func_tile$0$0
	C$tile.c$9$0_0$161	= .
	.globl	C$tile.c$9$0_0$161
;assets/tile.c:9: BANKREF(tile)
;	---------------------------------
; Function __func_tile
; ---------------------------------
	b___func_tile	= 1
___func_tile::
	.local b___func_tile 
	___bank_tile = b___func_tile 
	.globl ___bank_tile 
	.area _CODE_1
G$tile_tiles$0_0$0 == .
_tile_tiles:
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf6	; 246
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xd7	; 215
	.db #0x28	; 40
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0xdb	; 219
	.db #0x24	; 36
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbd	; 189
	.db #0x42	; 66	'B'
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xb7	; 183
	.db #0x48	; 72	'H'
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x4a	; 74	'J'
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0x61	; 97	'a'
	.db #0x6b	; 107	'k'
	.db #0x94	; 148
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0xd6	; 214
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0x63	; 99	'c'
	.db #0xed	; 237
	.db #0x12	; 18
	.db #0x48	; 72	'H'
	.db #0xb7	; 183
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0x41	; 65	'A'
	.db #0xff	; 255
	.db #0x35	; 53	'5'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8a	; 138
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdd	; 221
	.db #0x22	; 34
	.db #0x98	; 152
	.db #0x67	; 103	'g'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xad	; 173
	.db #0xff	; 255
	.db #0x65	; 101	'e'
	.db #0xff	; 255
	.db #0xd5	; 213
	.db #0xba	; 186
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0x7b	; 123
	.db #0x84	; 132
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xad	; 173
	.db #0x52	; 82	'R'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x0b	; 11
	.db #0x08	; 8
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0xa2	; 162
	.db #0x22	; 34
	.db #0xee	; 238
	.db #0x6e	; 110	'n'
	.db #0xf4	; 244
	.db #0x34	; 52	'4'
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0x7f	; 127
	.db #0x8f	; 143
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x16	; 22
	.db #0x15	; 21
	.db #0x0f	; 15
	.db #0x0c	; 12
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0xfa	; 250
	.db #0xe5	; 229
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0xec	; 236
	.db #0x0c	; 12
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0xf3	; 243
	.db #0xfe	; 254
	.db #0xf3	; 243
	.db #0x80	; 128
	.db #0xce	; 206
	.db #0x0d	; 13
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x0c	; 12
	.db #0xdf	; 223
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xf7	; 247
	.db #0x09	; 9
	.db #0x7d	; 125
	.db #0x82	; 130
	.db #0x1f	; 31
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0xe2	; 226
	.db #0x03	; 3
	.db #0x8f	; 143
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0xfb	; 251
	.db #0xe4	; 228
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbb	; 187
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc1	; 193
	.db #0x22	; 34
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x2a	; 42
	.db #0xc0	; 192
	.db #0x29	; 41
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x90	; 144
	.db #0x07	; 7
	.db #0x50	; 80	'P'
	.db #0x05	; 5
	.db #0x52	; 82	'R'
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0x07	; 7
	.db #0x48	; 72	'H'
	.db #0xc0	; 192
	.db #0x23	; 35
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x48	; 72	'H'
	.db #0xc0	; 192
	.db #0x08	; 8
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x2f	; 47
	.db #0x77	; 119	'w'
	.db #0x88	; 136
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x60	; 96
	.db #0x03	; 3
	.db #0x24	; 36
	.db #0x0a	; 10
	.db #0x65	; 101	'e'
	.db #0xef	; 239
	.db #0x10	; 16
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0xdd	; 221
	.db #0x22	; 34
	.db #0xea	; 234
	.db #0x08	; 8
	.db #0xea	; 234
	.db #0x0b	; 11
	.db #0xea	; 234
	.db #0x0a	; 10
	.db #0x6c	; 108	'l'
	.db #0x8c	; 140
	.db #0xed	; 237
	.db #0x0d	; 13
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xaf	; 175
	.db #0x00	; 0
	.db #0xa7	; 167
	.db #0x20	; 32
	.db #0xd6	; 214
	.db #0x51	; 81	'Q'
	.db #0xd7	; 215
	.db #0x50	; 80	'P'
	.db #0x75	; 117	'u'
	.db #0x52	; 82	'R'
	.db #0xed	; 237
	.db #0x09	; 9
	.db #0xcd	; 205
	.db #0x09	; 9
	.db #0xcd	; 205
	.db #0x09	; 9
	.db #0x5d	; 93
	.db #0x99	; 153
	.db #0xdd	; 221
	.db #0x11	; 17
	.db #0xde	; 222
	.db #0x08	; 8
	.db #0xf6	; 246
	.db #0x08	; 8
	.db #0xbf	; 191
	.db #0x40	; 64
	.db #0x67	; 103	'g'
	.db #0x40	; 64
	.db #0x67	; 103	'g'
	.db #0x40	; 64
	.db #0x6d	; 109	'm'
	.db #0x4a	; 74	'J'
	.db #0x6f	; 111	'o'
	.db #0x08	; 8
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x7f	; 127
	.db #0x08	; 8
	.db #0xfe	; 254
	.db #0x81	; 129
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0x8f	; 143
	.db #0x71	; 113	'q'
	.db #0xef	; 239
	.db #0x13	; 19
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x80	; 128
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xb8	; 184
	.db #0xe8	; 232
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0xfc	; 252
	.db #0x3c	; 60
	.db #0xe6	; 230
	.db #0x66	; 102	'f'
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0xc3	; 195
	.db #0x42	; 66	'B'
	.db #0xef	; 239
	.db #0xa8	; 168
	.db #0xfe	; 254
	.db #0xce	; 206
	.db #0x71	; 113	'q'
	.db #0x71	; 113	'q'
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0xe3	; 227
	.db #0x9b	; 155
	.db #0x64	; 100	'd'
	.db #0xbe	; 190
	.db #0x41	; 65	'A'
	.db #0xed	; 237
	.db #0x12	; 18
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7b	; 123
	.db #0x84	; 132
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xee	; 238
	.db #0x10	; 16
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0x35	; 53	'5'
	.db #0x3a	; 58
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x3f	; 63
	.db #0x38	; 56	'8'
	.db #0x7f	; 127
	.db #0x70	; 112	'p'
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x83	; 131
	.db #0x03	; 3
	.db #0xc3	; 195
	.db #0x13	; 19
	.db #0x71	; 113	'q'
	.db #0x81	; 129
	.db #0xe1	; 225
	.db #0x01	; 1
	.db #0x63	; 99	'c'
	.db #0x93	; 147
	.db #0xd7	; 215
	.db #0xe8	; 232
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0xa0	; 160
	.db #0xfd	; 253
	.db #0x82	; 130
	.db #0xfb	; 251
	.db #0x04	; 4
	.area _INITIALIZER
	.area _CABS (ABS)
