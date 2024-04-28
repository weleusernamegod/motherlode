;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module attributes
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _attributes_numbers
	.globl _init_attributes
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
_attributes_numbers::
	.ds 12
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
	.area _CODE
;src/attributes.c:16: void init_attributes(void){
;	---------------------------------
; Function init_attributes
; ---------------------------------
_init_attributes::
;src/attributes.c:17: player.drill.attribute_name = "Drill";
	ld	hl, #(_player + 126)
	ld	a, #<(___str_0)
	ld	(hl+), a
	ld	(hl), #>(___str_0)
;src/attributes.c:18: player.drill.attribute_unit = "m/s";
	ld	hl, #(_player + 128)
	ld	a, #<(___str_1)
	ld	(hl+), a
	ld	(hl), #>(___str_1)
;src/attributes.c:19: player.drill.current_value = 1;
	ld	hl, #(_player + 130)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:20: player.drill.max_value = 1;
	ld	hl, #(_player + 132)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:21: player.drill.upgrade_level = 0;
	ld	hl, #(_player + 134)
	ld	(hl), #0x00
;src/attributes.c:22: player.drill.upgrade_value[0] = 1;
	ld	hl, #(_player + 135)
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:23: player.drill.upgrade_value[1] = 2;
	ld	hl, #(_player + 137)
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:24: player.drill.upgrade_value[2] = 4;    
	ld	hl, #(_player + 139)
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:25: player.drill.upgrade_value[3] = 6;
	ld	hl, #(_player + 141)
	ld	a, #0x06
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:26: player.drill.upgrade_value[4] = 8;
	ld	hl, #(_player + 143)
	ld	a, #0x08
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:27: player.drill.upgrade_value[5] = 10;
	ld	hl, #(_player + 145)
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:28: player.drill.upgrade_cost[0] = 0;
	ld	hl, #(_player + 147)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:29: player.drill.upgrade_cost[1] = 2000;
	ld	hl, #(_player + 149)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:30: player.drill.upgrade_cost[2] = 5000;
	ld	hl, #(_player + 151)
	ld	(hl), #0x88
	inc	hl
	ld	(hl), #0x13
;src/attributes.c:31: player.drill.upgrade_cost[3] = 8000;
	ld	hl, #(_player + 153)
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x1f
;src/attributes.c:32: player.drill.upgrade_cost[4] = 10000;
	ld	hl, #(_player + 155)
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x27
;src/attributes.c:33: player.drill.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 157)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:34: player.drill.upgrade_name[0] = "Stock Drill";
	ld	hl, #(_player + 114)
	ld	(hl), #<(___str_2)
	inc	hl
	ld	(hl), #>(___str_2)
;src/attributes.c:35: player.drill.upgrade_name[1] = "Iron Drill";
	ld	hl, #(_player + 116)
	ld	(hl), #<(___str_3)
	inc	hl
	ld	(hl), #>(___str_3)
;src/attributes.c:36: player.drill.upgrade_name[2] = "Steel Drill";
	ld	hl, #(_player + 118)
	ld	(hl), #<(___str_4)
	inc	hl
	ld	(hl), #>(___str_4)
;src/attributes.c:37: player.drill.upgrade_name[3] = "Titanium Drill";
	ld	hl, #(_player + 120)
	ld	(hl), #<(___str_5)
	inc	hl
	ld	(hl), #>(___str_5)
;src/attributes.c:38: player.drill.upgrade_name[4] = "Diamond Drill";
	ld	hl, #(_player + 122)
	ld	(hl), #<(___str_6)
	inc	hl
	ld	(hl), #>(___str_6)
;src/attributes.c:39: player.drill.upgrade_name[5] = "Platinum Drill";
	ld	hl, #(_player + 124)
	ld	(hl), #<(___str_7)
	inc	hl
	ld	(hl), #>(___str_7)
;src/attributes.c:40: player.drill.color_palette[0] = palette_red;
	ld	hl, #(_player + 159)
	ld	(hl), #<(_palette_red)
	inc	hl
	ld	(hl), #>(_palette_red)
;src/attributes.c:41: player.drill.color_palette[1] = palette_yellow;
	ld	hl, #(_player + 161)
	ld	(hl), #<(_palette_yellow)
	inc	hl
	ld	(hl), #>(_palette_yellow)
;src/attributes.c:42: player.drill.color_palette[2] = palette_orange;
	ld	hl, #(_player + 163)
	ld	(hl), #<(_palette_orange)
	inc	hl
	ld	(hl), #>(_palette_orange)
;src/attributes.c:43: player.drill.color_palette[3] = palette_red;
	ld	hl, #(_player + 165)
	ld	(hl), #<(_palette_red)
	inc	hl
	ld	(hl), #>(_palette_red)
;src/attributes.c:44: player.drill.color_palette[4] = palette_yellow;
	ld	hl, #(_player + 167)
	ld	(hl), #<(_palette_yellow)
	inc	hl
	ld	(hl), #>(_palette_yellow)
;src/attributes.c:45: player.drill.color_palette[5] = palette_orange;
	ld	hl, #(_player + 169)
	ld	(hl), #<(_palette_orange)
	inc	hl
	ld	(hl), #>(_palette_orange)
;src/attributes.c:47: player.hull.attribute_name = "Hull";
	ld	hl, #(_player + 69)
	ld	a, #<(___str_8)
	ld	(hl+), a
	ld	(hl), #>(___str_8)
;src/attributes.c:48: player.hull.attribute_unit = "pt";
	ld	hl, #(_player + 71)
	ld	a, #<(___str_9)
	ld	(hl+), a
	ld	(hl), #>(___str_9)
;src/attributes.c:49: player.hull.current_value = 20;
	ld	hl, #(_player + 73)
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:50: player.hull.max_value = 20;
	ld	hl, #(_player + 75)
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:51: player.hull.upgrade_level = 0;
	ld	hl, #(_player + 77)
	ld	(hl), #0x00
;src/attributes.c:52: player.hull.upgrade_value[0] = 17;
	ld	hl, #(_player + 78)
	ld	a, #0x11
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:53: player.hull.upgrade_value[1] = 30;
	ld	hl, #(_player + 80)
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:54: player.hull.upgrade_value[2] = 50;
	ld	hl, #(_player + 82)
	ld	a, #0x32
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:55: player.hull.upgrade_value[3] = 80;
	ld	hl, #(_player + 84)
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:56: player.hull.upgrade_value[4] = 120;
	ld	hl, #(_player + 86)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:57: player.hull.upgrade_value[5] = 180;
	ld	hl, #(_player + 88)
	ld	a, #0xb4
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:58: player.hull.upgrade_cost[0] = 0;
	ld	hl, #(_player + 90)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:59: player.hull.upgrade_cost[1] = 750;
	ld	hl, #(_player + 92)
	ld	(hl), #0xee
	inc	hl
	ld	(hl), #0x02
;src/attributes.c:60: player.hull.upgrade_cost[2] = 2000;
	ld	hl, #(_player + 94)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:61: player.hull.upgrade_cost[3] = 5000;
	ld	hl, #(_player + 96)
	ld	(hl), #0x88
	inc	hl
	ld	(hl), #0x13
;src/attributes.c:62: player.hull.upgrade_cost[4] = 15000;
	ld	hl, #(_player + 98)
	ld	(hl), #0x98
	inc	hl
	ld	(hl), #0x3a
;src/attributes.c:63: player.hull.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 100)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:64: player.hull.upgrade_name[0] = "Stock Hull";
	ld	hl, #(_player + 57)
	ld	(hl), #<(___str_10)
	inc	hl
	ld	(hl), #>(___str_10)
;src/attributes.c:65: player.hull.upgrade_name[1] = "Iron Hull";
	ld	hl, #(_player + 59)
	ld	(hl), #<(___str_11)
	inc	hl
	ld	(hl), #>(___str_11)
;src/attributes.c:66: player.hull.upgrade_name[2] = "Bronze Hull";
	ld	hl, #(_player + 61)
	ld	(hl), #<(___str_12)
	inc	hl
	ld	(hl), #>(___str_12)
;src/attributes.c:67: player.hull.upgrade_name[3] = "Steel Hull";
	ld	hl, #(_player + 63)
	ld	(hl), #<(___str_13)
	inc	hl
	ld	(hl), #>(___str_13)
;src/attributes.c:68: player.hull.upgrade_name[4] = "Platinum Hull";
	ld	hl, #(_player + 65)
	ld	(hl), #<(___str_14)
	inc	hl
	ld	(hl), #>(___str_14)
;src/attributes.c:69: player.hull.upgrade_name[5] = "Enegry Shield";
	ld	hl, #(_player + 67)
	ld	(hl), #<(___str_15)
	inc	hl
	ld	(hl), #>(___str_15)
;src/attributes.c:70: player.hull.color_palette[0] = palette_green;
	ld	hl, #(_player + 102)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:71: player.hull.color_palette[1] = palette_blue;
	ld	hl, #(_player + 104)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:72: player.hull.color_palette[2] = palette_purple;
	ld	hl, #(_player + 106)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:73: player.hull.color_palette[3] = palette_green;
	ld	hl, #(_player + 108)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:74: player.hull.color_palette[4] = palette_blue;
	ld	hl, #(_player + 110)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:75: player.hull.color_palette[5] = palette_purple;
	ld	hl, #(_player + 112)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:77: player.engine.attribute_name = "Engine";
	ld	hl, #(_player + 297)
	ld	a, #<(___str_16)
	ld	(hl+), a
	ld	(hl), #>(___str_16)
;src/attributes.c:78: player.engine.attribute_unit = "hp";
	ld	hl, #(_player + 299)
	ld	a, #<(___str_17)
	ld	(hl+), a
	ld	(hl), #>(___str_17)
;src/attributes.c:79: player.engine.current_value = 16;
	ld	hl, #(_player + 301)
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:80: player.engine.max_value = 16;
	ld	hl, #(_player + 303)
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:81: player.engine.upgrade_level = 0;
	ld	hl, #(_player + 305)
	ld	(hl), #0x00
;src/attributes.c:82: player.engine.upgrade_value[0] = 16;
	ld	hl, #(_player + 306)
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:83: player.engine.upgrade_value[1] = 18;
	ld	hl, #(_player + 308)
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:84: player.engine.upgrade_value[2] = 21;
	ld	hl, #(_player + 310)
	ld	a, #0x15
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:85: player.engine.upgrade_value[3] = 25;
	ld	hl, #(_player + 312)
	ld	a, #0x19
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:86: player.engine.upgrade_value[4] = 32;
	ld	hl, #(_player + 314)
	ld	a, #0x20
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:87: player.engine.upgrade_value[5] = 40;
	ld	hl, #(_player + 316)
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:88: player.engine.upgrade_cost[0] = 0;
	ld	hl, #(_player + 318)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:89: player.engine.upgrade_cost[1] = 750;
	ld	hl, #(_player + 320)
	ld	(hl), #0xee
	inc	hl
	ld	(hl), #0x02
;src/attributes.c:90: player.engine.upgrade_cost[2] = 2000;
	ld	hl, #(_player + 322)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:91: player.engine.upgrade_cost[3] = 5000;
	ld	hl, #(_player + 324)
	ld	(hl), #0x88
	inc	hl
	ld	(hl), #0x13
;src/attributes.c:92: player.engine.upgrade_cost[4] = 20000;
	ld	hl, #(_player + 326)
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x4e
;src/attributes.c:93: player.engine.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 328)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:94: player.engine.upgrade_name[0] = "Stock Engine";
	ld	hl, #(_player + 285)
	ld	(hl), #<(___str_18)
	inc	hl
	ld	(hl), #>(___str_18)
;src/attributes.c:95: player.engine.upgrade_name[1] = "V4 1.6 Ltr";
	ld	hl, #(_player + 287)
	ld	(hl), #<(___str_19)
	inc	hl
	ld	(hl), #>(___str_19)
;src/attributes.c:96: player.engine.upgrade_name[2] = "V4 2.0 Ltr Turbo";
	ld	hl, #(_player + 289)
	ld	(hl), #<(___str_20)
	inc	hl
	ld	(hl), #>(___str_20)
;src/attributes.c:97: player.engine.upgrade_name[3] = "V6 3.8 Ltr";
	ld	hl, #(_player + 291)
	ld	(hl), #<(___str_21)
	inc	hl
	ld	(hl), #>(___str_21)
;src/attributes.c:98: player.engine.upgrade_name[4] = "V8 5.0 Ltr Turbo";
	ld	hl, #(_player + 293)
	ld	(hl), #<(___str_22)
	inc	hl
	ld	(hl), #>(___str_22)
;src/attributes.c:99: player.engine.upgrade_name[5] = "V16 Jaguar";
	ld	hl, #(_player + 295)
	ld	(hl), #<(___str_23)
	inc	hl
	ld	(hl), #>(___str_23)
;src/attributes.c:100: player.engine.color_palette[0] = palette_dark_red;
	ld	hl, #(_player + 330)
	ld	(hl), #<(_palette_dark_red)
	inc	hl
	ld	(hl), #>(_palette_dark_red)
;src/attributes.c:101: player.engine.color_palette[1] = palette_grey;
	ld	hl, #(_player + 332)
	ld	(hl), #<(_palette_grey)
	inc	hl
	ld	(hl), #>(_palette_grey)
;src/attributes.c:102: player.engine.color_palette[2] = palette_grey;
	ld	hl, #(_player + 334)
	ld	(hl), #<(_palette_grey)
	inc	hl
	ld	(hl), #>(_palette_grey)
;src/attributes.c:103: player.engine.color_palette[3] = palette_orange;
	ld	hl, #(_player + 336)
	ld	(hl), #<(_palette_orange)
	inc	hl
	ld	(hl), #>(_palette_orange)
;src/attributes.c:104: player.engine.color_palette[4] = palette_blue;
	ld	hl, #(_player + 338)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:105: player.engine.color_palette[5] = palette_red;
	ld	hl, #(_player + 340)
	ld	(hl), #<(_palette_red)
	inc	hl
	ld	(hl), #>(_palette_red)
;src/attributes.c:107: player.fuel.attribute_name = "Fueltank";
	ld	hl, #(_player + 12)
	ld	a, #<(___str_24)
	ld	(hl+), a
	ld	(hl), #>(___str_24)
;src/attributes.c:108: player.fuel.attribute_unit = "ltr";
	ld	hl, #(_player + 14)
	ld	a, #<(___str_25)
	ld	(hl+), a
	ld	(hl), #>(___str_25)
;src/attributes.c:109: player.fuel.current_value = 120;
	ld	hl, #(_player + 16)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:110: player.fuel.max_value = 120;
	ld	hl, #(_player + 18)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:111: player.fuel.upgrade_level = 0;
	ld	hl, #(_player + 20)
	ld	(hl), #0x00
;src/attributes.c:112: player.fuel.upgrade_value[0] = 120;
	ld	hl, #(_player + 21)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:113: player.fuel.upgrade_value[1] = 200;
	ld	hl, #(_player + 23)
	ld	a, #0xc8
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:114: player.fuel.upgrade_value[2] = 350;
	ld	hl, #(_player + 25)
	ld	a, #0x5e
	ld	(hl+), a
	ld	(hl), #0x01
;src/attributes.c:115: player.fuel.upgrade_value[3] = 600;
	ld	hl, #(_player + 27)
	ld	a, #0x58
	ld	(hl+), a
	ld	(hl), #0x02
;src/attributes.c:116: player.fuel.upgrade_value[4] = 950;
	ld	hl, #(_player + 29)
	ld	a, #0xb6
	ld	(hl+), a
	ld	(hl), #0x03
;src/attributes.c:117: player.fuel.upgrade_value[5] = 1200;
	ld	hl, #(_player + 31)
	ld	a, #0xb0
	ld	(hl+), a
	ld	(hl), #0x04
;src/attributes.c:118: player.fuel.upgrade_cost[0] = 0;
	ld	hl, #(_player + 33)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:119: player.fuel.upgrade_cost[1] = 750;
	ld	hl, #(_player + 35)
	ld	(hl), #0xee
	inc	hl
	ld	(hl), #0x02
;src/attributes.c:120: player.fuel.upgrade_cost[2] = 2000;
	ld	hl, #(_player + 37)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:121: player.fuel.upgrade_cost[3] = 8000;
	ld	hl, #(_player + 39)
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x1f
;src/attributes.c:122: player.fuel.upgrade_cost[4] = 10000;
	ld	hl, #(_player + 41)
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x27
;src/attributes.c:123: player.fuel.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 43)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:124: player.fuel.upgrade_name[0] = "Micro Tank";
	ld	hl, #_player
	ld	(hl), #<(___str_26)
	inc	hl
	ld	(hl), #>(___str_26)
;src/attributes.c:125: player.fuel.upgrade_name[1] = "Medium Tank";
	ld	hl, #(_player + 2)
	ld	(hl), #<(___str_27)
	inc	hl
	ld	(hl), #>(___str_27)
;src/attributes.c:126: player.fuel.upgrade_name[2] = "Huge Tank";
	ld	hl, #(_player + 4)
	ld	(hl), #<(___str_28)
	inc	hl
	ld	(hl), #>(___str_28)
;src/attributes.c:127: player.fuel.upgrade_name[3] = "Titanic Tank";
	ld	hl, #(_player + 6)
	ld	(hl), #<(___str_29)
	inc	hl
	ld	(hl), #>(___str_29)
;src/attributes.c:128: player.fuel.upgrade_name[4] = "Leviathan Tank";
	ld	hl, #(_player + 8)
	ld	(hl), #<(___str_30)
	inc	hl
	ld	(hl), #>(___str_30)
;src/attributes.c:129: player.fuel.upgrade_name[5] = "Liquid Gas";
	ld	hl, #(_player + 10)
	ld	(hl), #<(___str_31)
	inc	hl
	ld	(hl), #>(___str_31)
;src/attributes.c:130: player.fuel.color_palette[0] = palette_green;
	ld	hl, #(_player + 45)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:131: player.fuel.color_palette[1] = palette_blue;
	ld	hl, #(_player + 47)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:132: player.fuel.color_palette[2] = palette_purple;
	ld	hl, #(_player + 49)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:133: player.fuel.color_palette[3] = palette_green;
	ld	hl, #(_player + 51)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:134: player.fuel.color_palette[4] = palette_blue;
	ld	hl, #(_player + 53)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:135: player.fuel.color_palette[5] = palette_purple;
	ld	hl, #(_player + 55)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:137: player.radiator.attribute_name = "Radiator";
	ld	hl, #(_player + 240)
	ld	(hl), #<(___str_32)
	inc	hl
	ld	(hl), #>(___str_32)
;src/attributes.c:138: player.radiator.attribute_unit = "&";
	ld	hl, #(_player + 242)
	ld	(hl), #<(___str_33)
	inc	hl
	ld	(hl), #>(___str_33)
;src/attributes.c:139: player.radiator.current_value = 10;
	ld	hl, #(_player + 244)
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:140: player.radiator.max_value = 10;
	ld	hl, #(_player + 246)
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:141: player.radiator.upgrade_level = 0;
	ld	hl, #(_player + 248)
	ld	(hl), #0x00
;src/attributes.c:142: player.radiator.upgrade_value[0] = 0;
	ld	hl, #(_player + 249)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:143: player.radiator.upgrade_value[1] = 10;
	ld	hl, #(_player + 251)
	ld	a, #0x0a
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:144: player.radiator.upgrade_value[2] = 25;
	ld	hl, #(_player + 253)
	ld	a, #0x19
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:145: player.radiator.upgrade_value[3] = 40;
	ld	hl, #(_player + 255)
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:146: player.radiator.upgrade_value[4] = 30;
	ld	hl, #(_player + 257)
	ld	a, #0x1e
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:147: player.radiator.upgrade_value[5] = 80;
	ld	hl, #(_player + 259)
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:148: player.radiator.upgrade_cost[0] = 0;
	ld	hl, #(_player + 261)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:149: player.radiator.upgrade_cost[1] = 2000;
	ld	hl, #(_player + 263)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:150: player.radiator.upgrade_cost[2] = 5000;
	ld	hl, #(_player + 265)
	ld	(hl), #0x88
	inc	hl
	ld	(hl), #0x13
;src/attributes.c:151: player.radiator.upgrade_cost[3] = 8000;
	ld	hl, #(_player + 267)
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x1f
;src/attributes.c:152: player.radiator.upgrade_cost[4] = 10000;
	ld	hl, #(_player + 269)
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x27
;src/attributes.c:153: player.radiator.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 271)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:154: player.radiator.upgrade_name[0] = "Stock Fan";
	ld	hl, #(_player + 228)
	ld	(hl), #<(___str_34)
	inc	hl
	ld	(hl), #>(___str_34)
;src/attributes.c:155: player.radiator.upgrade_name[1] = "Dual Fans";
	ld	hl, #(_player + 230)
	ld	(hl), #<(___str_35)
	inc	hl
	ld	(hl), #>(___str_35)
;src/attributes.c:156: player.radiator.upgrade_name[2] = "Single Turbine";
	ld	hl, #(_player + 232)
	ld	(hl), #<(___str_36)
	inc	hl
	ld	(hl), #>(___str_36)
;src/attributes.c:157: player.radiator.upgrade_name[3] = "Dual Turbines";
	ld	hl, #(_player + 234)
	ld	(hl), #<(___str_37)
	inc	hl
	ld	(hl), #>(___str_37)
;src/attributes.c:158: player.radiator.upgrade_name[4] = "Puron Cooling";
	ld	hl, #(_player + 236)
	ld	(hl), #<(___str_38)
	inc	hl
	ld	(hl), #>(___str_38)
;src/attributes.c:159: player.radiator.upgrade_name[5] = "Tri-Turbine";
	ld	hl, #(_player + 238)
	ld	(hl), #<(___str_39)
	inc	hl
	ld	(hl), #>(___str_39)
;src/attributes.c:160: player.radiator.color_palette[0] = palette_red;
	ld	hl, #(_player + 273)
	ld	(hl), #<(_palette_red)
	inc	hl
	ld	(hl), #>(_palette_red)
;src/attributes.c:161: player.radiator.color_palette[1] = palette_yellow;
	ld	hl, #(_player + 275)
	ld	(hl), #<(_palette_yellow)
	inc	hl
	ld	(hl), #>(_palette_yellow)
;src/attributes.c:162: player.radiator.color_palette[2] = palette_orange;
	ld	hl, #(_player + 277)
	ld	(hl), #<(_palette_orange)
	inc	hl
	ld	(hl), #>(_palette_orange)
;src/attributes.c:163: player.radiator.color_palette[3] = palette_red;
	ld	hl, #(_player + 279)
	ld	(hl), #<(_palette_red)
	inc	hl
	ld	(hl), #>(_palette_red)
;src/attributes.c:164: player.radiator.color_palette[4] = palette_yellow;
	ld	hl, #(_player + 281)
	ld	(hl), #<(_palette_yellow)
	inc	hl
	ld	(hl), #>(_palette_yellow)
;src/attributes.c:165: player.radiator.color_palette[5] = palette_orange;
	ld	hl, #(_player + 283)
	ld	(hl), #<(_palette_orange)
	inc	hl
	ld	(hl), #>(_palette_orange)
;src/attributes.c:167: player.cargo.attribute_name = "Cargo Bay";
	ld	hl, #(_player + 183)
	ld	a, #<(___str_40)
	ld	(hl+), a
	ld	(hl), #>(___str_40)
;src/attributes.c:168: player.cargo.attribute_unit = "m3";
	ld	hl, #(_player + 185)
	ld	a, #<(___str_41)
	ld	(hl+), a
	ld	(hl), #>(___str_41)
;src/attributes.c:169: player.cargo.current_value = 15;
	ld	hl, #(_player + 187)
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:170: player.cargo.max_value = 15;
	ld	hl, #(_player + 189)
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:171: player.cargo.upgrade_level = 0;
	ld	hl, #(_player + 191)
	ld	(hl), #0x00
;src/attributes.c:172: player.cargo.upgrade_value[0] = 7;
	ld	hl, #(_player + 192)
	ld	a, #0x07
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:173: player.cargo.upgrade_value[1] = 15;
	ld	hl, #(_player + 194)
	ld	a, #0x0f
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:174: player.cargo.upgrade_value[2] = 25;
	ld	hl, #(_player + 196)
	ld	a, #0x19
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:175: player.cargo.upgrade_value[3] = 40;
	ld	hl, #(_player + 198)
	ld	a, #0x28
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:176: player.cargo.upgrade_value[4] = 70;
	ld	hl, #(_player + 200)
	ld	a, #0x46
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:177: player.cargo.upgrade_value[5] = 120;
	ld	hl, #(_player + 202)
	ld	a, #0x78
	ld	(hl+), a
	ld	(hl), #0x00
;src/attributes.c:178: player.cargo.upgrade_cost[0] = 0;
	ld	hl, #(_player + 204)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/attributes.c:179: player.cargo.upgrade_cost[1] = 750;
	ld	hl, #(_player + 206)
	ld	(hl), #0xee
	inc	hl
	ld	(hl), #0x02
;src/attributes.c:180: player.cargo.upgrade_cost[2] = 2000;
	ld	hl, #(_player + 208)
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x07
;src/attributes.c:181: player.cargo.upgrade_cost[3] = 5000;
	ld	hl, #(_player + 210)
	ld	(hl), #0x88
	inc	hl
	ld	(hl), #0x13
;src/attributes.c:182: player.cargo.upgrade_cost[4] = 10000;
	ld	hl, #(_player + 212)
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x27
;src/attributes.c:183: player.cargo.upgrade_cost[5] = 30000;
	ld	hl, #(_player + 214)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;src/attributes.c:184: player.cargo.upgrade_name[0] = "Micro Bay";
	ld	hl, #(_player + 171)
	ld	(hl), #<(___str_42)
	inc	hl
	ld	(hl), #>(___str_42)
;src/attributes.c:185: player.cargo.upgrade_name[1] = "Medium Bay";
	ld	hl, #(_player + 173)
	ld	(hl), #<(___str_43)
	inc	hl
	ld	(hl), #>(___str_43)
;src/attributes.c:186: player.cargo.upgrade_name[2] = "Huge Bay";
	ld	hl, #(_player + 175)
	ld	(hl), #<(___str_44)
	inc	hl
	ld	(hl), #>(___str_44)
;src/attributes.c:187: player.cargo.upgrade_name[3] = "Gigantic Bay";
	ld	hl, #(_player + 177)
	ld	(hl), #<(___str_45)
	inc	hl
	ld	(hl), #>(___str_45)
;src/attributes.c:188: player.cargo.upgrade_name[4] = "Titanic Bay";
	ld	hl, #(_player + 179)
	ld	(hl), #<(___str_46)
	inc	hl
	ld	(hl), #>(___str_46)
;src/attributes.c:189: player.cargo.upgrade_name[5] = "Leviathan Bay";
	ld	hl, #(_player + 181)
	ld	(hl), #<(___str_47)
	inc	hl
	ld	(hl), #>(___str_47)
;src/attributes.c:190: player.cargo.color_palette[0] = palette_green;
	ld	hl, #(_player + 216)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:191: player.cargo.color_palette[1] = palette_blue;
	ld	hl, #(_player + 218)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:192: player.cargo.color_palette[2] = palette_purple;
	ld	hl, #(_player + 220)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:193: player.cargo.color_palette[3] = palette_green;
	ld	hl, #(_player + 222)
	ld	(hl), #<(_palette_green)
	inc	hl
	ld	(hl), #>(_palette_green)
;src/attributes.c:194: player.cargo.color_palette[4] = palette_blue;
	ld	hl, #(_player + 224)
	ld	(hl), #<(_palette_blue)
	inc	hl
	ld	(hl), #>(_palette_blue)
;src/attributes.c:195: player.cargo.color_palette[5] = palette_purple;
	ld	hl, #(_player + 226)
	ld	(hl), #<(_palette_purple)
	inc	hl
	ld	(hl), #>(_palette_purple)
;src/attributes.c:197: player.money = 31100;
	ld	hl, #(_player + 342)
	ld	a, #0x7c
	ld	(hl+), a
	ld	(hl), #0x79
;src/attributes.c:198: player.speed.l = 0;
	ld	bc, #_player + 344
	xor	a, a
	ld	(bc), a
;src/attributes.c:199: player.speed.h = 16;
	ld	hl, #(_player + 345)
	ld	(hl), #0x10
;src/attributes.c:200: player.prev_speed.w = player.speed.w;
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_player + 346)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/attributes.c:202: }
	ret
___str_0:
	.ascii "Drill"
	.db 0x00
___str_1:
	.ascii "m/s"
	.db 0x00
___str_2:
	.ascii "Stock Drill"
	.db 0x00
___str_3:
	.ascii "Iron Drill"
	.db 0x00
___str_4:
	.ascii "Steel Drill"
	.db 0x00
___str_5:
	.ascii "Titanium Drill"
	.db 0x00
___str_6:
	.ascii "Diamond Drill"
	.db 0x00
___str_7:
	.ascii "Platinum Drill"
	.db 0x00
___str_8:
	.ascii "Hull"
	.db 0x00
___str_9:
	.ascii "pt"
	.db 0x00
___str_10:
	.ascii "Stock Hull"
	.db 0x00
___str_11:
	.ascii "Iron Hull"
	.db 0x00
___str_12:
	.ascii "Bronze Hull"
	.db 0x00
___str_13:
	.ascii "Steel Hull"
	.db 0x00
___str_14:
	.ascii "Platinum Hull"
	.db 0x00
___str_15:
	.ascii "Enegry Shield"
	.db 0x00
___str_16:
	.ascii "Engine"
	.db 0x00
___str_17:
	.ascii "hp"
	.db 0x00
___str_18:
	.ascii "Stock Engine"
	.db 0x00
___str_19:
	.ascii "V4 1.6 Ltr"
	.db 0x00
___str_20:
	.ascii "V4 2.0 Ltr Turbo"
	.db 0x00
___str_21:
	.ascii "V6 3.8 Ltr"
	.db 0x00
___str_22:
	.ascii "V8 5.0 Ltr Turbo"
	.db 0x00
___str_23:
	.ascii "V16 Jaguar"
	.db 0x00
___str_24:
	.ascii "Fueltank"
	.db 0x00
___str_25:
	.ascii "ltr"
	.db 0x00
___str_26:
	.ascii "Micro Tank"
	.db 0x00
___str_27:
	.ascii "Medium Tank"
	.db 0x00
___str_28:
	.ascii "Huge Tank"
	.db 0x00
___str_29:
	.ascii "Titanic Tank"
	.db 0x00
___str_30:
	.ascii "Leviathan Tank"
	.db 0x00
___str_31:
	.ascii "Liquid Gas"
	.db 0x00
___str_32:
	.ascii "Radiator"
	.db 0x00
___str_33:
	.ascii "&"
	.db 0x00
___str_34:
	.ascii "Stock Fan"
	.db 0x00
___str_35:
	.ascii "Dual Fans"
	.db 0x00
___str_36:
	.ascii "Single Turbine"
	.db 0x00
___str_37:
	.ascii "Dual Turbines"
	.db 0x00
___str_38:
	.ascii "Puron Cooling"
	.db 0x00
___str_39:
	.ascii "Tri-Turbine"
	.db 0x00
___str_40:
	.ascii "Cargo Bay"
	.db 0x00
___str_41:
	.ascii "m3"
	.db 0x00
___str_42:
	.ascii "Micro Bay"
	.db 0x00
___str_43:
	.ascii "Medium Bay"
	.db 0x00
___str_44:
	.ascii "Huge Bay"
	.db 0x00
___str_45:
	.ascii "Gigantic Bay"
	.db 0x00
___str_46:
	.ascii "Titanic Bay"
	.db 0x00
___str_47:
	.ascii "Leviathan Bay"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__attributes_numbers:
	.dw (_player + 114)
	.dw (_player + 57)
	.dw (_player + 285)
	.dw (_player + 0)
	.dw (_player + 228)
	.dw (_player + 171)
	.area _CABS (ABS)
