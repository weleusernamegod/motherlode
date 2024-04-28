;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module player
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _reset_player
	.globl _check_game_over
	.globl _check_enter_buildings
	.globl _update_fuel
	.globl _check_fuel
	.globl _check_hull
	.globl _calculate_falldamage
	.globl _initiate_movement
	.globl _move
	.globl _move_down
	.globl _move_up
	.globl _move_right
	.globl _move_left
	.globl _calculate_speed
	.globl _calculate_frames
	.globl _update_movement
	.globl _draw_metasprite
	.globl _metasprite_rover
	.globl _metasprite_drill_vertical
	.globl _metasprite_drill_horizontal
	.globl _check_surroundings
	.globl _init_speed
	.globl _init_character
	.globl b___func_bank_player
	.globl ___func_bank_player
	.globl _abs
	.globl _player
	.globl _drill_vertical_metasprite
	.globl _drill_horizontal_metasprite
	.globl _rover_metasprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$player$0_0$0==.
_player::
	.ds 348
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
	G$__func_bank_player$0$0	= .
	.globl	G$__func_bank_player$0$0
	C$player.c$20$0_0$209	= .
	.globl	C$player.c$20$0_0$209
;src/player.c:20: BANKREF(bank_player)
;	---------------------------------
; Function __func_bank_player
; ---------------------------------
	b___func_bank_player	= 1
___func_bank_player::
	.local b___func_bank_player 
	___bank_bank_player = b___func_bank_player 
	.globl ___bank_bank_player 
	G$init_character$0$0	= .
	.globl	G$init_character$0$0
	C$player.c$44$1_0$211	= .
	.globl	C$player.c$44$1_0$211
;src/player.c:44: void init_character(void){
;	---------------------------------
; Function init_character
; ---------------------------------
_init_character::
	C$player.c$45$1_0$211	= .
	.globl	C$player.c$45$1_0$211
;src/player.c:45: direction_prev = RIGHT;    // start with the rover facing right
	ld	hl, #_direction_prev
	ld	(hl), #0x02
	C$player.c$46$1_0$211	= .
	.globl	C$player.c$46$1_0$211
;src/player.c:46: prev_depth = depth;
	ld	a, (#_depth)
	ld	(#_prev_depth),a
	C$player.c$47$1_0$211	= .
	.globl	C$player.c$47$1_0$211
;src/player.c:47: width_pixel.h = 16 + ((width - width_offset) * 16);
	ld	bc, #_width_pixel+1
	ld	a, (#_width)
	ld	hl, #_width_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x10
	ld	(bc), a
	C$player.c$48$1_0$211	= .
	.globl	C$player.c$48$1_0$211
;src/player.c:48: depth_pixel.h = 16 + 8 + (depth - depth_offset) * 16;
	ld	bc, #_depth_pixel+1
	ld	a, (#_depth)
	ld	hl, #_depth_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x18
	ld	(bc), a
	C$player.c$49$1_0$211	= .
	.globl	C$player.c$49$1_0$211
;src/player.c:49: scroll_x.h = width_offset * 16;
	ld	bc, #_scroll_x+1
	ld	a, (#_width_offset)
	swap	a
	and	a, #0xf0
	ld	(bc), a
	C$player.c$50$1_0$211	= .
	.globl	C$player.c$50$1_0$211
;src/player.c:50: scroll_y.h = depth_offset * 16;
	ld	bc, #_scroll_y+1
	ld	a, (#_depth_offset)
	swap	a
	and	a, #0xf0
	ld	(bc), a
	C$player.c$51$1_0$211	= .
	.globl	C$player.c$51$1_0$211
;src/player.c:51: }
	C$player.c$51$1_0$211	= .
	.globl	C$player.c$51$1_0$211
	XG$init_character$0$0	= .
	.globl	XG$init_character$0$0
	ret
G$rover_metasprite$0_0$0 == .
_rover_metasprite:
	.db #0xf8	; -8
	.db #0xf8	; -8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0xf8	; -8
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
G$drill_horizontal_metasprite$0_0$0 == .
_drill_horizontal_metasprite:
	.db #0xf8	; -8
	.db #0xf0	; -16
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
G$drill_vertical_metasprite$0_0$0 == .
_drill_vertical_metasprite:
	.db #0x08	;  8
	.db #0xf8	; -8
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	G$init_speed$0$0	= .
	.globl	G$init_speed$0$0
	C$player.c$54$1_0$213	= .
	.globl	C$player.c$54$1_0$213
;src/player.c:54: void init_speed(void){
;	---------------------------------
; Function init_speed
; ---------------------------------
_init_speed::
	C$player.c$55$1_0$213	= .
	.globl	C$player.c$55$1_0$213
;src/player.c:55: move_x_per_frame.w = 0;
	ld	hl, #_move_x_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$56$1_0$213	= .
	.globl	C$player.c$56$1_0$213
;src/player.c:56: move_y_per_frame.w = 0;
	ld	hl, #_move_y_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$57$1_0$213	= .
	.globl	C$player.c$57$1_0$213
;src/player.c:57: scroll_x_per_frame.w = 0;
	ld	hl, #_scroll_x_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$58$1_0$213	= .
	.globl	C$player.c$58$1_0$213
;src/player.c:58: scroll_y_per_frame.w = 0;
	ld	hl, #_scroll_y_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$59$1_0$213	= .
	.globl	C$player.c$59$1_0$213
;src/player.c:59: scroll_x.w = 0;
	ld	hl, #_scroll_x
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$60$1_0$213	= .
	.globl	C$player.c$60$1_0$213
;src/player.c:60: scroll_y.w = 0;
	ld	hl, #_scroll_y
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$61$1_0$213	= .
	.globl	C$player.c$61$1_0$213
;src/player.c:61: }
	C$player.c$61$1_0$213	= .
	.globl	C$player.c$61$1_0$213
	XG$init_speed$0$0	= .
	.globl	XG$init_speed$0$0
	ret
	G$check_surroundings$0$0	= .
	.globl	G$check_surroundings$0$0
	C$player.c$64$1_0$215	= .
	.globl	C$player.c$64$1_0$215
;src/player.c:64: void check_surroundings(void){
;	---------------------------------
; Function check_surroundings
; ---------------------------------
_check_surroundings::
	C$player.c$65$1_0$215	= .
	.globl	C$player.c$65$1_0$215
;src/player.c:65: next_tile_down = level_array[depth + 1][width];
	ld	hl, #_depth
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_level_array
	add	hl, de
	push	hl
	ld	hl, #_width
	ld	e, (hl)
	pop	hl
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(#_next_tile_down),a
	C$player.c$66$1_0$215	= .
	.globl	C$player.c$66$1_0$215
;src/player.c:66: next_tile_up = level_array[depth - 1][width];
	ld	l, c
	ld	h, b
	dec	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_level_array
	add	hl, de
	pop	de
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	ld	(#_next_tile_up),a
	C$player.c$67$1_0$215	= .
	.globl	C$player.c$67$1_0$215
;src/player.c:67: next_tile_right = level_array[depth][width + 1];
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_level_array)
	ld	c, a
	ld	a, h
	adc	a, #>(_level_array)
	ld	b, a
	ld	hl, #_width
	ld	e, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	inc	l
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_next_tile_right),a
	C$player.c$68$1_0$215	= .
	.globl	C$player.c$68$1_0$215
;src/player.c:68: next_tile_left = level_array[depth][width - 1];
	dec	e
	ld	l, e
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(#_next_tile_left),a
	C$player.c$69$1_0$215	= .
	.globl	C$player.c$69$1_0$215
;src/player.c:69: }
	C$player.c$69$1_0$215	= .
	.globl	C$player.c$69$1_0$215
	XG$check_surroundings$0$0	= .
	.globl	XG$check_surroundings$0$0
	ret
	G$metasprite_drill_horizontal$0$0	= .
	.globl	G$metasprite_drill_horizontal$0$0
	C$player.c$71$1_0$217	= .
	.globl	C$player.c$71$1_0$217
;src/player.c:71: void metasprite_drill_horizontal(char direction){
;	---------------------------------
; Function metasprite_drill_horizontal
; ---------------------------------
_metasprite_drill_horizontal::
	ld	c, a
;src/player.c:72: hide_metasprite(drill_vertical_metasprite, 15);
;/usr/local/opt/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_vertical_metasprite)
	inc	hl
	ld	(hl), #>(_drill_vertical_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	push	bc
	ld	a, #0x0f
	call	___hide_metasprite
	pop	bc
	C$player.c$73$1_0$217	= .
	.globl	C$player.c$73$1_0$217
;src/player.c:73: if (direction == LEFT) move_metasprite_ex (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
	ld	a, c
	dec	a
	jr	NZ, 00102$
	ld	hl, #(_depth_pixel + 1)
	ld	b, (hl)
	ld	de, #_width_pixel+1
	ld	a, (de)
	ld	e, a
;/usr/local/opt/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_horizontal_metasprite)
	inc	hl
	ld	(hl), #>(_drill_horizontal_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	or	a, e
	ld	e, a
	ld	d, l
	push	bc
	ld	a, #0x0b
	call	___move_metasprite
	pop	bc
	C$player.c$73$1_0$217	= .
	.globl	C$player.c$73$1_0$217
;src/player.c:73: if (direction == LEFT) move_metasprite_ex (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
00102$:
	C$player.c$74$1_0$217	= .
	.globl	C$player.c$74$1_0$217
;src/player.c:74: if (direction == RIGHT) move_metasprite_flipx (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
	ld	a, c
	sub	a, #0x02
	ret	NZ
	ld	hl, #(_depth_pixel + 1)
	ld	b, (hl)
	ld	hl, #(_width_pixel + 1)
	ld	c, (hl)
;/usr/local/opt/gbdk/include/gb/metasprites.h:191: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_horizontal_metasprite)
	inc	hl
	ld	(hl), #>(_drill_horizontal_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:192: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:193: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:194: return __move_metasprite_flipx(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, b
	ld	e, #0x00
	ld	a, c
	add	a, #0xf8
	ld	c, #0x00
	or	a, e
	ld	e, a
	ld	a, #0x0b
	C$player.c$74$1_0$217	= .
	.globl	C$player.c$74$1_0$217
;src/player.c:74: if (direction == RIGHT) move_metasprite_flipx (drill_horizontal_metasprite,0,0,11,width_pixel.h,depth_pixel.h);
	C$player.c$75$1_0$217	= .
	.globl	C$player.c$75$1_0$217
;src/player.c:75: }
	C$player.c$75$1_0$217	= .
	.globl	C$player.c$75$1_0$217
	XG$metasprite_drill_horizontal$0$0	= .
	.globl	XG$metasprite_drill_horizontal$0$0
	jp	___move_metasprite_flipx
	G$metasprite_drill_vertical$0$0	= .
	.globl	G$metasprite_drill_vertical$0$0
	C$player.c$76$1_0$228	= .
	.globl	C$player.c$76$1_0$228
;src/player.c:76: void metasprite_drill_vertical(char direction){
;	---------------------------------
; Function metasprite_drill_vertical
; ---------------------------------
_metasprite_drill_vertical::
	ld	c, a
;src/player.c:77: hide_metasprite(drill_horizontal_metasprite, 11);
;/usr/local/opt/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_horizontal_metasprite)
	inc	hl
	ld	(hl), #>(_drill_horizontal_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	push	bc
	ld	a, #0x0b
	call	___hide_metasprite
	pop	bc
	C$player.c$78$1_0$228	= .
	.globl	C$player.c$78$1_0$228
;src/player.c:78: if (direction == DOWN) move_metasprite_ex(drill_vertical_metasprite,0,0,15,width_pixel.h,depth_pixel.h);
	ld	a, c
	sub	a, #0x04
	ret	NZ
	ld	hl, #(_depth_pixel + 1)
	ld	c, (hl)
	ld	de, #_width_pixel+1
	ld	a, (de)
	ld	e, a
;/usr/local/opt/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_vertical_metasprite)
	inc	hl
	ld	(hl), #>(_drill_vertical_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
;/usr/local/opt/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	(hl), #0x00
	ld	a, (hl)
	ld	b,a
	or	a, e
	ld	e, a
	ld	d, c
	ld	a, #0x0f
	C$player.c$78$1_0$228	= .
	.globl	C$player.c$78$1_0$228
;src/player.c:78: if (direction == DOWN) move_metasprite_ex(drill_vertical_metasprite,0,0,15,width_pixel.h,depth_pixel.h);
	C$player.c$79$1_0$228	= .
	.globl	C$player.c$79$1_0$228
;src/player.c:79: }
	C$player.c$79$1_0$228	= .
	.globl	C$player.c$79$1_0$228
	XG$metasprite_drill_vertical$0$0	= .
	.globl	XG$metasprite_drill_vertical$0$0
	jp	___move_metasprite
	G$metasprite_rover$0$0	= .
	.globl	G$metasprite_rover$0$0
	C$player.c$80$1_0$236	= .
	.globl	C$player.c$80$1_0$236
;src/player.c:80: void metasprite_rover(char direction){
;	---------------------------------
; Function metasprite_rover
; ---------------------------------
_metasprite_rover::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
;src/player.c:81: hide_metasprite(drill_horizontal_metasprite, 15);
;/usr/local/opt/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_horizontal_metasprite)
	inc	hl
	ld	(hl), #>(_drill_horizontal_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x0f
	call	___hide_metasprite
;src/player.c:82: hide_metasprite(drill_horizontal_metasprite, 11);
;/usr/local/opt/gbdk/include/gb/metasprites.h:297: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_drill_horizontal_metasprite)
	inc	hl
	ld	(hl), #>(_drill_horizontal_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:298: __hide_metasprite(base_sprite);
	ld	a, #0x0b
	call	___hide_metasprite
	C$player.c$83$1_0$236	= .
	.globl	C$player.c$83$1_0$236
;src/player.c:83: if (direction == LEFT) move_metasprite_ex(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
	ld	hl, #(_depth_pixel + 1)
	ld	c, (hl)
	ld	de, #_width_pixel+1
	ld	a, (de)
	ld	e, a
;/usr/local/opt/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_rover_metasprite)
	inc	hl
	ld	(hl), #>(_rover_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
;/usr/local/opt/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	xor	a, a
	ld	(hl),a
	or	a, e
	ld	e, a
	ld	d, c
	xor	a, a
	call	___move_metasprite
	C$player.c$83$1_0$236	= .
	.globl	C$player.c$83$1_0$236
;src/player.c:83: if (direction == LEFT) move_metasprite_ex(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
00102$:
	C$player.c$84$1_0$236	= .
	.globl	C$player.c$84$1_0$236
;src/player.c:84: if (direction == RIGHT) move_metasprite_flipx(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00109$
	ld	hl, #(_depth_pixel + 1)
	ld	b, (hl)
	ld	hl, #(_width_pixel + 1)
	ld	c, (hl)
;/usr/local/opt/gbdk/include/gb/metasprites.h:191: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_rover_metasprite)
	inc	hl
	ld	(hl), #>(_rover_metasprite)
;/usr/local/opt/gbdk/include/gb/metasprites.h:192: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:193: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:194: return __move_metasprite_flipx(base_sprite, (y << 8) | (uint8_t)(x - 8u));
	ld	d, b
	ld	e, #0x00
	ld	a, c
	add	a, #0xf8
	ld	c, #0x00
	or	a, e
	ld	e, a
	xor	a, a
	inc	sp
	jp	___move_metasprite_flipx
	C$player.c$84$1_0$236	= .
	.globl	C$player.c$84$1_0$236
;src/player.c:84: if (direction == RIGHT) move_metasprite_flipx(rover_metasprite,0,0,0,width_pixel.h,depth_pixel.h);
00109$:
	C$player.c$85$1_0$236	= .
	.globl	C$player.c$85$1_0$236
;src/player.c:85: }
	inc	sp
	C$player.c$85$1_0$236	= .
	.globl	C$player.c$85$1_0$236
	XG$metasprite_rover$0$0	= .
	.globl	XG$metasprite_rover$0$0
	ret
	G$draw_metasprite$0$0	= .
	.globl	G$draw_metasprite$0$0
	C$player.c$87$1_0$250	= .
	.globl	C$player.c$87$1_0$250
;src/player.c:87: void draw_metasprite(char direction){
;	---------------------------------
; Function draw_metasprite
; ---------------------------------
_draw_metasprite::
	C$player.c$88$1_0$250	= .
	.globl	C$player.c$88$1_0$250
;src/player.c:88: if (direction == LEFT || direction == RIGHT){
	ld	c, a
	dec	a
	jr	Z, 00108$
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00109$
00108$:
	C$player.c$89$2_0$251	= .
	.globl	C$player.c$89$2_0$251
;src/player.c:89: metasprite_rover(direction);
	push	bc
	ld	a, c
	call	_metasprite_rover
	pop	bc
	C$player.c$90$2_0$251	= .
	.globl	C$player.c$90$2_0$251
;src/player.c:90: if (is_drilling == TRUE) metasprite_drill_horizontal(direction);
	ld	hl, #_is_drilling
	ld	a, (hl)
	dec	a
	ret	NZ
	ld	a, c
	jp	_metasprite_drill_horizontal
00109$:
	C$player.c$91$1_0$250	= .
	.globl	C$player.c$91$1_0$250
;src/player.c:91: } else if (direction == UP || direction == DOWN) {
	ld	a,c
	cp	a,#0x03
	jr	Z, 00105$
	sub	a, #0x04
	ret	NZ
00105$:
	C$player.c$92$2_0$252	= .
	.globl	C$player.c$92$2_0$252
;src/player.c:92: metasprite_rover(direction_prev);
	push	bc
	ld	a, (#_direction_prev)
	call	_metasprite_rover
	pop	bc
	C$player.c$93$2_0$252	= .
	.globl	C$player.c$93$2_0$252
;src/player.c:93: if (is_drilling == TRUE) metasprite_drill_vertical(direction);
	ld	hl, #_is_drilling
	ld	a, (hl)
	dec	a
	ret	NZ
	ld	a, c
	C$player.c$95$1_0$250	= .
	.globl	C$player.c$95$1_0$250
;src/player.c:95: }
	C$player.c$95$1_0$250	= .
	.globl	C$player.c$95$1_0$250
	XG$draw_metasprite$0$0	= .
	.globl	XG$draw_metasprite$0$0
	jp	_metasprite_drill_vertical
	G$update_movement$0$0	= .
	.globl	G$update_movement$0$0
	C$player.c$97$1_0$254	= .
	.globl	C$player.c$97$1_0$254
;src/player.c:97: void update_movement(void) {
;	---------------------------------
; Function update_movement
; ---------------------------------
_update_movement::
	C$player.c$98$1_0$254	= .
	.globl	C$player.c$98$1_0$254
;src/player.c:98: if (animation_frames_left > 0) {
	ld	a, (#_animation_frames_left)
	or	a, a
	ret	Z
	C$player.c$100$2_0$255	= .
	.globl	C$player.c$100$2_0$255
;src/player.c:100: scroll_x.w += scroll_x_per_frame.w;
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_x_per_frame
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scroll_x
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$101$2_0$255	= .
	.globl	C$player.c$101$2_0$255
;src/player.c:101: scroll_y.w += scroll_y_per_frame.w;
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_y_per_frame
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scroll_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$102$2_0$255	= .
	.globl	C$player.c$102$2_0$255
;src/player.c:102: width_pixel.w += move_x_per_frame.w;
	ld	hl, #_width_pixel
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_move_x_per_frame
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_width_pixel
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$103$2_0$255	= .
	.globl	C$player.c$103$2_0$255
;src/player.c:103: depth_pixel.w += move_y_per_frame.w;
	ld	hl, #_depth_pixel
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_move_y_per_frame
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_depth_pixel
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$106$2_0$255	= .
	.globl	C$player.c$106$2_0$255
;src/player.c:106: draw_metasprite(direction_now);
	ld	a, (#_direction_now)
	call	_draw_metasprite
;src/player.c:109: move_bkg(scroll_x.h, scroll_y.h);
	ld	hl, #(_scroll_y + 1)
	ld	c, (hl)
	ld	a, (#(_scroll_x + 1) + 0)
	ldh	(_SCX_REG + 0), a
;/usr/local/opt/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ld	a, c
	ldh	(_SCY_REG + 0), a
	C$player.c$112$2_0$255	= .
	.globl	C$player.c$112$2_0$255
;src/player.c:112: animation_frames_left--;
	ld	hl, #_animation_frames_left
	dec	(hl)
	C$player.c$115$2_0$255	= .
	.globl	C$player.c$115$2_0$255
;src/player.c:115: if (animation_frames_left % 15 == 0) {  // Every 15 frames
	ld	e, (hl)
	ld	d, #0x00
	ld	bc, #0x000f
	call	__modsint
	ld	a, b
	or	a, c
	jr	NZ, 00102$
	C$player.c$116$3_0$256	= .
	.globl	C$player.c$116$3_0$256
;src/player.c:116: player.fuel.current_value -= 1;
	ld	hl, #(_player + 16)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	hl, #(_player + 16)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00102$:
	C$player.c$120$2_0$255	= .
	.globl	C$player.c$120$2_0$255
;src/player.c:120: if (animation_frames_left == 0) {
	ld	a, (#_animation_frames_left)
	or	a, a
	ret	NZ
	C$player.c$121$3_0$257	= .
	.globl	C$player.c$121$3_0$257
;src/player.c:121: move_x_per_frame.w = 0;
	ld	hl, #_move_x_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$122$3_0$257	= .
	.globl	C$player.c$122$3_0$257
;src/player.c:122: move_y_per_frame.w = 0;
	ld	hl, #_move_y_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$123$3_0$257	= .
	.globl	C$player.c$123$3_0$257
;src/player.c:123: scroll_x_per_frame.w = 0;
	ld	hl, #_scroll_x_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$124$3_0$257	= .
	.globl	C$player.c$124$3_0$257
;src/player.c:124: scroll_y_per_frame.w = 0;
	ld	hl, #_scroll_y_per_frame
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$127$3_0$257	= .
	.globl	C$player.c$127$3_0$257
;src/player.c:127: width_pixel.h = 16 + (width - width_offset) * 16, width_pixel.l = 0;
	ld	a, (#_width)
	ld	hl, #_width_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x10
	ld	(#(_width_pixel + 1)),a
	ld	hl, #_width_pixel
	ld	(hl), #0x00
	C$player.c$128$3_0$257	= .
	.globl	C$player.c$128$3_0$257
;src/player.c:128: depth_pixel.h = 24 + (depth - depth_offset) * 16, depth_pixel.l = 0;
	ld	bc, #_depth_pixel + 1
	ld	a, (#_depth)
	ld	hl, #_depth_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x18
	ld	(bc), a
	ld	hl, #_depth_pixel
	ld	(hl), #0x00
	C$player.c$129$3_0$257	= .
	.globl	C$player.c$129$3_0$257
;src/player.c:129: scroll_x.h = width_offset * 16, scroll_x.l = 0;
	ld	a, (#_width_offset)
	swap	a
	and	a, #0xf0
	ld	(#(_scroll_x + 1)),a
	ld	hl, #_scroll_x
	ld	(hl), #0x00
	C$player.c$130$3_0$257	= .
	.globl	C$player.c$130$3_0$257
;src/player.c:130: scroll_y.h = depth_offset * 16, scroll_y.l = 0;  
	ld	a, (#_depth_offset)
	swap	a
	and	a, #0xf0
	ld	(#(_scroll_y + 1)),a
	ld	hl, #_scroll_y
	ld	(hl), #0x00
	C$player.c$132$3_0$257	= .
	.globl	C$player.c$132$3_0$257
;src/player.c:132: prev_depth = depth;
	ld	a, (#_depth)
	ld	(#_prev_depth),a
	C$player.c$133$3_0$257	= .
	.globl	C$player.c$133$3_0$257
;src/player.c:133: width_pixel.h = 16 + ((width - width_offset) * 16);
	ld	a, (#_width)
	ld	hl, #_width_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x10
	ld	(#(_width_pixel + 1)),a
	C$player.c$134$3_0$257	= .
	.globl	C$player.c$134$3_0$257
;src/player.c:134: depth_pixel.h = 16 + 8 + (depth - depth_offset) * 16;
	ld	a, (#_depth)
	ld	hl, #_depth_offset
	sub	a, (hl)
	swap	a
	and	a, #0xf0
	add	a, #0x18
	ld	(bc), a
	C$player.c$135$3_0$257	= .
	.globl	C$player.c$135$3_0$257
;src/player.c:135: scroll_x.h = width_offset * 16;
	ld	a, (#_width_offset)
	swap	a
	and	a, #0xf0
	ld	(#(_scroll_x + 1)),a
	C$player.c$136$3_0$257	= .
	.globl	C$player.c$136$3_0$257
;src/player.c:136: scroll_y.h = depth_offset * 16;
	ld	a, (#_depth_offset)
	swap	a
	and	a, #0xf0
	ld	(#(_scroll_y + 1)),a
	C$player.c$139$3_0$257	= .
	.globl	C$player.c$139$3_0$257
;src/player.c:139: is_drilling = FALSE;
	ld	hl, #_is_drilling
	ld	(hl), #0x00
	C$player.c$141$3_0$257	= .
	.globl	C$player.c$141$3_0$257
;src/player.c:141: if (level_array[depth][width] != 0){
	ld	bc, #_level_array+0
	ld	hl, #_depth
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_width
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00104$
	C$player.c$142$4_0$258	= .
	.globl	C$player.c$142$4_0$258
;src/player.c:142: tile_mined = TRUE;
	ld	hl, #_tile_mined
	ld	(hl), #0x01
00104$:
	C$player.c$145$3_0$257	= .
	.globl	C$player.c$145$3_0$257
;src/player.c:145: draw_metasprite(direction_now);
	ld	a, (#_direction_now)
	call	_draw_metasprite
;src/player.c:147: move_bkg(scroll_x.h, scroll_y.h);
	ld	a, (#(_scroll_y + 1) + 0)
	ld	hl, #(_scroll_x + 1)
	push	af
	ld	a, (hl)
	ldh	(_SCX_REG + 0), a
	pop	af
;/usr/local/opt/gbdk/include/gb/gb.h:1378: SCX_REG=x, SCY_REG=y;
	ldh	(_SCY_REG + 0), a
	C$player.c$147$1_0$254	= .
	.globl	C$player.c$147$1_0$254
;src/player.c:147: move_bkg(scroll_x.h, scroll_y.h);
	C$player.c$151$1_0$254	= .
	.globl	C$player.c$151$1_0$254
;src/player.c:151: }
	C$player.c$151$1_0$254	= .
	.globl	C$player.c$151$1_0$254
	XG$update_movement$0$0	= .
	.globl	XG$update_movement$0$0
	ret
	G$calculate_frames$0$0	= .
	.globl	G$calculate_frames$0$0
	C$player.c$153$1_0$266	= .
	.globl	C$player.c$153$1_0$266
;src/player.c:153: uint8_t calculate_frames(void){
;	---------------------------------
; Function calculate_frames
; ---------------------------------
_calculate_frames::
	C$player.c$155$1_0$266	= .
	.globl	C$player.c$155$1_0$266
;src/player.c:155: frames = base_drilltime + (materials[next_tile].ore_resistance / player.drill.max_value);
	ld	hl, #_next_tile
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_materials
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	hl, #(_player + 132)
	ld	a,	(hl+)
	ld	b, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, c
	ld	d, #0x00
	ld	c, l
	call	__divsint
	ld	a, (#_base_drilltime)
	add	a, c
	C$player.c$156$1_0$266	= .
	.globl	C$player.c$156$1_0$266
;src/player.c:156: return frames;
	C$player.c$157$1_0$266	= .
	.globl	C$player.c$157$1_0$266
;src/player.c:157: }
	C$player.c$157$1_0$266	= .
	.globl	C$player.c$157$1_0$266
	XG$calculate_frames$0$0	= .
	.globl	XG$calculate_frames$0$0
	ret
	G$calculate_speed$0$0	= .
	.globl	G$calculate_speed$0$0
	C$player.c$159$1_0$268	= .
	.globl	C$player.c$159$1_0$268
;src/player.c:159: fixed calculate_speed(uint8_t frames){
;	---------------------------------
; Function calculate_speed
; ---------------------------------
_calculate_speed::
	dec	sp
	dec	sp
	ld	c, a
	C$player.c$161$1_0$268	= .
	.globl	C$player.c$161$1_0$268
;src/player.c:161: speed.w = 4096 / frames;
	ld	b, #0x00
	ld	de, #0x1000
	call	__divsint
	pop	hl
	push	bc
	C$player.c$162$1_0$268	= .
	.globl	C$player.c$162$1_0$268
;src/player.c:162: return speed;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$player.c$163$1_0$268	= .
	.globl	C$player.c$163$1_0$268
;src/player.c:163: }
	inc	sp
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
	G$move_left$0$0	= .
	.globl	G$move_left$0$0
	C$player.c$165$1_0$270	= .
	.globl	C$player.c$165$1_0$270
;src/player.c:165: void move_left(uint8_t frames){
;	---------------------------------
; Function move_left
; ---------------------------------
_move_left::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
	C$player.c$166$1_0$270	= .
	.globl	C$player.c$166$1_0$270
;src/player.c:166: player.speed = calculate_speed(frames);
	ld	a, (hl)
	ldhl	sp,	#0
	push	hl
	call	_calculate_speed
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	de, #(_player + 344)
	call	___memcpy
	C$player.c$167$1_0$270	= .
	.globl	C$player.c$167$1_0$270
;src/player.c:167: if (width - width_offset == THRESHOLD && width > THRESHOLD) {
	ld	a, (#_width)
	ld	c, #0x00
	ld	hl, #_width_offset
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, d
	ld	b, a
	C$player.c$169$1_0$270	= .
	.globl	C$player.c$169$1_0$270
;src/player.c:169: width--;
	ld	hl, #_width
	ld	c, (hl)
	dec	c
	C$player.c$167$1_0$270	= .
	.globl	C$player.c$167$1_0$270
;src/player.c:167: if (width - width_offset == THRESHOLD && width > THRESHOLD) {
	ld	a, e
	sub	a, #0x02
	or	a, b
	jr	NZ, 00105$
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00105$
	C$player.c$168$2_0$271	= .
	.globl	C$player.c$168$2_0$271
;src/player.c:168: width_offset--;
	ld	hl, #_width_offset
	dec	(hl)
	C$player.c$169$2_0$271	= .
	.globl	C$player.c$169$2_0$271
;src/player.c:169: width--;
	ld	hl, #_width
	ld	(hl), c
	C$player.c$170$2_0$271	= .
	.globl	C$player.c$170$2_0$271
;src/player.c:170: scroll_x_per_frame.w = - player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #_scroll_x_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00105$:
	C$player.c$171$1_0$270	= .
	.globl	C$player.c$171$1_0$270
;src/player.c:171: } else if (width > 0) {
	ld	hl, #_width
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
	C$player.c$172$2_0$272	= .
	.globl	C$player.c$172$2_0$272
;src/player.c:172: width--;
	ld	(hl), c
	C$player.c$173$2_0$272	= .
	.globl	C$player.c$173$2_0$272
;src/player.c:173: move_x_per_frame.w = - player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #_move_x_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$174$1_0$270	= .
	.globl	C$player.c$174$1_0$270
;src/player.c:174: } else return;
	jr	00106$
00106$:
	C$player.c$175$1_0$270	= .
	.globl	C$player.c$175$1_0$270
;src/player.c:175: animation_frames_left = frames;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_animation_frames_left),a
00108$:
	C$player.c$176$1_0$270	= .
	.globl	C$player.c$176$1_0$270
;src/player.c:176: }
	add	sp, #3
	C$player.c$176$1_0$270	= .
	.globl	C$player.c$176$1_0$270
	XG$move_left$0$0	= .
	.globl	XG$move_left$0$0
	ret
	G$move_right$0$0	= .
	.globl	G$move_right$0$0
	C$player.c$178$1_0$274	= .
	.globl	C$player.c$178$1_0$274
;src/player.c:178: void move_right(uint8_t frames){
;	---------------------------------
; Function move_right
; ---------------------------------
_move_right::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
	C$player.c$179$1_0$274	= .
	.globl	C$player.c$179$1_0$274
;src/player.c:179: player.speed = calculate_speed(frames);
	ld	a, (hl)
	ldhl	sp,	#0
	push	hl
	call	_calculate_speed
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	de, #(_player + 344)
	call	___memcpy
	C$player.c$180$1_0$274	= .
	.globl	C$player.c$180$1_0$274
;src/player.c:180: if (width - width_offset == (8 - THRESHOLD) + 1 && width < (8 - THRESHOLD) + 7) {
	ld	a, (#_width)
	ld	c, #0x00
	ld	hl, #_width_offset
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, d
	ld	b, a
	C$player.c$182$1_0$274	= .
	.globl	C$player.c$182$1_0$274
;src/player.c:182: width++;
	ld	hl, #_width
	ld	c, (hl)
	inc	c
	C$player.c$180$1_0$274	= .
	.globl	C$player.c$180$1_0$274
;src/player.c:180: if (width - width_offset == (8 - THRESHOLD) + 1 && width < (8 - THRESHOLD) + 7) {
	ld	a, e
	sub	a, #0x07
	or	a, b
	jr	NZ, 00105$
	ld	a, (hl)
	sub	a, #0x0d
	jr	NC, 00105$
	C$player.c$181$2_0$275	= .
	.globl	C$player.c$181$2_0$275
;src/player.c:181: width_offset++;
	ld	hl, #_width_offset
	inc	(hl)
	C$player.c$182$2_0$275	= .
	.globl	C$player.c$182$2_0$275
;src/player.c:182: width++;
	ld	hl, #_width
	ld	(hl), c
	C$player.c$183$2_0$275	= .
	.globl	C$player.c$183$2_0$275
;src/player.c:183: scroll_x_per_frame.w = player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_x_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00105$:
	C$player.c$184$1_0$274	= .
	.globl	C$player.c$184$1_0$274
;src/player.c:184: } else if (width < 15) {
	ld	hl, #_width
	ld	a, (hl)
	sub	a, #0x0f
	jr	NC, 00108$
	C$player.c$185$2_0$276	= .
	.globl	C$player.c$185$2_0$276
;src/player.c:185: width++;
	ld	(hl), c
	C$player.c$186$2_0$276	= .
	.globl	C$player.c$186$2_0$276
;src/player.c:186: move_x_per_frame.w = player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_move_x_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$187$1_0$274	= .
	.globl	C$player.c$187$1_0$274
;src/player.c:187: } else return;
	jr	00106$
00106$:
	C$player.c$188$1_0$274	= .
	.globl	C$player.c$188$1_0$274
;src/player.c:188: animation_frames_left = frames;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_animation_frames_left),a
00108$:
	C$player.c$189$1_0$274	= .
	.globl	C$player.c$189$1_0$274
;src/player.c:189: }
	add	sp, #3
	C$player.c$189$1_0$274	= .
	.globl	C$player.c$189$1_0$274
	XG$move_right$0$0	= .
	.globl	XG$move_right$0$0
	ret
	G$move_up$0$0	= .
	.globl	G$move_up$0$0
	C$player.c$191$1_0$278	= .
	.globl	C$player.c$191$1_0$278
;src/player.c:191: void move_up(uint8_t frames){
;	---------------------------------
; Function move_up
; ---------------------------------
_move_up::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
	C$player.c$192$1_0$278	= .
	.globl	C$player.c$192$1_0$278
;src/player.c:192: player.speed = calculate_speed(frames);
	ld	a, (hl)
	ldhl	sp,	#0
	push	hl
	call	_calculate_speed
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	de, #(_player + 344)
	call	___memcpy
	C$player.c$193$1_0$278	= .
	.globl	C$player.c$193$1_0$278
;src/player.c:193: if (depth - depth_offset == THRESHOLD && depth > THRESHOLD) {
	ld	a, (#_depth)
	ld	c, #0x00
	ld	hl, #_depth_offset
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, d
	ld	b, a
	C$player.c$195$1_0$278	= .
	.globl	C$player.c$195$1_0$278
;src/player.c:195: depth--;
	ld	hl, #_depth
	ld	c, (hl)
	dec	c
	C$player.c$193$1_0$278	= .
	.globl	C$player.c$193$1_0$278
;src/player.c:193: if (depth - depth_offset == THRESHOLD && depth > THRESHOLD) {
	ld	a, e
	sub	a, #0x02
	or	a, b
	jr	NZ, 00105$
	ld	a, #0x02
	sub	a, (hl)
	jr	NC, 00105$
	C$player.c$194$2_0$279	= .
	.globl	C$player.c$194$2_0$279
;src/player.c:194: depth_offset--;
	ld	hl, #_depth_offset
	dec	(hl)
	C$player.c$195$2_0$279	= .
	.globl	C$player.c$195$2_0$279
;src/player.c:195: depth--;
	ld	hl, #_depth
	ld	(hl), c
	C$player.c$196$2_0$279	= .
	.globl	C$player.c$196$2_0$279
;src/player.c:196: scroll_y_per_frame.w = - player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #_scroll_y_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00105$:
	C$player.c$197$1_0$278	= .
	.globl	C$player.c$197$1_0$278
;src/player.c:197: } else if (depth > 1) {
	ld	a, #0x01
	ld	hl, #_depth
	sub	a, (hl)
	jr	NC, 00108$
	C$player.c$198$2_0$280	= .
	.globl	C$player.c$198$2_0$280
;src/player.c:198: depth--;
	ld	(hl), c
	C$player.c$199$2_0$280	= .
	.globl	C$player.c$199$2_0$280
;src/player.c:199: move_y_per_frame.w = - player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	hl, #_move_y_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$200$1_0$278	= .
	.globl	C$player.c$200$1_0$278
;src/player.c:200: } else return;
	jr	00106$
00106$:
	C$player.c$201$1_0$278	= .
	.globl	C$player.c$201$1_0$278
;src/player.c:201: animation_frames_left = frames;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_animation_frames_left),a
00108$:
	C$player.c$202$1_0$278	= .
	.globl	C$player.c$202$1_0$278
;src/player.c:202: }
	add	sp, #3
	C$player.c$202$1_0$278	= .
	.globl	C$player.c$202$1_0$278
	XG$move_up$0$0	= .
	.globl	XG$move_up$0$0
	ret
	G$move_down$0$0	= .
	.globl	G$move_down$0$0
	C$player.c$204$1_0$282	= .
	.globl	C$player.c$204$1_0$282
;src/player.c:204: void move_down(uint8_t frames){
;	---------------------------------
; Function move_down
; ---------------------------------
_move_down::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
	C$player.c$205$1_0$282	= .
	.globl	C$player.c$205$1_0$282
;src/player.c:205: player.speed = calculate_speed(frames);
	ld	a, (hl)
	ldhl	sp,	#0
	push	hl
	call	_calculate_speed
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	de, #0x0002
	push	de
	ld	de, #(_player + 344)
	call	___memcpy
	C$player.c$206$1_0$282	= .
	.globl	C$player.c$206$1_0$282
;src/player.c:206: if (depth - depth_offset == (8 - THRESHOLD - BOTTOM) && depth < ROWS - THRESHOLD - BOTTOM - 1) {
	ld	a, (#_depth)
	ld	c, #0x00
	ld	hl, #_depth_offset
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, d
	ld	b, a
	C$player.c$208$1_0$282	= .
	.globl	C$player.c$208$1_0$282
;src/player.c:208: depth++;
	ld	hl, #_depth
	ld	c, (hl)
	inc	c
	C$player.c$206$1_0$282	= .
	.globl	C$player.c$206$1_0$282
;src/player.c:206: if (depth - depth_offset == (8 - THRESHOLD - BOTTOM) && depth < ROWS - THRESHOLD - BOTTOM - 1) {
	ld	a, e
	sub	a, #0x06
	or	a, b
	jr	NZ, 00105$
	ld	a, (hl)
	sub	a, #0x5d
	jr	NC, 00105$
	C$player.c$207$2_0$283	= .
	.globl	C$player.c$207$2_0$283
;src/player.c:207: depth_offset++;
	ld	hl, #_depth_offset
	inc	(hl)
	C$player.c$208$2_0$283	= .
	.globl	C$player.c$208$2_0$283
;src/player.c:208: depth++;
	ld	hl, #_depth
	ld	(hl), c
	C$player.c$209$2_0$283	= .
	.globl	C$player.c$209$2_0$283
;src/player.c:209: scroll_y_per_frame.w = player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_y_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	jr	00106$
00105$:
	C$player.c$210$1_0$282	= .
	.globl	C$player.c$210$1_0$282
;src/player.c:210: } else if (depth < ROWS - 1) {
	ld	hl, #_depth
	ld	a, (hl)
	sub	a, #0x5f
	jr	NC, 00108$
	C$player.c$211$2_0$284	= .
	.globl	C$player.c$211$2_0$284
;src/player.c:211: depth++;
	ld	(hl), c
	C$player.c$212$2_0$284	= .
	.globl	C$player.c$212$2_0$284
;src/player.c:212: move_y_per_frame.w = player.speed.w;
	ld	hl, #(_player + 344)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_move_y_per_frame
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$213$1_0$282	= .
	.globl	C$player.c$213$1_0$282
;src/player.c:213: } else return;
	jr	00106$
00106$:
	C$player.c$214$1_0$282	= .
	.globl	C$player.c$214$1_0$282
;src/player.c:214: animation_frames_left = frames;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_animation_frames_left),a
00108$:
	C$player.c$215$1_0$282	= .
	.globl	C$player.c$215$1_0$282
;src/player.c:215: }
	add	sp, #3
	C$player.c$215$1_0$282	= .
	.globl	C$player.c$215$1_0$282
	XG$move_down$0$0	= .
	.globl	XG$move_down$0$0
	ret
	G$move$0$0	= .
	.globl	G$move$0$0
	C$player.c$217$1_0$286	= .
	.globl	C$player.c$217$1_0$286
;src/player.c:217: void move(char direction, char mode){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	add	sp, #-5
	ld	c, a
	ldhl	sp,	#4
	ld	(hl), e
	C$player.c$218$1_0$286	= .
	.globl	C$player.c$218$1_0$286
;src/player.c:218: direction_now = direction;
	ld	hl, #_direction_now
	C$player.c$219$1_0$286	= .
	.globl	C$player.c$219$1_0$286
;src/player.c:219: if (direction == LEFT || direction == RIGHT) direction_prev = direction;
	ld	a,c
	ld	(hl),a
	dec	a
	ld	a, #0x01
	jr	Z, 00290$
	xor	a, a
00290$:
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, c
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00292$
	xor	a, a
00292$:
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, (hl)
	or	a, a
	jr	NZ, 00101$
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
00101$:
	ld	hl, #_direction_prev
	ld	(hl), c
00102$:
	C$player.c$221$2_0$287	= .
	.globl	C$player.c$221$2_0$287
;src/player.c:221: uint8_t frames = 0;
	ldhl	sp,	#2
	ld	(hl), #0x00
	C$player.c$222$1_1$287	= .
	.globl	C$player.c$222$1_1$287
;src/player.c:222: if (animation_frames_left == 0){
	ld	a, (#_animation_frames_left)
	or	a, a
	jp	NZ, 00147$
	C$player.c$228$1_1$286	= .
	.globl	C$player.c$228$1_1$286
;src/player.c:228: if (direction == UP) next_tile = next_tile_up;
	ld	a, c
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00294$
	xor	a, a
00294$:
	ld	e, a
	C$player.c$229$1_1$286	= .
	.globl	C$player.c$229$1_1$286
;src/player.c:229: if (direction == DOWN) next_tile = next_tile_down;
	ld	a, c
	sub	a, #0x04
	ld	a, #0x01
	jr	Z, 00296$
	xor	a, a
00296$:
	ldhl	sp,	#3
	C$player.c$223$2_1$288	= .
	.globl	C$player.c$223$2_1$288
;src/player.c:223: if (mode == DRILL) {
	ld	(hl+), a
	ld	a, (hl)
	dec	a
	jr	NZ, 00135$
	C$player.c$224$3_1$289	= .
	.globl	C$player.c$224$3_1$289
;src/player.c:224: is_drilling = TRUE;
	ld	hl, #_is_drilling
	ld	(hl), #0x01
	C$player.c$225$3_1$289	= .
	.globl	C$player.c$225$3_1$289
;src/player.c:225: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	C$player.c$226$3_1$289	= .
	.globl	C$player.c$226$3_1$289
;src/player.c:226: if (direction == LEFT) next_tile = next_tile_left;
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	a, (#_next_tile_left)
	ld	(#_next_tile),a
00105$:
	C$player.c$227$3_1$289	= .
	.globl	C$player.c$227$3_1$289
;src/player.c:227: if (direction == RIGHT) next_tile = next_tile_right;
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
	ld	a, (#_next_tile_right)
	ld	(#_next_tile),a
00107$:
	C$player.c$228$3_1$289	= .
	.globl	C$player.c$228$3_1$289
;src/player.c:228: if (direction == UP) next_tile = next_tile_up;
	ld	a, e
	or	a, a
	jr	Z, 00109$
	ld	a, (#_next_tile_up)
	ld	(#_next_tile),a
00109$:
	C$player.c$229$3_1$289	= .
	.globl	C$player.c$229$3_1$289
;src/player.c:229: if (direction == DOWN) next_tile = next_tile_down;
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00111$
	ld	a, (#_next_tile_down)
	ld	(#_next_tile),a
00111$:
	C$player.c$230$3_1$289	= .
	.globl	C$player.c$230$3_1$289
;src/player.c:230: frames = calculate_frames();
	push	bc
	call	_calculate_frames
	ldhl	sp,	#4
	ld	(hl), a
	pop	bc
	jp	00136$
00135$:
	C$player.c$231$2_1$288	= .
	.globl	C$player.c$231$2_1$288
;src/player.c:231: } else if (mode == DRIVE) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00132$
	C$player.c$232$3_1$290	= .
	.globl	C$player.c$232$3_1$290
;src/player.c:232: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	C$player.c$233$3_1$290	= .
	.globl	C$player.c$233$3_1$290
;src/player.c:233: frames = 16;
	ldhl	sp,	#2
	ld	(hl), #0x10
	jp	00136$
00132$:
	C$player.c$234$2_1$288	= .
	.globl	C$player.c$234$2_1$288
;src/player.c:234: } else if (mode == ACCELERATE) {
	ldhl	sp,	#4
	ld	a, (hl)
	sub	a, #0x03
	jp	NZ,00136$
	C$player.c$235$3_1$291	= .
	.globl	C$player.c$235$3_1$291
;src/player.c:235: if (next_tile_up != EMPTY) velocity = 0;
	ld	a, (#_next_tile_up)
	or	a, a
	jr	Z, 00113$
	ld	hl, #_velocity
	ld	(hl), #0x00
00113$:
	C$player.c$236$3_1$291	= .
	.globl	C$player.c$236$3_1$291
;src/player.c:236: if (direction == DOWN) {
	ldhl	sp,	#3
	ld	a, (hl)
	or	a, a
	jr	Z, 00123$
	C$player.c$239$1_1$286	= .
	.globl	C$player.c$239$1_1$286
;src/player.c:239: velocity++;
	ld	hl, #_velocity
	ld	b, (hl)
	inc	b
	C$player.c$237$4_1$292	= .
	.globl	C$player.c$237$4_1$292
;src/player.c:237: if (velocity < 0) {
	bit	7, (hl)
	jr	Z, 00115$
	C$player.c$238$5_1$293	= .
	.globl	C$player.c$238$5_1$293
;src/player.c:238: direction = UP;
	ld	c, #0x03
	C$player.c$239$5_1$293	= .
	.globl	C$player.c$239$5_1$293
;src/player.c:239: velocity++;
	ld	(hl), b
	C$player.c$240$5_1$293	= .
	.globl	C$player.c$240$5_1$293
;src/player.c:240: velocity++;
	inc	(hl)
	jr	00124$
00115$:
	C$player.c$242$5_1$294	= .
	.globl	C$player.c$242$5_1$294
;src/player.c:242: velocity++;
	ld	hl, #_velocity
	ld	(hl), b
	jr	00124$
00123$:
	C$player.c$244$3_1$291	= .
	.globl	C$player.c$244$3_1$291
;src/player.c:244: } else if (direction == UP) {
	ld	a, e
	or	a, a
	jr	Z, 00124$
	C$player.c$247$1_1$286	= .
	.globl	C$player.c$247$1_1$286
;src/player.c:247: velocity--;
	ld	hl, #_velocity
	ld	b, (hl)
	dec	b
	C$player.c$245$4_1$295	= .
	.globl	C$player.c$245$4_1$295
;src/player.c:245: if (velocity > 0) {
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00303$
	bit	7, d
	jr	NZ, 00304$
	cp	a, a
	jr	00304$
00303$:
	bit	7, d
	jr	Z, 00304$
	scf
00304$:
	jr	NC, 00118$
	C$player.c$246$5_1$296	= .
	.globl	C$player.c$246$5_1$296
;src/player.c:246: direction = DOWN;
	ld	c, #0x04
	C$player.c$247$5_1$296	= .
	.globl	C$player.c$247$5_1$296
;src/player.c:247: velocity--;
	ld	hl, #_velocity
	ld	(hl), b
	C$player.c$248$5_1$296	= .
	.globl	C$player.c$248$5_1$296
;src/player.c:248: velocity--;
	dec	(hl)
	jr	00124$
00118$:
	C$player.c$250$5_1$297	= .
	.globl	C$player.c$250$5_1$297
;src/player.c:250: velocity--;
	ld	hl, #_velocity
	ld	(hl), b
00124$:
	C$player.c$253$3_1$291	= .
	.globl	C$player.c$253$3_1$291
;src/player.c:253: if (velocity >= 12) velocity = 12;
	ld	hl, #_velocity
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8c
	jr	C, 00126$
	ld	(hl), #0x0c
00126$:
	C$player.c$254$3_1$291	= .
	.globl	C$player.c$254$3_1$291
;src/player.c:254: if (velocity <= -6) velocity = -6;
	ld	hl, #_velocity
	ld	e, (hl)
	ld	a,#0xfa
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00305$
	bit	7, d
	jr	NZ, 00306$
	cp	a, a
	jr	00306$
00305$:
	bit	7, d
	jr	Z, 00306$
	scf
00306$:
	jr	C, 00128$
	ld	hl, #_velocity
	ld	(hl), #0xfa
00128$:
	C$player.c$255$3_1$291	= .
	.globl	C$player.c$255$3_1$291
;src/player.c:255: frames = 16 - abs(velocity);
	ld	a, (#_velocity)
	ld	e, a
	rlca
	sbc	a, a
	push	bc
	ld	d, a
	push	de
	call	_abs
	pop	hl
	pop	bc
	ld	a, #0x10
	sub	a, e
	ldhl	sp,	#2
	ld	(hl), a
00136$:
	C$player.c$258$2_1$288	= .
	.globl	C$player.c$258$2_1$288
;src/player.c:258: if (direction == LEFT) move_left(frames);
	ld	a, c
	dec	a
	jr	NZ, 00138$
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	call	_move_left
	pop	bc
00138$:
	C$player.c$259$2_1$288	= .
	.globl	C$player.c$259$2_1$288
;src/player.c:259: if (direction == RIGHT) move_right(frames);
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00140$
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	call	_move_right
	pop	bc
00140$:
	C$player.c$260$2_1$288	= .
	.globl	C$player.c$260$2_1$288
;src/player.c:260: if (direction == UP) move_up(frames);
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00142$
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	call	_move_up
	pop	bc
00142$:
	C$player.c$261$2_1$288	= .
	.globl	C$player.c$261$2_1$288
;src/player.c:261: if (direction == DOWN) move_down(frames);
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00147$
	ldhl	sp,	#2
	ld	a, (hl)
	call	_move_down
00147$:
	C$player.c$263$1_1$286	= .
	.globl	C$player.c$263$1_1$286
;src/player.c:263: }
	add	sp, #5
	C$player.c$263$1_1$286	= .
	.globl	C$player.c$263$1_1$286
	XG$move$0$0	= .
	.globl	XG$move$0$0
	ret
	G$initiate_movement$0$0	= .
	.globl	G$initiate_movement$0$0
	C$player.c$265$1_1$299	= .
	.globl	C$player.c$265$1_1$299
;src/player.c:265: void initiate_movement(void) {
;	---------------------------------
; Function initiate_movement
; ---------------------------------
_initiate_movement::
	C$player.c$266$1_0$299	= .
	.globl	C$player.c$266$1_0$299
;src/player.c:266: if (buttons & J_LEFT) {
	ld	a, (#_buttons)
	bit	1, a
	jr	Z, 00110$
	C$player.c$267$2_0$300	= .
	.globl	C$player.c$267$2_0$300
;src/player.c:267: if (next_tile_left != EMPTY && next_tile_left != STONE && next_tile_down != EMPTY) {
	ld	hl, #_next_tile_left
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00105$
	ld	a, (#_next_tile_down)
	or	a, a
	jr	Z, 00105$
	C$player.c$268$3_0$301	= .
	.globl	C$player.c$268$3_0$301
;src/player.c:268: move(LEFT, DRILL);
	ld	a,#0x01
	ld	e,a
	call	_move
	jr	00110$
00105$:
	C$player.c$269$2_0$300	= .
	.globl	C$player.c$269$2_0$300
;src/player.c:269: } else if (next_tile_left == EMPTY) {
	ld	a, (#_next_tile_left)
	or	a, a
	jr	NZ, 00102$
	C$player.c$270$3_0$302	= .
	.globl	C$player.c$270$3_0$302
;src/player.c:270: move(LEFT, DRIVE);
	ld	e, #0x02
	ld	a, #0x01
	call	_move
	jr	00110$
00102$:
	C$player.c$271$2_0$300	= .
	.globl	C$player.c$271$2_0$300
;src/player.c:271: } else direction_prev = LEFT;
	ld	hl, #_direction_prev
	ld	(hl), #0x01
00110$:
	C$player.c$273$1_0$299	= .
	.globl	C$player.c$273$1_0$299
;src/player.c:273: if (buttons & J_RIGHT) { 
	ld	a, (#_buttons)
	rrca
	jr	NC, 00120$
	C$player.c$274$2_0$303	= .
	.globl	C$player.c$274$2_0$303
;src/player.c:274: if (next_tile_right != EMPTY && next_tile_right != STONE && next_tile_down != EMPTY) {
	ld	hl, #_next_tile_right
	ld	a, (hl)
	or	a, a
	jr	Z, 00115$
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00115$
	ld	a, (#_next_tile_down)
	or	a, a
	jr	Z, 00115$
	C$player.c$275$3_0$304	= .
	.globl	C$player.c$275$3_0$304
;src/player.c:275: move(RIGHT, DRILL);
	ld	e, #0x01
	ld	a, #0x02
	call	_move
	jr	00120$
00115$:
	C$player.c$276$2_0$303	= .
	.globl	C$player.c$276$2_0$303
;src/player.c:276: } else if (next_tile_right == EMPTY) {
	ld	a, (#_next_tile_right)
	or	a, a
	jr	NZ, 00112$
	C$player.c$277$3_0$305	= .
	.globl	C$player.c$277$3_0$305
;src/player.c:277: move(RIGHT, DRIVE);
	ld	a,#0x02
	ld	e,a
	call	_move
	jr	00120$
00112$:
	C$player.c$278$2_0$303	= .
	.globl	C$player.c$278$2_0$303
;src/player.c:278: } else direction_prev = RIGHT;
	ld	hl, #_direction_prev
	ld	(hl), #0x02
00120$:
	C$player.c$280$1_0$299	= .
	.globl	C$player.c$280$1_0$299
;src/player.c:280: if (buttons & J_DOWN) { 
	ld	a, (#_buttons)
	bit	3, a
	jr	Z, 00125$
	C$player.c$281$2_0$306	= .
	.globl	C$player.c$281$2_0$306
;src/player.c:281: if (next_tile_down != EMPTY && next_tile_down != STONE){
	ld	hl, #_next_tile_down
	ld	a, (hl)
	or	a, a
	jr	Z, 00125$
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00125$
	C$player.c$282$3_0$307	= .
	.globl	C$player.c$282$3_0$307
;src/player.c:282: move(DOWN, DRILL);
	ld	e, #0x01
	ld	a, #0x04
	call	_move
00125$:
	C$player.c$285$1_0$299	= .
	.globl	C$player.c$285$1_0$299
;src/player.c:285: if (next_tile_up == EMPTY && (buttons & J_UP )) {
	ld	a, (#_next_tile_up)
	or	a, a
	jr	NZ, 00127$
	ld	a, (#_buttons)
	bit	2, a
	jr	Z, 00127$
	C$player.c$286$2_0$308	= .
	.globl	C$player.c$286$2_0$308
;src/player.c:286: move(UP, ACCELERATE);
	ld	a,#0x03
	ld	e,a
	call	_move
00127$:
	C$player.c$288$1_0$299	= .
	.globl	C$player.c$288$1_0$299
;src/player.c:288: if (next_tile_down == EMPTY && !(buttons & J_UP)) {
	ld	a, (#_next_tile_down)
	or	a, a
	ret	NZ
	ld	hl, #_buttons
	ld	a, (hl)
	bit	2, a
	ret	NZ
	C$player.c$289$2_0$309	= .
	.globl	C$player.c$289$2_0$309
;src/player.c:289: move(DOWN, ACCELERATE);
	ld	e, #0x03
	ld	a, #0x04
	C$player.c$291$1_0$299	= .
	.globl	C$player.c$291$1_0$299
;src/player.c:291: }
	C$player.c$291$1_0$299	= .
	.globl	C$player.c$291$1_0$299
	XG$initiate_movement$0$0	= .
	.globl	XG$initiate_movement$0$0
	jp	_move
	G$calculate_falldamage$0$0	= .
	.globl	G$calculate_falldamage$0$0
	C$player.c$293$1_0$311	= .
	.globl	C$player.c$293$1_0$311
;src/player.c:293: void calculate_falldamage(void){
;	---------------------------------
; Function calculate_falldamage
; ---------------------------------
_calculate_falldamage::
	C$player.c$294$1_0$311	= .
	.globl	C$player.c$294$1_0$311
;src/player.c:294: if (next_tile_down != EMPTY && velocity > 4) {
	ld	hl, #_velocity
	ld	e, (hl)
	ld	a,#0x04
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00146$
	bit	7, d
	jr	NZ, 00147$
	cp	a, a
	jr	00147$
00146$:
	bit	7, d
	jr	Z, 00147$
	scf
00147$:
	ld	a, #0x00
	rla
	ld	c, a
	ld	a, (#_next_tile_down)
	or	a, a
	jr	Z, 00106$
	ld	a, c
	or	a, a
	jr	Z, 00106$
	C$player.c$295$2_0$312	= .
	.globl	C$player.c$295$2_0$312
;src/player.c:295: player.hull.current_value -= velocity;
	ld	hl, #(_player + 73)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_velocity)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	hl, #(_player + 73)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$296$2_0$312	= .
	.globl	C$player.c$296$2_0$312
;src/player.c:296: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	ret
00106$:
	C$player.c$297$1_0$311	= .
	.globl	C$player.c$297$1_0$311
;src/player.c:297: } else if (next_tile_down != EMPTY && velocity <= 4 && velocity > 0){
	ld	a, (#_next_tile_down)
	or	a, a
	ret	Z
	bit	0, c
	ret	NZ
	ld	hl, #_velocity
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00148$
	bit	7, d
	jr	NZ, 00149$
	cp	a, a
	jr	00149$
00148$:
	bit	7, d
	jr	Z, 00149$
	scf
00149$:
	ret	NC
	C$player.c$298$2_0$313	= .
	.globl	C$player.c$298$2_0$313
;src/player.c:298: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	C$player.c$300$1_0$311	= .
	.globl	C$player.c$300$1_0$311
;src/player.c:300: }
	C$player.c$300$1_0$311	= .
	.globl	C$player.c$300$1_0$311
	XG$calculate_falldamage$0$0	= .
	.globl	XG$calculate_falldamage$0$0
	ret
	G$check_hull$0$0	= .
	.globl	G$check_hull$0$0
	C$player.c$302$1_0$315	= .
	.globl	C$player.c$302$1_0$315
;src/player.c:302: void check_hull(void){
;	---------------------------------
; Function check_hull
; ---------------------------------
_check_hull::
	C$player.c$303$1_0$315	= .
	.globl	C$player.c$303$1_0$315
;src/player.c:303: if (player.hull.current_value <= 0 && animation_frames_left == 0) {
	ld	hl, #(_player + 73)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00120$
	bit	7, d
	jr	NZ, 00121$
	cp	a, a
	jr	00121$
00120$:
	bit	7, d
	jr	Z, 00121$
	scf
00121$:
	ret	C
	ld	a, (#_animation_frames_left)
	or	a, a
	ret	NZ
	C$player.c$304$2_0$316	= .
	.globl	C$player.c$304$2_0$316
;src/player.c:304: player_alive = FALSE;
	ld	hl, #_player_alive
	ld	(hl), #0x00
	C$player.c$305$2_0$316	= .
	.globl	C$player.c$305$2_0$316
;src/player.c:305: player.hull.current_value = 0;
	ld	hl, #(_player + 73)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$307$1_0$315	= .
	.globl	C$player.c$307$1_0$315
;src/player.c:307: }
	C$player.c$307$1_0$315	= .
	.globl	C$player.c$307$1_0$315
	XG$check_hull$0$0	= .
	.globl	XG$check_hull$0$0
	ret
	G$check_fuel$0$0	= .
	.globl	G$check_fuel$0$0
	C$player.c$309$1_0$318	= .
	.globl	C$player.c$309$1_0$318
;src/player.c:309: void check_fuel(void){
;	---------------------------------
; Function check_fuel
; ---------------------------------
_check_fuel::
	C$player.c$310$1_0$318	= .
	.globl	C$player.c$310$1_0$318
;src/player.c:310: if (player.fuel.current_value <= 0 && animation_frames_left == 0) {
	ld	hl, #(_player + 16)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	e, b
	xor	a, a
	ld	d, a
	cp	a, c
	sbc	a, b
	bit	7, e
	jr	Z, 00120$
	bit	7, d
	jr	NZ, 00121$
	cp	a, a
	jr	00121$
00120$:
	bit	7, d
	jr	Z, 00121$
	scf
00121$:
	ret	C
	ld	a, (#_animation_frames_left)
	or	a, a
	ret	NZ
	C$player.c$311$2_0$319	= .
	.globl	C$player.c$311$2_0$319
;src/player.c:311: player_alive = FALSE;
	ld	hl, #_player_alive
	ld	(hl), #0x00
	C$player.c$312$2_0$319	= .
	.globl	C$player.c$312$2_0$319
;src/player.c:312: player.fuel.current_value = 0;
	ld	hl, #(_player + 16)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$player.c$314$1_0$318	= .
	.globl	C$player.c$314$1_0$318
;src/player.c:314: }
	C$player.c$314$1_0$318	= .
	.globl	C$player.c$314$1_0$318
	XG$check_fuel$0$0	= .
	.globl	XG$check_fuel$0$0
	ret
	G$update_fuel$0$0	= .
	.globl	G$update_fuel$0$0
	C$player.c$315$1_0$321	= .
	.globl	C$player.c$315$1_0$321
;src/player.c:315: void update_fuel(void){
;	---------------------------------
; Function update_fuel
; ---------------------------------
_update_fuel::
	C$player.c$316$1_0$321	= .
	.globl	C$player.c$316$1_0$321
;src/player.c:316: if (frame_counter == 0) {
	ld	a, (#_frame_counter)
	or	a, a
	jr	NZ, 00102$
	C$player.c$317$2_0$322	= .
	.globl	C$player.c$317$2_0$322
;src/player.c:317: player.fuel.current_value --;   // only once every 60 frames
	ld	hl, #(_player + 16)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	hl, #(_player + 16)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00102$:
	C$player.c$319$1_0$321	= .
	.globl	C$player.c$319$1_0$321
;src/player.c:319: if (depth <= 5) player.fuel.current_value = player.fuel.max_value;
	ld	a, #0x05
	ld	hl, #_depth
	sub	a, (hl)
	ret	C
	ld	hl, #_player + 18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_player + 16)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$320$1_0$321	= .
	.globl	C$player.c$320$1_0$321
;src/player.c:320: }
	C$player.c$320$1_0$321	= .
	.globl	C$player.c$320$1_0$321
	XG$update_fuel$0$0	= .
	.globl	XG$update_fuel$0$0
	ret
	G$check_enter_buildings$0$0	= .
	.globl	G$check_enter_buildings$0$0
	C$player.c$322$1_0$324	= .
	.globl	C$player.c$322$1_0$324
;src/player.c:322: void check_enter_buildings(void){
;	---------------------------------
; Function check_enter_buildings
; ---------------------------------
_check_enter_buildings::
	C$player.c$324$1_0$324	= .
	.globl	C$player.c$324$1_0$324
;src/player.c:324: if (depth == STATION_SHOP_Y && width == STATION_SHOP_X && animation_frames_left == 0 && left_shop_area) {
	ld	a, (#_depth)
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00192$
	xor	a, a
00192$:
	ld	c, a
	ld	a, (#_width)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00194$
	xor	a, a
00194$:
	ld	b, a
	ld	a, c
	or	a, a
	jr	Z, 00105$
	ld	a, b
	or	a, a
	jr	Z, 00105$
	ld	a, (#_animation_frames_left)
	or	a, a
	jr	NZ, 00105$
	ld	a, (#_left_shop_area)
	or	a, a
	jr	Z, 00105$
	C$player.c$325$2_0$325	= .
	.globl	C$player.c$325$2_0$325
;src/player.c:325: currentGameState = GAME_STATE_SHOP_MENU;
	ld	hl, #_currentGameState
	ld	(hl), #0x01
	C$player.c$326$2_0$325	= .
	.globl	C$player.c$326$2_0$325
;src/player.c:326: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	C$player.c$327$2_0$325	= .
	.globl	C$player.c$327$2_0$325
;src/player.c:327: left_shop_area = FALSE;  // Player enters the shop, set flag to false
	ld	hl, #_left_shop_area
	ld	(hl), #0x00
	jr	00106$
00105$:
	C$player.c$328$1_0$324	= .
	.globl	C$player.c$328$1_0$324
;src/player.c:328: } else if (depth != STATION_SHOP_Y || width != STATION_SHOP_X) {
	ld	e, c
	bit	0, e
	jr	Z, 00101$
	bit	0, b
	jr	NZ, 00106$
00101$:
	C$player.c$329$2_0$326	= .
	.globl	C$player.c$329$2_0$326
;src/player.c:329: left_shop_area = TRUE;  // Player moves away from the shop trigger location
	ld	hl, #_left_shop_area
	ld	(hl), #0x01
00106$:
	C$player.c$333$1_0$324	= .
	.globl	C$player.c$333$1_0$324
;src/player.c:333: if (depth == STATION_SELL_Y && width == STATION_SELL_X && animation_frames_left == 0 && left_sell_area) {
	ld	a, (#_width)
	sub	a, #0x0a
	ld	a, #0x01
	jr	Z, 00196$
	xor	a, a
00196$:
	ld	b, a
	ld	a, c
	or	a, a
	jr	Z, 00114$
	ld	a, b
	or	a, a
	jr	Z, 00114$
	ld	a, (#_animation_frames_left)
	or	a, a
	jr	NZ, 00114$
	ld	a, (#_left_sell_area)
	or	a, a
	jr	Z, 00114$
	C$player.c$334$2_0$327	= .
	.globl	C$player.c$334$2_0$327
;src/player.c:334: currentGameState = GAME_STATE_SELL_MENU;
	ld	hl, #_currentGameState
	ld	(hl), #0x02
	C$player.c$335$2_0$327	= .
	.globl	C$player.c$335$2_0$327
;src/player.c:335: velocity = 0;
	ld	hl, #_velocity
	ld	(hl), #0x00
	C$player.c$336$2_0$327	= .
	.globl	C$player.c$336$2_0$327
;src/player.c:336: left_sell_area = FALSE;  // Player enters the sell station, set flag to false
	ld	hl, #_left_sell_area
	ld	(hl), #0x00
	ret
00114$:
	C$player.c$337$1_0$324	= .
	.globl	C$player.c$337$1_0$324
;src/player.c:337: } else if (depth != STATION_SELL_Y || width != STATION_SELL_X) {
	bit	0, c
	jr	Z, 00110$
	bit	0, b
	ret	NZ
00110$:
	C$player.c$338$2_0$328	= .
	.globl	C$player.c$338$2_0$328
;src/player.c:338: left_sell_area = TRUE;  // Player moves away from the sell station trigger location
	ld	hl, #_left_sell_area
	ld	(hl), #0x01
	C$player.c$340$1_0$324	= .
	.globl	C$player.c$340$1_0$324
;src/player.c:340: }
	C$player.c$340$1_0$324	= .
	.globl	C$player.c$340$1_0$324
	XG$check_enter_buildings$0$0	= .
	.globl	XG$check_enter_buildings$0$0
	ret
	G$check_game_over$0$0	= .
	.globl	G$check_game_over$0$0
	C$player.c$342$1_0$330	= .
	.globl	C$player.c$342$1_0$330
;src/player.c:342: void check_game_over(void){
;	---------------------------------
; Function check_game_over
; ---------------------------------
_check_game_over::
	C$player.c$343$1_0$330	= .
	.globl	C$player.c$343$1_0$330
;src/player.c:343: if (player_alive == FALSE) {
	ld	a, (#_player_alive)
	or	a, a
	ret	NZ
	C$player.c$344$2_0$331	= .
	.globl	C$player.c$344$2_0$331
;src/player.c:344: currentGameState = GAME_STATE_GAME_OVER;
	ld	hl, #_currentGameState
	ld	(hl), #0x04
	C$player.c$346$1_0$330	= .
	.globl	C$player.c$346$1_0$330
;src/player.c:346: }
	C$player.c$346$1_0$330	= .
	.globl	C$player.c$346$1_0$330
	XG$check_game_over$0$0	= .
	.globl	XG$check_game_over$0$0
	ret
	G$reset_player$0$0	= .
	.globl	G$reset_player$0$0
	C$player.c$348$1_0$333	= .
	.globl	C$player.c$348$1_0$333
;src/player.c:348: void reset_player(void){
;	---------------------------------
; Function reset_player
; ---------------------------------
_reset_player::
	C$player.c$349$1_0$333	= .
	.globl	C$player.c$349$1_0$333
;src/player.c:349: player_alive = TRUE; // Reset player alive status
	ld	hl, #_player_alive
	ld	(hl), #0x01
	C$player.c$350$1_0$333	= .
	.globl	C$player.c$350$1_0$333
;src/player.c:350: player.hull.current_value = player.hull.max_value;
	ld	hl, #_player + 75
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_player + 73)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$351$1_0$333	= .
	.globl	C$player.c$351$1_0$333
;src/player.c:351: player.fuel.current_value = player.fuel.max_value;
	ld	hl, #_player + 18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #(_player + 16)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$player.c$352$1_0$333	= .
	.globl	C$player.c$352$1_0$333
;src/player.c:352: }
	C$player.c$352$1_0$333	= .
	.globl	C$player.c$352$1_0$333
	XG$reset_player$0$0	= .
	.globl	XG$reset_player$0$0
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
