;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module gameloop
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _game_loop
	.globl _draw_hull
	.globl _draw_fuel
	.globl _draw_cargo
	.globl _draw_depth
	.globl _clear_4bkg_tiles
	.globl _spawn_bkg_row
	.globl _read_buttons
	.globl _calculate_cargo
	.globl _update_inventory
	.globl _check_game_over
	.globl _check_enter_buildings
	.globl _update_fuel
	.globl _check_fuel
	.globl _check_hull
	.globl _calculate_falldamage
	.globl _initiate_movement
	.globl _update_movement
	.globl _check_surroundings
	.globl _wait_vbl_done
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
	.area _CODE
;src/gameloop.c:18: void game_loop(void) {
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
;src/gameloop.c:20: read_buttons();
	call	_read_buttons
;src/gameloop.c:21: check_surroundings();
	call	_check_surroundings
;src/gameloop.c:23: if (animation_frames_left == 0) {
	ld	a, (#_animation_frames_left)
	or	a, a
	jr	NZ, 00102$
;src/gameloop.c:24: initiate_movement();
	call	_initiate_movement
00102$:
;src/gameloop.c:27: update_movement();
	call	_update_movement
;src/gameloop.c:29: if (tile_mined == TRUE) {
	ld	a, (#_tile_mined)
	dec	a
	jr	NZ, 00104$
;src/gameloop.c:30: update_inventory();
	call	_update_inventory
;src/gameloop.c:31: clear_4bkg_tiles(level_array, width, depth);
	ld	a, (#_depth)
	push	af
	inc	sp
	ld	a, (#_width)
	ld	de, #_level_array
	call	_clear_4bkg_tiles
;src/gameloop.c:32: calculate_cargo();
	call	_calculate_cargo
;src/gameloop.c:33: draw_cargo();
	call	_draw_cargo
;src/gameloop.c:34: tile_mined = FALSE;
	ld	hl, #_tile_mined
	ld	(hl), #0x00
00104$:
;src/gameloop.c:37: update_fuel();
	call	_update_fuel
;src/gameloop.c:38: draw_fuel();
	call	_draw_fuel
;src/gameloop.c:39: draw_hull();
	call	_draw_hull
;src/gameloop.c:40: calculate_falldamage();
	call	_calculate_falldamage
;src/gameloop.c:41: check_hull();
	call	_check_hull
;src/gameloop.c:42: check_fuel();
	call	_check_fuel
;src/gameloop.c:43: check_game_over();
	call	_check_game_over
;src/gameloop.c:45: if (prev_depth != depth) {
	ld	a, (#_prev_depth)
	ld	hl, #_depth
	sub	a, (hl)
	jr	Z, 00106$
;src/gameloop.c:46: spawn_bkg_row();
	call	_spawn_bkg_row
;src/gameloop.c:47: draw_depth();
	call	_draw_depth
00106$:
;src/gameloop.c:50: check_enter_buildings();
	call	_check_enter_buildings
;src/gameloop.c:53: prev_buttons = buttons;
	ld	a, (#_buttons)
	ld	(#_prev_buttons),a
;src/gameloop.c:54: prev_depth = depth;
	ld	a, (#_depth)
	ld	(#_prev_depth),a
;src/gameloop.c:55: prev_width = width;
	ld	a, (#_width)
	ld	hl, #_prev_width
	ld	(hl), a
;src/gameloop.c:57: wait_vbl_done();
;src/gameloop.c:58: }
	jp	_wait_vbl_done
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
