;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module menuloop
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _shop_menu_loop
	.globl _handleInput
	.globl _change_main_shop_tile_palettes
	.globl _change_sub_shop_tile_palettes
	.globl _write_sub_shop_text
	.globl _write_main_shop_text
	.globl _load_main_shop_tiles
	.globl _load_sub_shop_tiles
	.globl _displayMenu
	.globl _update_upgrade_tick
	.globl _read_buttons
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
	G$shop_menu_loop$0$0	= .
	.globl	G$shop_menu_loop$0$0
	C$menuloop.c$9$0_0$186	= .
	.globl	C$menuloop.c$9$0_0$186
;src/menuloop.c:9: void shop_menu_loop(void) {
;	---------------------------------
; Function shop_menu_loop
; ---------------------------------
_shop_menu_loop::
	C$menuloop.c$11$1_0$186	= .
	.globl	C$menuloop.c$11$1_0$186
;src/menuloop.c:11: read_buttons();
	call	_read_buttons
	C$menuloop.c$14$1_0$186	= .
	.globl	C$menuloop.c$14$1_0$186
;src/menuloop.c:14: if (prev_buttons != buttons) {
	ld	a, (#_prev_buttons)
	ld	hl, #_buttons
	sub	a, (hl)
	jr	Z, 00102$
	C$menuloop.c$15$2_0$187	= .
	.globl	C$menuloop.c$15$2_0$187
;src/menuloop.c:15: handleInput(&currentState, currentMenu);
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_currentState
	call	_handleInput
	C$menuloop.c$16$2_0$187	= .
	.globl	C$menuloop.c$16$2_0$187
;src/menuloop.c:16: update_menu = TRUE;  // Set the update flag
	ld	hl, #_update_menu
	ld	(hl), #0x01
00102$:
	C$menuloop.c$19$1_0$186	= .
	.globl	C$menuloop.c$19$1_0$186
;src/menuloop.c:19: if (update_menu) {
	ld	a, (#_update_menu)
	or	a, a
	jr	Z, 00107$
	C$menuloop.c$20$2_0$188	= .
	.globl	C$menuloop.c$20$2_0$188
;src/menuloop.c:20: displayMenu(currentMenu);
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_displayMenu
	C$menuloop.c$21$2_0$188	= .
	.globl	C$menuloop.c$21$2_0$188
;src/menuloop.c:21: update_upgrade_tick(currentState);
	ld	a, (#_currentState)
	call	_update_upgrade_tick
	C$menuloop.c$24$2_0$188	= .
	.globl	C$menuloop.c$24$2_0$188
;src/menuloop.c:24: if (currentState == MAIN_MENU) {
	ld	a, (#_currentState)
	sub	a, #0x06
	jr	NZ, 00104$
	C$menuloop.c$25$3_0$189	= .
	.globl	C$menuloop.c$25$3_0$189
;src/menuloop.c:25: currentMenu = &main_menu;
	ld	hl, #_currentMenu
	ld	(hl), #<(_main_menu)
	inc	hl
	ld	(hl), #>(_main_menu)
	C$menuloop.c$26$3_0$189	= .
	.globl	C$menuloop.c$26$3_0$189
;src/menuloop.c:26: change_main_shop_tile_palettes();
	call	_change_main_shop_tile_palettes
	C$menuloop.c$27$3_0$189	= .
	.globl	C$menuloop.c$27$3_0$189
;src/menuloop.c:27: write_main_shop_text();
	call	_write_main_shop_text
	C$menuloop.c$28$3_0$189	= .
	.globl	C$menuloop.c$28$3_0$189
;src/menuloop.c:28: load_main_shop_tiles();
	call	_load_main_shop_tiles
	jr	00105$
00104$:
	C$menuloop.c$30$3_0$190	= .
	.globl	C$menuloop.c$30$3_0$190
;src/menuloop.c:30: currentMenu = menu_numbers[currentState];
	ld	bc, #_menu_numbers+0
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_currentMenu
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	C$menuloop.c$31$3_0$190	= .
	.globl	C$menuloop.c$31$3_0$190
;src/menuloop.c:31: change_sub_shop_tile_palettes();
	call	_change_sub_shop_tile_palettes
	C$menuloop.c$32$3_0$190	= .
	.globl	C$menuloop.c$32$3_0$190
;src/menuloop.c:32: write_sub_shop_text();
	call	_write_sub_shop_text
	C$menuloop.c$33$3_0$190	= .
	.globl	C$menuloop.c$33$3_0$190
;src/menuloop.c:33: load_sub_shop_tiles();
	call	_load_sub_shop_tiles
00105$:
	C$menuloop.c$36$2_0$188	= .
	.globl	C$menuloop.c$36$2_0$188
;src/menuloop.c:36: update_menu = FALSE;  // Reset the update flag after updating the screen
	ld	hl, #_update_menu
	ld	(hl), #0x00
00107$:
	C$menuloop.c$39$1_0$186	= .
	.globl	C$menuloop.c$39$1_0$186
;src/menuloop.c:39: prev_buttons = buttons;
	ld	a, (#_buttons)
	ld	hl, #_prev_buttons
	ld	(hl), a
	C$menuloop.c$40$1_0$186	= .
	.globl	C$menuloop.c$40$1_0$186
;src/menuloop.c:40: wait_vbl_done();
	C$menuloop.c$42$1_0$186	= .
	.globl	C$menuloop.c$42$1_0$186
;src/menuloop.c:42: }
	C$menuloop.c$42$1_0$186	= .
	.globl	C$menuloop.c$42$1_0$186
	XG$shop_menu_loop$0$0	= .
	.globl	XG$shop_menu_loop$0$0
	jp	_wait_vbl_done
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
