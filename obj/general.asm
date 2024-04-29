;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module general
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _draw_number_sprite
	.globl _draw_text
	.globl _convert_char_to_tile
	.globl _read_buttons
	.globl _init_clear_screen
	.globl _init_screen
	.globl _init_font
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _strlen
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _sprintf
	.globl _set_sprite_data
	.globl _set_win_tile_xy
	.globl _get_win_xy_addr
	.globl _set_bkg_tiles
	.globl _set_vram_byte
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
	G$init_font$0$0	= .
	.globl	G$init_font$0$0
	C$general.c$13$0_0$154	= .
	.globl	C$general.c$13$0_0$154
;src/general.c:13: void init_font(void){
;	---------------------------------
; Function init_font
; ---------------------------------
_init_font::
	C$general.c$15$1_0$154	= .
	.globl	C$general.c$15$1_0$154
;src/general.c:15: font_init();
	call	_font_init
	C$general.c$16$1_0$154	= .
	.globl	C$general.c$16$1_0$154
;src/general.c:16: min_font = font_load(font_ibm);
	ld	de, #_font_ibm
	push	de
	call	_font_load
	pop	hl
	C$general.c$17$1_0$154	= .
	.globl	C$general.c$17$1_0$154
;src/general.c:17: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
	C$general.c$18$1_0$154	= .
	.globl	C$general.c$18$1_0$154
;src/general.c:18: }
	C$general.c$18$1_0$154	= .
	.globl	C$general.c$18$1_0$154
	XG$init_font$0$0	= .
	.globl	XG$init_font$0$0
	ret
	G$init_screen$0$0	= .
	.globl	G$init_screen$0$0
	C$general.c$20$1_0$156	= .
	.globl	C$general.c$20$1_0$156
;src/general.c:20: void init_screen(void){
;	---------------------------------
; Function init_screen
; ---------------------------------
_init_screen::
	C$general.c$21$1_0$156	= .
	.globl	C$general.c$21$1_0$156
;src/general.c:21: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$general.c$22$1_0$156	= .
	.globl	C$general.c$22$1_0$156
;src/general.c:22: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	C$general.c$23$1_0$156	= .
	.globl	C$general.c$23$1_0$156
;src/general.c:23: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$general.c$24$1_0$156	= .
	.globl	C$general.c$24$1_0$156
;src/general.c:24: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	C$general.c$25$1_0$156	= .
	.globl	C$general.c$25$1_0$156
;src/general.c:25: }
	C$general.c$25$1_0$156	= .
	.globl	C$general.c$25$1_0$156
	XG$init_screen$0$0	= .
	.globl	XG$init_screen$0$0
	ret
	G$init_clear_screen$0$0	= .
	.globl	G$init_clear_screen$0$0
	C$general.c$27$1_0$158	= .
	.globl	C$general.c$27$1_0$158
;src/general.c:27: void init_clear_screen(void) {
;	---------------------------------
; Function init_clear_screen
; ---------------------------------
_init_clear_screen::
	ld	hl, #-4096
	add	hl, sp
	ld	sp, hl
	C$general.c$30$3_0$160	= .
	.globl	C$general.c$30$3_0$160
;src/general.c:30: for (uint16_t i = 0; i < 2048; i++){
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ld	de, #0x0000
00107$:
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	sub	a, #0x08
	jr	NC, 00101$
	C$general.c$31$3_0$160	= .
	.globl	C$general.c$31$3_0$160
;src/general.c:31: temparray[i] = 0;
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, bc
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	C$general.c$30$2_0$159	= .
	.globl	C$general.c$30$2_0$159
;src/general.c:30: for (uint16_t i = 0; i < 2048; i++){
	inc	de
	jr	00107$
00101$:
	C$general.c$33$1_0$158	= .
	.globl	C$general.c$33$1_0$158
;src/general.c:33: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$general.c$34$1_0$158	= .
	.globl	C$general.c$34$1_0$158
;src/general.c:34: set_bkg_tiles(0,0,20, 18, temparray);
	push	bc
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
	C$general.c$35$1_0$158	= .
	.globl	C$general.c$35$1_0$158
;src/general.c:35: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$general.c$38$3_0$162	= .
	.globl	C$general.c$38$3_0$162
;src/general.c:38: for (uint8_t i = 0; i < 8; i++) {
	ld	d, #0x00
00110$:
	ld	a, d
	sub	a, #0x08
	jr	NC, 00102$
	C$general.c$39$3_0$162	= .
	.globl	C$general.c$39$3_0$162
;src/general.c:39: set_sprite_palette(i, 1, palette_default);
	push	bc
	push	de
	ld	hl, #_palette_default
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_sprite_palette
	add	sp, #4
	pop	de
	push	de
	ld	hl, #_palette_default
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_palette
	add	sp, #4
	pop	de
	pop	bc
	C$general.c$38$2_0$161	= .
	.globl	C$general.c$38$2_0$161
;src/general.c:38: for (uint8_t i = 0; i < 8; i++) {
	inc	d
	jr	00110$
00102$:
	C$general.c$44$1_0$158	= .
	.globl	C$general.c$44$1_0$158
;src/general.c:44: set_sprite_data(0, 128, temparray);
	push	bc
	ld	hl, #0x8000
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$general.c$47$2_0$158	= .
	.globl	C$general.c$47$2_0$158
;src/general.c:47: for (uint8_t i = 0; i < 40; i++) {
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00115$
;/usr/local/opt/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x00
;/usr/local/opt/gbdk/include/gb/gb.h:1905: shadow_OAM[nb].y = 0;
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	(hl), #0x00
	C$general.c$47$2_0$163	= .
	.globl	C$general.c$47$2_0$163
;src/general.c:47: for (uint8_t i = 0; i < 40; i++) {
	inc	c
	jr	00113$
00115$:
	C$general.c$51$2_0$158	= .
	.globl	C$general.c$51$2_0$158
;src/general.c:51: }
	ld	hl, #4096
	add	hl, sp
	ld	sp, hl
	C$general.c$51$2_0$158	= .
	.globl	C$general.c$51$2_0$158
	XG$init_clear_screen$0$0	= .
	.globl	XG$init_clear_screen$0$0
	ret
	G$read_buttons$0$0	= .
	.globl	G$read_buttons$0$0
	C$general.c$53$2_0$172	= .
	.globl	C$general.c$53$2_0$172
;src/general.c:53: void read_buttons(void) {
;	---------------------------------
; Function read_buttons
; ---------------------------------
_read_buttons::
	C$general.c$54$1_0$172	= .
	.globl	C$general.c$54$1_0$172
;src/general.c:54: buttons = joypad(); // Read current gamepad state
	call	_joypad
	ld	(#_buttons),a
	C$general.c$55$1_0$172	= .
	.globl	C$general.c$55$1_0$172
;src/general.c:55: }
	C$general.c$55$1_0$172	= .
	.globl	C$general.c$55$1_0$172
	XG$read_buttons$0$0	= .
	.globl	XG$read_buttons$0$0
	ret
	G$convert_char_to_tile$0$0	= .
	.globl	G$convert_char_to_tile$0$0
	C$general.c$57$1_0$174	= .
	.globl	C$general.c$57$1_0$174
;src/general.c:57: unsigned char convert_char_to_tile(char c) {
;	---------------------------------
; Function convert_char_to_tile
; ---------------------------------
_convert_char_to_tile::
	C$general.c$58$1_0$174	= .
	.globl	C$general.c$58$1_0$174
;src/general.c:58: if (c >= 'A' && c <= 'Z') return LETTERSTART + (c - 'A');
	ld	c, a
	xor	a, #0x80
	sub	a, #0xc1
	jr	C, 00102$
	ld	e, c
	ld	a,#0x5a
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00236$
	bit	7, d
	jr	NZ, 00237$
	cp	a, a
	jr	00237$
00236$:
	bit	7, d
	jr	Z, 00237$
	scf
00237$:
	jr	C, 00102$
	ld	a, c
	add	a, #0xe0
	ret
00102$:
	C$general.c$59$1_0$174	= .
	.globl	C$general.c$59$1_0$174
;src/general.c:59: if (c >= 'a' && c <= 'z') return SLETTERSTART + (c - 'a');
	ld	a, c
	xor	a, #0x80
	sub	a, #0xe1
	jr	C, 00105$
	ld	e, c
	ld	a,#0x7a
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00238$
	bit	7, d
	jr	NZ, 00239$
	cp	a, a
	jr	00239$
00238$:
	bit	7, d
	jr	Z, 00239$
	scf
00239$:
	jr	C, 00105$
	ld	a, c
	add	a, #0xe0
	ret
00105$:
	C$general.c$60$1_0$174	= .
	.globl	C$general.c$60$1_0$174
;src/general.c:60: if (c >= '0' && c <= '9') return NUMSTART + (c - '0');
	ld	a, c
	xor	a, #0x80
	sub	a, #0xb0
	jr	C, 00108$
	ld	e, c
	ld	a,#0x39
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00240$
	bit	7, d
	jr	NZ, 00241$
	cp	a, a
	jr	00241$
00240$:
	bit	7, d
	jr	Z, 00241$
	scf
00241$:
	jr	C, 00108$
	ld	a, c
	add	a, #0xe0
	ret
00108$:
	C$general.c$61$1_0$174	= .
	.globl	C$general.c$61$1_0$174
;src/general.c:61: switch (c) {
	ld	a,c
	cp	a,#0x20
	jr	Z, 00119$
	cp	a,#0x21
	jr	Z, 00118$
	cp	a,#0x24
	jr	Z, 00116$
	cp	a,#0x26
	jr	Z, 00117$
	cp	a,#0x2a
	jr	Z, 00114$
	cp	a,#0x2d
	jr	Z, 00112$
	cp	a,#0x2e
	jr	Z, 00111$
	cp	a,#0x2f
	jr	Z, 00110$
	cp	a,#0x3d
	jr	Z, 00113$
	sub	a, #0x3f
	jr	Z, 00115$
	jr	00120$
	C$general.c$62$2_0$175	= .
	.globl	C$general.c$62$2_0$175
;src/general.c:62: case '/': return 15;
00110$:
	ld	a, #0x0f
	ret
	C$general.c$63$2_0$175	= .
	.globl	C$general.c$63$2_0$175
;src/general.c:63: case '.': return 14;
00111$:
	ld	a, #0x0e
	ret
	C$general.c$64$2_0$175	= .
	.globl	C$general.c$64$2_0$175
;src/general.c:64: case '-': return 13;
00112$:
	ld	a, #0x0d
	ret
	C$general.c$65$2_0$175	= .
	.globl	C$general.c$65$2_0$175
;src/general.c:65: case '=': return 38;
00113$:
	ld	a, #0x26
	ret
	C$general.c$66$2_0$175	= .
	.globl	C$general.c$66$2_0$175
;src/general.c:66: case '*': return 39;
00114$:
	ld	a, #0x27
	ret
	C$general.c$67$2_0$175	= .
	.globl	C$general.c$67$2_0$175
;src/general.c:67: case '?': return 31;
00115$:
	ld	a, #0x1f
	ret
	C$general.c$68$2_0$175	= .
	.globl	C$general.c$68$2_0$175
;src/general.c:68: case '$': return 4;
00116$:
	ld	a, #0x04
	ret
	C$general.c$69$2_0$175	= .
	.globl	C$general.c$69$2_0$175
;src/general.c:69: case '&': return 5;
00117$:
	ld	a, #0x05
	ret
	C$general.c$70$2_0$175	= .
	.globl	C$general.c$70$2_0$175
;src/general.c:70: case '!': return 1;
00118$:
	ld	a, #0x01
	ret
	C$general.c$71$2_0$175	= .
	.globl	C$general.c$71$2_0$175
;src/general.c:71: case ' ': return 0;
00119$:
	xor	a, a
	ret
	C$general.c$72$2_0$175	= .
	.globl	C$general.c$72$2_0$175
;src/general.c:72: default: return 0;  // Default to space if character is not handled
00120$:
	xor	a, a
	C$general.c$73$1_0$174	= .
	.globl	C$general.c$73$1_0$174
;src/general.c:73: }
	C$general.c$74$1_0$174	= .
	.globl	C$general.c$74$1_0$174
;src/general.c:74: }
	C$general.c$74$1_0$174	= .
	.globl	C$general.c$74$1_0$174
	XG$convert_char_to_tile$0$0	= .
	.globl	XG$convert_char_to_tile$0$0
	ret
	G$draw_text$0$0	= .
	.globl	G$draw_text$0$0
	C$general.c$76$1_0$177	= .
	.globl	C$general.c$76$1_0$177
;src/general.c:76: void draw_text(uint8_t x, uint8_t y, const char *text, uint8_t length, BOOLEAN left_aligned, unsigned char palette) {
;	---------------------------------
; Function draw_text
; ---------------------------------
_draw_text::
	add	sp, #-14
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
	C$general.c$77$1_0$177	= .
	.globl	C$general.c$77$1_0$177
;src/general.c:77: uint8_t textLength = strlen(text);
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_strlen
	pop	hl
	ldhl	sp,	#2
	ld	(hl), e
	C$general.c$78$1_0$177	= .
	.globl	C$general.c$78$1_0$177
;src/general.c:78: uint8_t *vramAddr = get_win_xy_addr(x, y);
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_get_win_xy_addr
	pop	hl
	ldhl	sp,	#11
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	C$general.c$80$1_0$177	= .
	.globl	C$general.c$80$1_0$177
;src/general.c:80: if (textLength > length) {
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00102$
	C$general.c$81$2_0$178	= .
	.globl	C$general.c$81$2_0$178
;src/general.c:81: textLength = length;  // Cap the text length at the defined maximum
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
00102$:
	C$general.c$87$1_0$177	= .
	.globl	C$general.c$87$1_0$177
;src/general.c:87: vramAddr += length - textLength;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	(hl), e
	C$general.c$85$1_0$177	= .
	.globl	C$general.c$85$1_0$177
;src/general.c:85: if (!left_aligned) {
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
	C$general.c$87$2_0$179	= .
	.globl	C$general.c$87$2_0$179
;src/general.c:87: vramAddr += length - textLength;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
	C$general.c$88$2_0$179	= .
	.globl	C$general.c$88$2_0$179
;src/general.c:88: x += length - textLength;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#2
	sub	a, (hl)
	ldhl	sp,	#10
	add	a, (hl)
	ld	(hl), a
00104$:
	C$general.c$92$1_0$177	= .
	.globl	C$general.c$92$1_0$177
;src/general.c:92: if (!left_aligned) {
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jp	NZ, 00129$
	C$general.c$93$4_0$182	= .
	.globl	C$general.c$93$4_0$182
;src/general.c:93: for (uint8_t i = 0; i < length - textLength; i++) {
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#18
	sub	a, (hl)
	ldhl	sp,	#2
	add	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#13
	ld	(hl), #0x00
00113$:
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#0
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
	ld	e, (hl)
	bit	7, e
	jr	Z, 00196$
	bit	7, d
	jr	NZ, 00197$
	cp	a, a
	jr	00197$
00196$:
	bit	7, d
	jr	Z, 00197$
	scf
00197$:
	jr	NC, 00129$
	C$general.c$94$4_0$182	= .
	.globl	C$general.c$94$4_0$182
;src/general.c:94: set_win_tile_xy(x - length + textLength + i, y, palette);
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#13
	add	a, (hl)
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tile_xy
	add	sp, #3
	C$general.c$95$4_0$182	= .
	.globl	C$general.c$95$4_0$182
;src/general.c:95: set_vram_byte(vramAddr - length + textLength + i, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
	ld	a, #0x20
	call	_convert_char_to_tile
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#3
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, a
	ld	c, e
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	call	_set_vram_byte
	C$general.c$93$3_0$181	= .
	.globl	C$general.c$93$3_0$181
;src/general.c:93: for (uint8_t i = 0; i < length - textLength; i++) {
	ldhl	sp,	#13
	inc	(hl)
	jr	00113$
	C$general.c$100$1_0$177	= .
	.globl	C$general.c$100$1_0$177
;src/general.c:100: for (uint8_t i = 0; i < textLength; i++) {
00129$:
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ld	c, #0x00
00116$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	jr	NC, 00108$
	C$general.c$101$3_0$184	= .
	.globl	C$general.c$101$3_0$184
;src/general.c:101: set_win_tile_xy(x + i, y, palette);
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, c
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tile_xy
	add	sp, #3
	C$general.c$102$3_0$184	= .
	.globl	C$general.c$102$3_0$184
;src/general.c:102: set_vram_byte(vramAddr++, convert_char_to_tile(text[i]));
	ldhl	sp,#16
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	b, a
	push	bc
	ld	a, b
	call	_convert_char_to_tile
	ld	e, a
	pop	bc
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl-)
	ld	d, a
	inc	(hl)
	jr	NZ, 00198$
	inc	hl
	inc	(hl)
00198$:
	ld	a, e
	ld	e, b
	call	_set_vram_byte
	C$general.c$100$2_0$183	= .
	.globl	C$general.c$100$2_0$183
;src/general.c:100: for (uint8_t i = 0; i < textLength; i++) {
	inc	c
	jr	00116$
00108$:
	C$general.c$106$1_0$177	= .
	.globl	C$general.c$106$1_0$177
;src/general.c:106: if (left_aligned) {
	ldhl	sp,	#19
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
	C$general.c$107$1_0$177	= .
	.globl	C$general.c$107$1_0$177
;src/general.c:107: for (uint8_t i = textLength; i < length; i++) {
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, (hl)
	ldhl	sp,	#11
	ld	(hl), a
00119$:
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#18
	sub	a, (hl)
	jr	NC, 00121$
	C$general.c$108$4_0$187	= .
	.globl	C$general.c$108$4_0$187
;src/general.c:108: set_win_tile_xy(x + i, y, palette);
	ldhl	sp,	#10
	ld	a, (hl+)
	add	a, (hl)
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_win_tile_xy
	add	sp, #3
	C$general.c$109$4_0$187	= .
	.globl	C$general.c$109$4_0$187
;src/general.c:109: set_vram_byte(vramAddr++, convert_char_to_tile(' '));  // Assuming tile 0 is a space or zero
	ld	a, #0x20
	call	_convert_char_to_tile
	ld	c, a
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#12
	inc	(hl)
	jr	NZ, 00199$
	inc	hl
	inc	(hl)
00199$:
	ld	a, c
	ldhl	sp,	#7
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
	C$general.c$107$3_0$186	= .
	.globl	C$general.c$107$3_0$186
;src/general.c:107: for (uint8_t i = textLength; i < length; i++) {
	ldhl	sp,	#11
	inc	(hl)
	jr	00119$
00121$:
	C$general.c$112$1_0$177	= .
	.globl	C$general.c$112$1_0$177
;src/general.c:112: }
	add	sp, #14
	pop	hl
	add	sp, #5
	jp	(hl)
	G$draw_number_sprite$0$0	= .
	.globl	G$draw_number_sprite$0$0
	C$general.c$114$1_0$189	= .
	.globl	C$general.c$114$1_0$189
;src/general.c:114: void draw_number_sprite(uint8_t x, uint8_t y, uint16_t number, uint8_t digits, int8_t tileoffset, int8_t fontspacing) {
;	---------------------------------
; Function draw_number_sprite
; ---------------------------------
_draw_number_sprite::
	add	sp, #-15
	ld	c, a
	ldhl	sp,	#13
	ld	(hl), e
	C$general.c$118$1_0$189	= .
	.globl	C$general.c$118$1_0$189
;src/general.c:118: sprintf(buffer, "%u", number);
	push	bc
	ldhl	sp,	#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	de, #___str_0
	push	de
	ld	hl, #6
	add	hl, sp
	push	hl
	call	_sprintf
	add	sp, #6
	pop	bc
	C$general.c$121$1_1$190	= .
	.globl	C$general.c$121$1_1$190
;src/general.c:121: uint8_t len = strlen(buffer);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_strlen
	pop	hl
	ld	b, e
	C$general.c$124$1_1$190	= .
	.globl	C$general.c$124$1_1$190
;src/general.c:124: uint8_t displayLength = len < digits ? len : digits;  // Display length is the minimum of len or digits
	ld	a, b
	ldhl	sp,	#19
	sub	a, (hl)
	jr	C, 00116$
	ldhl	sp,	#19
	ld	b, (hl)
00116$:
	C$general.c$125$1_1$190	= .
	.globl	C$general.c$125$1_1$190
;src/general.c:125: uint8_t startX = x + (digits - displayLength) * fontspacing;  // Adjust start position
	ldhl	sp,	#19
	ld	a, (hl+)
	inc	hl
	sub	a, b
	ld	d, a
	push	bc
	ld	e, (hl)
	ld	a, d
	call	__mulsuchar
	ld	a, c
	pop	bc
	add	a, c
	ldhl	sp,	#6
	ld	(hl), a
	C$general.c$128$2_1$189	= .
	.globl	C$general.c$128$2_1$189
;src/general.c:128: for(uint8_t i = 0; i < digits - displayLength; i++) {
	ldhl	sp,	#14
	ld	(hl), #0x00
00108$:
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#7
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#9
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#9
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00154$
	bit	7, d
	jr	NZ, 00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z, 00155$
	scf
00155$:
	jr	NC, 00101$
;src/general.c:129: set_sprite_tile(tileoffset + i, 0);
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#20
	add	a, (hl)
	ld	e, a
	ld	d, e
;/usr/local/opt/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x00
	C$general.c$130$2_1$189	= .
	.globl	C$general.c$130$2_1$189
;src/general.c:130: move_sprite(tileoffset + i, x + (fontspacing * i), y);
	push	bc
	push	de
	ldhl	sp,	#18
	ld	e, (hl)
	ldhl	sp,	#25
	ld	a, (hl)
	call	__muluschar
	ld	a, c
	pop	de
	pop	bc
	add	a, c
	ldhl	sp,	#12
	ld	(hl), a
;/usr/local/opt/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/usr/local/opt/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#13
	ld	a, (hl-)
	ld	(de), a
	inc	de
	C$general.c$128$2_1$191	= .
	.globl	C$general.c$128$2_1$191
;src/general.c:128: for(uint8_t i = 0; i < digits - displayLength; i++) {
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	(hl)
	jp	00108$
00101$:
	C$general.c$134$3_1$194	= .
	.globl	C$general.c$134$3_1$194
;src/general.c:134: for(uint8_t i = 0; i < displayLength; i++) {
	ldhl	sp,	#14
	ld	(hl), #0x00
00111$:
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, b
	jr	NC, 00113$
	C$general.c$135$3_1$194	= .
	.globl	C$general.c$135$3_1$194
;src/general.c:135: uint8_t spriteIndex = buffer[i] - '0';
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#14
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	add	a, #0xd0
	ld	e, a
	C$general.c$136$3_1$194	= .
	.globl	C$general.c$136$3_1$194
;src/general.c:136: uint8_t spritePos = tileoffset + digits - displayLength + i;
	ldhl	sp,	#19
	ld	a, (hl+)
	add	a, (hl)
	ld	c, b
	sub	a, c
	ldhl	sp,	#14
	ld	c, (hl)
	add	a, c
	ld	c, a
	C$general.c$137$3_1$194	= .
	.globl	C$general.c$137$3_1$194
;src/general.c:137: set_sprite_data(spritePos, 1, &font[spriteIndex * 16]); // Assuming 'font' is defined elsewhere
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_font
	add	hl, de
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	a, c
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;/usr/local/opt/gbdk/include/gb/gb.h:1804: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), c
	C$general.c$139$2_1$189	= .
	.globl	C$general.c$139$2_1$189
;src/general.c:139: move_sprite(spritePos, startX + (fontspacing * i), y);
	push	bc
	push	de
	ldhl	sp,	#18
	ld	e, (hl)
	ldhl	sp,	#25
	ld	a, (hl)
	call	__muluschar
	ld	a, c
	pop	de
	pop	bc
	ldhl	sp,	#6
	ld	c, (hl)
	add	a, c
	ld	c, a
;/usr/local/opt/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/usr/local/opt/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#13
	C$general.c$134$2_1$193	= .
	.globl	C$general.c$134$2_1$193
;src/general.c:134: for(uint8_t i = 0; i < displayLength; i++) {
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
	inc	(hl)
	jr	00111$
00113$:
	C$general.c$142$2_1$189	= .
	.globl	C$general.c$142$2_1$189
;src/general.c:142: }
	add	sp, #15
	pop	hl
	add	sp, #5
	jp	(hl)
Fgeneral$__str_0$0_0$0 == .
___str_0:
	.ascii "%u"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
