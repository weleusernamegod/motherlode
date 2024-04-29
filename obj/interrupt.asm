;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module interrupt
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _init_disable_lcd_interrupt
	.globl _init_enable_lcd_interrupt
	.globl _init_framecounter
	.globl _interrupt_VBL_framecounter
	.globl _interrupt_VBL_window
	.globl _interrupt_LCD
	.globl _set_interrupts
	.globl _add_LCD
	.globl _add_VBL
	.globl _remove_LCD
	.globl _remove_VBL
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
	G$interrupt_LCD$0$0	= .
	.globl	G$interrupt_LCD$0$0
	C$interrupt.c$8$0_0$130	= .
	.globl	C$interrupt.c$8$0_0$130
;src/interrupt.c:8: void interrupt_LCD(void) {
;	---------------------------------
; Function interrupt_LCD
; ---------------------------------
_interrupt_LCD::
;/usr/local/opt/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0xa7
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
	C$interrupt.c$9$3_0$130	= .
	.globl	C$interrupt.c$9$3_0$130
;src/interrupt.c:9: move_win(167, 0);
	C$interrupt.c$10$3_0$130	= .
	.globl	C$interrupt.c$10$3_0$130
;src/interrupt.c:10: }
	C$interrupt.c$10$3_0$130	= .
	.globl	C$interrupt.c$10$3_0$130
	XG$interrupt_LCD$0$0	= .
	.globl	XG$interrupt_LCD$0$0
	ret
	G$interrupt_VBL_window$0$0	= .
	.globl	G$interrupt_VBL_window$0$0
	C$interrupt.c$11$3_0$135	= .
	.globl	C$interrupt.c$11$3_0$135
;src/interrupt.c:11: void interrupt_VBL_window(void) {
;	---------------------------------
; Function interrupt_VBL_window
; ---------------------------------
_interrupt_VBL_window::
;/usr/local/opt/gbdk/include/gb/gb.h:1656: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
	C$interrupt.c$12$3_0$135	= .
	.globl	C$interrupt.c$12$3_0$135
;src/interrupt.c:12: move_win(7, 0);
	C$interrupt.c$13$3_0$135	= .
	.globl	C$interrupt.c$13$3_0$135
;src/interrupt.c:13: }
	C$interrupt.c$13$3_0$135	= .
	.globl	C$interrupt.c$13$3_0$135
	XG$interrupt_VBL_window$0$0	= .
	.globl	XG$interrupt_VBL_window$0$0
	ret
	G$interrupt_VBL_framecounter$0$0	= .
	.globl	G$interrupt_VBL_framecounter$0$0
	C$interrupt.c$15$3_0$140	= .
	.globl	C$interrupt.c$15$3_0$140
;src/interrupt.c:15: void interrupt_VBL_framecounter(void) {
;	---------------------------------
; Function interrupt_VBL_framecounter
; ---------------------------------
_interrupt_VBL_framecounter::
	C$interrupt.c$16$1_0$140	= .
	.globl	C$interrupt.c$16$1_0$140
;src/interrupt.c:16: frame_counter++;  // Increment the frame counter every VBlank
	ld	hl, #_frame_counter
	inc	(hl)
	ld	a, (hl)
	C$interrupt.c$17$1_0$140	= .
	.globl	C$interrupt.c$17$1_0$140
;src/interrupt.c:17: if (frame_counter >= 60) frame_counter = 0;
	ld	a, (hl)
	sub	a, #0x3c
	ret	C
	ld	(hl), #0x00
	C$interrupt.c$18$1_0$140	= .
	.globl	C$interrupt.c$18$1_0$140
;src/interrupt.c:18: }
	C$interrupt.c$18$1_0$140	= .
	.globl	C$interrupt.c$18$1_0$140
	XG$interrupt_VBL_framecounter$0$0	= .
	.globl	XG$interrupt_VBL_framecounter$0$0
	ret
	G$init_framecounter$0$0	= .
	.globl	G$init_framecounter$0$0
	C$interrupt.c$20$1_0$142	= .
	.globl	C$interrupt.c$20$1_0$142
;src/interrupt.c:20: void init_framecounter(void) {
;	---------------------------------
; Function init_framecounter
; ---------------------------------
_init_framecounter::
	C$interrupt.c$21$1_0$142	= .
	.globl	C$interrupt.c$21$1_0$142
;src/interrupt.c:21: add_VBL(interrupt_VBL_framecounter);  // Add the VBL interrupt handler
	ld	de, #_interrupt_VBL_framecounter
	call	_add_VBL
;/usr/local/opt/gbdk/include/gb/gb.h:738: __asm__("ei");
	ei
	C$interrupt.c$22$3_0$142	= .
	.globl	C$interrupt.c$22$3_0$142
;src/interrupt.c:22: enable_interrupts();  // Enable interrupts globally
	C$interrupt.c$23$3_0$142	= .
	.globl	C$interrupt.c$23$3_0$142
;src/interrupt.c:23: }
	C$interrupt.c$23$3_0$142	= .
	.globl	C$interrupt.c$23$3_0$142
	XG$init_framecounter$0$0	= .
	.globl	XG$init_framecounter$0$0
	ret
	G$init_enable_lcd_interrupt$0$0	= .
	.globl	G$init_enable_lcd_interrupt$0$0
	C$interrupt.c$25$3_0$147	= .
	.globl	C$interrupt.c$25$3_0$147
;src/interrupt.c:25: void init_enable_lcd_interrupt(void){
;	---------------------------------
; Function init_enable_lcd_interrupt
; ---------------------------------
_init_enable_lcd_interrupt::
	C$interrupt.c$27$1_0$147	= .
	.globl	C$interrupt.c$27$1_0$147
;src/interrupt.c:27: STAT_REG = 0x40;
	ld	a, #0x40
	ldh	(_STAT_REG + 0), a
	C$interrupt.c$29$1_0$147	= .
	.globl	C$interrupt.c$29$1_0$147
;src/interrupt.c:29: LYC_REG = 16;
	ld	a, #0x10
	ldh	(_LYC_REG + 0), a
;/usr/local/opt/gbdk/include/gb/gb.h:754: __asm__("di");
	di
	C$interrupt.c$31$1_0$147	= .
	.globl	C$interrupt.c$31$1_0$147
;src/interrupt.c:31: add_LCD(interrupt_LCD);
	ld	de, #_interrupt_LCD
	call	_add_LCD
	C$interrupt.c$32$1_0$147	= .
	.globl	C$interrupt.c$32$1_0$147
;src/interrupt.c:32: add_VBL(interrupt_VBL_window);
	ld	de, #_interrupt_VBL_window
	call	_add_VBL
;/usr/local/opt/gbdk/include/gb/gb.h:738: __asm__("ei");
	ei
	C$interrupt.c$34$1_0$147	= .
	.globl	C$interrupt.c$34$1_0$147
;src/interrupt.c:34: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	C$interrupt.c$35$1_0$147	= .
	.globl	C$interrupt.c$35$1_0$147
;src/interrupt.c:35: }
	C$interrupt.c$35$1_0$147	= .
	.globl	C$interrupt.c$35$1_0$147
	XG$init_enable_lcd_interrupt$0$0	= .
	.globl	XG$init_enable_lcd_interrupt$0$0
	jp	_set_interrupts
	G$init_disable_lcd_interrupt$0$0	= .
	.globl	G$init_disable_lcd_interrupt$0$0
	C$interrupt.c$37$1_0$155	= .
	.globl	C$interrupt.c$37$1_0$155
;src/interrupt.c:37: void init_disable_lcd_interrupt(void) {
;	---------------------------------
; Function init_disable_lcd_interrupt
; ---------------------------------
_init_disable_lcd_interrupt::
;/usr/local/opt/gbdk/include/gb/gb.h:754: __asm__("di");
	di
	C$interrupt.c$41$1_0$155	= .
	.globl	C$interrupt.c$41$1_0$155
;src/interrupt.c:41: remove_LCD(interrupt_LCD);
	ld	de, #_interrupt_LCD
	call	_remove_LCD
	C$interrupt.c$42$1_0$155	= .
	.globl	C$interrupt.c$42$1_0$155
;src/interrupt.c:42: remove_VBL(interrupt_VBL_window);
	ld	de, #_interrupt_VBL_window
	call	_remove_VBL
	C$interrupt.c$45$1_0$155	= .
	.globl	C$interrupt.c$45$1_0$155
;src/interrupt.c:45: STAT_REG = 0x00; // This sets the STAT_REG to a state where no LCD STAT interrupts are enabled
	ld	a, #0x00
	ldh	(_STAT_REG + 0), a
;/usr/local/opt/gbdk/include/gb/gb.h:738: __asm__("ei");
	ei
	C$interrupt.c$47$1_0$155	= .
	.globl	C$interrupt.c$47$1_0$155
;src/interrupt.c:47: set_interrupts(VBL_IFLAG | LCD_IFLAG);
	ld	a, #0x03
	C$interrupt.c$48$1_0$155	= .
	.globl	C$interrupt.c$48$1_0$155
;src/interrupt.c:48: }
	C$interrupt.c$48$1_0$155	= .
	.globl	C$interrupt.c$48$1_0$155
	XG$init_disable_lcd_interrupt$0$0	= .
	.globl	XG$init_disable_lcd_interrupt$0$0
	jp	_set_interrupts
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
