#ifndef FUEL_H
#define FUEL_H

BANKREF_EXTERN(bank_fuel)

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include "inventory.h"

extern metasprite_t metasprite_fuel_highlight_frame[];

void init_fuel(void);
void draw_fuel_display(void);
void hide_fuel_display(void);
void draw_fuel_menu(void);
uint16_t calculate_fuel_cost(void);
void set_fuel_display_y(void);
uint8_t check_fuel_display_y(void);
void fuel_up(void);
uint16_t calculate_hull_cost(void);
void repair_hull(void);
void purchase_powerup(void);
void update_fuel_highlight_frame_position(void);
void handle_fuel_input(void);
void fuel_menu_loop(void);

#endif // FUEL_H