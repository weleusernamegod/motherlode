;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (Mac OS X x86_64)
;--------------------------------------------------------
	.module globals
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _prev_buttons
	.globl _tile_mined
	.globl _base_drilltime
	.globl _velocity
	.globl _animation_frames_left
	.globl _width_offset
	.globl _depth_offset
	.globl _width
	.globl _depth
	.globl _currentGameState
	.globl _player_alive
	.globl _left_sell_area
	.globl _left_shop_area
	.globl _update_menu
	.globl _current_menu_index
	.globl _frame_counter
	.globl _next_tile_right
	.globl _next_tile_left
	.globl _next_tile_down
	.globl _next_tile_up
	.globl _next_tile
	.globl _buttons
	.globl _is_drilling
	.globl _direction_prev
	.globl _direction_now
	.globl _scroll_y_per_frame
	.globl _scroll_x_per_frame
	.globl _move_y_per_frame
	.globl _move_x_per_frame
	.globl _ore_resistance
	.globl _scroll_y
	.globl _scroll_x
	.globl _width_pixel
	.globl _depth_pixel
	.globl _prev_width
	.globl _prev_depth
	.globl _saved_bank
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$saved_bank$0_0$0==.
_saved_bank::
	.ds 1
G$prev_depth$0_0$0==.
_prev_depth::
	.ds 1
G$prev_width$0_0$0==.
_prev_width::
	.ds 1
G$depth_pixel$0_0$0==.
_depth_pixel::
	.ds 2
G$width_pixel$0_0$0==.
_width_pixel::
	.ds 2
G$scroll_x$0_0$0==.
_scroll_x::
	.ds 2
G$scroll_y$0_0$0==.
_scroll_y::
	.ds 2
G$ore_resistance$0_0$0==.
_ore_resistance::
	.ds 2
G$move_x_per_frame$0_0$0==.
_move_x_per_frame::
	.ds 2
G$move_y_per_frame$0_0$0==.
_move_y_per_frame::
	.ds 2
G$scroll_x_per_frame$0_0$0==.
_scroll_x_per_frame::
	.ds 2
G$scroll_y_per_frame$0_0$0==.
_scroll_y_per_frame::
	.ds 2
G$direction_now$0_0$0==.
_direction_now::
	.ds 1
G$direction_prev$0_0$0==.
_direction_prev::
	.ds 1
G$is_drilling$0_0$0==.
_is_drilling::
	.ds 1
G$buttons$0_0$0==.
_buttons::
	.ds 1
G$next_tile$0_0$0==.
_next_tile::
	.ds 1
G$next_tile_up$0_0$0==.
_next_tile_up::
	.ds 1
G$next_tile_down$0_0$0==.
_next_tile_down::
	.ds 1
G$next_tile_left$0_0$0==.
_next_tile_left::
	.ds 1
G$next_tile_right$0_0$0==.
_next_tile_right::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$frame_counter$0_0$0==.
_frame_counter::
	.ds 1
G$current_menu_index$0_0$0==.
_current_menu_index::
	.ds 1
G$update_menu$0_0$0==.
_update_menu::
	.ds 1
G$left_shop_area$0_0$0==.
_left_shop_area::
	.ds 1
G$left_sell_area$0_0$0==.
_left_sell_area::
	.ds 1
G$player_alive$0_0$0==.
_player_alive::
	.ds 1
G$currentGameState$0_0$0==.
_currentGameState::
	.ds 1
G$depth$0_0$0==.
_depth::
	.ds 1
G$width$0_0$0==.
_width::
	.ds 1
G$depth_offset$0_0$0==.
_depth_offset::
	.ds 1
G$width_offset$0_0$0==.
_width_offset::
	.ds 1
G$animation_frames_left$0_0$0==.
_animation_frames_left::
	.ds 1
G$velocity$0_0$0==.
_velocity::
	.ds 1
G$base_drilltime$0_0$0==.
_base_drilltime::
	.ds 1
G$tile_mined$0_0$0==.
_tile_mined::
	.ds 1
G$prev_buttons$0_0$0==.
_prev_buttons::
	.ds 1
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
	.area _INITIALIZER
Fglobals$__xinit_frame_counter$0_0$0 == .
__xinit__frame_counter:
	.db #0x00	; 0
Fglobals$__xinit_current_menu_index$0_0$0 == .
__xinit__current_menu_index:
	.db #0x00	; 0
Fglobals$__xinit_update_menu$0_0$0 == .
__xinit__update_menu:
	.db #0x01	;  1
Fglobals$__xinit_left_shop_area$0_0$0 == .
__xinit__left_shop_area:
	.db #0x01	;  1
Fglobals$__xinit_left_sell_area$0_0$0 == .
__xinit__left_sell_area:
	.db #0x01	;  1
Fglobals$__xinit_player_alive$0_0$0 == .
__xinit__player_alive:
	.db #0x01	;  1
Fglobals$__xinit_currentGameState$0_0$0 == .
__xinit__currentGameState:
	.db #0x00	; 0
Fglobals$__xinit_depth$0_0$0 == .
__xinit__depth:
	.db #0x02	; 2
Fglobals$__xinit_width$0_0$0 == .
__xinit__width:
	.db #0x06	; 6
Fglobals$__xinit_depth_offset$0_0$0 == .
__xinit__depth_offset:
	.db #0x00	; 0
Fglobals$__xinit_width_offset$0_0$0 == .
__xinit__width_offset:
	.db #0x00	; 0
Fglobals$__xinit_animation_frames_left$0_0$0 == .
__xinit__animation_frames_left:
	.db #0x00	; 0
Fglobals$__xinit_velocity$0_0$0 == .
__xinit__velocity:
	.db #0x00	;  0
Fglobals$__xinit_base_drilltime$0_0$0 == .
__xinit__base_drilltime:
	.db #0x10	; 16
Fglobals$__xinit_tile_mined$0_0$0 == .
__xinit__tile_mined:
	.db #0x00	;  0
Fglobals$__xinit_prev_buttons$0_0$0 == .
__xinit__prev_buttons:
	.db #0x00	; 0
	.area _CABS (ABS)
