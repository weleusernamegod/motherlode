#include <gb/gb.h>
#include <stdio.h>

#include "globals.h"
#include "general.h"

#include "upgrade.h"

void shop_menu_loop(void) {

    read_buttons();

    // Check if input has changed the state or selection
    if (prev_buttons != buttons) {
        handle_input(&currentState, currentMenu);
        update_menu = TRUE;  // Set the update flag
    }

    if (update_menu) {
        display_menu(currentMenu);
        update_upgrade_tick(currentState);

        // Update the display and functionality based on the current state
        if (currentState == MAIN_MENU) {
            currentMenu = &main_menu;
            change_main_shop_tile_palettes();
            write_main_shop_text();
            load_main_upgrade_tiles();
        } else {
            currentMenu = menu_numbers[currentState];
            change_sub_shop_tile_palettes();
            write_sub_shop_text();
            load_sub_upgrade_tiles();
        }

        update_menu = FALSE;  // Reset the update flag after updating the screen
    }

    prev_buttons = buttons;
    vsync();
}
