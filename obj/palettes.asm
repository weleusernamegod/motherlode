;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module palettes
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _palette_purple
	.globl _palette_yellow
	.globl _palette_blue
	.globl _palette_green
	.globl _palette_orange
	.globl _palette_dark_red
	.globl _palette_red
	.globl _palette_button_passive
	.globl _palette_button_active
	.globl _palette_grey
	.globl _palette_light_grey
	.globl _palette_default
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
	.area _CODE
_palette_default:
	.dw #0x7fff
	.dw #0x56b5
	.dw #0x294a
	.dw #0x0000
_palette_light_grey:
	.dw #0x7fff
	.dw #0x739c
	.dw #0x739c
	.dw #0x6b5a
_palette_grey:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x4210
	.dw #0x2108
_palette_button_active:
	.dw #0x7fff
	.dw #0x2ade
	.dw #0x167b
	.dw #0x6fff
_palette_button_passive:
	.dw #0x7fff
	.dw #0x1973
	.dw #0x10ee
	.dw #0x0400
_palette_red:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x001a
	.dw #0x2108
_palette_dark_red:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x14b4
	.dw #0x2108
_palette_orange:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x017f
	.dw #0x2108
_palette_green:
	.dw #0x7fff
	.dw #0x33ec
	.dw #0x1b06
	.dw #0x2108
_palette_blue:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x668c
	.dw #0x2108
_palette_yellow:
	.dw #0x63ff
	.dw #0x33ff
	.dw #0x1b18
	.dw #0x0210
_palette_purple:
	.dw #0x7f1f
	.dw #0x7d98
	.dw #0x60d0
	.dw #0x400c
	.area _INITIALIZER
	.area _CABS (ABS)
