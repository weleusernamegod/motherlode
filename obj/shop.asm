;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module shop
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b___func_bank_shop
	.globl ___func_bank_shop
	.globl _draw_text
	.globl _itoa
	.globl _strcat
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_win_data
	.globl _currentMenu
	.globl _currentState
	.globl _main_menu
	.globl _cargo_menu
	.globl _radiator_menu
	.globl _fuel_menu
	.globl _engine_menu
	.globl _hull_menu
	.globl _drill_menu
	.globl _menu_numbers
	.globl _metasprite_buttonframe
	.globl _init_shop
	.globl _init_shop_tiles_palettes
	.globl _updateMetaSpritePosition
	.globl _update_upgrade_tick
	.globl _displayMenu
	.globl _load_shop_single_tile
	.globl _load_sub_shop_tiles
	.globl _load_main_shop_tiles
	.globl _write_main_shop_text
	.globl _write_sub_shop_text
	.globl _change_sub_shop_tile_palettes
	.globl _change_main_shop_tile_palettes
	.globl _attempt_purchase
	.globl _handleInput
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
G$menu_numbers$0_0$0==.
_menu_numbers::
	.ds 14
G$drill_menu$0_0$0==.
_drill_menu::
	.ds 1
G$hull_menu$0_0$0==.
_hull_menu::
	.ds 1
G$engine_menu$0_0$0==.
_engine_menu::
	.ds 1
G$fuel_menu$0_0$0==.
_fuel_menu::
	.ds 1
G$radiator_menu$0_0$0==.
_radiator_menu::
	.ds 1
G$cargo_menu$0_0$0==.
_cargo_menu::
	.ds 1
G$main_menu$0_0$0==.
_main_menu::
	.ds 1
G$currentState$0_0$0==.
_currentState::
	.ds 1
G$currentMenu$0_0$0==.
_currentMenu::
	.ds 2
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
	.area _CODE_2
	G$__func_bank_shop$0$0	= .
	.globl	G$__func_bank_shop$0$0
	C$shop.c$27$0_0$229	= .
	.globl	C$shop.c$27$0_0$229
;src/shop.c:27: BANKREF(bank_shop)
;	---------------------------------
; Function __func_bank_shop
; ---------------------------------
	b___func_bank_shop	= 2
___func_bank_shop::
	.local b___func_bank_shop 
	___bank_bank_shop = b___func_bank_shop 
	.globl ___bank_bank_shop 
	G$init_shop$0$0	= .
	.globl	G$init_shop$0$0
	C$shop.c$66$1_0$231	= .
	.globl	C$shop.c$66$1_0$231
;src/shop.c:66: void init_shop(void) {
;	---------------------------------
; Function init_shop
; ---------------------------------
_init_shop::
	C$shop.c$67$1_0$231	= .
	.globl	C$shop.c$67$1_0$231
;src/shop.c:67: set_sprite_palette(0, 1, palette_default);
	ld	de, #_palette_default
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_sprite_palette
	add	sp, #4
	C$shop.c$68$1_0$231	= .
	.globl	C$shop.c$68$1_0$231
;src/shop.c:68: set_sprite_palette(1, 1, palette_grey);
	ld	de, #_palette_grey
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_sprite_palette
	add	sp, #4
	C$shop.c$70$1_0$231	= .
	.globl	C$shop.c$70$1_0$231
;src/shop.c:70: set_win_data(SHOP_FRAME_START, shopframe_TILE_COUNT, shopframe_tiles);
	ld	de, #_shopframe_tiles
	push	de
	ld	hl, #0x997
	push	hl
	call	_set_win_data
	add	sp, #4
	C$shop.c$71$1_0$231	= .
	.globl	C$shop.c$71$1_0$231
;src/shop.c:71: set_win_tiles(0, 0, 20, 18, shopframe_map);
	ld	de, #_shopframe_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
	C$shop.c$73$1_0$231	= .
	.globl	C$shop.c$73$1_0$231
;src/shop.c:73: set_bkg_palette(0, 1, palette_default);
	ld	de, #_palette_default
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$74$1_0$231	= .
	.globl	C$shop.c$74$1_0$231
;src/shop.c:74: set_bkg_palette(1, 1, palette_grey);
	ld	de, #_palette_grey
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$75$1_0$231	= .
	.globl	C$shop.c$75$1_0$231
;src/shop.c:75: set_bkg_palette(2, 1, palette_blue);
	ld	de, #_palette_blue
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$76$1_0$231	= .
	.globl	C$shop.c$76$1_0$231
;src/shop.c:76: set_bkg_palette(3, 1, palette_green);
	ld	de, #_palette_green
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$77$1_0$231	= .
	.globl	C$shop.c$77$1_0$231
;src/shop.c:77: set_bkg_palette(4, 1, palette_orange);
	ld	de, #_palette_orange
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$78$1_0$231	= .
	.globl	C$shop.c$78$1_0$231
;src/shop.c:78: set_bkg_palette(5, 1, palette_purple);
	ld	de, #_palette_purple
	push	de
	ld	hl, #0x105
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$79$1_0$231	= .
	.globl	C$shop.c$79$1_0$231
;src/shop.c:79: set_bkg_palette(6, 1, palette_red);
	ld	de, #_palette_red
	push	de
	ld	hl, #0x106
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$80$1_0$231	= .
	.globl	C$shop.c$80$1_0$231
;src/shop.c:80: set_bkg_palette(7, 1, palette_yellow);
	ld	de, #_palette_yellow
	push	de
	ld	hl, #0x107
	push	hl
	call	_set_bkg_palette
	add	sp, #4
	C$shop.c$82$1_0$231	= .
	.globl	C$shop.c$82$1_0$231
;src/shop.c:82: set_sprite_data(1, buttonframe_TILE_COUNT, buttonframe_tiles); // blank tile in the end
	ld	de, #_buttonframe_tiles
	push	de
	ld	a, #0x04
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/usr/local/opt/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 50)
	ld	(hl), #0x04
;src/shop.c:84: move_metasprite_ex(metasprite_buttonframe, 0, 0, 0, 24, 40);
;/usr/local/opt/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_metasprite_buttonframe)
	inc	hl
	ld	(hl), #>(_metasprite_buttonframe)
;/usr/local/opt/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	de, #0x2818
	xor	a, a
	call	___move_metasprite
	C$shop.c$86$1_0$231	= .
	.globl	C$shop.c$86$1_0$231
;src/shop.c:86: update_menu = TRUE; // always update the menu the first time the player enters the shop
	ld	hl, #_update_menu
	ld	(hl), #0x01
	C$shop.c$87$1_0$231	= .
	.globl	C$shop.c$87$1_0$231
;src/shop.c:87: }
	C$shop.c$87$1_0$231	= .
	.globl	C$shop.c$87$1_0$231
	XG$init_shop$0$0	= .
	.globl	XG$init_shop$0$0
	ret
G$metasprite_buttonframe$0_0$0 == .
_metasprite_buttonframe:
	.db #0x10	;  16
	.db #0x08	;  8
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x01	; 1
	.db #0x20	; 32
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x08	;  8
	.db #0x00	;  0
	.db #0x01	; 1
	.db #0x60	; 96
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x00	;  0
	.db #0xf8	; -8
	.db #0x01	; 1
	.db #0x40	; 64
	.db #0xf8	; -8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0xf8	; -8
	.db #0x00	;  0
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	G$init_shop_tiles_palettes$0$0	= .
	.globl	G$init_shop_tiles_palettes$0$0
	C$shop.c$89$1_0$239	= .
	.globl	C$shop.c$89$1_0$239
;src/shop.c:89: void init_shop_tiles_palettes(void) {
;	---------------------------------
; Function init_shop_tiles_palettes
; ---------------------------------
_init_shop_tiles_palettes::
	add	sp, #-28
	C$shop.c$91$2_0$239	= .
	.globl	C$shop.c$91$2_0$239
;src/shop.c:91: uint8_t x_coords[] = {3, 8, 13, 3, 8, 13};
	ldhl	sp,	#0
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x08
	inc	hl
	ld	(hl), #0x0d
	inc	hl
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x08
	inc	hl
	ld	(hl), #0x0d
	C$shop.c$92$2_0$239	= .
	.globl	C$shop.c$92$2_0$239
;src/shop.c:92: uint8_t y_coords[] = {5, 5, 5, 10, 10, 10};
	inc	hl
	ld	(hl), #0x05
	inc	hl
	ld	(hl), #0x05
	inc	hl
	ld	(hl), #0x05
	inc	hl
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x0a
	C$shop.c$94$1_0$239	= .
	.globl	C$shop.c$94$1_0$239
;src/shop.c:94: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$shop.c$96$5_0$243	= .
	.globl	C$shop.c$96$5_0$243
;src/shop.c:96: for (uint8_t i = 0; i < 6; i++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x06
	jr	NC, 00102$
	C$shop.c$98$1_0$239	= .
	.globl	C$shop.c$98$1_0$239
;src/shop.c:98: for (uint8_t j = 0; j < 16; j++) {
	ld	b, #0x00
00104$:
	ld	a, b
	sub	a, #0x10
	jr	NC, 00101$
	C$shop.c$99$5_0$243	= .
	.globl	C$shop.c$99$5_0$243
;src/shop.c:99: tileData[j]=i+2;    // first palette = 2, then inc up to 7
	ld	e, b
	ld	d, #0x00
	ld	hl, #12
	add	hl, sp
	add	hl, de
	ld	a, c
	add	a, #0x02
	ld	(hl), a
	C$shop.c$98$4_0$242	= .
	.globl	C$shop.c$98$4_0$242
;src/shop.c:98: for (uint8_t j = 0; j < 16; j++) {
	inc	b
	jr	00104$
00101$:
	C$shop.c$101$3_0$241	= .
	.globl	C$shop.c$101$3_0$241
;src/shop.c:101: set_win_tiles(x_coords[i], y_coords[i], 4, 4, tileData);
	ld	e, c
	ld	d, #0x00
	ld	hl, #6
	add	hl, sp
	add	hl, de
	ld	b, (hl)
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ld	hl, #12
	add	hl, sp
	push	hl
	ld	hl, #0x404
	push	hl
	push	bc
	inc	sp
	ld	a, e
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
	C$shop.c$96$2_0$240	= .
	.globl	C$shop.c$96$2_0$240
;src/shop.c:96: for (uint8_t i = 0; i < 6; i++) {
	inc	c
	jr	00107$
00102$:
	C$shop.c$103$1_0$239	= .
	.globl	C$shop.c$103$1_0$239
;src/shop.c:103: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$shop.c$104$1_0$239	= .
	.globl	C$shop.c$104$1_0$239
;src/shop.c:104: }
	add	sp, #28
	C$shop.c$104$1_0$239	= .
	.globl	C$shop.c$104$1_0$239
	XG$init_shop_tiles_palettes$0$0	= .
	.globl	XG$init_shop_tiles_palettes$0$0
	ret
	G$updateMetaSpritePosition$0$0	= .
	.globl	G$updateMetaSpritePosition$0$0
	C$shop.c$106$1_0$245	= .
	.globl	C$shop.c$106$1_0$245
;src/shop.c:106: void updateMetaSpritePosition(uint8_t currentSelection) {
;	---------------------------------
; Function updateMetaSpritePosition
; ---------------------------------
_updateMetaSpritePosition::
	add	sp, #-3
	C$shop.c$108$1_0$245	= .
	.globl	C$shop.c$108$1_0$245
;src/shop.c:108: x = 24 + (40 * (currentSelection % 3));
	ldhl	sp,	#0
	ld	(hl+), a
	ld	bc, #0x0003
	ld	(hl), b
	pop	de
	push	de
	call	__modsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x18
	ldhl	sp,	#2
	ld	(hl), a
	C$shop.c$109$3_0$245	= .
	.globl	C$shop.c$109$3_0$245
;src/shop.c:109: y = 40 + (40 * (currentSelection / 3));
	ld	bc, #0x0003
	pop	de
	push	de
	call	__divsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x28
	ld	d, a
;src/shop.c:110: move_metasprite_ex(metasprite_buttonframe, 0, 0, 0, x, y);
;/usr/local/opt/gbdk/include/gb/metasprites.h:151: __current_metasprite = metasprite;
	ld	hl, #___current_metasprite
	ld	(hl), #<(_metasprite_buttonframe)
	inc	hl
	ld	(hl), #>(_metasprite_buttonframe)
;/usr/local/opt/gbdk/include/gb/metasprites.h:152: __current_base_tile = base_tile;
	ld	hl, #___current_base_tile
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/metasprites.h:153: __current_base_prop = base_prop;
	ld	hl, #___current_base_prop
;/usr/local/opt/gbdk/include/gb/metasprites.h:154: return __move_metasprite(base_sprite, (y << 8) | (uint8_t)x);
	ld	(hl), #0x00
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, e
	ld	e, a
	xor	a, a
	call	___move_metasprite
	C$shop.c$110$3_0$245	= .
	.globl	C$shop.c$110$3_0$245
;src/shop.c:110: move_metasprite_ex(metasprite_buttonframe, 0, 0, 0, x, y);
	C$shop.c$111$3_0$245	= .
	.globl	C$shop.c$111$3_0$245
;src/shop.c:111: }
	add	sp, #3
	C$shop.c$111$3_0$245	= .
	.globl	C$shop.c$111$3_0$245
	XG$updateMetaSpritePosition$0$0	= .
	.globl	XG$updateMetaSpritePosition$0$0
	ret
	G$update_upgrade_tick$0$0	= .
	.globl	G$update_upgrade_tick$0$0
	C$shop.c$113$3_0$250	= .
	.globl	C$shop.c$113$3_0$250
;src/shop.c:113: void update_upgrade_tick(MenuState state) {
;	---------------------------------
; Function update_upgrade_tick
; ---------------------------------
_update_upgrade_tick::
	add	sp, #-3
	C$shop.c$116$1_0$250	= .
	.globl	C$shop.c$116$1_0$250
;src/shop.c:116: if (state != MAIN_MENU) {
	ld	c, a
	sub	a, #0x06
	jr	Z, 00102$
	C$shop.c$117$2_0$251	= .
	.globl	C$shop.c$117$2_0$251
;src/shop.c:117: player_attributes *currentAttributes = attributes_numbers[state];
	ld	de, #_attributes_numbers+0
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	C$shop.c$118$2_0$251	= .
	.globl	C$shop.c$118$2_0$251
;src/shop.c:118: uint8_t x = 8 + 24 + 24 - 2 + (40 * (currentAttributes->upgrade_level % 3));
	ld	hl, #0x0014
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	bc, #0x0003
	ld	(hl), b
	pop	de
	push	de
	call	__modsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x36
	ldhl	sp,	#2
	ld	(hl), a
	C$shop.c$119$1_0$250	= .
	.globl	C$shop.c$119$1_0$250
;src/shop.c:119: uint8_t y = 16 + 24 + 40 - 2 + (40 * (currentAttributes->upgrade_level / 3));
	ld	bc, #0x0003
	pop	de
	push	de
	call	__divsint
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x4e
;/usr/local/opt/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
;/usr/local/opt/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ld	e, a
	ld	bc, #_shadow_OAM+48
	ld	(bc), a
	inc	bc
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	C$shop.c$120$1_0$250	= .
	.globl	C$shop.c$120$1_0$250
;src/shop.c:120: move_sprite(UPGRADE_TICK_TILE, x, y);
	jr	00106$
00102$:
;/usr/local/opt/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	hl, #(_shadow_OAM + 48)
	ld	(hl), #0x00
	C$shop.c$122$1_0$250	= .
	.globl	C$shop.c$122$1_0$250
;src/shop.c:122: hide_sprite(UPGRADE_TICK_TILE);  // Hide the sprite if not in a specific upgrade menu
00106$:
	C$shop.c$124$1_0$250	= .
	.globl	C$shop.c$124$1_0$250
;src/shop.c:124: }
	add	sp, #3
	C$shop.c$124$1_0$250	= .
	.globl	C$shop.c$124$1_0$250
	XG$update_upgrade_tick$0$0	= .
	.globl	XG$update_upgrade_tick$0$0
	ret
	G$displayMenu$0$0	= .
	.globl	G$displayMenu$0$0
	C$shop.c$127$1_0$260	= .
	.globl	C$shop.c$127$1_0$260
;src/shop.c:127: void displayMenu(Menu *menu) {
;	---------------------------------
; Function displayMenu
; ---------------------------------
_displayMenu::
	C$shop.c$128$1_0$260	= .
	.globl	C$shop.c$128$1_0$260
;src/shop.c:128: updateMetaSpritePosition(menu->currentSelection);
	ld	a, (de)
	ld	c, a
	C$shop.c$129$1_0$260	= .
	.globl	C$shop.c$129$1_0$260
;src/shop.c:129: }
	C$shop.c$129$1_0$260	= .
	.globl	C$shop.c$129$1_0$260
	XG$displayMenu$0$0	= .
	.globl	XG$displayMenu$0$0
	jp	_updateMetaSpritePosition
	G$load_shop_single_tile$0$0	= .
	.globl	G$load_shop_single_tile$0$0
	C$shop.c$131$1_0$262	= .
	.globl	C$shop.c$131$1_0$262
;src/shop.c:131: void load_shop_single_tile(uint16_t tilestart, uint8_t tilenumber, uint8_t position, uint8_t upgrade_type) {
;	---------------------------------
; Function load_shop_single_tile
; ---------------------------------
_load_shop_single_tile::
	add	sp, #-24
	ldhl	sp,	#22
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
	C$shop.c$133$3_0$264	= .
	.globl	C$shop.c$133$3_0$264
;src/shop.c:133: for (uint8_t i = 0; i < 16; i++){
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ldhl	sp,	#20
	ld	(hl), #0x00
00120$:
	C$shop.c$134$1_0$262	= .
	.globl	C$shop.c$134$1_0$262
;src/shop.c:134: array[i] = tilestart+i;
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	C$shop.c$133$2_0$263	= .
	.globl	C$shop.c$133$2_0$263
;src/shop.c:133: for (uint8_t i = 0; i < 16; i++){
	ldhl	sp,	#20
	ld	a, (hl)
	sub	a, #0x10
	jr	NC, 00101$
	C$shop.c$134$3_0$264	= .
	.globl	C$shop.c$134$3_0$264
;src/shop.c:134: array[i] = tilestart+i;
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (hl)
	ldhl	sp,	#20
	add	a, (hl)
	ld	(de), a
	C$shop.c$133$2_0$263	= .
	.globl	C$shop.c$133$2_0$263
;src/shop.c:133: for (uint8_t i = 0; i < 16; i++){
	inc	(hl)
	jr	00120$
00101$:
	C$shop.c$136$1_0$262	= .
	.globl	C$shop.c$136$1_0$262
;src/shop.c:136: set_win_data(tilestart, 16, &shoptiles_tiles[(tilenumber * 16 * 16) + (upgrade_type * 16 * 16 * 6)]);
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl-), a
	ld	(hl), #0x00
	ldhl	sp,	#27
	ld	a, (hl)
	ldhl	sp,	#19
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#17
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #_shoptiles_tiles
	add	hl, de
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	ldhl	sp,	#19
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_win_data
	add	sp, #4
	C$shop.c$137$1_0$262	= .
	.globl	C$shop.c$137$1_0$262
;src/shop.c:137: if (position == 0) set_win_tiles(3, 5, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	or	a, a
	jr	NZ, 00117$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0x503
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00122$
00117$:
	C$shop.c$138$1_0$262	= .
	.globl	C$shop.c$138$1_0$262
;src/shop.c:138: else if (position == 1) set_win_tiles(8, 5, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	dec	a
	jr	NZ, 00114$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0x508
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00122$
00114$:
	C$shop.c$139$1_0$262	= .
	.globl	C$shop.c$139$1_0$262
;src/shop.c:139: else if (position == 2) set_win_tiles(13, 5, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00111$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0x50d
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00122$
00111$:
	C$shop.c$140$1_0$262	= .
	.globl	C$shop.c$140$1_0$262
;src/shop.c:140: else if (position == 3) set_win_tiles(3, 10, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00108$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0xa03
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00122$
00108$:
	C$shop.c$141$1_0$262	= .
	.globl	C$shop.c$141$1_0$262
;src/shop.c:141: else if (position == 4) set_win_tiles(8, 10, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00105$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0xa08
	push	hl
	call	_set_win_tiles
	add	sp, #6
	jr	00122$
00105$:
	C$shop.c$142$1_0$262	= .
	.globl	C$shop.c$142$1_0$262
;src/shop.c:142: else if (position == 5) set_win_tiles(13, 10, 4, 4, array);
	ldhl	sp,	#26
	ld	a, (hl)
	sub	a, #0x05
	jr	NZ, 00122$
	push	bc
	ld	hl, #0x404
	push	hl
	ld	hl, #0xa0d
	push	hl
	call	_set_win_tiles
	add	sp, #6
00122$:
	C$shop.c$143$1_0$262	= .
	.globl	C$shop.c$143$1_0$262
;src/shop.c:143: }
	add	sp, #24
	pop	hl
	pop	af
	jp	(hl)
	G$load_sub_shop_tiles$0$0	= .
	.globl	G$load_sub_shop_tiles$0$0
	C$shop.c$145$1_0$267	= .
	.globl	C$shop.c$145$1_0$267
;src/shop.c:145: void load_sub_shop_tiles(void) {
;	---------------------------------
; Function load_sub_shop_tiles
; ---------------------------------
_load_sub_shop_tiles::
	C$shop.c$146$2_0$267	= .
	.globl	C$shop.c$146$2_0$267
;src/shop.c:146: for (uint8_t i = 0; i < 6; i++) {
	ld	b, #0x00
00103$:
	ld	a, b
	sub	a, #0x06
	ret	NC
	C$shop.c$147$3_0$268	= .
	.globl	C$shop.c$147$3_0$268
;src/shop.c:147: load_shop_single_tile(SHOP_TILES_START + 16 * i, i, i, currentState);
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0x00a0
	add	hl, de
	ld	e, l
	ld	d, h
	push	bc
	ld	a, (#_currentState)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, b
	call	_load_shop_single_tile
	pop	bc
	C$shop.c$146$2_0$267	= .
	.globl	C$shop.c$146$2_0$267
;src/shop.c:146: for (uint8_t i = 0; i < 6; i++) {
	inc	b
	C$shop.c$149$2_0$267	= .
	.globl	C$shop.c$149$2_0$267
;src/shop.c:149: }
	C$shop.c$149$2_0$267	= .
	.globl	C$shop.c$149$2_0$267
	XG$load_sub_shop_tiles$0$0	= .
	.globl	XG$load_sub_shop_tiles$0$0
	jr	00103$
	G$load_main_shop_tiles$0$0	= .
	.globl	G$load_main_shop_tiles$0$0
	C$shop.c$150$2_0$271	= .
	.globl	C$shop.c$150$2_0$271
;src/shop.c:150: void load_main_shop_tiles(void) {
;	---------------------------------
; Function load_main_shop_tiles
; ---------------------------------
_load_main_shop_tiles::
	dec	sp
	C$shop.c$151$3_0$272	= .
	.globl	C$shop.c$151$3_0$272
;src/shop.c:151: for (uint8_t i = 0; i < 6; i++) {
	ldhl	sp,	#0
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x06
	jr	NC, 00105$
	C$shop.c$152$3_0$272	= .
	.globl	C$shop.c$152$3_0$272
;src/shop.c:152: load_shop_single_tile(SHOP_TILES_START + i * 16, attributes_numbers[i]->upgrade_level, i, i);
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	de, #0x0014
	add	hl, de
	ld	e, (hl)
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #0x00a0
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, e
	ld	e, c
	ld	d, b
	call	_load_shop_single_tile
	C$shop.c$151$2_0$271	= .
	.globl	C$shop.c$151$2_0$271
;src/shop.c:151: for (uint8_t i = 0; i < 6; i++) {
	ldhl	sp,	#0
	inc	(hl)
	jr	00103$
00105$:
	C$shop.c$154$2_0$271	= .
	.globl	C$shop.c$154$2_0$271
;src/shop.c:154: }
	inc	sp
	C$shop.c$154$2_0$271	= .
	.globl	C$shop.c$154$2_0$271
	XG$load_main_shop_tiles$0$0	= .
	.globl	XG$load_main_shop_tiles$0$0
	ret
	G$write_main_shop_text$0$0	= .
	.globl	G$write_main_shop_text$0$0
	C$shop.c$156$2_0$274	= .
	.globl	C$shop.c$156$2_0$274
;src/shop.c:156: void write_main_shop_text(void) {
;	---------------------------------
; Function write_main_shop_text
; ---------------------------------
_write_main_shop_text::
	add	sp, #-10
	C$shop.c$159$1_0$274	= .
	.globl	C$shop.c$159$1_0$274
;src/shop.c:159: itoa(player.money, money_string, 10);
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #1
	add	hl, sp
	push	hl
	push	bc
	call	_itoa
	add	sp, #5
	C$shop.c$161$1_0$274	= .
	.globl	C$shop.c$161$1_0$274
;src/shop.c:161: draw_text(3, 2, "Upgrade Store", 14, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	de, #___str_0
	push	de
	ld	e, #0x02
	ld	a, #0x03
	call	_draw_text
	C$shop.c$163$1_0$274	= .
	.globl	C$shop.c$163$1_0$274
;src/shop.c:163: draw_text(3, 3, attributes_numbers[currentMenu->currentSelection]->attribute_name, 14, TRUE, 0);
	ld	bc, #_attributes_numbers+0
	ld	hl, #_currentMenu
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_currentMenu + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	push	bc
	ld	a,#0x03
	ld	e,a
	call	_draw_text
	C$shop.c$166$1_0$274	= .
	.globl	C$shop.c$166$1_0$274
;src/shop.c:166: draw_text(3, 15, "Money", 5, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	de, #___str_1
	push	de
	ld	e, #0x0f
	ld	a, #0x03
	call	_draw_text
	C$shop.c$167$1_0$274	= .
	.globl	C$shop.c$167$1_0$274
;src/shop.c:167: draw_text(11, 15, money_string, 5, FALSE, 0);
	ld	hl, #0
	add	hl, sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x05
	push	af
	inc	sp
	push	hl
	ld	e, #0x0f
	ld	a, #0x0b
	call	_draw_text
	C$shop.c$168$1_0$274	= .
	.globl	C$shop.c$168$1_0$274
;src/shop.c:168: draw_text(16, 15, "$", 1, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	de, #___str_2
	push	de
	ld	e, #0x0f
	ld	a, #0x10
	call	_draw_text
	C$shop.c$169$1_0$274	= .
	.globl	C$shop.c$169$1_0$274
;src/shop.c:169: }
	add	sp, #10
	C$shop.c$169$1_0$274	= .
	.globl	C$shop.c$169$1_0$274
	XG$write_main_shop_text$0$0	= .
	.globl	XG$write_main_shop_text$0$0
	ret
Fshop$__str_0$0_0$0 == .
___str_0:
	.ascii "Upgrade Store"
	.db 0x00
Fshop$__str_1$0_0$0 == .
___str_1:
	.ascii "Money"
	.db 0x00
Fshop$__str_2$0_0$0 == .
___str_2:
	.ascii "$"
	.db 0x00
	G$write_sub_shop_text$0$0	= .
	.globl	G$write_sub_shop_text$0$0
	C$shop.c$171$1_0$276	= .
	.globl	C$shop.c$171$1_0$276
;src/shop.c:171: void write_sub_shop_text(void) {
;	---------------------------------
; Function write_sub_shop_text
; ---------------------------------
_write_sub_shop_text::
	add	sp, #-28
	C$shop.c$176$1_0$276	= .
	.globl	C$shop.c$176$1_0$276
;src/shop.c:176: itoa(attributes_numbers[currentState]->upgrade_value[currentMenu->currentSelection], upgrade_string, 10);
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x15
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #1
	add	hl, sp
	push	hl
	push	bc
	call	_itoa
	add	sp, #5
	C$shop.c$177$1_0$276	= .
	.globl	C$shop.c$177$1_0$276
;src/shop.c:177: itoa(attributes_numbers[currentState]->upgrade_cost[currentMenu->currentSelection], cost_string, 10);
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x21
	ld	c, a
	jr	NC, 00104$
	inc	b
00104$:
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #9
	add	hl, sp
	push	hl
	push	bc
	call	_itoa
	add	sp, #5
	C$shop.c$178$1_0$276	= .
	.globl	C$shop.c$178$1_0$276
;src/shop.c:178: itoa(player.money, money_string, 10);
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #19
	add	hl, sp
	push	hl
	push	bc
	call	_itoa
	add	sp, #5
	C$shop.c$179$1_0$276	= .
	.globl	C$shop.c$179$1_0$276
;src/shop.c:179: strcat(upgrade_string, attributes_numbers[currentState]->attribute_unit);
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$shop.c$182$1_0$276	= .
	.globl	C$shop.c$182$1_0$276
;src/shop.c:182: draw_text(3, 2, attributes_numbers[currentState]->upgrade_name[currentMenu->currentSelection], 14, TRUE, 0);
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_currentMenu
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	push	bc
	ld	e, #0x02
	ld	a, #0x03
	call	_draw_text
	C$shop.c$184$1_0$276	= .
	.globl	C$shop.c$184$1_0$276
;src/shop.c:184: draw_text(3, 3, upgrade_string, 8, TRUE, 0);
	ld	hl, #0
	add	hl, sp
	xor	a, a
	ld	d, a
	ld	e, #0x01
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	push	hl
	ld	a,#0x03
	ld	e,a
	call	_draw_text
	C$shop.c$185$1_0$276	= .
	.globl	C$shop.c$185$1_0$276
;src/shop.c:185: draw_text(11, 3, cost_string, 5, FALSE, 0);
	ld	hl, #8
	add	hl, sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x05
	push	af
	inc	sp
	push	hl
	ld	e, #0x03
	ld	a, #0x0b
	call	_draw_text
	C$shop.c$186$1_0$276	= .
	.globl	C$shop.c$186$1_0$276
;src/shop.c:186: draw_text(16, 3, "$", 1, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	de, #___str_3
	push	de
	ld	e, #0x03
	ld	a, #0x10
	call	_draw_text
	C$shop.c$188$1_0$276	= .
	.globl	C$shop.c$188$1_0$276
;src/shop.c:188: draw_text(3, 15, "Money", 5, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	de, #___str_4
	push	de
	ld	e, #0x0f
	ld	a, #0x03
	call	_draw_text
	C$shop.c$189$1_0$276	= .
	.globl	C$shop.c$189$1_0$276
;src/shop.c:189: draw_text(11, 15, money_string, 5, FALSE, 0);
	ld	hl, #18
	add	hl, sp
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	a, #0x05
	push	af
	inc	sp
	push	hl
	ld	e, #0x0f
	ld	a, #0x0b
	call	_draw_text
	C$shop.c$190$1_0$276	= .
	.globl	C$shop.c$190$1_0$276
;src/shop.c:190: draw_text(16, 15, "$", 1, TRUE, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	de, #___str_3
	push	de
	ld	e, #0x0f
	ld	a, #0x10
	call	_draw_text
	C$shop.c$191$1_0$276	= .
	.globl	C$shop.c$191$1_0$276
;src/shop.c:191: }
	add	sp, #28
	C$shop.c$191$1_0$276	= .
	.globl	C$shop.c$191$1_0$276
	XG$write_sub_shop_text$0$0	= .
	.globl	XG$write_sub_shop_text$0$0
	ret
Fshop$__str_3$0_0$0 == .
___str_3:
	.ascii "$"
	.db 0x00
Fshop$__str_4$0_0$0 == .
___str_4:
	.ascii "Money"
	.db 0x00
	G$change_sub_shop_tile_palettes$0$0	= .
	.globl	G$change_sub_shop_tile_palettes$0$0
	C$shop.c$194$1_0$279	= .
	.globl	C$shop.c$194$1_0$279
;src/shop.c:194: void change_sub_shop_tile_palettes (void) {
;	---------------------------------
; Function change_sub_shop_tile_palettes
; ---------------------------------
_change_sub_shop_tile_palettes::
	add	sp, #-7
	C$shop.c$195$3_0$280	= .
	.globl	C$shop.c$195$3_0$280
;src/shop.c:195: for (uint8_t i = 0; i < 6; i++) {
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x06
	jp	NC, 00109$
	C$shop.c$196$2_0$279	= .
	.globl	C$shop.c$196$2_0$279
;src/shop.c:196: if (attributes_numbers[currentState]->upgrade_level < i && player.money < attributes_numbers[currentState]->upgrade_cost[i]) {
	ld	hl, #_currentState
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0014
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	a, c
	add	a, a
	ld	b, a
	C$shop.c$197$2_0$279	= .
	.globl	C$shop.c$197$2_0$279
;src/shop.c:197: set_bkg_palette(2 + i, 1, palette_light_grey);
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#2
	ld	(hl), a
	C$shop.c$196$3_0$280	= .
	.globl	C$shop.c$196$3_0$280
;src/shop.c:196: if (attributes_numbers[currentState]->upgrade_level < i && player.money < attributes_numbers[currentState]->upgrade_cost[i]) {
	ld	a, e
	sub	a, c
	jr	NC, 00102$
	inc	hl
	ld	de, #(_player + 342)
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0021
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#3
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00140$
	bit	7, d
	jr	NZ, 00141$
	cp	a, a
	jr	00141$
00140$:
	bit	7, d
	jr	Z, 00141$
	scf
00141$:
	jr	NC, 00102$
	C$shop.c$197$4_0$281	= .
	.globl	C$shop.c$197$4_0$281
;src/shop.c:197: set_bkg_palette(2 + i, 1, palette_light_grey);
	push	bc
	ld	de, #_palette_light_grey
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	pop	bc
	jr	00108$
00102$:
	C$shop.c$199$4_0$282	= .
	.globl	C$shop.c$199$4_0$282
;src/shop.c:199: set_bkg_palette(2 + i, 1, attributes_numbers[currentState]->color_palette[i]);
	pop	de
	push	de
	ld	hl, #0x002d
	add	hl, de
	ld	e, l
	ld	d, h
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	pop	bc
00108$:
	C$shop.c$195$2_0$279	= .
	.globl	C$shop.c$195$2_0$279
;src/shop.c:195: for (uint8_t i = 0; i < 6; i++) {
	inc	c
	jp	00107$
00109$:
	C$shop.c$202$2_0$279	= .
	.globl	C$shop.c$202$2_0$279
;src/shop.c:202: }
	add	sp, #7
	C$shop.c$202$2_0$279	= .
	.globl	C$shop.c$202$2_0$279
	XG$change_sub_shop_tile_palettes$0$0	= .
	.globl	XG$change_sub_shop_tile_palettes$0$0
	ret
	G$change_main_shop_tile_palettes$0$0	= .
	.globl	G$change_main_shop_tile_palettes$0$0
	C$shop.c$204$2_0$285	= .
	.globl	C$shop.c$204$2_0$285
;src/shop.c:204: void change_main_shop_tile_palettes (void) {
;	---------------------------------
; Function change_main_shop_tile_palettes
; ---------------------------------
_change_main_shop_tile_palettes::
	C$shop.c$205$3_0$286	= .
	.globl	C$shop.c$205$3_0$286
;src/shop.c:205: for (uint8_t i = 0; i < 6; i++) {
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x06
	ret	NC
	C$shop.c$206$3_0$286	= .
	.globl	C$shop.c$206$3_0$286
;src/shop.c:206: set_bkg_palette(2 + i, 1, attributes_numbers[i]->color_palette[attributes_numbers[i]->upgrade_level]);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	a, (hl+)
;	spillPairReg hl
	ld	b, a
	ld	h, (hl)
	add	a, #0x2d
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	a, b
	add	a, #0x14
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00122$
	inc	h
00122$:
	ld	a, (hl)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	add	a, #0x02
	push	bc
	push	hl
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	pop	bc
	C$shop.c$205$2_0$285	= .
	.globl	C$shop.c$205$2_0$285
;src/shop.c:205: for (uint8_t i = 0; i < 6; i++) {
	inc	c
	C$shop.c$208$2_0$285	= .
	.globl	C$shop.c$208$2_0$285
;src/shop.c:208: }
	C$shop.c$208$2_0$285	= .
	.globl	C$shop.c$208$2_0$285
	XG$change_main_shop_tile_palettes$0$0	= .
	.globl	XG$change_main_shop_tile_palettes$0$0
	jr	00103$
	G$attempt_purchase$0$0	= .
	.globl	G$attempt_purchase$0$0
	C$shop.c$211$2_0$288	= .
	.globl	C$shop.c$211$2_0$288
;src/shop.c:211: void attempt_purchase(MenuState currentState, Menu *currentMenu) {
;	---------------------------------
; Function attempt_purchase
; ---------------------------------
_attempt_purchase::
	add	sp, #-10
	ldhl	sp,	#9
	ld	(hl), a
	ld	c, e
	ld	b, d
	C$shop.c$213$1_0$288	= .
	.globl	C$shop.c$213$1_0$288
;src/shop.c:213: player_attributes *currentAttributes = attributes_numbers[currentState];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_attributes_numbers
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	C$shop.c$214$1_0$288	= .
	.globl	C$shop.c$214$1_0$288
;src/shop.c:214: uint16_t cost = currentAttributes->upgrade_cost[currentMenu->currentSelection];
	pop	de
	push	de
	ld	hl, #0x0021
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (bc)
	ld	c, a
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	C$shop.c$215$1_0$288	= .
	.globl	C$shop.c$215$1_0$288
;src/shop.c:215: uint8_t upgrade_to = currentMenu->currentSelection;
	ldhl	sp,	#4
	ld	(hl), c
	C$shop.c$218$1_0$288	= .
	.globl	C$shop.c$218$1_0$288
;src/shop.c:218: if (currentAttributes->upgrade_level >= upgrade_to) {
	pop	de
	push	de
	ld	hl, #0x0014
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#4
	sub	a, (hl)
	C$shop.c$219$2_0$289	= .
	.globl	C$shop.c$219$2_0$289
;src/shop.c:219: return;
	jp	NC,00105$
	C$shop.c$223$1_0$288	= .
	.globl	C$shop.c$223$1_0$288
;src/shop.c:223: if (player.money >= cost) {
	ld	de, #(_player + 342)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	C, 00105$
	C$shop.c$225$2_0$290	= .
	.globl	C$shop.c$225$2_0$290
;src/shop.c:225: player.money -= cost;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	de, #(_player + 342)
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$shop.c$226$2_0$290	= .
	.globl	C$shop.c$226$2_0$290
;src/shop.c:226: currentAttributes->upgrade_level = upgrade_to;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	C$shop.c$227$2_0$290	= .
	.globl	C$shop.c$227$2_0$290
;src/shop.c:227: currentAttributes->max_value = currentAttributes->current_value = currentAttributes->upgrade_value[upgrade_to];
	pop	de
	push	de
	ld	hl, #0x0012
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0015
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, a
	ld	l, a
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00105$:
	C$shop.c$232$1_0$288	= .
	.globl	C$shop.c$232$1_0$288
;src/shop.c:232: }
	add	sp, #10
	C$shop.c$232$1_0$288	= .
	.globl	C$shop.c$232$1_0$288
	XG$attempt_purchase$0$0	= .
	.globl	XG$attempt_purchase$0$0
	ret
	G$handleInput$0$0	= .
	.globl	G$handleInput$0$0
	C$shop.c$235$1_0$293	= .
	.globl	C$shop.c$235$1_0$293
;src/shop.c:235: void handleInput(MenuState *currentState, Menu *currentMenu) {
;	---------------------------------
; Function handleInput
; ---------------------------------
_handleInput::
	add	sp, #-7
	ldhl	sp,	#5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$shop.c$236$1_0$293	= .
	.globl	C$shop.c$236$1_0$293
;src/shop.c:236: if (prev_buttons != buttons) {
	ld	a, (#_prev_buttons)
	ld	hl, #_buttons
	sub	a, (hl)
	jp	Z,00160$
	C$shop.c$237$1_0$293	= .
	.globl	C$shop.c$237$1_0$293
;src/shop.c:237: if (buttons & J_UP) {
	ld	a, (#_buttons)
	ldhl	sp,	#2
	ld	(hl), a
	push	hl
	bit	2, (hl)
	pop	hl
	jr	Z, 00118$
	C$shop.c$238$3_0$295	= .
	.globl	C$shop.c$238$3_0$295
;src/shop.c:238: if (currentMenu->currentSelection > 2) currentMenu->currentSelection -= 3;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	a, #0x02
	sub	a, (hl)
	jp	NC, 00119$
	ld	a, (hl+)
	add	a, #0xfd
	ld	c, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00119$
00118$:
	C$shop.c$239$2_0$294	= .
	.globl	C$shop.c$239$2_0$294
;src/shop.c:239: } else if (buttons & J_DOWN) {
	push	hl
	ldhl	sp,	#4
	bit	3, (hl)
	pop	hl
	jr	Z, 00115$
	C$shop.c$240$3_0$296	= .
	.globl	C$shop.c$240$3_0$296
;src/shop.c:240: if (currentMenu->currentSelection < 3) currentMenu->currentSelection += 3;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	sub	a, #0x03
	jr	NC, 00119$
	ld	a, (hl+)
	ld	c, a
	inc	c
	inc	c
	inc	c
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00119$
00115$:
	C$shop.c$241$2_0$294	= .
	.globl	C$shop.c$241$2_0$294
;src/shop.c:241: } else if (buttons & J_LEFT) {
	push	hl
	ldhl	sp,	#4
	bit	1, (hl)
	pop	hl
	jr	Z, 00112$
	C$shop.c$242$3_0$297	= .
	.globl	C$shop.c$242$3_0$297
;src/shop.c:242: if (currentMenu->currentSelection % 3 != 0) currentMenu->currentSelection--;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	bc, #0x0003
	ld	e, (hl)
	ld	d, #0x00
	call	__modsint
	ld	a, b
	or	a, c
	jr	Z, 00119$
	ldhl	sp,	#0
	ld	c, (hl)
	dec	c
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	jr	00119$
00112$:
	C$shop.c$243$2_0$294	= .
	.globl	C$shop.c$243$2_0$294
;src/shop.c:243: } else if (buttons & J_RIGHT) {
	push	hl
	ldhl	sp,	#4
	bit	0, (hl)
	pop	hl
	jr	Z, 00119$
	C$shop.c$244$3_0$298	= .
	.globl	C$shop.c$244$3_0$298
;src/shop.c:244: if ((currentMenu->currentSelection % 3) != 2) currentMenu->currentSelection++;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, #0x00
	push	hl
	ld	bc, #0x0003
	call	__modsint
	pop	hl
	ld	a, c
	sub	a, #0x02
	or	a, b
	jr	Z, 00119$
	ld	c, l
	inc	c
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
00119$:
	C$shop.c$248$2_0$294	= .
	.globl	C$shop.c$248$2_0$294
;src/shop.c:248: if (buttons & J_A) {
	ld	a, (#_buttons)
	bit	4, a
	jp	Z,00147$
	C$shop.c$249$3_0$299	= .
	.globl	C$shop.c$249$3_0$299
;src/shop.c:249: switch (*currentState) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x06
	sub	a, c
	jr	C, 00147$
	ld	e, c
	ld	d, #0x00
	ld	hl, #00302$
	add	hl, de
	add	hl, de
	C$shop.c$250$4_0$300	= .
	.globl	C$shop.c$250$4_0$300
;src/shop.c:250: case MAIN_MENU:
	jp	(hl)
00302$:
	jr	00143$
	jr	00143$
	jr	00143$
	jr	00143$
	jr	00143$
	jr	00143$
	jr	00120$
00120$:
	C$shop.c$238$1_0$293	= .
	.globl	C$shop.c$238$1_0$293
;src/shop.c:238: if (currentMenu->currentSelection > 2) currentMenu->currentSelection -= 3;
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	C$shop.c$252$4_0$300	= .
	.globl	C$shop.c$252$4_0$300
;src/shop.c:252: if (currentMenu->currentSelection == 0) *currentState = DRILL_MENU;
	or	a, a
	jr	NZ, 00136$
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	jr	00147$
00136$:
	C$shop.c$253$4_0$300	= .
	.globl	C$shop.c$253$4_0$300
;src/shop.c:253: else if (currentMenu->currentSelection == 1) *currentState = HULL_MENU;
	cp	a, #0x01
	jr	NZ, 00133$
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
	jr	00147$
00133$:
	C$shop.c$254$4_0$300	= .
	.globl	C$shop.c$254$4_0$300
;src/shop.c:254: else if (currentMenu->currentSelection == 2) *currentState = ENGINE_MENU;
	cp	a, #0x02
	jr	NZ, 00130$
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	jr	00147$
00130$:
	C$shop.c$255$4_0$300	= .
	.globl	C$shop.c$255$4_0$300
;src/shop.c:255: else if (currentMenu->currentSelection == 3) *currentState = FUEL_MENU;
	cp	a, #0x03
	jr	NZ, 00127$
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x03
	jr	00147$
00127$:
	C$shop.c$256$4_0$300	= .
	.globl	C$shop.c$256$4_0$300
;src/shop.c:256: else if (currentMenu->currentSelection == 4) *currentState = RADIATOR_MENU;
	cp	a, #0x04
	jr	NZ, 00124$
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x04
	jr	00147$
00124$:
	C$shop.c$257$4_0$300	= .
	.globl	C$shop.c$257$4_0$300
;src/shop.c:257: else if (currentMenu->currentSelection == 5) *currentState = CARGO_MENU;
	sub	a, #0x05
	jr	NZ, 00147$
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x05
	C$shop.c$258$4_0$300	= .
	.globl	C$shop.c$258$4_0$300
;src/shop.c:258: break;
	jr	00147$
	C$shop.c$264$4_0$300	= .
	.globl	C$shop.c$264$4_0$300
;src/shop.c:264: case CARGO_MENU:
00143$:
	C$shop.c$265$4_0$300	= .
	.globl	C$shop.c$265$4_0$300
;src/shop.c:265: attempt_purchase(*currentState, currentMenu);
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	call	_attempt_purchase
	C$shop.c$269$2_0$294	= .
	.globl	C$shop.c$269$2_0$294
;src/shop.c:269: }
00147$:
	C$shop.c$273$2_0$294	= .
	.globl	C$shop.c$273$2_0$294
;src/shop.c:273: if (buttons & J_B) {
	ld	a, (#_buttons)
	bit	5, a
	jr	Z, 00160$
	C$shop.c$274$3_0$301	= .
	.globl	C$shop.c$274$3_0$301
;src/shop.c:274: switch (*currentState) {
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ld	a, #0x06
	sub	a, c
	jr	C, 00160$
	ld	b, #0x00
	ld	hl, #00314$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00314$:
	jp	00154$
	jp	00154$
	jp	00154$
	jp	00154$
	jp	00154$
	jp	00154$
	jp	00148$
	C$shop.c$275$4_0$302	= .
	.globl	C$shop.c$275$4_0$302
;src/shop.c:275: case MAIN_MENU:
00148$:
	C$shop.c$276$4_0$302	= .
	.globl	C$shop.c$276$4_0$302
;src/shop.c:276: currentGameState = GAME_STATE_PLAY;
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	C$shop.c$277$4_0$302	= .
	.globl	C$shop.c$277$4_0$302
;src/shop.c:277: main_menu.currentSelection = 0;
	ld	hl, #_main_menu
	ld	(hl), #0x00
	C$shop.c$278$4_0$302	= .
	.globl	C$shop.c$278$4_0$302
;src/shop.c:278: drill_menu.currentSelection = 0;
	ld	hl, #_drill_menu
	ld	(hl), #0x00
	C$shop.c$279$4_0$302	= .
	.globl	C$shop.c$279$4_0$302
;src/shop.c:279: hull_menu.currentSelection = 0;
	ld	hl, #_hull_menu
	ld	(hl), #0x00
	C$shop.c$280$4_0$302	= .
	.globl	C$shop.c$280$4_0$302
;src/shop.c:280: engine_menu.currentSelection = 0;
	ld	hl, #_engine_menu
	ld	(hl), #0x00
	C$shop.c$281$4_0$302	= .
	.globl	C$shop.c$281$4_0$302
;src/shop.c:281: fuel_menu.currentSelection = 0;
	ld	hl, #_fuel_menu
	ld	(hl), #0x00
	C$shop.c$282$4_0$302	= .
	.globl	C$shop.c$282$4_0$302
;src/shop.c:282: radiator_menu.currentSelection = 0;
	ld	hl, #_radiator_menu
	ld	(hl), #0x00
	C$shop.c$283$4_0$302	= .
	.globl	C$shop.c$283$4_0$302
;src/shop.c:283: cargo_menu.currentSelection = 0;
	ld	hl, #_cargo_menu
	ld	(hl), #0x00
	C$shop.c$284$4_0$302	= .
	.globl	C$shop.c$284$4_0$302
;src/shop.c:284: break;
	jr	00160$
	C$shop.c$290$4_0$302	= .
	.globl	C$shop.c$290$4_0$302
;src/shop.c:290: case CARGO_MENU:
00154$:
	C$shop.c$291$4_0$302	= .
	.globl	C$shop.c$291$4_0$302
;src/shop.c:291: *currentState = MAIN_MENU; // Go back to the main menu
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x06
	C$shop.c$293$1_0$293	= .
	.globl	C$shop.c$293$1_0$293
;src/shop.c:293: }
00160$:
	C$shop.c$296$1_0$293	= .
	.globl	C$shop.c$296$1_0$293
;src/shop.c:296: }
	add	sp, #7
	C$shop.c$296$1_0$293	= .
	.globl	C$shop.c$296$1_0$293
	XG$handleInput$0$0	= .
	.globl	XG$handleInput$0$0
	ret
	.area _CODE_2
	.area _INITIALIZER
Fshop$__xinit_menu_numbers$0_0$0 == .
__xinit__menu_numbers:
	.dw _drill_menu
	.dw _hull_menu
	.dw _engine_menu
	.dw _fuel_menu
	.dw _radiator_menu
	.dw _cargo_menu
	.dw _main_menu
Fshop$__xinit_drill_menu$0_0$0 == .
__xinit__drill_menu:
	.db #0x00	; 0
Fshop$__xinit_hull_menu$0_0$0 == .
__xinit__hull_menu:
	.db #0x00	; 0
Fshop$__xinit_engine_menu$0_0$0 == .
__xinit__engine_menu:
	.db #0x00	; 0
Fshop$__xinit_fuel_menu$0_0$0 == .
__xinit__fuel_menu:
	.db #0x00	; 0
Fshop$__xinit_radiator_menu$0_0$0 == .
__xinit__radiator_menu:
	.db #0x00	; 0
Fshop$__xinit_cargo_menu$0_0$0 == .
__xinit__cargo_menu:
	.db #0x00	; 0
Fshop$__xinit_main_menu$0_0$0 == .
__xinit__main_menu:
	.db #0x00	; 0
Fshop$__xinit_currentState$0_0$0 == .
__xinit__currentState:
	.db #0x06	; 6
Fshop$__xinit_currentMenu$0_0$0 == .
__xinit__currentMenu:
	.dw _main_menu
	.area _CABS (ABS)
