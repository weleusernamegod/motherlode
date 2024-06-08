#ifndef FUEL_H
#define FUEL_H

BANKREF_EXTERN(bank_fuel)

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include "inventory.h"

extern metasprite_t metasprite_fuel_highlight_frame[];

typedef struct {
    uint8_t currentFuelSelection;
} FuelMenu;

    // Define menu states
typedef enum {
    OPTION_FUEL_UP,
    OPTION_REPAIR,
    OPTRION_RESERVE_TANK,
    OPTION_DYNAMITE,
    OPTION_REPAIR_KIT,
    OPTION_TELEPORTER,
    // Add additional submenus as necessary
} FuelMenuState;

extern FuelMenu *fuel_menu_numbers[];

extern FuelMenu option_fuel_up;
extern FuelMenu option_repair;
extern FuelMenu option_reserve_tank;
extern FuelMenu option_dynamite;
extern FuelMenu option_repair_kit;
extern FuelMenu option_teleporter;

extern FuelMenuState currentFuelState;
extern FuelMenu *currentFuelMenu;

void init_fuel(void);
void draw_fuel_menu(void);
void fuel_up(void);

void update_fuel_highlight_frame_position(uint8_t selection);
void display_fuel_menu(FuelMenu *menu);
void handle_fuel_input(FuelMenuState *currentFuelState, FuelMenu *currentFuelMenu);
void fuel_menu_loop(void);

#endif // FUEL_H