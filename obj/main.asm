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
	.globl _init_attributes
	.globl _sell_all_ores
	.globl _calculate_cargo
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
	.globl _initrand
	.globl _waitpad
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
	C$main.c$29$0_0$227	= .
	.globl	C$main.c$29$0_0$227
;src/main.c:29: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$30$1_0$227	= .
	.globl	C$main.c$30$1_0$227
;src/main.c:30: init_framecounter();
	call	_init_framecounter
	C$main.c$31$1_0$227	= .
	.globl	C$main.c$31$1_0$227
;src/main.c:31: initrand(DIV_REG);
	ldh	a, (_DIV_REG + 0)
	ld	b, #0x00
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
	C$main.c$32$1_0$227	= .
	.globl	C$main.c$32$1_0$227
;src/main.c:32: init_attributes();
	call	_init_attributes
	C$main.c$33$1_0$227	= .
	.globl	C$main.c$33$1_0$227
;src/main.c:33: init_font();
	call	_init_font
	C$main.c$34$1_0$227	= .
	.globl	C$main.c$34$1_0$227
;src/main.c:34: init_speed();
	call	_init_speed
	C$main.c$35$1_0$227	= .
	.globl	C$main.c$35$1_0$227
;src/main.c:35: init_character();
	call	_init_character
	C$main.c$36$1_0$227	= .
	.globl	C$main.c$36$1_0$227
;src/main.c:36: init_screen();
	call	_init_screen
	C$main.c$39$1_1$228	= .
	.globl	C$main.c$39$1_1$228
;src/main.c:39: saved_bank = CURRENT_BANK;
	ldh	a, (__current_bank + 0)
	C$main.c$41$1_1$228	= .
	.globl	C$main.c$41$1_1$228
;src/main.c:41: while (1) {
00114$:
	C$main.c$42$2_1$229	= .
	.globl	C$main.c$42$2_1$229
;src/main.c:42: switch (currentGameState) {
	ld	a, (#_currentGameState)
	dec	a
	jr	Z, 00106$
	ld	a, (#_currentGameState)
	sub	a, #0x02
	jr	Z, 00110$
	ld	a, (#_currentGameState)
	sub	a, #0x03
	jr	Z, 00101$
	ld	a, (#_currentGameState)
	sub	a, #0x04
	jr	Z, 00111$
	jr	00114$
	C$main.c$43$3_1$230	= .
	.globl	C$main.c$43$3_1$230
;src/main.c:43: case GAME_STATE_PLAY:
00101$:
	C$main.c$45$3_1$230	= .
	.globl	C$main.c$45$3_1$230
;src/main.c:45: SWITCH_ROM(1);
	ld	a, #0x01
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x01
	C$main.c$46$3_1$230	= .
	.globl	C$main.c$46$3_1$230
;src/main.c:46: init_enable_lcd_interrupt();
	call	_init_enable_lcd_interrupt
	C$main.c$47$3_1$230	= .
	.globl	C$main.c$47$3_1$230
;src/main.c:47: init_clear_screen();
	call	_init_clear_screen
	C$main.c$48$3_1$230	= .
	.globl	C$main.c$48$3_1$230
;src/main.c:48: init_tiles();
	call	_init_tiles
	C$main.c$49$3_1$230	= .
	.globl	C$main.c$49$3_1$230
;src/main.c:49: init_progressbar();
	call	_init_progressbar
	C$main.c$50$3_1$230	= .
	.globl	C$main.c$50$3_1$230
;src/main.c:50: init_nav();
	call	_init_nav
	C$main.c$52$3_1$230	= .
	.globl	C$main.c$52$3_1$230
;src/main.c:52: draw_character();
	call	_draw_character
	C$main.c$53$3_1$230	= .
	.globl	C$main.c$53$3_1$230
;src/main.c:53: draw_fuel();
	call	_draw_fuel
	C$main.c$54$3_1$230	= .
	.globl	C$main.c$54$3_1$230
;src/main.c:54: draw_hull();
	call	_draw_hull
	C$main.c$55$3_1$230	= .
	.globl	C$main.c$55$3_1$230
;src/main.c:55: calculate_cargo();
	call	_calculate_cargo
	C$main.c$56$3_1$230	= .
	.globl	C$main.c$56$3_1$230
;src/main.c:56: draw_cargo();
	call	_draw_cargo
	C$main.c$57$3_1$230	= .
	.globl	C$main.c$57$3_1$230
;src/main.c:57: draw_depth();
	call	_draw_depth
	C$main.c$59$3_1$230	= .
	.globl	C$main.c$59$3_1$230
;src/main.c:59: while (player_alive == TRUE && currentGameState == GAME_STATE_PLAY) {
00103$:
	ld	a, (#_player_alive)
	dec	a
	jr	NZ, 00114$
	ld	a, (#_currentGameState)
	sub	a, #0x03
	jr	NZ, 00114$
	C$main.c$60$4_1$231	= .
	.globl	C$main.c$60$4_1$231
;src/main.c:60: game_loop();
	call	_game_loop
	jr	00103$
	C$main.c$64$3_1$230	= .
	.globl	C$main.c$64$3_1$230
;src/main.c:64: case GAME_STATE_SHOP_MENU:
00106$:
	C$main.c$65$3_1$230	= .
	.globl	C$main.c$65$3_1$230
;src/main.c:65: SWITCH_ROM(2);
	ld	a, #0x02
	ldh	(__current_bank + 0), a
	ld	hl, #_rROMB0
	ld	(hl), #0x02
	C$main.c$67$3_1$230	= .
	.globl	C$main.c$67$3_1$230
;src/main.c:67: init_disable_lcd_interrupt();
	call	_init_disable_lcd_interrupt
	C$main.c$68$3_1$230	= .
	.globl	C$main.c$68$3_1$230
;src/main.c:68: init_clear_screen();
	call	_init_clear_screen
	C$main.c$69$3_1$230	= .
	.globl	C$main.c$69$3_1$230
;src/main.c:69: init_shop();
	call	_init_shop
	C$main.c$70$3_1$230	= .
	.globl	C$main.c$70$3_1$230
;src/main.c:70: init_shop_tiles_palettes();
	call	_init_shop_tiles_palettes
	C$main.c$71$3_1$230	= .
	.globl	C$main.c$71$3_1$230
;src/main.c:71: while (currentGameState == GAME_STATE_SHOP_MENU){
00107$:
	ld	a, (#_currentGameState)
	dec	a
	jr	NZ, 00114$
	C$main.c$72$4_1$232	= .
	.globl	C$main.c$72$4_1$232
;src/main.c:72: shop_menu_loop();
	call	_shop_menu_loop
	jr	00107$
	C$main.c$75$3_1$230	= .
	.globl	C$main.c$75$3_1$230
;src/main.c:75: case GAME_STATE_SELL_MENU:
00110$:
	C$main.c$76$3_1$230	= .
	.globl	C$main.c$76$3_1$230
;src/main.c:76: init_disable_lcd_interrupt();
	call	_init_disable_lcd_interrupt
	C$main.c$77$3_1$230	= .
	.globl	C$main.c$77$3_1$230
;src/main.c:77: sell_all_ores();
	call	_sell_all_ores
	C$main.c$78$3_1$230	= .
	.globl	C$main.c$78$3_1$230
;src/main.c:78: break;
	jp	00114$
	C$main.c$80$3_1$230	= .
	.globl	C$main.c$80$3_1$230
;src/main.c:80: case GAME_STATE_GAME_OVER:
00111$:
	C$main.c$81$3_1$230	= .
	.globl	C$main.c$81$3_1$230
;src/main.c:81: init_disable_lcd_interrupt();
	call	_init_disable_lcd_interrupt
	C$main.c$82$3_1$230	= .
	.globl	C$main.c$82$3_1$230
;src/main.c:82: waitpad(J_START);
	ld	a, #0x80
	call	_waitpad
	C$main.c$83$3_1$230	= .
	.globl	C$main.c$83$3_1$230
;src/main.c:83: reset_player();
	call	_reset_player
	C$main.c$84$3_1$230	= .
	.globl	C$main.c$84$3_1$230
;src/main.c:84: currentGameState = GAME_STATE_PLAY;
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	C$main.c$87$1_1$228	= .
	.globl	C$main.c$87$1_1$228
;src/main.c:87: }
	C$main.c$89$1_1$227	= .
	.globl	C$main.c$89$1_1$227
;src/main.c:89: }
	C$main.c$89$1_1$227	= .
	.globl	C$main.c$89$1_1$227
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jp	00114$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
