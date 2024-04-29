;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module inventory
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _materials
	.globl _update_inventory
	.globl _calculate_cargo
	.globl _sell_all_ores
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
G$materials$0_0$0==.
_materials::
	.ds 216
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
	G$update_inventory$0$0	= .
	.globl	G$update_inventory$0$0
	C$inventory.c$44$0_0$142	= .
	.globl	C$inventory.c$44$0_0$142
;src/inventory.c:44: void update_inventory(void) {
;	---------------------------------
; Function update_inventory
; ---------------------------------
_update_inventory::
	C$inventory.c$45$1_0$142	= .
	.globl	C$inventory.c$45$1_0$142
;src/inventory.c:45: uint8_t material_index = level_array[depth][width];
	ld	bc, #_level_array+0
	ld	hl, #_depth
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_width
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
	C$inventory.c$47$1_0$142	= .
	.globl	C$inventory.c$47$1_0$142
;src/inventory.c:47: if (material_index >= COAL && material_index <= DIAMOND) {
	ld	a, c
	sub	a, #0x04
	jr	C, 00102$
	ld	a, #0x12
	sub	a, c
	jr	C, 00102$
	C$inventory.c$48$2_0$143	= .
	.globl	C$inventory.c$48$2_0$143
;src/inventory.c:48: materials[material_index].inventory++;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_materials
	add	hl, de
	ld	de, #0x0007
	add	hl, de
	inc	(hl)
00102$:
	C$inventory.c$51$1_0$142	= .
	.globl	C$inventory.c$51$1_0$142
;src/inventory.c:51: if (material_index == BONES) {
	ld	a, c
	sub	a, #0x1e
	jr	NZ, 00110$
	C$inventory.c$52$2_0$144	= .
	.globl	C$inventory.c$52$2_0$144
;src/inventory.c:52: player.money += 1000;
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x03e8
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_player + 342)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ret
00110$:
	C$inventory.c$53$1_0$142	= .
	.globl	C$inventory.c$53$1_0$142
;src/inventory.c:53: } else if (material_index == ARTEFACT) {
	ld	a, c
	sub	a, #0x1f
	jr	NZ, 00107$
	C$inventory.c$54$2_0$145	= .
	.globl	C$inventory.c$54$2_0$145
;src/inventory.c:54: player.money += 5000;
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x1388
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_player + 342)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ret
00107$:
	C$inventory.c$55$1_0$142	= .
	.globl	C$inventory.c$55$1_0$142
;src/inventory.c:55: } else if (material_index == TREASURE) {
	ld	a, c
	sub	a, #0x20
	ret	NZ
	C$inventory.c$56$2_0$146	= .
	.globl	C$inventory.c$56$2_0$146
;src/inventory.c:56: player.money += 10000;
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x2710
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_player + 342)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$inventory.c$58$1_0$142	= .
	.globl	C$inventory.c$58$1_0$142
;src/inventory.c:58: }
	C$inventory.c$58$1_0$142	= .
	.globl	C$inventory.c$58$1_0$142
	XG$update_inventory$0$0	= .
	.globl	XG$update_inventory$0$0
	ret
	G$calculate_cargo$0$0	= .
	.globl	G$calculate_cargo$0$0
	C$inventory.c$60$1_0$148	= .
	.globl	C$inventory.c$60$1_0$148
;src/inventory.c:60: void calculate_cargo(void) {
;	---------------------------------
; Function calculate_cargo
; ---------------------------------
_calculate_cargo::
	dec	sp
	dec	sp
	C$inventory.c$61$2_0$148	= .
	.globl	C$inventory.c$61$2_0$148
;src/inventory.c:61: int total_weight = 0;
	ld	bc, #0x0000
	C$inventory.c$62$3_0$150	= .
	.globl	C$inventory.c$62$3_0$150
;src/inventory.c:62: for (int i = COAL; i <= DIAMOND; i++) {
	ldhl	sp,	#0
	ld	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00103$:
	ldhl	sp,	#0
	ld	a, #0x12
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00122$
	bit	7, d
	jr	NZ, 00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z, 00123$
	scf
00123$:
	jr	C, 00101$
	C$inventory.c$63$3_0$150	= .
	.globl	C$inventory.c$63$3_0$150
;src/inventory.c:63: total_weight += materials[i].inventory * materials[i].weight;
	pop	de
	push	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	a, l
	add	a, #<(_materials)
	ld	e, a
	ld	a, h
	adc	a, #>(_materials)
	ld	d, a
	ld	hl, #0x0007
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	inc	de
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
	push	bc
	ld	a, l
	call	__muluchar
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	bc
	add	hl, bc
	ld	c, l
	ld	b, h
	C$inventory.c$62$2_0$149	= .
	.globl	C$inventory.c$62$2_0$149
;src/inventory.c:62: for (int i = COAL; i <= DIAMOND; i++) {
	ldhl	sp,	#0
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
	jr	00103$
00101$:
	C$inventory.c$65$1_0$148	= .
	.globl	C$inventory.c$65$1_0$148
;src/inventory.c:65: player.cargo.current_value = total_weight;
	ld	hl, #(_player + 187)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$inventory.c$66$1_0$148	= .
	.globl	C$inventory.c$66$1_0$148
;src/inventory.c:66: }
	inc	sp
	inc	sp
	C$inventory.c$66$1_0$148	= .
	.globl	C$inventory.c$66$1_0$148
	XG$calculate_cargo$0$0	= .
	.globl	XG$calculate_cargo$0$0
	ret
	G$sell_all_ores$0$0	= .
	.globl	G$sell_all_ores$0$0
	C$inventory.c$68$1_0$152	= .
	.globl	C$inventory.c$68$1_0$152
;src/inventory.c:68: void sell_all_ores(void) {
;	---------------------------------
; Function sell_all_ores
; ---------------------------------
_sell_all_ores::
	add	sp, #-4
	C$inventory.c$69$2_0$152	= .
	.globl	C$inventory.c$69$2_0$152
;src/inventory.c:69: int total_value = 0;
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	C$inventory.c$71$3_0$154	= .
	.globl	C$inventory.c$71$3_0$154
;src/inventory.c:71: for (int i = COAL; i <= DIAMOND; i++) {
	ld	(hl+), a
	ld	a, #0x04
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00104$:
	ldhl	sp,	#2
	ld	a, #0x12
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00141$
	bit	7, d
	jr	NZ, 00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z, 00142$
	scf
00142$:
	jr	C, 00101$
	C$inventory.c$72$3_0$154	= .
	.globl	C$inventory.c$72$3_0$154
;src/inventory.c:72: total_value += materials[i].inventory * materials[i].value;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_materials
	add	hl,bc
	ld	e, l
	ld	d, h
	ld	hl, #0x0007
	add	hl, de
	ld	c, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, c
	ld	d, #0x00
	ld	c, l
	ld	b, h
	call	__mulint
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	e, (hl)
	C$inventory.c$71$2_0$153	= .
	.globl	C$inventory.c$71$2_0$153
;src/inventory.c:71: for (int i = COAL; i <= DIAMOND; i++) {
	inc	hl
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	inc	sp
	inc	sp
	push	bc
	inc	(hl)
	jr	NZ, 00104$
	inc	hl
	inc	(hl)
	jr	00104$
00101$:
	C$inventory.c$75$1_0$152	= .
	.globl	C$inventory.c$75$1_0$152
;src/inventory.c:75: player.money += total_value;
	ld	hl, #(_player + 342)
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #(_player + 342)
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$inventory.c$78$3_0$156	= .
	.globl	C$inventory.c$78$3_0$156
;src/inventory.c:78: for (int i = COAL; i <= DIAMOND; i++) {
	ld	bc, #0x0004
00107$:
	ld	e, b
	ld	d, #0x00
	ld	a, #0x12
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00144$
	bit	7, d
	jr	NZ, 00145$
	cp	a, a
	jr	00145$
00144$:
	bit	7, d
	jr	Z, 00145$
	scf
00145$:
	jr	C, 00102$
	C$inventory.c$79$3_0$156	= .
	.globl	C$inventory.c$79$3_0$156
;src/inventory.c:79: materials[i].inventory = 0;  // Reset inventory after selling
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_materials
	add	hl, de
	ld	de, #0x0007
	add	hl, de
	ld	(hl), #0x00
	C$inventory.c$78$2_0$155	= .
	.globl	C$inventory.c$78$2_0$155
;src/inventory.c:78: for (int i = COAL; i <= DIAMOND; i++) {
	inc	bc
	jr	00107$
00102$:
	C$inventory.c$81$1_0$152	= .
	.globl	C$inventory.c$81$1_0$152
;src/inventory.c:81: currentGameState = GAME_STATE_PLAY;
	ld	hl, #_currentGameState
	ld	(hl), #0x03
	C$inventory.c$83$1_0$152	= .
	.globl	C$inventory.c$83$1_0$152
;src/inventory.c:83: }
	add	sp, #4
	C$inventory.c$83$1_0$152	= .
	.globl	C$inventory.c$83$1_0$152
	XG$sell_all_ores$0$0	= .
	.globl	XG$sell_all_ores$0$0
	ret
	.area _CODE
Finventory$__str_0$0_0$0 == .
___str_0:
	.ascii "Empty"
	.db 0x00
Finventory$__str_1$0_0$0 == .
___str_1:
	.ascii "Dirt"
	.db 0x00
Finventory$__str_2$0_0$0 == .
___str_2:
	.ascii "Grass"
	.db 0x00
Finventory$__str_3$0_0$0 == .
___str_3:
	.ascii "Stone"
	.db 0x00
Finventory$__str_4$0_0$0 == .
___str_4:
	.ascii "Coal"
	.db 0x00
Finventory$__str_5$0_0$0 == .
___str_5:
	.ascii "Iron"
	.db 0x00
Finventory$__str_6$0_0$0 == .
___str_6:
	.ascii "Copper"
	.db 0x00
Finventory$__str_7$0_0$0 == .
___str_7:
	.ascii "Tin"
	.db 0x00
Finventory$__str_8$0_0$0 == .
___str_8:
	.ascii "Silver"
	.db 0x00
Finventory$__str_9$0_0$0 == .
___str_9:
	.ascii "Gold"
	.db 0x00
Finventory$__str_10$0_0$0 == .
___str_10:
	.ascii "Mithril"
	.db 0x00
Finventory$__str_11$0_0$0 == .
___str_11:
	.ascii "Platinum"
	.db 0x00
Finventory$__str_12$0_0$0 == .
___str_12:
	.ascii "Titanium"
	.db 0x00
Finventory$__str_13$0_0$0 == .
___str_13:
	.ascii "Obsidium"
	.db 0x00
Finventory$__str_14$0_0$0 == .
___str_14:
	.ascii "Elementium"
	.db 0x00
Finventory$__str_15$0_0$0 == .
___str_15:
	.ascii "Adamantite"
	.db 0x00
Finventory$__str_16$0_0$0 == .
___str_16:
	.ascii "Emerald"
	.db 0x00
Finventory$__str_17$0_0$0 == .
___str_17:
	.ascii "Ruby"
	.db 0x00
Finventory$__str_18$0_0$0 == .
___str_18:
	.ascii "Diamond"
	.db 0x00
Finventory$__str_19$0_0$0 == .
___str_19:
	.ascii "Lava"
	.db 0x00
Finventory$__str_20$0_0$0 == .
___str_20:
	.ascii "Gas"
	.db 0x00
Finventory$__str_21$0_0$0 == .
___str_21:
	.ascii "Bones"
	.db 0x00
Finventory$__str_22$0_0$0 == .
___str_22:
	.ascii "Artefact"
	.db 0x00
Finventory$__str_23$0_0$0 == .
___str_23:
	.ascii "Treasure"
	.db 0x00
	.area _INITIALIZER
Finventory$__xinit_materials$0_0$0 == .
__xinit__materials:
	.dw ___str_0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x00	; 0
	.dw ___str_1
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.dw #0x0000
	.db #0x00	; 0
	.db #0x02	; 2
	.dw ___str_2
	.db #0x02	; 2
	.db #0x10	; 16
	.db #0x01	; 1
	.dw #0x0000
	.db #0x00	; 0
	.db #0x01	; 1
	.dw ___str_3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x02	; 2
	.dw ___str_4
	.db #0x04	; 4
	.db #0x20	; 32
	.db #0x01	; 1
	.dw #0x000f
	.db #0x00	; 0
	.db #0x03	; 3
	.dw ___str_5
	.db #0x05	; 5
	.db #0x20	; 32
	.db #0x01	; 1
	.dw #0x001e
	.db #0x00	; 0
	.db #0x03	; 3
	.dw ___str_6
	.db #0x06	; 6
	.db #0x28	; 40
	.db #0x02	; 2
	.dw #0x003c
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_7
	.db #0x07	; 7
	.db #0x2d	; 45
	.db #0x02	; 2
	.dw #0x0050
	.db #0x00	; 0
	.db #0x02	; 2
	.dw ___str_8
	.db #0x08	; 8
	.db #0x32	; 50	'2'
	.db #0x03	; 3
	.dw #0x0064
	.db #0x00	; 0
	.db #0x01	; 1
	.dw ___str_9
	.db #0x09	; 9
	.db #0x40	; 64
	.db #0x03	; 3
	.dw #0x00fa
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_10
	.db #0x0a	; 10
	.db #0x50	; 80	'P'
	.db #0x04	; 4
	.dw #0x01f4
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_11
	.db #0x0b	; 11
	.db #0x64	; 100	'd'
	.db #0x05	; 5
	.dw #0x02ee
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_12
	.db #0x0c	; 12
	.db #0x78	; 120	'x'
	.db #0x08	; 8
	.dw #0x04b0
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_13
	.db #0x0d	; 13
	.db #0x96	; 150
	.db #0x0a	; 10
	.dw #0x1388
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_14
	.db #0x0e	; 14
	.db #0xc8	; 200
	.db #0x14	; 20
	.dw #0x2710
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_15
	.db #0x0f	; 15
	.db #0xfa	; 250
	.db #0x1e	; 30
	.dw #0x3a98
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_16
	.db #0x10	; 16
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.dw #0x07d0
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_17
	.db #0x11	; 17
	.db #0x50	; 80	'P'
	.db #0x0a	; 10
	.dw #0x1388
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_18
	.db #0x12	; 18
	.db #0xa0	; 160
	.db #0x0a	; 10
	.dw #0x2710
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_19
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_20
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_21
	.db #0x1e	; 30
	.db #0x40	; 64
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_22
	.db #0x1f	; 31
	.db #0x40	; 64
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x04	; 4
	.dw ___str_23
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.dw #0x0000
	.db #0x00	; 0
	.db #0x04	; 4
	.area _CABS (ABS)
