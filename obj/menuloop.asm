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
	C$menuloop.c$8$0_0$179	= .
	.globl	C$menuloop.c$8$0_0$179
;src/menuloop.c:8: void shop_menu_loop(void) {
;	---------------------------------
; Function shop_menu_loop
; ---------------------------------
_shop_menu_loop::
	C$menuloop.c$10$1_0$179	= .
	.globl	C$menuloop.c$10$1_0$179
;src/menuloop.c:10: read_buttons();
	call	_read_buttons
	C$menuloop.c$13$1_0$179	= .
	.globl	C$menuloop.c$13$1_0$179
;src/menuloop.c:13: if (prev_buttons != buttons) {
	ld	a, (#_prev_buttons)
	ld	hl, #_buttons
	sub	a, (hl)
	jr	Z, 00102$
	C$menuloop.c$14$2_0$180	= .
	.globl	C$menuloop.c$14$2_0$180
;src/menuloop.c:14: handleInput(&currentState, currentMenu);
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #_currentState
	call	_handleInput
	C$menuloop.c$15$2_0$180	= .
	.globl	C$menuloop.c$15$2_0$180
;src/menuloop.c:15: update_menu = TRUE;  // Set the update flag
	ld	hl, #_update_menu
	ld	(hl), #0x01
00102$:
	C$menuloop.c$18$1_0$179	= .
	.globl	C$menuloop.c$18$1_0$179
;src/menuloop.c:18: if (update_menu) {
	ld	a, (#_update_menu)
	or	a, a
	jr	Z, 00107$
	C$menuloop.c$19$2_0$181	= .
	.globl	C$menuloop.c$19$2_0$181
;src/menuloop.c:19: displayMenu(currentMenu);
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_displayMenu
	C$menuloop.c$20$2_0$181	= .
	.globl	C$menuloop.c$20$2_0$181
;src/menuloop.c:20: update_upgrade_tick(currentState);
	ld	a, (#_currentState)
	call	_update_upgrade_tick
	C$menuloop.c$23$2_0$181	= .
	.globl	C$menuloop.c$23$2_0$181
;src/menuloop.c:23: if (currentState == MAIN_MENU) {
	ld	a, (#_currentState)
	sub	a, #0x06
	jr	NZ, 00104$
	C$menuloop.c$24$3_0$182	= .
	.globl	C$menuloop.c$24$3_0$182
;src/menuloop.c:24: currentMenu = &main_menu;
	ld	hl, #_currentMenu
	ld	(hl), #<(_main_menu)
	inc	hl
	ld	(hl), #>(_main_menu)
	C$menuloop.c$25$3_0$182	= .
	.globl	C$menuloop.c$25$3_0$182
;src/menuloop.c:25: change_main_shop_tile_palettes();
	call	_change_main_shop_tile_palettes
	C$menuloop.c$26$3_0$182	= .
	.globl	C$menuloop.c$26$3_0$182
;src/menuloop.c:26: write_main_shop_text();
	call	_write_main_shop_text
	C$menuloop.c$27$3_0$182	= .
	.globl	C$menuloop.c$27$3_0$182
;src/menuloop.c:27: load_main_shop_tiles();
	call	_load_main_shop_tiles
	jr	00105$
00104$:
	C$menuloop.c$29$3_0$183	= .
	.globl	C$menuloop.c$29$3_0$183
;src/menuloop.c:29: currentMenu = menu_numbers[currentState];
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
	C$menuloop.c$30$3_0$183	= .
	.globl	C$menuloop.c$30$3_0$183
;src/menuloop.c:30: change_sub_shop_tile_palettes();
	call	_change_sub_shop_tile_palettes
	C$menuloop.c$31$3_0$183	= .
	.globl	C$menuloop.c$31$3_0$183
;src/menuloop.c:31: write_sub_shop_text();
	call	_write_sub_shop_text
	C$menuloop.c$32$3_0$183	= .
	.globl	C$menuloop.c$32$3_0$183
;src/menuloop.c:32: load_sub_shop_tiles();
	call	_load_sub_shop_tiles
00105$:
	C$menuloop.c$35$2_0$181	= .
	.globl	C$menuloop.c$35$2_0$181
;src/menuloop.c:35: update_menu = FALSE;  // Reset the update flag after updating the screen
	ld	hl, #_update_menu
	ld	(hl), #0x00
00107$:
	C$menuloop.c$38$1_0$179	= .
	.globl	C$menuloop.c$38$1_0$179
;src/menuloop.c:38: prev_buttons = buttons;
	ld	a, (#_buttons)
	ld	hl, #_prev_buttons
	ld	(hl), a
	C$menuloop.c$39$1_0$179	= .
	.globl	C$menuloop.c$39$1_0$179
;src/menuloop.c:39: wait_vbl_done();
	C$menuloop.c$41$1_0$179	= .
	.globl	C$menuloop.c$41$1_0$179
;src/menuloop.c:41: }
	C$menuloop.c$41$1_0$179	= .
	.globl	C$menuloop.c$41$1_0$179
	XG$shop_menu_loop$0$0	= .
	.globl	XG$shop_menu_loop$0$0
	jp	_wait_vbl_done
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
