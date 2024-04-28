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
_saved_bank::
	.ds 1
_prev_depth::
	.ds 1
_prev_width::
	.ds 1
_depth_pixel::
	.ds 2
_width_pixel::
	.ds 2
_scroll_x::
	.ds 2
_scroll_y::
	.ds 2
_ore_resistance::
	.ds 2
_move_x_per_frame::
	.ds 2
_move_y_per_frame::
	.ds 2
_scroll_x_per_frame::
	.ds 2
_scroll_y_per_frame::
	.ds 2
_direction_now::
	.ds 1
_direction_prev::
	.ds 1
_is_drilling::
	.ds 1
_buttons::
	.ds 1
_next_tile::
	.ds 1
_next_tile_up::
	.ds 1
_next_tile_down::
	.ds 1
_next_tile_left::
	.ds 1
_next_tile_right::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_frame_counter::
	.ds 1
_update_menu::
	.ds 1
_left_shop_area::
	.ds 1
_left_sell_area::
	.ds 1
_player_alive::
	.ds 1
_currentGameState::
	.ds 1
_depth::
	.ds 1
_width::
	.ds 1
_depth_offset::
	.ds 1
_width_offset::
	.ds 1
_animation_frames_left::
	.ds 1
_velocity::
	.ds 1
_base_drilltime::
	.ds 1
_tile_mined::
	.ds 1
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
__xinit__frame_counter:
	.db #0x00	; 0
__xinit__update_menu:
	.db #0x01	;  1
__xinit__left_shop_area:
	.db #0x01	;  1
__xinit__left_sell_area:
	.db #0x01	;  1
__xinit__player_alive:
	.db #0x01	;  1
__xinit__currentGameState:
	.db #0x03	; 3
__xinit__depth:
	.db #0x02	; 2
__xinit__width:
	.db #0x06	; 6
__xinit__depth_offset:
	.db #0x00	; 0
__xinit__width_offset:
	.db #0x00	; 0
__xinit__animation_frames_left:
	.db #0x00	; 0
__xinit__velocity:
	.db #0x00	;  0
__xinit__base_drilltime:
	.db #0x10	; 16
__xinit__tile_mined:
	.db #0x00	;  0
__xinit__prev_buttons:
	.db #0x00	; 0
	.area _CABS (ABS)
