;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module map
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _init_progressbar
	.globl _init_tiles
	.globl _init_nav
	.globl _draw_character
	.globl _draw_hull
	.globl _draw_fuel
	.globl _draw_cargo
	.globl _draw_depth
	.globl _progressbar
	.globl _add_block
	.globl _clear_4bkg_tiles
	.globl _spawn_bkg_row
	.globl _set_4bkg_tiles
	.globl _shuffle
	.globl b___func_bank_map
	.globl ___func_bank_map
	.globl _draw_metasprite
	.globl _draw_text
	.globl _rand
	.globl _initrand
	.globl _strcat
	.globl _itoa
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
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
	.area _CODE_1
	G$__func_bank_map$0$0	= .
	.globl	G$__func_bank_map$0$0
	C$map.c$28$0_0$246	= .
	.globl	C$map.c$28$0_0$246
;src/map.c:28: BANKREF(bank_map)
;	---------------------------------
; Function __func_bank_map
; ---------------------------------
	b___func_bank_map	= 1
___func_bank_map::
	.local b___func_bank_map 
	___bank_bank_map = b___func_bank_map 
	.globl ___bank_bank_map 
	G$shuffle$0$0	= .
	.globl	G$shuffle$0$0
	C$map.c$30$1_0$248	= .
	.globl	C$map.c$30$1_0$248
;src/map.c:30: void shuffle(uint8_t array[4]) {
;	---------------------------------
; Function shuffle
; ---------------------------------
_shuffle::
	dec	sp
	C$map.c$31$2_0$248	= .
	.globl	C$map.c$31$2_0$248
;src/map.c:31: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	C$map.c$32$1_0$248	= .
	.globl	C$map.c$32$1_0$248
;src/map.c:32: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	c, a
	xor	a, a
	or	a, l
	C$map.c$33$1_0$248	= .
	.globl	C$map.c$33$1_0$248
;src/map.c:33: initrand(seed);
	push	de
	ld	b, c
	ld	c, a
	push	bc
	call	_initrand
	pop	hl
	call	_rand
	ld	a, e
	pop	de
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$map.c$37$1_1$249	= .
	.globl	C$map.c$37$1_1$249
;src/map.c:37: do {
00101$:
	C$map.c$38$2_1$250	= .
	.globl	C$map.c$38$2_1$250
;src/map.c:38: secondSwapIndex = rand() % 4;
	push	hl
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	hl
	and	a, #0x03
	ld	c, a
	C$map.c$39$1_1$249	= .
	.globl	C$map.c$39$1_1$249
;src/map.c:39: } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index
	ld	a, l
	sub	a, c
	jr	Z, 00101$
	C$map.c$42$1_2$251	= .
	.globl	C$map.c$42$1_2$251
;src/map.c:42: uint8_t temp = array[firstSwapIndex];
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	hl
	ldhl	sp,	#2
	ld	(hl), a
	pop	hl
	C$map.c$43$1_2$251	= .
	.globl	C$map.c$43$1_2$251
;src/map.c:43: array[firstSwapIndex] = array[secondSwapIndex];
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(hl), a
	C$map.c$44$1_2$251	= .
	.globl	C$map.c$44$1_2$251
;src/map.c:44: array[secondSwapIndex] = temp;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
	C$map.c$47$1_2$251	= .
	.globl	C$map.c$47$1_2$251
;src/map.c:47: firstSwapIndex = rand() % 4;
	push	de
	call	_rand
	ld	a, e
	pop	de
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$map.c$48$1_2$251	= .
	.globl	C$map.c$48$1_2$251
;src/map.c:48: do {
00104$:
	C$map.c$49$2_2$252	= .
	.globl	C$map.c$49$2_2$252
;src/map.c:49: secondSwapIndex = rand() % 4;
	push	hl
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	hl
	and	a, #0x03
	ld	b, a
	C$map.c$50$1_2$251	= .
	.globl	C$map.c$50$1_2$251
;src/map.c:50: } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index
	ld	a, l
	sub	a, b
	jr	Z, 00104$
	C$map.c$52$1_2$251	= .
	.globl	C$map.c$52$1_2$251
;src/map.c:52: temp = array[firstSwapIndex];
	ld	h, #0x00
	add	hl, de
	ld	c, (hl)
	C$map.c$53$1_2$251	= .
	.globl	C$map.c$53$1_2$251
;src/map.c:53: array[firstSwapIndex] = array[secondSwapIndex];
	ld	a, e
	add	a, b
	ld	e, a
	jr	NC, 00139$
	inc	d
00139$:
	ld	a, (de)
	ld	(hl), a
	C$map.c$54$1_2$251	= .
	.globl	C$map.c$54$1_2$251
;src/map.c:54: array[secondSwapIndex] = temp;
	ld	a, c
	ld	(de), a
	C$map.c$55$1_2$248	= .
	.globl	C$map.c$55$1_2$248
;src/map.c:55: }
	inc	sp
	C$map.c$55$1_2$248	= .
	.globl	C$map.c$55$1_2$248
	XG$shuffle$0$0	= .
	.globl	XG$shuffle$0$0
	ret
	G$set_4bkg_tiles$0$0	= .
	.globl	G$set_4bkg_tiles$0$0
	C$map.c$66$1_2$255	= .
	.globl	C$map.c$66$1_2$255
;src/map.c:66: void set_4bkg_tiles(uint8_t array[][16], uint8_t x1, uint8_t y1, uint8_t r, uint8_t c) {
;	---------------------------------
; Function set_4bkg_tiles
; ---------------------------------
_set_4bkg_tiles::
	add	sp, #-19
	ldhl	sp,	#15
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
	C$map.c$67$3_0$255	= .
	.globl	C$map.c$67$3_0$255
;src/map.c:67: for (uint8_t y = y1; y < y1 + r; y++) {
	ldhl	sp,	#21
	ld	a, (hl)
	ldhl	sp,	#17
	ld	(hl), a
00115$:
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, #0x00
	ld	e, (hl)
	ld	d, #0x00
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, b
	ld	b, a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	ld	e, a
	bit	7, e
	jr	Z, 00170$
	bit	7, d
	jr	NZ, 00171$
	cp	a, a
	jr	00171$
00170$:
	bit	7, d
	jr	Z, 00171$
	scf
00171$:
	jp	NC, 00117$
	C$map.c$68$5_0$258	= .
	.globl	C$map.c$68$5_0$258
;src/map.c:68: for (uint8_t x = x1; x < x1 + c; x++) {
	ldhl	sp,	#17
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#18
	ld	(hl), a
00112$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#8
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#10
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00172$
	bit	7, d
	jr	NZ, 00173$
	cp	a, a
	jr	00173$
00172$:
	bit	7, d
	jr	Z, 00173$
	scf
00173$:
	jp	NC, 00116$
	C$map.c$69$5_0$258	= .
	.globl	C$map.c$69$5_0$258
;src/map.c:69: uint8_t temp = (array[y][x] * 4) + TILESTART - 4; // Calculate tile offset
	ldhl	sp,	#4
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x04
00174$:
	ldhl	sp,	#10
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00174$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#18
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, a
	add	a, a
	ldhl	sp,	#13
	ld	(hl), a
	add	a, #0x58
	ldhl	sp,	#9
	C$map.c$70$5_0$258	= .
	.globl	C$map.c$70$5_0$258
;src/map.c:70: uint8_t temp_array[4] = {temp, temp + 1, temp + 2, temp + 3};
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	(hl+), a
	inc	a
	ld	(hl), a
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl+)
	inc	hl
	add	a, #0x02
	ld	(hl), a
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	add	a, #0x03
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,	#3
	ld	(hl), a
	C$map.c$72$5_0$258	= .
	.globl	C$map.c$72$5_0$258
;src/map.c:72: if (array[y][x] == EMPTY) {
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	NZ, 00107$
	C$map.c$73$6_0$259	= .
	.globl	C$map.c$73$6_0$259
;src/map.c:73: temp_array[0] = 0;
	ldhl	sp,	#0
	C$map.c$74$6_0$259	= .
	.globl	C$map.c$74$6_0$259
;src/map.c:74: temp_array[1] = 0;
	xor	a, a
	ld	(hl+), a
	C$map.c$75$6_0$259	= .
	.globl	C$map.c$75$6_0$259
;src/map.c:75: temp_array[2] = 0;
	xor	a, a
	ld	(hl+), a
	C$map.c$76$6_0$259	= .
	.globl	C$map.c$76$6_0$259
;src/map.c:76: temp_array[3] = 0;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
	jr	00108$
00107$:
	C$map.c$77$5_0$258	= .
	.globl	C$map.c$77$5_0$258
;src/map.c:77: } else if (array[y][x] == GRAS) {
	cp	a, #0x02
	jr	NZ, 00104$
	C$map.c$78$6_0$260	= .
	.globl	C$map.c$78$6_0$260
;src/map.c:78: temp_array[0] = temp + (rand() % 4);
	call	_rand
	ld	a, e
	and	a, #0x03
	ldhl	sp,	#10
	add	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	C$map.c$79$6_0$260	= .
	.globl	C$map.c$79$6_0$260
;src/map.c:79: temp_array[1] = temp + (rand() % 4);
	call	_rand
	ld	a, e
	and	a, #0x03
	ldhl	sp,	#10
	add	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	C$map.c$80$6_0$260	= .
	.globl	C$map.c$80$6_0$260
;src/map.c:80: temp_array[2] = temp - 1;
	ldhl	sp,	#10
	ld	a, (hl)
	dec	a
	ldhl	sp,	#2
	ld	(hl), a
	C$map.c$81$6_0$260	= .
	.globl	C$map.c$81$6_0$260
;src/map.c:81: temp_array[3] = temp - 2;
	ldhl	sp,	#10
	ld	a, (hl)
	dec	a
	dec	a
	ldhl	sp,	#3
	ld	(hl), a
	jr	00108$
00104$:
	C$map.c$83$5_0$258	= .
	.globl	C$map.c$83$5_0$258
;src/map.c:83: else if (array[y][x] == DIRT) {
	dec	a
	jr	NZ, 00108$
	C$map.c$84$6_0$261	= .
	.globl	C$map.c$84$6_0$261
;src/map.c:84: temp_array[0] = temp;
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	C$map.c$85$6_0$261	= .
	.globl	C$map.c$85$6_0$261
;src/map.c:85: temp_array[1] = temp + 1;
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	C$map.c$86$6_0$261	= .
	.globl	C$map.c$86$6_0$261
;src/map.c:86: temp_array[2] = temp + 2;
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	C$map.c$87$6_0$261	= .
	.globl	C$map.c$87$6_0$261
;src/map.c:87: temp_array[3] = temp + 3;
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	C$map.c$88$6_0$261	= .
	.globl	C$map.c$88$6_0$261
;src/map.c:88: shuffle(temp_array);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_shuffle
00108$:
	C$map.c$91$5_0$258	= .
	.globl	C$map.c$91$5_0$258
;src/map.c:91: set_bkg_tiles(2 * x, 2 * y, 2, 1, temp_array);
	ldhl	sp,	#18
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#12
	ld	(hl), a
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ldhl	sp,	#10
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$92$5_0$258	= .
	.globl	C$map.c$92$5_0$258
;src/map.c:92: set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, temp_array + 2);
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl), a
	sla	(hl)
	inc	(hl)
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ldhl	sp,	#17
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$68$4_0$257	= .
	.globl	C$map.c$68$4_0$257
;src/map.c:68: for (uint8_t x = x1; x < x1 + c; x++) {
	ldhl	sp,	#18
	inc	(hl)
	jp	00112$
00116$:
	C$map.c$67$2_0$255	= .
	.globl	C$map.c$67$2_0$255
;src/map.c:67: for (uint8_t y = y1; y < y1 + r; y++) {
	ldhl	sp,	#17
	inc	(hl)
	jp	00115$
00117$:
	C$map.c$95$2_0$255	= .
	.globl	C$map.c$95$2_0$255
;src/map.c:95: }
	add	sp, #19
	pop	hl
	add	sp, #3
	jp	(hl)
	G$spawn_bkg_row$0$0	= .
	.globl	G$spawn_bkg_row$0$0
	C$map.c$97$2_0$263	= .
	.globl	C$map.c$97$2_0$263
;src/map.c:97: void spawn_bkg_row(void) {
;	---------------------------------
; Function spawn_bkg_row
; ---------------------------------
_spawn_bkg_row::
	C$map.c$98$1_0$263	= .
	.globl	C$map.c$98$1_0$263
;src/map.c:98: if (depth > 3) {
	ld	a, #0x03
	ld	hl, #_depth
	sub	a, (hl)
	ret	NC
	C$map.c$99$2_0$264	= .
	.globl	C$map.c$99$2_0$264
;src/map.c:99: if (depth - depth_offset == (8 - THRESHOLD - BOTTOM)) set_4bkg_tiles(level_array, 0, depth + 4, 1, 16);
	ld	a, (hl)
	ld	c, #0x00
	ld	hl, #_depth_offset
	ld	e, (hl)
	ld	b, #0x00
	sub	a, e
	ld	e, a
	ld	a, c
	sbc	a, b
	ld	d, a
	ld	hl, #_depth
	ld	c, (hl)
	ld	a, e
	sub	a, #0x06
	or	a, d
	jr	NZ, 00104$
	inc	c
	inc	c
	inc	c
	inc	c
	ld	hl, #0x1001
	push	hl
	ld	a, c
	push	af
	inc	sp
	xor	a, a
	ld	de, #_level_array
	call	_set_4bkg_tiles
	ret
00104$:
	C$map.c$100$2_0$264	= .
	.globl	C$map.c$100$2_0$264
;src/map.c:100: else if (depth - depth_offset == THRESHOLD) set_4bkg_tiles(level_array, 0, depth - 4, 1, 16);
	ld	a, e
	sub	a, #0x02
	or	a, d
	ret	NZ
	ld	a, c
	add	a, #0xfc
	ld	b, a
	ld	hl, #0x1001
	push	hl
	push	bc
	inc	sp
	xor	a, a
	ld	de, #_level_array
	call	_set_4bkg_tiles
	C$map.c$102$1_0$263	= .
	.globl	C$map.c$102$1_0$263
;src/map.c:102: }
	C$map.c$102$1_0$263	= .
	.globl	C$map.c$102$1_0$263
	XG$spawn_bkg_row$0$0	= .
	.globl	XG$spawn_bkg_row$0$0
	ret
	G$clear_4bkg_tiles$0$0	= .
	.globl	G$clear_4bkg_tiles$0$0
	C$map.c$111$1_0$266	= .
	.globl	C$map.c$111$1_0$266
;src/map.c:111: void clear_4bkg_tiles(uint8_t array[][16], uint8_t x, uint8_t y) {
;	---------------------------------
; Function clear_4bkg_tiles
; ---------------------------------
_clear_4bkg_tiles::
	ld	c, a
	C$map.c$112$1_0$266	= .
	.globl	C$map.c$112$1_0$266
;src/map.c:112: array[y][x] = 0; // Clear the tile in the array
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x00
	C$map.c$113$1_0$266	= .
	.globl	C$map.c$113$1_0$266
;src/map.c:113: set_4bkg_tiles(level_array, x, y, 1, 1); // Update the background
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_level_array
	call	_set_4bkg_tiles
	C$map.c$114$1_0$266	= .
	.globl	C$map.c$114$1_0$266
;src/map.c:114: }
	pop	hl
	inc	sp
	jp	(hl)
	G$add_block$0$0	= .
	.globl	G$add_block$0$0
	C$map.c$126$1_0$268	= .
	.globl	C$map.c$126$1_0$268
;src/map.c:126: void add_block(uint8_t array[][16], uint8_t x, uint8_t y, uint8_t type) {
;	---------------------------------
; Function add_block
; ---------------------------------
_add_block::
	ld	c, a
	C$map.c$127$1_0$268	= .
	.globl	C$map.c$127$1_0$268
;src/map.c:127: array[y][x] = type;
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	d, h
	ld	a, l
	add	a, c
	ld	e, a
	jr	NC, 00103$
	inc	d
00103$:
	ldhl	sp,	#3
	C$map.c$128$1_0$268	= .
	.globl	C$map.c$128$1_0$268
;src/map.c:128: set_4bkg_tiles(level_array, x, y, 1, 1);
	ld	a, (hl-)
	ld	(de), a
	ld	de, #0x101
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	ld	de, #_level_array
	call	_set_4bkg_tiles
	C$map.c$129$1_0$268	= .
	.globl	C$map.c$129$1_0$268
;src/map.c:129: }
	pop	hl
	pop	af
	jp	(hl)
	G$progressbar$0$0	= .
	.globl	G$progressbar$0$0
	C$map.c$141$1_0$271	= .
	.globl	C$map.c$141$1_0$271
;src/map.c:141: void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t x, uint8_t y) {
;	---------------------------------
; Function progressbar
; ---------------------------------
_progressbar::
	add	sp, #-8
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$map.c$143$1_0$270	= .
	.globl	C$map.c$143$1_0$270
;src/map.c:143: uint8_t total_pixels = digits * 8;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	C$map.c$144$1_0$270	= .
	.globl	C$map.c$144$1_0$270
;src/map.c:144: uint16_t pixels_to_fill = (current_value * total_pixels) / max_value;
	ld	c, a
	ld	b, #0x00
	call	__mulint
	ld	e, c
	ld	d, b
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	__divsint
	C$map.c$146$5_0$274	= .
	.globl	C$map.c$146$5_0$274
;src/map.c:146: for (uint8_t i = 0; i < digits; i++) {
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00185$
	xor	a, a
00185$:
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#7
	ld	(hl), #0x00
00122$:
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#0
	sub	a, (hl)
	jp	NC, 00124$
	C$map.c$147$4_0$272	= .
	.globl	C$map.c$147$4_0$272
;src/map.c:147: uint8_t tile_index = SPRITE_TILE_EMPTY; // Default to empty
	ld	e, #0x00
	C$map.c$149$3_0$272	= .
	.globl	C$map.c$149$3_0$272
;src/map.c:149: uint8_t effective_pixels = (pixels_to_fill > sprite_pixels) ? sprite_pixels : pixels_to_fill;
	ld	a, #0x08
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00126$
	ld	d, #0x08
	jr	00127$
00126$:
	ld	d, c
00127$:
	C$map.c$152$3_0$272	= .
	.globl	C$map.c$152$3_0$272
;src/map.c:152: pixels_to_fill -= effective_pixels;
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	C$map.c$155$3_0$272	= .
	.globl	C$map.c$155$3_0$272
;src/map.c:155: switch (effective_pixels) {
	ld	a, #0x08
	sub	a, d
	jp	C, 00117$
	ld	e, d
	ld	d, #0x00
	ld	hl, #00186$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00186$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
	C$map.c$156$4_0$273	= .
	.globl	C$map.c$156$4_0$273
;src/map.c:156: case 0: tile_index = SPRITE_TILE_EMPTY; break;
00101$:
	ld	e, #0x00
	jr	00117$
	C$map.c$157$4_0$273	= .
	.globl	C$map.c$157$4_0$273
;src/map.c:157: case 1: tile_index = SPRITE_TILE_1_8; break;
00102$:
	ld	e, #0x20
	jr	00117$
	C$map.c$158$4_0$273	= .
	.globl	C$map.c$158$4_0$273
;src/map.c:158: case 2: tile_index = SPRITE_TILE_2_8; break;
00103$:
	ld	e, #0x21
	jr	00117$
	C$map.c$159$4_0$273	= .
	.globl	C$map.c$159$4_0$273
;src/map.c:159: case 3: tile_index = SPRITE_TILE_3_8; break;
00104$:
	ld	e, #0x22
	jr	00117$
	C$map.c$160$4_0$273	= .
	.globl	C$map.c$160$4_0$273
;src/map.c:160: case 4: tile_index = SPRITE_TILE_4_8; break;
00105$:
	ld	e, #0x23
	jr	00117$
	C$map.c$161$4_0$273	= .
	.globl	C$map.c$161$4_0$273
;src/map.c:161: case 5: tile_index = SPRITE_TILE_5_8; break;
00106$:
	ld	e, #0x24
	jr	00117$
	C$map.c$162$4_0$273	= .
	.globl	C$map.c$162$4_0$273
;src/map.c:162: case 6: tile_index = SPRITE_TILE_6_8; break;
00107$:
	ld	e, #0x25
	jr	00117$
	C$map.c$163$4_0$273	= .
	.globl	C$map.c$163$4_0$273
;src/map.c:163: case 7: tile_index = SPRITE_TILE_7_8; break;
00108$:
	ld	e, #0x26
	jr	00117$
	C$map.c$164$4_0$273	= .
	.globl	C$map.c$164$4_0$273
;src/map.c:164: case 8: 
00109$:
	C$map.c$165$4_0$273	= .
	.globl	C$map.c$165$4_0$273
;src/map.c:165: if (i == 0) { // First sprite
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00115$
	C$map.c$166$5_0$274	= .
	.globl	C$map.c$166$5_0$274
;src/map.c:166: tile_index = (digits == 1 || pixels_to_fill == 0) ? SPRITE_TILE_END : SPRITE_TILE_MID;
	ldhl	sp,	#1
	bit	0, (hl)
	jr	NZ, 00131$
	ld	a, b
	or	a, c
	jr	NZ, 00128$
00131$:
	ld	de, #0x0027
	jr	00117$
00128$:
	ld	de, #0x0028
	jr	00117$
00115$:
	C$map.c$167$4_0$273	= .
	.globl	C$map.c$167$4_0$273
;src/map.c:167: } else if (i == digits - 1 || pixels_to_fill == 0) { // Last sprite or no more pixels to fill
	ldhl	sp,	#0
	ld	e, (hl)
	ld	d, #0x00
	dec	de
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00187$
	inc	hl
	ld	a, (hl)
	sub	a, d
	jr	Z, 00110$
00187$:
	ld	a, b
	or	a, c
	jr	NZ, 00111$
00110$:
	C$map.c$168$5_0$275	= .
	.globl	C$map.c$168$5_0$275
;src/map.c:168: tile_index = SPRITE_TILE_END;
	ld	e, #0x27
	jr	00117$
00111$:
	C$map.c$170$5_0$276	= .
	.globl	C$map.c$170$5_0$276
;src/map.c:170: tile_index = SPRITE_TILE_MID;
	ld	e, #0x28
	C$map.c$173$3_0$272	= .
	.globl	C$map.c$173$3_0$272
;src/map.c:173: }
00117$:
;src/map.c:176: set_sprite_tile(tilestart + i, tile_index);
	ldhl	sp,	#11
	ld	a, (hl)
	ldhl	sp,	#7
	add	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ld	d, (hl)
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
	ld	(hl), e
;src/map.c:177: move_sprite(tilestart + i, x + i * 8, y);
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#12
	ld	e, (hl)
	add	a, e
	ldhl	sp,	#4
;/usr/local/opt/gbdk/include/gb/gb.h:1877: OAM_item_t * itm = &shadow_OAM[nb];
	ld	(hl-), a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/usr/local/opt/gbdk/include/gb/gb.h:1878: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$map.c$146$2_0$271	= .
	.globl	C$map.c$146$2_0$271
;src/map.c:146: for (uint8_t i = 0; i < digits; i++) {
	ldhl	sp,	#7
	inc	(hl)
	jp	00122$
00124$:
	C$map.c$179$2_0$271	= .
	.globl	C$map.c$179$2_0$271
;src/map.c:179: }
	add	sp, #8
	pop	hl
	add	sp, #4
	jp	(hl)
	G$draw_depth$0$0	= .
	.globl	G$draw_depth$0$0
	C$map.c$181$2_0$284	= .
	.globl	C$map.c$181$2_0$284
;src/map.c:181: void draw_depth(void){
;	---------------------------------
; Function draw_depth
; ---------------------------------
_draw_depth::
	add	sp, #-10
	C$map.c$183$1_0$284	= .
	.globl	C$map.c$183$1_0$284
;src/map.c:183: itoa((depth <= 5) ? 0 : (depth - 5), string, 10);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	ld	a, #0x05
	ld	hl, #_depth
	sub	a, (hl)
	jr	C, 00103$
	ld	bc, #0x0000
	jr	00104$
00103$:
	ld	a, (#_depth)
	ld	b, #0x00
	add	a, #0xfb
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
00104$:
	ld	a, #0x0a
	push	af
	inc	sp
	push	de
	push	bc
	call	_itoa
	add	sp, #5
	C$map.c$184$1_0$284	= .
	.globl	C$map.c$184$1_0$284
;src/map.c:184: strcat(string, "m");
	ld	bc, #___str_0
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$185$1_0$284	= .
	.globl	C$map.c$185$1_0$284
;src/map.c:185: draw_text(15,0,"Depth",5,TRUE,0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	de, #___str_1
	push	de
	ld	e, #0x00
	ld	a, #0x0f
	call	_draw_text
	C$map.c$186$1_0$284	= .
	.globl	C$map.c$186$1_0$284
;src/map.c:186: draw_text(15,1,string,5,FALSE,0);
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
	ld	e, #0x01
	ld	a, #0x0f
	call	_draw_text
	C$map.c$187$1_0$284	= .
	.globl	C$map.c$187$1_0$284
;src/map.c:187: }
	add	sp, #10
	C$map.c$187$1_0$284	= .
	.globl	C$map.c$187$1_0$284
	XG$draw_depth$0$0	= .
	.globl	XG$draw_depth$0$0
	ret
Fmap$__str_0$0_0$0 == .
___str_0:
	.ascii "m"
	.db 0x00
Fmap$__str_1$0_0$0 == .
___str_1:
	.ascii "Depth"
	.db 0x00
	G$draw_cargo$0$0	= .
	.globl	G$draw_cargo$0$0
	C$map.c$189$1_0$286	= .
	.globl	C$map.c$189$1_0$286
;src/map.c:189: void draw_cargo(void){
;	---------------------------------
; Function draw_cargo
; ---------------------------------
_draw_cargo::
	add	sp, #-20
	C$map.c$192$1_0$286	= .
	.globl	C$map.c$192$1_0$286
;src/map.c:192: itoa(player.cargo.current_value, string, 10);
	ld	hl, #_player + 187
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
	C$map.c$193$1_0$286	= .
	.globl	C$map.c$193$1_0$286
;src/map.c:193: itoa(player.cargo.max_value, string_max, 10);
	ld	hl, #_player + 189
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #11
	add	hl, sp
	push	hl
	push	bc
	call	_itoa
	add	sp, #5
	C$map.c$194$1_0$286	= .
	.globl	C$map.c$194$1_0$286
;src/map.c:194: strcat(string, "/");
	ld	bc, #___str_2
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$195$1_0$286	= .
	.globl	C$map.c$195$1_0$286
;src/map.c:195: strcat(string, string_max);
	ld	hl, #10
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$196$1_0$286	= .
	.globl	C$map.c$196$1_0$286
;src/map.c:196: draw_text(9,0,"Cargo",5,TRUE,0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	de, #___str_3
	push	de
	ld	e, #0x00
	ld	a, #0x09
	call	_draw_text
	C$map.c$197$1_0$286	= .
	.globl	C$map.c$197$1_0$286
;src/map.c:197: draw_text(9,1,string,5,TRUE,0);
	ld	hl, #0
	add	hl, sp
	xor	a, a
	ld	d, a
	ld	e, #0x01
	push	de
	ld	a, #0x05
	push	af
	inc	sp
	push	hl
	ld	e, #0x01
	ld	a, #0x09
	call	_draw_text
	C$map.c$198$1_0$286	= .
	.globl	C$map.c$198$1_0$286
;src/map.c:198: }
	add	sp, #20
	C$map.c$198$1_0$286	= .
	.globl	C$map.c$198$1_0$286
	XG$draw_cargo$0$0	= .
	.globl	XG$draw_cargo$0$0
	ret
Fmap$__str_2$0_0$0 == .
___str_2:
	.ascii "/"
	.db 0x00
Fmap$__str_3$0_0$0 == .
___str_3:
	.ascii "Cargo"
	.db 0x00
	G$draw_fuel$0$0	= .
	.globl	G$draw_fuel$0$0
	C$map.c$200$1_0$288	= .
	.globl	C$map.c$200$1_0$288
;src/map.c:200: void draw_fuel(void){
;	---------------------------------
; Function draw_fuel
; ---------------------------------
_draw_fuel::
	C$map.c$201$1_0$288	= .
	.globl	C$map.c$201$1_0$288
;src/map.c:201: progressbar(player.fuel.current_value, player.fuel.max_value, 3, 35, 44, 20);
	ld	hl, #_player + 18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_player + 16
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x142c
	push	de
	ld	de, #0x2303
	push	de
	ld	e, l
	ld	d, h
	call	_progressbar
	C$map.c$202$1_0$288	= .
	.globl	C$map.c$202$1_0$288
;src/map.c:202: }
	C$map.c$202$1_0$288	= .
	.globl	C$map.c$202$1_0$288
	XG$draw_fuel$0$0	= .
	.globl	XG$draw_fuel$0$0
	ret
	G$draw_hull$0$0	= .
	.globl	G$draw_hull$0$0
	C$map.c$203$1_0$290	= .
	.globl	C$map.c$203$1_0$290
;src/map.c:203: void draw_hull(void){
;	---------------------------------
; Function draw_hull
; ---------------------------------
_draw_hull::
	C$map.c$204$1_0$290	= .
	.globl	C$map.c$204$1_0$290
;src/map.c:204: progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
	ld	hl, #_player + 75
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_player + 73
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x140c
	push	de
	ld	de, #0x2002
	push	de
	ld	e, l
	ld	d, h
	call	_progressbar
	C$map.c$205$1_0$290	= .
	.globl	C$map.c$205$1_0$290
;src/map.c:205: }
	C$map.c$205$1_0$290	= .
	.globl	C$map.c$205$1_0$290
	XG$draw_hull$0$0	= .
	.globl	XG$draw_hull$0$0
	ret
	G$draw_character$0$0	= .
	.globl	G$draw_character$0$0
	C$map.c$208$1_0$292	= .
	.globl	C$map.c$208$1_0$292
;src/map.c:208: void draw_character(void){
;	---------------------------------
; Function draw_character
; ---------------------------------
_draw_character::
	C$map.c$209$1_0$292	= .
	.globl	C$map.c$209$1_0$292
;src/map.c:209: set_sprite_data(CHARSTART, 16, rover_tiles);
	ld	de, #_rover_tiles
	push	de
	ld	hl, #0x1001
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$map.c$210$1_0$292	= .
	.globl	C$map.c$210$1_0$292
;src/map.c:210: draw_metasprite(direction_prev);
	ld	hl, #_direction_prev
	ld	a, (hl)
	C$map.c$211$1_0$292	= .
	.globl	C$map.c$211$1_0$292
;src/map.c:211: }
	C$map.c$211$1_0$292	= .
	.globl	C$map.c$211$1_0$292
	XG$draw_character$0$0	= .
	.globl	XG$draw_character$0$0
	jp	_draw_metasprite
	G$init_nav$0$0	= .
	.globl	G$init_nav$0$0
	C$map.c$213$1_0$294	= .
	.globl	C$map.c$213$1_0$294
;src/map.c:213: void init_nav(void){
;	---------------------------------
; Function init_nav
; ---------------------------------
_init_nav::
	C$map.c$214$1_0$294	= .
	.globl	C$map.c$214$1_0$294
;src/map.c:214: set_win_tiles(0,0,20,3,nav_map);
	ld	de, #_nav_map
	push	de
	ld	hl, #0x314
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;/usr/local/opt/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
	C$map.c$215$3_0$294	= .
	.globl	C$map.c$215$3_0$294
;src/map.c:215: move_win(7, 0); //124
	C$map.c$216$3_0$294	= .
	.globl	C$map.c$216$3_0$294
;src/map.c:216: }
	C$map.c$216$3_0$294	= .
	.globl	C$map.c$216$3_0$294
	XG$init_nav$0$0	= .
	.globl	XG$init_nav$0$0
	ret
	G$init_tiles$0$0	= .
	.globl	G$init_tiles$0$0
	C$map.c$218$3_0$299	= .
	.globl	C$map.c$218$3_0$299
;src/map.c:218: void init_tiles(void){
;	---------------------------------
; Function init_tiles
; ---------------------------------
_init_tiles::
	C$map.c$219$1_0$299	= .
	.globl	C$map.c$219$1_0$299
;src/map.c:219: set_bkg_data(TILESTART, 28, tile_tiles);
	ld	de, #_tile_tiles
	push	de
	ld	hl, #0x1c5c
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$map.c$220$1_0$299	= .
	.globl	C$map.c$220$1_0$299
;src/map.c:220: set_bkg_data(NAVSTART, nav_TILE_COUNT, nav_tiles);
	ld	de, #_nav_tiles
	push	de
	ld	hl, #0xc80
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$map.c$221$1_0$299	= .
	.globl	C$map.c$221$1_0$299
;src/map.c:221: set_4bkg_tiles(level_array, 0, 0, 16, 16);
	ld	hl, #0x1010
	push	hl
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	de, #_level_array
	call	_set_4bkg_tiles
	C$map.c$222$1_0$299	= .
	.globl	C$map.c$222$1_0$299
;src/map.c:222: }
	C$map.c$222$1_0$299	= .
	.globl	C$map.c$222$1_0$299
	XG$init_tiles$0$0	= .
	.globl	XG$init_tiles$0$0
	ret
	G$init_progressbar$0$0	= .
	.globl	G$init_progressbar$0$0
	C$map.c$224$1_0$301	= .
	.globl	C$map.c$224$1_0$301
;src/map.c:224: void init_progressbar(void){
;	---------------------------------
; Function init_progressbar
; ---------------------------------
_init_progressbar::
	C$map.c$225$1_0$301	= .
	.globl	C$map.c$225$1_0$301
;src/map.c:225: set_sprite_data(SPRITE_TILE_1_8, progressbar_TILE_COUNT, progressbar_tiles);
	ld	de, #_progressbar_tiles
	push	de
	ld	hl, #0x920
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$map.c$226$1_0$301	= .
	.globl	C$map.c$226$1_0$301
;src/map.c:226: progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
	ld	hl, #_player + 75
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_player + 73
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x140c
	push	de
	ld	de, #0x2002
	push	de
	ld	e, l
	ld	d, h
	call	_progressbar
	C$map.c$227$1_0$301	= .
	.globl	C$map.c$227$1_0$301
;src/map.c:227: }
	C$map.c$227$1_0$301	= .
	.globl	C$map.c$227$1_0$301
	XG$init_progressbar$0$0	= .
	.globl	XG$init_progressbar$0$0
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
