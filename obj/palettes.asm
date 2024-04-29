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
	.globl _palette_red
	.globl _palette_button_passive
	.globl _palette_button_active
	.globl _palette_light_grey
	.globl _palette_grey
	.globl _palette_copper
	.globl _palette_iron
	.globl _palette_rock
	.globl _palette_gras
	.globl _palette_default
	.globl _palette_sky
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
G$palette_sky$0_0$0==.
_palette_sky::
	.ds 8
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
G$palette_default$0_0$0 == .
_palette_default:
	.dw #0x7fff
	.dw #0x56b5
	.dw #0x294a
	.dw #0x0000
G$palette_gras$0_0$0 == .
_palette_gras:
	.dw #0x1973
	.dw #0x1e8c
	.dw #0x1dc8
	.dw #0x10e5
G$palette_rock$0_0$0 == .
_palette_rock:
	.dw #0x1973
	.dw #0x14e9
	.dw #0x3df0
	.dw #0x18c6
G$palette_iron$0_0$0 == .
_palette_iron:
	.dw #0x1973
	.dw #0x14e9
	.dw #0x5ef7
	.dw #0x294a
G$palette_copper$0_0$0 == .
_palette_copper:
	.dw #0x1973
	.dw #0x14e9
	.dw #0x19d7
	.dw #0x0993
G$palette_grey$0_0$0 == .
_palette_grey:
	.dw #0x7fff
	.dw #0x56b5
	.dw #0x3df0
	.dw #0x294a
G$palette_light_grey$0_0$0 == .
_palette_light_grey:
	.dw #0x7fff
	.dw #0x739c
	.dw #0x739c
	.dw #0x6b5a
G$palette_button_active$0_0$0 == .
_palette_button_active:
	.dw #0x7fff
	.dw #0x2ade
	.dw #0x167b
	.dw #0x6fff
G$palette_button_passive$0_0$0 == .
_palette_button_passive:
	.dw #0x7fff
	.dw #0x1973
	.dw #0x10ee
	.dw #0x0400
G$palette_red$0_0$0 == .
_palette_red:
	.dw #0x7fff
	.dw #0x739c
	.dw #0x017f
	.dw #0x14b4
G$palette_orange$0_0$0 == .
_palette_orange:
	.dw #0x7fff
	.dw #0x56b5
	.dw #0x017f
	.dw #0x294a
G$palette_green$0_0$0 == .
_palette_green:
	.dw #0x7fff
	.dw #0x1e8c
	.dw #0x1dc8
	.dw #0x10e5
G$palette_blue$0_0$0 == .
_palette_blue:
	.dw #0x7fff
	.dw #0x739c
	.dw #0x668c
	.dw #0x294a
G$palette_yellow$0_0$0 == .
_palette_yellow:
	.dw #0x63ff
	.dw #0x33ff
	.dw #0x1b18
	.dw #0x0210
G$palette_purple$0_0$0 == .
_palette_purple:
	.dw #0x7f1f
	.dw #0x7d98
	.dw #0x60d0
	.dw #0x400c
	.area _INITIALIZER
Fpalettes$__xinit_palette_sky$0_0$0 == .
__xinit__palette_sky:
	.dw #0x7fff
	.dw #0x56b5
	.dw #0x294a
	.dw #0x0000
	.area _CABS (ABS)
