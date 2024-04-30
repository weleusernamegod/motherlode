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
	.globl _change_background_color
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
	G$game_loop$0$0	= .
	.globl	G$game_loop$0$0
	C$gameloop.c$18$0_0$214	= .
	.globl	C$gameloop.c$18$0_0$214
;src/gameloop.c:18: void game_loop(void) {
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
	C$gameloop.c$20$1_0$214	= .
	.globl	C$gameloop.c$20$1_0$214
;src/gameloop.c:20: read_buttons();
	call	_read_buttons
	C$gameloop.c$21$1_0$214	= .
	.globl	C$gameloop.c$21$1_0$214
;src/gameloop.c:21: check_surroundings();
	call	_check_surroundings
	C$gameloop.c$23$1_0$214	= .
	.globl	C$gameloop.c$23$1_0$214
;src/gameloop.c:23: if (animation_frames_left == 0) {
	ld	a, (#_animation_frames_left)
	or	a, a
	jr	NZ, 00102$
	C$gameloop.c$24$2_0$215	= .
	.globl	C$gameloop.c$24$2_0$215
;src/gameloop.c:24: initiate_movement();
	call	_initiate_movement
00102$:
	C$gameloop.c$27$1_0$214	= .
	.globl	C$gameloop.c$27$1_0$214
;src/gameloop.c:27: update_movement();
	call	_update_movement
	C$gameloop.c$29$1_0$214	= .
	.globl	C$gameloop.c$29$1_0$214
;src/gameloop.c:29: if (tile_mined == TRUE) {
	ld	a, (#_tile_mined)
	dec	a
	jr	NZ, 00106$
	C$gameloop.c$30$2_0$216	= .
	.globl	C$gameloop.c$30$2_0$216
;src/gameloop.c:30: if (depth >= EARTH_START) clear_4bkg_tiles(level_array, width, depth);
	ld	a, (#_depth)
	cp	a,#0x05
	jr	C, 00104$
	push	af
	inc	sp
	ld	a, (#_width)
	ld	de, #_level_array
	call	_clear_4bkg_tiles
00104$:
	C$gameloop.c$31$2_0$216	= .
	.globl	C$gameloop.c$31$2_0$216
;src/gameloop.c:31: update_inventory();
	call	_update_inventory
	C$gameloop.c$32$2_0$216	= .
	.globl	C$gameloop.c$32$2_0$216
;src/gameloop.c:32: calculate_cargo();
	call	_calculate_cargo
	C$gameloop.c$33$2_0$216	= .
	.globl	C$gameloop.c$33$2_0$216
;src/gameloop.c:33: draw_cargo();
	call	_draw_cargo
	C$gameloop.c$34$2_0$216	= .
	.globl	C$gameloop.c$34$2_0$216
;src/gameloop.c:34: tile_mined = FALSE;
	ld	hl, #_tile_mined
	ld	(hl), #0x00
00106$:
	C$gameloop.c$37$1_0$214	= .
	.globl	C$gameloop.c$37$1_0$214
;src/gameloop.c:37: update_fuel();
	call	_update_fuel
	C$gameloop.c$38$1_0$214	= .
	.globl	C$gameloop.c$38$1_0$214
;src/gameloop.c:38: draw_fuel();
	call	_draw_fuel
	C$gameloop.c$39$1_0$214	= .
	.globl	C$gameloop.c$39$1_0$214
;src/gameloop.c:39: draw_hull();
	call	_draw_hull
	C$gameloop.c$40$1_0$214	= .
	.globl	C$gameloop.c$40$1_0$214
;src/gameloop.c:40: calculate_falldamage();
	call	_calculate_falldamage
	C$gameloop.c$41$1_0$214	= .
	.globl	C$gameloop.c$41$1_0$214
;src/gameloop.c:41: check_hull();
	call	_check_hull
	C$gameloop.c$42$1_0$214	= .
	.globl	C$gameloop.c$42$1_0$214
;src/gameloop.c:42: check_fuel();
	call	_check_fuel
	C$gameloop.c$43$1_0$214	= .
	.globl	C$gameloop.c$43$1_0$214
;src/gameloop.c:43: check_game_over();
	call	_check_game_over
	C$gameloop.c$45$1_0$214	= .
	.globl	C$gameloop.c$45$1_0$214
;src/gameloop.c:45: if (prev_depth != depth) {
	ld	a, (#_prev_depth)
	ld	hl, #_depth
	sub	a, (hl)
	jr	Z, 00108$
	C$gameloop.c$46$2_0$217	= .
	.globl	C$gameloop.c$46$2_0$217
;src/gameloop.c:46: spawn_bkg_row();
	call	_spawn_bkg_row
	C$gameloop.c$47$2_0$217	= .
	.globl	C$gameloop.c$47$2_0$217
;src/gameloop.c:47: draw_depth();
	call	_draw_depth
	C$gameloop.c$48$2_0$217	= .
	.globl	C$gameloop.c$48$2_0$217
;src/gameloop.c:48: change_background_color();
	call	_change_background_color
00108$:
	C$gameloop.c$51$1_0$214	= .
	.globl	C$gameloop.c$51$1_0$214
;src/gameloop.c:51: check_enter_buildings();
	call	_check_enter_buildings
	C$gameloop.c$54$1_0$214	= .
	.globl	C$gameloop.c$54$1_0$214
;src/gameloop.c:54: prev_buttons = buttons;
	ld	a, (#_buttons)
	ld	(#_prev_buttons),a
	C$gameloop.c$55$1_0$214	= .
	.globl	C$gameloop.c$55$1_0$214
;src/gameloop.c:55: prev_depth = depth;
	ld	a, (#_depth)
	ld	(#_prev_depth),a
	C$gameloop.c$56$1_0$214	= .
	.globl	C$gameloop.c$56$1_0$214
;src/gameloop.c:56: prev_width = width;
	ld	a, (#_width)
	ld	hl, #_prev_width
	ld	(hl), a
	C$gameloop.c$58$1_0$214	= .
	.globl	C$gameloop.c$58$1_0$214
;src/gameloop.c:58: wait_vbl_done();
	C$gameloop.c$59$1_0$214	= .
	.globl	C$gameloop.c$59$1_0$214
;src/gameloop.c:59: }
	C$gameloop.c$59$1_0$214	= .
	.globl	C$gameloop.c$59$1_0$214
	XG$game_loop$0$0	= .
	.globl	XG$game_loop$0$0
	jp	_wait_vbl_done
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
