#ifndef FUEL_H
#define FUEL_H

BANKREF_EXTERN(bank_fuel)

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include "inventory.h"

extern metasprite_t metasprite_powerup_highlight_frame[];

void init_powerup(void);
void draw_fuel_display(void);
void hide_fuel_display(void);
void draw_powerup_menu(void);
uint16_t calculate_fuel_cost(void);
void set_fuel_display_y(void);
uint8_t check_fuel_display_y(void);
void fuel_up(void);
uint16_t calculate_hull_cost(void);
void repair_hull(void);
void purchase_powerup(void);
void update_powerup_highlight_frame_position(void);
void handle_powerup_input(void);
void powerup_menu_loop(void);

#endif // FUEL_H