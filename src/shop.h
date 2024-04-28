#ifndef SHOP_H
#define SHOP_H

BANKREF_EXTERN(bank_shop)

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>

extern const metasprite_t metasprite_buttonframe[];

typedef struct {
    uint8_t currentSelection;
} Menu;

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
} MenuState;

extern Menu *menu_numbers[];

extern Menu drill_menu;
extern Menu hull_menu;
extern Menu engine_menu;
extern Menu fuel_menu;
extern Menu radiator_menu;
extern Menu cargo_menu;
extern Menu main_menu;

extern MenuState currentState;
extern Menu *currentMenu;

void init_shop(void);
void init_shop_tiles_palettes(void);
void updateMetaSpritePosition(uint8_t currentSelection);
void update_upgrade_tick(MenuState currentState);
void displayMenu(Menu *menu);
void load_shop_single_tile(uint16_t tilestart, uint8_t tilenumber, uint8_t position, uint8_t upgrade_type);
void load_sub_shop_tiles(void);
void load_main_shop_tiles(void);
void write_main_shop_text(void);
void write_sub_shop_text(void);
void change_sub_shop_tile_palettes (void);
void change_main_shop_tile_palettes (void);
void attempt_purchase(MenuState currentState, Menu *currentMenu);
void handleInput(MenuState *currentState, Menu *currentMenu); 

#endif // SHOP_H