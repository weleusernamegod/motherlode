;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init_shop_tiles_palettes
	.globl _init_shop
	.globl _init_main_menu
	.globl _draw_main_menu
	.globl _shop_menu_loop
	.globl _game_loop
	.globl _init_disable_lcd_interrupt
	.globl _init_enable_lcd_interrupt
	.globl _init_framecounter
	.globl _init_clear_screen
	.globl _init_screen
	.globl _init_font
	.globl _reset_player
	.globl _init_speed
	.globl _init_character
	.globl _init_progressbar
	.globl _init_tiles
	.globl _init_nav
	.globl _draw_character
	.globl _draw_hull
	.globl _draw_fuel
	.globl _draw_cargo
	.globl _draw_depth
	.globl _init_attributes
	.globl _sell_all_ores
	.globl _calculate_cargo
	.globl _initrand
	.globl _set_bkg_palette
	.globl _wait_vbl_done
	.globl _waitpad
	.globl _joypad
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$34$0_0$247	= .
	.globl	C$main.c$34$0_0$247
;src/main.c:34: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$35$1_0$247	= .
	.globl	C$main.c$35$1_0$247
;src/main.c:35: init_framecounter();
	call	_init_framecounter
	C$main.c$36$1_0$247	= .
	.globl	C$main.c$36$1_0$247
;src/main.c:36: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
	C$main.c$37$1_0$247	= .
	.globl	C$main.c$37$1_0$247
;src/main.c:37: init_attributes();
	call	_init_attributes
	C$main.c$38$1_0$247	= .
	.globl	C$main.c$38$1_0$247
;src/main.c:38: init_speed();
	call	_init_speed
	C$main.c$39$1_0$247	= .
	.globl	C$main.c$39$1_0$247
;src/main.c:39: init_character();
	call	_init_character
	C$main.c$40$1_0$247	= .
	.globl	C$main.c$40$1_0$247
;src/main.c:40: init_screen();
	call	_init_screen
	C$main.c$42$1_0$247	= .
	.globl	C$main.c$42$1_0$247
;src/main.c:42: while (1) {
00128$:
	C$main.c$43$2_0$248	= .
	.globl	C$main.c$43$2_0$248
;src/main.c:43: switch (currentGameState) {
	ld	a, #0x04
	ld	hl, #_currentGameState
	sub	a, (hl)
	jr	C, 00128$
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00223$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00223$:
	jp	00101$
	jp	00120$
	jp	00124$
	jp	00115$
	jp	00125$
	C$main.c$44$3_0$249	= .
	.globl	C$main.c$44$3_0$249
;src/main.c:44: case GAME_STATE_MAIN_MENU:
00101$:
	C$main.c$45$3_0$249	= .
	.globl	C$main.c$45$3_0$249
;src/main.c:45: SWITCH_ROM(3);
	ld	a, #0x03
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x03
	C$main.c$46$3_0$249	= .
	.globl	C$main.c$46$3_0$249
;src/main.c:46: init_clear_screen();
	call	_init_clear_screen
	C$main.c$47$3_0$249	= .
	.globl	C$main.c$47$3_0$249
;src/main.c:47: init_main_menu();
	call	_init_main_menu
	C$main.c$48$3_0$249	= .
	.globl	C$main.c$48$3_0$249
;src/main.c:48: while (currentGameState == GAME_STATE_MAIN_MENU){
00112$:
	ld	a, (#_currentGameState)
	or	a, a
	jr	NZ, 00114$
	C$main.c$49$4_0$250	= .
	.globl	C$main.c$49$4_0$250
;src/main.c:49: draw_main_menu();
	call	_draw_main_menu
	C$main.c$50$4_0$250	= .
	.globl	C$main.c$50$4_0$250
;src/main.c:50: if (joypad() & J_START) {
	call	_joypad
	rlca
	jr	NC, 00111$
	C$main.c$51$5_0$251	= .
	.globl	C$main.c$51$5_0$251
;src/main.c:51: if (current_menu_index == 0) currentGameState = GAME_STATE_PLAY;
	ld	a, (#_current_menu_index)
	or	a, a
	jr	NZ, 00108$
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	jr	00111$
00108$:
	C$main.c$52$5_0$251	= .
	.globl	C$main.c$52$5_0$251
;src/main.c:52: else if (current_menu_index == 1) currentGameState = GAME_STATE_PLAY;
	ld	a, (#_current_menu_index)
	dec	a
	jr	NZ, 00105$
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	jr	00111$
00105$:
	C$main.c$53$5_0$251	= .
	.globl	C$main.c$53$5_0$251
;src/main.c:53: else if (current_menu_index >= 2) currentGameState = GAME_STATE_PLAY;
	ld	a, (#_current_menu_index)
	sub	a, #0x02
	jr	C, 00111$
	ld	hl, #_currentGameState
	ld	(hl), #0x03
00111$:
	C$main.c$56$4_0$250	= .
	.globl	C$main.c$56$4_0$250
;src/main.c:56: wait_vbl_done();
	call	_wait_vbl_done
	jr	00112$
00114$:
	C$main.c$58$3_0$249	= .
	.globl	C$main.c$58$3_0$249
;src/main.c:58: init_screen();
	call	_init_screen
	C$main.c$59$3_0$249	= .
	.globl	C$main.c$59$3_0$249
;src/main.c:59: break;
	jr	00128$
	C$main.c$60$3_0$249	= .
	.globl	C$main.c$60$3_0$249
;src/main.c:60: case GAME_STATE_PLAY:
00115$:
	C$main.c$62$3_0$249	= .
	.globl	C$main.c$62$3_0$249
;src/main.c:62: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
	C$main.c$63$3_0$249	= .
	.globl	C$main.c$63$3_0$249
;src/main.c:63: init_enable_lcd_interrupt();
	call	_init_enable_lcd_interrupt
	C$main.c$64$3_0$249	= .
	.globl	C$main.c$64$3_0$249
;src/main.c:64: init_clear_screen();
	call	_init_clear_screen
	C$main.c$65$3_0$249	= .
	.globl	C$main.c$65$3_0$249
;src/main.c:65: init_font();
	call	_init_font
	C$main.c$66$3_0$249	= .
	.globl	C$main.c$66$3_0$249
;src/main.c:66: init_tiles();
	call	_init_tiles
	C$main.c$67$3_0$249	= .
	.globl	C$main.c$67$3_0$249
;src/main.c:67: init_progressbar();
	call	_init_progressbar
	C$main.c$68$3_0$249	= .
	.globl	C$main.c$68$3_0$249
;src/main.c:68: init_nav();
	call	_init_nav
	C$main.c$70$3_0$249	= .
	.globl	C$main.c$70$3_0$249
;src/main.c:70: draw_character();
	call	_draw_character
	C$main.c$71$3_0$249	= .
	.globl	C$main.c$71$3_0$249
;src/main.c:71: draw_fuel();
	call	_draw_fuel
	C$main.c$72$3_0$249	= .
	.globl	C$main.c$72$3_0$249
;src/main.c:72: draw_hull();
	call	_draw_hull
	C$main.c$73$3_0$249	= .
	.globl	C$main.c$73$3_0$249
;src/main.c:73: calculate_cargo();
	call	_calculate_cargo
	C$main.c$74$3_0$249	= .
	.globl	C$main.c$74$3_0$249
;src/main.c:74: draw_cargo();
	call	_draw_cargo
	C$main.c$75$3_0$249	= .
	.globl	C$main.c$75$3_0$249
;src/main.c:75: draw_depth();
	call	_draw_depth
	C$main.c$77$3_0$249	= .
	.globl	C$main.c$77$3_0$249
;src/main.c:77: set_bkg_palette(0, 1, palette_default);
	ld	de, #_palette_default
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$78$3_0$249	= .
	.globl	C$main.c$78$3_0$249
;src/main.c:78: set_bkg_palette(1, 1, palette_gras);
	ld	de, #_palette_gras
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$79$3_0$249	= .
	.globl	C$main.c$79$3_0$249
;src/main.c:79: set_bkg_palette(2, 1, palette_rock);
	ld	de, #_palette_rock
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$80$3_0$249	= .
	.globl	C$main.c$80$3_0$249
;src/main.c:80: set_bkg_palette(3, 1, palette_iron);
	ld	de, #_palette_iron
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$81$3_0$249	= .
	.globl	C$main.c$81$3_0$249
;src/main.c:81: set_bkg_palette(4, 1, palette_copper);
	ld	de, #_palette_copper
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$82$3_0$249	= .
	.globl	C$main.c$82$3_0$249
;src/main.c:82: set_bkg_palette(5, 1, palette_iron);
	ld	de, #_palette_iron
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$83$3_0$249	= .
	.globl	C$main.c$83$3_0$249
;src/main.c:83: set_bkg_palette(6, 1, palette_yellow);
	ld	de, #_palette_yellow
	push	de
	ld	hl, #0x106
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$84$3_0$249	= .
	.globl	C$main.c$84$3_0$249
;src/main.c:84: set_bkg_palette(7, 1, palette_yellow);
	ld	de, #_palette_yellow
	push	de
	ld	hl, #0x107
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$main.c$87$3_0$249	= .
	.globl	C$main.c$87$3_0$249
;src/main.c:87: while (player_alive == TRUE && currentGameState == GAME_STATE_PLAY) {
00117$:
	ld	a, (#_player_alive)
	dec	a
	jr	NZ, 00119$
	ld	a, (#_currentGameState)
	sub	a, #0x03
	jr	NZ, 00119$
	C$main.c$88$4_0$252	= .
	.globl	C$main.c$88$4_0$252
;src/main.c:88: game_loop();
	call	_game_loop
	jr	00117$
00119$:
	C$main.c$90$3_0$249	= .
	.globl	C$main.c$90$3_0$249
;src/main.c:90: init_disable_lcd_interrupt();
	call	_init_disable_lcd_interrupt
	C$main.c$92$3_0$249	= .
	.globl	C$main.c$92$3_0$249
;src/main.c:92: break;
	jp	00128$
	C$main.c$94$3_0$249	= .
	.globl	C$main.c$94$3_0$249
;src/main.c:94: case GAME_STATE_UPGRADE_MENU:
00120$:
	C$main.c$95$3_0$249	= .
	.globl	C$main.c$95$3_0$249
;src/main.c:95: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
	C$main.c$97$3_0$249	= .
	.globl	C$main.c$97$3_0$249
;src/main.c:97: init_clear_screen();
	call	_init_clear_screen
	C$main.c$98$3_0$249	= .
	.globl	C$main.c$98$3_0$249
;src/main.c:98: init_shop();
	call	_init_shop
	C$main.c$99$3_0$249	= .
	.globl	C$main.c$99$3_0$249
;src/main.c:99: init_shop_tiles_palettes();
	call	_init_shop_tiles_palettes
	C$main.c$100$3_0$249	= .
	.globl	C$main.c$100$3_0$249
;src/main.c:100: while (currentGameState == GAME_STATE_UPGRADE_MENU){
00121$:
	ld	a, (#_currentGameState)
	dec	a
	jp	NZ,00128$
	C$main.c$101$4_0$253	= .
	.globl	C$main.c$101$4_0$253
;src/main.c:101: shop_menu_loop();
	call	_shop_menu_loop
	jr	00121$
	C$main.c$104$3_0$249	= .
	.globl	C$main.c$104$3_0$249
;src/main.c:104: case GAME_STATE_SELL_MENU:
00124$:
	C$main.c$105$3_0$249	= .
	.globl	C$main.c$105$3_0$249
;src/main.c:105: sell_all_ores();
	call	_sell_all_ores
	C$main.c$106$3_0$249	= .
	.globl	C$main.c$106$3_0$249
;src/main.c:106: break;
	jp	00128$
	C$main.c$108$3_0$249	= .
	.globl	C$main.c$108$3_0$249
;src/main.c:108: case GAME_STATE_GAME_OVER:
00125$:
	C$main.c$109$3_0$249	= .
	.globl	C$main.c$109$3_0$249
;src/main.c:109: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
	C$main.c$110$3_0$249	= .
	.globl	C$main.c$110$3_0$249
;src/main.c:110: reset_player();
	call	_reset_player
	C$main.c$111$3_0$249	= .
	.globl	C$main.c$111$3_0$249
;src/main.c:111: currentGameState = GAME_STATE_PLAY;
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	C$main.c$113$1_0$247	= .
	.globl	C$main.c$113$1_0$247
;src/main.c:113: }
	C$main.c$115$1_0$247	= .
	.globl	C$main.c$115$1_0$247
;src/main.c:115: }
	C$main.c$115$1_0$247	= .
	.globl	C$main.c$115$1_0$247
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jp	00128$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
