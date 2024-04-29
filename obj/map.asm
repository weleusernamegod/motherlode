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
	.globl _change_background_color
	.globl _shuffle
	.globl b___func_bank_map
	.globl ___func_bank_map
	.globl _draw_metasprite
	.globl _draw_text
	.globl _rand
	.globl _initrand
	.globl _strcat
	.globl _itoa
	.globl _set_bkg_palette_entry
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
	C$map.c$30$0_0$246	= .
	.globl	C$map.c$30$0_0$246
;src/map.c:30: BANKREF(bank_map)
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
	C$map.c$33$1_0$248	= .
	.globl	C$map.c$33$1_0$248
;src/map.c:33: void shuffle(uint8_t array[4]) {
;	---------------------------------
; Function shuffle
; ---------------------------------
_shuffle::
	dec	sp
	C$map.c$34$2_0$248	= .
	.globl	C$map.c$34$2_0$248
;src/map.c:34: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG + 0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	C$map.c$35$1_0$248	= .
	.globl	C$map.c$35$1_0$248
;src/map.c:35: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG + 0)
	ld	c, a
	xor	a, a
	or	a, l
	C$map.c$36$1_0$248	= .
	.globl	C$map.c$36$1_0$248
;src/map.c:36: initrand(seed);
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
	C$map.c$40$1_1$249	= .
	.globl	C$map.c$40$1_1$249
;src/map.c:40: do {
00101$:
	C$map.c$41$2_1$250	= .
	.globl	C$map.c$41$2_1$250
;src/map.c:41: secondSwapIndex = rand() % 4;
	push	hl
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	hl
	and	a, #0x03
	ld	c, a
	C$map.c$42$1_1$249	= .
	.globl	C$map.c$42$1_1$249
;src/map.c:42: } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index
	ld	a, l
	sub	a, c
	jr	Z, 00101$
	C$map.c$45$1_2$251	= .
	.globl	C$map.c$45$1_2$251
;src/map.c:45: uint8_t temp = array[firstSwapIndex];
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	push	hl
	ldhl	sp,	#2
	ld	(hl), a
	pop	hl
	C$map.c$46$1_2$251	= .
	.globl	C$map.c$46$1_2$251
;src/map.c:46: array[firstSwapIndex] = array[secondSwapIndex];
	ld	a, e
	add	a, c
	ld	c, a
	ld	a, d
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(hl), a
	C$map.c$47$1_2$251	= .
	.globl	C$map.c$47$1_2$251
;src/map.c:47: array[secondSwapIndex] = temp;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
	C$map.c$50$1_2$251	= .
	.globl	C$map.c$50$1_2$251
;src/map.c:50: firstSwapIndex = rand() % 4;
	push	de
	call	_rand
	ld	a, e
	pop	de
	and	a, #0x03
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	C$map.c$51$1_2$251	= .
	.globl	C$map.c$51$1_2$251
;src/map.c:51: do {
00104$:
	C$map.c$52$2_2$252	= .
	.globl	C$map.c$52$2_2$252
;src/map.c:52: secondSwapIndex = rand() % 4;
	push	hl
	push	de
	call	_rand
	ld	a, e
	pop	de
	pop	hl
	and	a, #0x03
	ld	b, a
	C$map.c$53$1_2$251	= .
	.globl	C$map.c$53$1_2$251
;src/map.c:53: } while (firstSwapIndex == secondSwapIndex);  // Ensure it's a different index
	ld	a, l
	sub	a, b
	jr	Z, 00104$
	C$map.c$55$1_2$251	= .
	.globl	C$map.c$55$1_2$251
;src/map.c:55: temp = array[firstSwapIndex];
	ld	h, #0x00
	add	hl, de
	ld	c, (hl)
	C$map.c$56$1_2$251	= .
	.globl	C$map.c$56$1_2$251
;src/map.c:56: array[firstSwapIndex] = array[secondSwapIndex];
	ld	a, e
	add	a, b
	ld	e, a
	jr	NC, 00139$
	inc	d
00139$:
	ld	a, (de)
	ld	(hl), a
	C$map.c$57$1_2$251	= .
	.globl	C$map.c$57$1_2$251
;src/map.c:57: array[secondSwapIndex] = temp;
	ld	a, c
	ld	(de), a
	C$map.c$58$1_2$248	= .
	.globl	C$map.c$58$1_2$248
;src/map.c:58: }
	inc	sp
	C$map.c$58$1_2$248	= .
	.globl	C$map.c$58$1_2$248
	XG$shuffle$0$0	= .
	.globl	XG$shuffle$0$0
	ret
	G$change_background_color$0$0	= .
	.globl	G$change_background_color$0$0
	C$map.c$60$1_2$254	= .
	.globl	C$map.c$60$1_2$254
;src/map.c:60: void change_background_color(void) {
;	---------------------------------
; Function change_background_color
; ---------------------------------
_change_background_color::
	C$map.c$61$1_0$254	= .
	.globl	C$map.c$61$1_0$254
;src/map.c:61: set_bkg_palette_entry(0,0,RGB8(255 - 5 * depth, 255, 255));
	ld	hl, #_depth
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, #0xff
	sub	a, l
	ld	c, a
	sbc	a, a
	sub	a, h
	ld	b, a
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	and	a, #0x1f
	or	a, #0xe0
	ld	b, #0x7f
	ld	c, a
	push	bc
	xor	a, a
	rrca
	push	af
	call	_set_bkg_palette_entry
	add	sp, #4
	C$map.c$62$1_0$254	= .
	.globl	C$map.c$62$1_0$254
;src/map.c:62: }
	C$map.c$62$1_0$254	= .
	.globl	C$map.c$62$1_0$254
	XG$change_background_color$0$0	= .
	.globl	XG$change_background_color$0$0
	ret
	G$set_4bkg_tiles$0$0	= .
	.globl	G$set_4bkg_tiles$0$0
	C$map.c$73$1_0$257	= .
	.globl	C$map.c$73$1_0$257
;src/map.c:73: void set_4bkg_tiles(uint8_t array[][16], uint8_t x1, uint8_t y1, uint8_t r, uint8_t c) {
;	---------------------------------
; Function set_4bkg_tiles
; ---------------------------------
_set_4bkg_tiles::
	add	sp, #-24
	ldhl	sp,	#18
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
	C$map.c$74$3_0$257	= .
	.globl	C$map.c$74$3_0$257
;src/map.c:74: for (uint8_t y = y1; y < y1 + r; y++) {
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#20
	ld	(hl), a
00134$:
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	b, #0x00
	ld	e, (hl)
	add	a, e
	ld	c, a
	jr	NC, 00264$
	inc	b
00264$:
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#8
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
	jr	Z, 00265$
	bit	7, d
	jr	NZ, 00266$
	cp	a, a
	jr	00266$
00265$:
	bit	7, d
	jr	Z, 00266$
	scf
00266$:
	jp	NC, 00136$
	C$map.c$75$5_0$260	= .
	.globl	C$map.c$75$5_0$260
;src/map.c:75: for (uint8_t x = x1; x < x1 + c; x++) {
	ldhl	sp,	#20
	ld	a, (hl)
	add	a, a
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#21
	ld	(hl), a
00131$:
	ldhl	sp,	#17
	ld	a, (hl)
	ldhl	sp,	#13
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#28
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#24
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#23
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#15
	ld	e, l
	ld	d, h
	ldhl	sp,	#22
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00267$
	bit	7, d
	jr	NZ, 00268$
	cp	a, a
	jr	00268$
00267$:
	bit	7, d
	jr	Z, 00268$
	scf
00268$:
	jp	NC, 00135$
	C$map.c$76$5_0$260	= .
	.globl	C$map.c$76$5_0$260
;src/map.c:76: uint8_t temp = (array[y][x] * 4) + TILESTART - 4;
	ldhl	sp,	#8
	ld	a, (hl)
	ld	d, #0x00
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
	add	a, a
	rl	d
	ld	e, a
	ldhl	sp,	#18
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#21
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, a
	add	a, a
	add	a, #0x58
	ldhl	sp,	#23
	ld	(hl), a
	C$map.c$77$5_0$260	= .
	.globl	C$map.c$77$5_0$260
;src/map.c:77: uint8_t tile_array[4] = {temp, temp + 1, temp + 2, temp + 3};
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#23
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (hl)
	inc	a
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	inc	a
	inc	a
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl)
	inc	a
	inc	a
	inc	a
	ldhl	sp,	#3
	ld	(hl), a
	C$map.c$80$5_0$260	= .
	.globl	C$map.c$80$5_0$260
;src/map.c:80: if (array[y][x] == EMPTY) {
	ld	a, (bc)
	C$map.c$81$2_0$257	= .
	.globl	C$map.c$81$2_0$257
;src/map.c:81: for (int i = 0; i < 4; i++) tile_array[i] = 0;
	or	a,a
	jr	NZ, 00109$
	ldhl	sp,	#22
	ld	(hl+), a
	ld	(hl), a
00119$:
	ldhl	sp,	#22
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00270$
	bit	7, d
	jr	NZ, 00271$
	cp	a, a
	jr	00271$
00270$:
	bit	7, d
	jr	Z, 00271$
	scf
00271$:
	jp	NC, 00110$
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#22
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	xor	a, a
	ld	(de), a
	ldhl	sp,	#22
	inc	(hl)
	jr	NZ, 00119$
	inc	hl
	inc	(hl)
	jr	00119$
00109$:
	C$map.c$82$5_0$260	= .
	.globl	C$map.c$82$5_0$260
;src/map.c:82: } else if (array[y][x] == GRAS) {
	cp	a, #0x02
	jr	NZ, 00106$
	C$map.c$83$6_0$263	= .
	.globl	C$map.c$83$6_0$263
;src/map.c:83: tile_array[0] = temp + (rand() % 4);
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x03
	ldhl	sp,	#16
	add	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	C$map.c$84$6_0$263	= .
	.globl	C$map.c$84$6_0$263
;src/map.c:84: tile_array[1] = temp + (rand() % 4);
	push	bc
	call	_rand
	ld	a, e
	pop	bc
	and	a, #0x03
	ldhl	sp,	#16
	add	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	C$map.c$85$6_0$263	= .
	.globl	C$map.c$85$6_0$263
;src/map.c:85: tile_array[2] = temp - 1;
	ldhl	sp,	#16
	ld	a, (hl)
	dec	a
	ldhl	sp,	#2
	ld	(hl), a
	C$map.c$86$6_0$263	= .
	.globl	C$map.c$86$6_0$263
;src/map.c:86: tile_array[3] = temp - 2;
	ldhl	sp,	#16
	ld	a, (hl)
	dec	a
	dec	a
	ldhl	sp,	#3
	ld	(hl), a
	jr	00110$
00106$:
	C$map.c$87$5_0$260	= .
	.globl	C$map.c$87$5_0$260
;src/map.c:87: } else if (array[y][x] == DIRT) {
	C$map.c$88$2_0$257	= .
	.globl	C$map.c$88$2_0$257
;src/map.c:88: for (int i = 0; i < 4; i++) tile_array[i] = temp + i;
	dec	a
	jr	NZ, 00110$
	ldhl	sp,	#22
	ld	(hl+), a
	ld	(hl), a
00122$:
	ldhl	sp,	#22
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00277$
	bit	7, d
	jr	NZ, 00278$
	cp	a, a
	jr	00278$
00277$:
	bit	7, d
	jr	Z, 00278$
	scf
00278$:
	jr	NC, 00102$
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#22
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#22
	ld	a, (hl)
	ldhl	sp,	#16
	add	a, (hl)
	ld	(de), a
	ldhl	sp,	#22
	inc	(hl)
	jr	NZ, 00122$
	inc	hl
	inc	(hl)
	jr	00122$
00102$:
	C$map.c$89$6_0$264	= .
	.globl	C$map.c$89$6_0$264
;src/map.c:89: shuffle(tile_array);
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_shuffle
	pop	bc
00110$:
	C$map.c$92$5_0$260	= .
	.globl	C$map.c$92$5_0$260
;src/map.c:92: if (array[y][x] == EMPTY) {
	ld	a, (bc)
	or	a, a
	jr	NZ, 00153$
	C$map.c$93$2_0$257	= .
	.globl	C$map.c$93$2_0$257
;src/map.c:93: for (int i = 0; i < 4; i++) palette_array[i] = 0;
	ld	bc, #0x0000
00125$:
	ld	a, c
	sub	a, #0x04
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00115$
	ld	hl, #4
	add	hl, sp
	add	hl, bc
	ld	(hl), #0x00
	inc	bc
	jr	00125$
	C$map.c$95$2_0$257	= .
	.globl	C$map.c$95$2_0$257
;src/map.c:95: for (int i = 0; i < 4; i++) palette_array[i] = materials[(tile_array[i] + 4 - TILESTART) / 4].color_palette;
00153$:
	xor	a, a
	ldhl	sp,	#22
	ld	(hl+), a
	ld	(hl), a
00128$:
	ldhl	sp,	#22
	ld	a, (hl+)
	sub	a, #0x04
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00280$
	bit	7, d
	jr	NZ, 00281$
	cp	a, a
	jr	00281$
00280$:
	bit	7, d
	jr	Z, 00281$
	scf
00281$:
	jp	NC, 00115$
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#22
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
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#22
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0xffa8
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00138$
	ld	hl, #0xffab
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
00138$:
	ldhl	sp,#15
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_materials
	add	hl, de
	ld	bc, #0x0008
	add	hl, bc
	ld	c, (hl)
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	ldhl	sp,	#22
	inc	(hl)
	jp	NZ,00128$
	inc	hl
	inc	(hl)
	jp	00128$
00115$:
	C$map.c$99$5_0$260	= .
	.globl	C$map.c$99$5_0$260
;src/map.c:99: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$map.c$100$5_0$260	= .
	.globl	C$map.c$100$5_0$260
;src/map.c:100: set_bkg_tiles(2 * x, 2 * y, 2, 1, tile_array);
	ldhl	sp,	#21
	ld	a, (hl)
	add	a, a
	ld	b, a
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$101$5_0$260	= .
	.globl	C$map.c$101$5_0$260
;src/map.c:101: set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, tile_array + 2);
	ldhl	sp,	#20
	ld	a, (hl)
	add	a, a
	ld	c, a
	inc	c
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$104$5_0$260	= .
	.globl	C$map.c$104$5_0$260
;src/map.c:104: VBK_REG = 1;
	ld	a, #0x01
	ldh	(_VBK_REG + 0), a
	C$map.c$105$5_0$260	= .
	.globl	C$map.c$105$5_0$260
;src/map.c:105: set_bkg_tiles(2 * x, 2 * y, 2, 1, palette_array);
	ld	hl, #4
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$106$5_0$260	= .
	.globl	C$map.c$106$5_0$260
;src/map.c:106: set_bkg_tiles(2 * x, 2 * y + 1, 2, 1, palette_array + 2);
	ld	hl, #6
	add	hl, sp
	push	hl
	ld	hl, #0x102
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
	C$map.c$109$5_0$260	= .
	.globl	C$map.c$109$5_0$260
;src/map.c:109: VBK_REG = 0;
	xor	a, a
	ldh	(_VBK_REG + 0), a
	C$map.c$75$4_0$259	= .
	.globl	C$map.c$75$4_0$259
;src/map.c:75: for (uint8_t x = x1; x < x1 + c; x++) {
	ldhl	sp,	#21
	inc	(hl)
	jp	00131$
00135$:
	C$map.c$74$2_0$257	= .
	.globl	C$map.c$74$2_0$257
;src/map.c:74: for (uint8_t y = y1; y < y1 + r; y++) {
	ldhl	sp,	#20
	inc	(hl)
	jp	00134$
00136$:
	C$map.c$112$2_0$257	= .
	.globl	C$map.c$112$2_0$257
;src/map.c:112: }
	add	sp, #24
	pop	hl
	add	sp, #3
	jp	(hl)
	G$spawn_bkg_row$0$0	= .
	.globl	G$spawn_bkg_row$0$0
	C$map.c$115$2_0$271	= .
	.globl	C$map.c$115$2_0$271
;src/map.c:115: void spawn_bkg_row(void) {
;	---------------------------------
; Function spawn_bkg_row
; ---------------------------------
_spawn_bkg_row::
	C$map.c$116$1_0$271	= .
	.globl	C$map.c$116$1_0$271
;src/map.c:116: if (depth > 3) {
	ld	a, #0x03
	ld	hl, #_depth
	sub	a, (hl)
	ret	NC
	C$map.c$117$2_0$272	= .
	.globl	C$map.c$117$2_0$272
;src/map.c:117: if (depth - depth_offset == (8 - THRESHOLD - BOTTOM)) set_4bkg_tiles(level_array, 0, depth + 4, 1, 16);
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
	C$map.c$118$2_0$272	= .
	.globl	C$map.c$118$2_0$272
;src/map.c:118: else if (depth - depth_offset == THRESHOLD) set_4bkg_tiles(level_array, 0, depth - 4, 1, 16);
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
	C$map.c$120$1_0$271	= .
	.globl	C$map.c$120$1_0$271
;src/map.c:120: }
	C$map.c$120$1_0$271	= .
	.globl	C$map.c$120$1_0$271
	XG$spawn_bkg_row$0$0	= .
	.globl	XG$spawn_bkg_row$0$0
	ret
	G$clear_4bkg_tiles$0$0	= .
	.globl	G$clear_4bkg_tiles$0$0
	C$map.c$129$1_0$274	= .
	.globl	C$map.c$129$1_0$274
;src/map.c:129: void clear_4bkg_tiles(uint8_t array[][16], uint8_t x, uint8_t y) {
;	---------------------------------
; Function clear_4bkg_tiles
; ---------------------------------
_clear_4bkg_tiles::
	ld	c, a
	C$map.c$130$1_0$274	= .
	.globl	C$map.c$130$1_0$274
;src/map.c:130: array[y][x] = 0; // Clear the tile in the array
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
	C$map.c$131$1_0$274	= .
	.globl	C$map.c$131$1_0$274
;src/map.c:131: set_4bkg_tiles(array, x, y, 1, 1); // Update the background
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	ld	a, c
	call	_set_4bkg_tiles
	C$map.c$132$1_0$274	= .
	.globl	C$map.c$132$1_0$274
;src/map.c:132: }
	pop	hl
	inc	sp
	jp	(hl)
	G$add_block$0$0	= .
	.globl	G$add_block$0$0
	C$map.c$144$1_0$276	= .
	.globl	C$map.c$144$1_0$276
;src/map.c:144: void add_block(uint8_t array[][16], uint8_t x, uint8_t y, uint8_t type) {
;	---------------------------------
; Function add_block
; ---------------------------------
_add_block::
	ld	c, a
	C$map.c$145$1_0$276	= .
	.globl	C$map.c$145$1_0$276
;src/map.c:145: array[y][x] = type;
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
	C$map.c$146$1_0$276	= .
	.globl	C$map.c$146$1_0$276
;src/map.c:146: set_4bkg_tiles(level_array, x, y, 1, 1);
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
	C$map.c$147$1_0$276	= .
	.globl	C$map.c$147$1_0$276
;src/map.c:147: }
	pop	hl
	pop	af
	jp	(hl)
	G$progressbar$0$0	= .
	.globl	G$progressbar$0$0
	C$map.c$159$1_0$279	= .
	.globl	C$map.c$159$1_0$279
;src/map.c:159: void progressbar(int16_t current_value, int16_t max_value, uint8_t digits, uint8_t tilestart, uint8_t x, uint8_t y) {
;	---------------------------------
; Function progressbar
; ---------------------------------
_progressbar::
	add	sp, #-8
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$map.c$161$1_0$278	= .
	.globl	C$map.c$161$1_0$278
;src/map.c:161: uint8_t total_pixels = digits * 8;
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	C$map.c$162$1_0$278	= .
	.globl	C$map.c$162$1_0$278
;src/map.c:162: uint16_t pixels_to_fill = (current_value * total_pixels) / max_value;
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
	C$map.c$164$5_0$282	= .
	.globl	C$map.c$164$5_0$282
;src/map.c:164: for (uint8_t i = 0; i < digits; i++) {
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
	C$map.c$165$4_0$280	= .
	.globl	C$map.c$165$4_0$280
;src/map.c:165: uint8_t tile_index = SPRITE_TILE_EMPTY; // Default to empty
	ld	e, #0x00
	C$map.c$167$3_0$280	= .
	.globl	C$map.c$167$3_0$280
;src/map.c:167: uint8_t effective_pixels = (pixels_to_fill > sprite_pixels) ? sprite_pixels : pixels_to_fill;
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
	C$map.c$170$3_0$280	= .
	.globl	C$map.c$170$3_0$280
;src/map.c:170: pixels_to_fill -= effective_pixels;
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
	C$map.c$173$3_0$280	= .
	.globl	C$map.c$173$3_0$280
;src/map.c:173: switch (effective_pixels) {
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
	C$map.c$174$4_0$281	= .
	.globl	C$map.c$174$4_0$281
;src/map.c:174: case 0: tile_index = SPRITE_TILE_EMPTY; break;
00101$:
	ld	e, #0x00
	jr	00117$
	C$map.c$175$4_0$281	= .
	.globl	C$map.c$175$4_0$281
;src/map.c:175: case 1: tile_index = SPRITE_TILE_1_8; break;
00102$:
	ld	e, #0x20
	jr	00117$
	C$map.c$176$4_0$281	= .
	.globl	C$map.c$176$4_0$281
;src/map.c:176: case 2: tile_index = SPRITE_TILE_2_8; break;
00103$:
	ld	e, #0x21
	jr	00117$
	C$map.c$177$4_0$281	= .
	.globl	C$map.c$177$4_0$281
;src/map.c:177: case 3: tile_index = SPRITE_TILE_3_8; break;
00104$:
	ld	e, #0x22
	jr	00117$
	C$map.c$178$4_0$281	= .
	.globl	C$map.c$178$4_0$281
;src/map.c:178: case 4: tile_index = SPRITE_TILE_4_8; break;
00105$:
	ld	e, #0x23
	jr	00117$
	C$map.c$179$4_0$281	= .
	.globl	C$map.c$179$4_0$281
;src/map.c:179: case 5: tile_index = SPRITE_TILE_5_8; break;
00106$:
	ld	e, #0x24
	jr	00117$
	C$map.c$180$4_0$281	= .
	.globl	C$map.c$180$4_0$281
;src/map.c:180: case 6: tile_index = SPRITE_TILE_6_8; break;
00107$:
	ld	e, #0x25
	jr	00117$
	C$map.c$181$4_0$281	= .
	.globl	C$map.c$181$4_0$281
;src/map.c:181: case 7: tile_index = SPRITE_TILE_7_8; break;
00108$:
	ld	e, #0x26
	jr	00117$
	C$map.c$182$4_0$281	= .
	.globl	C$map.c$182$4_0$281
;src/map.c:182: case 8: 
00109$:
	C$map.c$183$4_0$281	= .
	.globl	C$map.c$183$4_0$281
;src/map.c:183: if (i == 0) { // First sprite
	ldhl	sp,	#7
	ld	a, (hl)
	or	a, a
	jr	NZ, 00115$
	C$map.c$184$5_0$282	= .
	.globl	C$map.c$184$5_0$282
;src/map.c:184: tile_index = (digits == 1 || pixels_to_fill == 0) ? SPRITE_TILE_END : SPRITE_TILE_MID;
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
	C$map.c$185$4_0$281	= .
	.globl	C$map.c$185$4_0$281
;src/map.c:185: } else if (i == digits - 1 || pixels_to_fill == 0) { // Last sprite or no more pixels to fill
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
	C$map.c$186$5_0$283	= .
	.globl	C$map.c$186$5_0$283
;src/map.c:186: tile_index = SPRITE_TILE_END;
	ld	e, #0x27
	jr	00117$
00111$:
	C$map.c$188$5_0$284	= .
	.globl	C$map.c$188$5_0$284
;src/map.c:188: tile_index = SPRITE_TILE_MID;
	ld	e, #0x28
	C$map.c$191$3_0$280	= .
	.globl	C$map.c$191$3_0$280
;src/map.c:191: }
00117$:
;src/map.c:194: set_sprite_tile(tilestart + i, tile_index);
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
;src/map.c:195: move_sprite(tilestart + i, x + i * 8, y);
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
	C$map.c$164$2_0$279	= .
	.globl	C$map.c$164$2_0$279
;src/map.c:164: for (uint8_t i = 0; i < digits; i++) {
	ldhl	sp,	#7
	inc	(hl)
	jp	00122$
00124$:
	C$map.c$197$2_0$279	= .
	.globl	C$map.c$197$2_0$279
;src/map.c:197: }
	add	sp, #8
	pop	hl
	add	sp, #4
	jp	(hl)
	G$draw_depth$0$0	= .
	.globl	G$draw_depth$0$0
	C$map.c$199$2_0$292	= .
	.globl	C$map.c$199$2_0$292
;src/map.c:199: void draw_depth(void){
;	---------------------------------
; Function draw_depth
; ---------------------------------
_draw_depth::
	add	sp, #-10
	C$map.c$201$1_0$292	= .
	.globl	C$map.c$201$1_0$292
;src/map.c:201: itoa((depth <= EARTH_START) ? 0 : (depth - EARTH_START), string, 10);
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
	C$map.c$202$1_0$292	= .
	.globl	C$map.c$202$1_0$292
;src/map.c:202: strcat(string, "m");
	ld	bc, #___str_0
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$203$1_0$292	= .
	.globl	C$map.c$203$1_0$292
;src/map.c:203: draw_text(15,0,"Depth",5,TRUE,0);
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
	C$map.c$204$1_0$292	= .
	.globl	C$map.c$204$1_0$292
;src/map.c:204: draw_text(15,1,string,5,FALSE,0);
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
	C$map.c$205$1_0$292	= .
	.globl	C$map.c$205$1_0$292
;src/map.c:205: }
	add	sp, #10
	C$map.c$205$1_0$292	= .
	.globl	C$map.c$205$1_0$292
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
	C$map.c$207$1_0$294	= .
	.globl	C$map.c$207$1_0$294
;src/map.c:207: void draw_cargo(void){
;	---------------------------------
; Function draw_cargo
; ---------------------------------
_draw_cargo::
	add	sp, #-20
	C$map.c$210$1_0$294	= .
	.globl	C$map.c$210$1_0$294
;src/map.c:210: itoa(player.cargo.current_value, string, 10);
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
	C$map.c$211$1_0$294	= .
	.globl	C$map.c$211$1_0$294
;src/map.c:211: itoa(player.cargo.max_value, string_max, 10);
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
	C$map.c$212$1_0$294	= .
	.globl	C$map.c$212$1_0$294
;src/map.c:212: strcat(string, "/");
	ld	bc, #___str_2
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$213$1_0$294	= .
	.globl	C$map.c$213$1_0$294
;src/map.c:213: strcat(string, string_max);
	ld	hl, #10
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_strcat
	C$map.c$214$1_0$294	= .
	.globl	C$map.c$214$1_0$294
;src/map.c:214: draw_text(9,0,"Cargo",5,TRUE,0);
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
	C$map.c$215$1_0$294	= .
	.globl	C$map.c$215$1_0$294
;src/map.c:215: draw_text(9,1,string,5,TRUE,0);
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
	C$map.c$216$1_0$294	= .
	.globl	C$map.c$216$1_0$294
;src/map.c:216: }
	add	sp, #20
	C$map.c$216$1_0$294	= .
	.globl	C$map.c$216$1_0$294
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
	C$map.c$218$1_0$296	= .
	.globl	C$map.c$218$1_0$296
;src/map.c:218: void draw_fuel(void){
;	---------------------------------
; Function draw_fuel
; ---------------------------------
_draw_fuel::
	C$map.c$219$1_0$296	= .
	.globl	C$map.c$219$1_0$296
;src/map.c:219: progressbar(player.fuel.current_value, player.fuel.max_value, 3, 35, 44, 20);
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
	C$map.c$220$1_0$296	= .
	.globl	C$map.c$220$1_0$296
;src/map.c:220: }
	C$map.c$220$1_0$296	= .
	.globl	C$map.c$220$1_0$296
	XG$draw_fuel$0$0	= .
	.globl	XG$draw_fuel$0$0
	ret
	G$draw_hull$0$0	= .
	.globl	G$draw_hull$0$0
	C$map.c$221$1_0$298	= .
	.globl	C$map.c$221$1_0$298
;src/map.c:221: void draw_hull(void){
;	---------------------------------
; Function draw_hull
; ---------------------------------
_draw_hull::
	C$map.c$222$1_0$298	= .
	.globl	C$map.c$222$1_0$298
;src/map.c:222: progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
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
	C$map.c$223$1_0$298	= .
	.globl	C$map.c$223$1_0$298
;src/map.c:223: }
	C$map.c$223$1_0$298	= .
	.globl	C$map.c$223$1_0$298
	XG$draw_hull$0$0	= .
	.globl	XG$draw_hull$0$0
	ret
	G$draw_character$0$0	= .
	.globl	G$draw_character$0$0
	C$map.c$226$1_0$300	= .
	.globl	C$map.c$226$1_0$300
;src/map.c:226: void draw_character(void){
;	---------------------------------
; Function draw_character
; ---------------------------------
_draw_character::
	C$map.c$227$1_0$300	= .
	.globl	C$map.c$227$1_0$300
;src/map.c:227: set_sprite_data(CHARSTART, 16, rover_tiles);
	ld	de, #_rover_tiles
	push	de
	ld	hl, #0x1001
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$map.c$228$1_0$300	= .
	.globl	C$map.c$228$1_0$300
;src/map.c:228: draw_metasprite(direction_prev);
	ld	hl, #_direction_prev
	ld	a, (hl)
	C$map.c$229$1_0$300	= .
	.globl	C$map.c$229$1_0$300
;src/map.c:229: }
	C$map.c$229$1_0$300	= .
	.globl	C$map.c$229$1_0$300
	XG$draw_character$0$0	= .
	.globl	XG$draw_character$0$0
	jp	_draw_metasprite
	G$init_nav$0$0	= .
	.globl	G$init_nav$0$0
	C$map.c$231$1_0$302	= .
	.globl	C$map.c$231$1_0$302
;src/map.c:231: void init_nav(void){
;	---------------------------------
; Function init_nav
; ---------------------------------
_init_nav::
	C$map.c$232$1_0$302	= .
	.globl	C$map.c$232$1_0$302
;src/map.c:232: set_win_tiles(0,0,20,3,nav_map);
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
	C$map.c$233$3_0$302	= .
	.globl	C$map.c$233$3_0$302
;src/map.c:233: move_win(7, 0); //124
	C$map.c$234$3_0$302	= .
	.globl	C$map.c$234$3_0$302
;src/map.c:234: }
	C$map.c$234$3_0$302	= .
	.globl	C$map.c$234$3_0$302
	XG$init_nav$0$0	= .
	.globl	XG$init_nav$0$0
	ret
	G$init_tiles$0$0	= .
	.globl	G$init_tiles$0$0
	C$map.c$236$3_0$307	= .
	.globl	C$map.c$236$3_0$307
;src/map.c:236: void init_tiles(void){
;	---------------------------------
; Function init_tiles
; ---------------------------------
_init_tiles::
	C$map.c$237$1_0$307	= .
	.globl	C$map.c$237$1_0$307
;src/map.c:237: set_bkg_data(TILESTART, 28, tile_tiles);
	ld	de, #_tile_tiles
	push	de
	ld	hl, #0x1c5c
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$map.c$238$1_0$307	= .
	.globl	C$map.c$238$1_0$307
;src/map.c:238: set_bkg_data(NAVSTART, nav_TILE_COUNT, nav_tiles);
	ld	de, #_nav_tiles
	push	de
	ld	hl, #0xc80
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$map.c$239$1_0$307	= .
	.globl	C$map.c$239$1_0$307
;src/map.c:239: set_4bkg_tiles(level_array, 0, 0, 16, 16);
	ld	hl, #0x1010
	push	hl
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	de, #_level_array
	call	_set_4bkg_tiles
	C$map.c$240$1_0$307	= .
	.globl	C$map.c$240$1_0$307
;src/map.c:240: }
	C$map.c$240$1_0$307	= .
	.globl	C$map.c$240$1_0$307
	XG$init_tiles$0$0	= .
	.globl	XG$init_tiles$0$0
	ret
	G$init_progressbar$0$0	= .
	.globl	G$init_progressbar$0$0
	C$map.c$242$1_0$309	= .
	.globl	C$map.c$242$1_0$309
;src/map.c:242: void init_progressbar(void){
;	---------------------------------
; Function init_progressbar
; ---------------------------------
_init_progressbar::
	C$map.c$243$1_0$309	= .
	.globl	C$map.c$243$1_0$309
;src/map.c:243: set_sprite_data(SPRITE_TILE_1_8, progressbar_TILE_COUNT, progressbar_tiles);
	ld	de, #_progressbar_tiles
	push	de
	ld	hl, #0x920
	push	hl
	call	_set_sprite_data
	add	sp, #4
	C$map.c$244$1_0$309	= .
	.globl	C$map.c$244$1_0$309
;src/map.c:244: progressbar(player.hull.current_value, player.hull.max_value, 2, 32, 12, 20);
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
	C$map.c$245$1_0$309	= .
	.globl	C$map.c$245$1_0$309
;src/map.c:245: }
	C$map.c$245$1_0$309	= .
	.globl	C$map.c$245$1_0$309
	XG$init_progressbar$0$0	= .
	.globl	XG$init_progressbar$0$0
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
