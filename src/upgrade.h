#ifndef UPGRADE_H
#define UPGRADE_H

BANKREF_EXTERN(bank_upgrade)

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>

extern const metasprite_t metasprite_upgrade_highlight_frame[];

typedef struct {
    uint8_t current_upgrade_selection;
} UpgradeMenu;

    // Define menu states
typedef enum {
    DRILL_MENU,
    HULL_MENU,
    ENGINE_MENU,
    FUEL_MENU,
    RADIATOR_MENU,
    CARGO_MENU,
    MAIN_MENU
    // Add additional submenus as necessary
} UpgradeMenuState;

extern UpgradeMenu *upgrade_menu_numbers[];

extern UpgradeMenu drill_menu;
extern UpgradeMenu hull_menu;
extern UpgradeMenu engine_menu;
extern UpgradeMenu fuel_menu;
extern UpgradeMenu radiator_menu;
extern UpgradeMenu cargo_menu;
extern UpgradeMenu main_menu;

extern UpgradeMenuState current_upgrade_state;
extern UpgradeMenu *current_upgrade_menu;

void init_upgrade(void);
void init_upgrade_tiles_palettes(void);
void update_upgrade_highlight_frame_position(uint8_t current_upgrade_selection);
void update_upgrade_tick(UpgradeMenuState current_upgrade_state);
void display_upgrade_menu(UpgradeMenu *menu);
void load_upgrade_single_tile(uint16_t tilestart, uint8_t tilenumber, uint8_t position, uint8_t upgrade_type);
void load_sub_upgrade_tiles(void);
void load_main_upgrade_tiles(void);
void write_main_upgrade_text(void);
void write_sub_upgrade_text(void);
void change_sub_upgrade_tile_palettes (void);
void change_main_upgrade_tile_palettes (void);
void attempt_upgrade_purchase(UpgradeMenuState current_upgrade_state, UpgradeMenu *current_upgrade_menu);
void handle_upgrade_input(UpgradeMenuState *current_upgrade_state, UpgradeMenu *current_upgrade_menu); 
void upgrade_menu_loop(void);

#endif // UPGRADE_H