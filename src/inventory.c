
#include <gb/gb.h>
#include "constants.h"
#include "globals.h"
#include "inventory.h"
#include "palettes.h"

#include "level.ba0.h"
#include "attributes.h"

Material materials[] = {
// empty
{"empty", EMPTY, 0, 0, 0, 0, PALETTE_DEFAULT},
// normal
{"dirt", DIRT, 16, 1, 0, 0, PALETTE_DIRT},
{"grass", GRAS, 16, 1, 0, 0, PALETTE_GRAS},
{"stone", STONE, 0, 0, 0, 0, PALETTE_STONE},
// ore
{"coal", COAL, 32, 1, 30, 0, PALETTE_COAL},
{"iron", IRON, 32, 1, 50, 0, PALETTE_IRON},
{"copper", COPPER, 40, 2, 100, 0, PALETTE_COPPER},
{"tin", TIN, 45, 2, 200, 0, PALETTE_TIN},
{"silver", SILVER, 50, 3, 500, 0, PALETTE_SILVER},
{"gold", GOLD, 64, 3, 750, 0, PALETTE_GOLD},
{"mithril", MITHRIL, 80, 4, 1000, 0, PALETTE_MITHRIL},
{"platinum", PLATINUM, 100, 5, 1500, 0, PALETTE_PLATINUM},
{"titanium", TITANIUM, 120, 8, 2500, 0, PALETTE_TITANIUM},
{"obsidium", OBSIDIUM, 150, 10, 5000, 0, PALETTE_OBSIDIUM},
{"elementium", ELEMENTIUM, 200, 20, 10000, 0, PALETTE_ELEMENTIUM},
{"adamantite", ADAMANTITE, 250, 30, 15000, 0, PALETTE_ADAMANTITE},
// gems
{"emerald", EMERALD, 80, 10, 2000, 0, PALETTE_EMERALD},
{"ruby", RUBY, 80, 10, 5000, 0, PALETTE_RUBY},
{"diamond", DIAMOND, 160, 10, 10000, 0, PALETTE_DIAMOND},
{"aquamarine", AQUAMARINE, 200, 10, 20000, 0, PALETTE_AQUAMARINE},
// hazards
{"lava", LAVA, 0, 0, 0, 0, PALETTE_LAVA},
{"gas", GAS, 0, 0, 0, 0, PALETTE_GAS},
// special
{"bones", BONES, 64, 0, 0, 0, PALETTE_BONES},
{"skull", SKULL, 64, 0, 0, 0, PALETTE_SKULL},
{"artefact", ARTEFACT, 64, 0, 0, 0, PALETTE_ARTEFACT},
};



void update_inventory(void) {
    uint8_t material_index = level_array[depth][width];
    
    // Check if the material is minable and within the defined range
    if (material_index >= MIN_MINABLE_MATERIAL && material_index <= MAX_MINABLE_MATERIAL) {
        // Calculate potential new weight if this material is added
        uint16_t new_weight = player.cargo.current_value + materials[material_index].weight;
        
        // If adding this material would exceed cargo capacity and already is beyond or at capacity, show warning
        if (player.cargo.current_value >= player.cargo.max_value) {
            // Since the cargo is already full or over, do not add more and warn the player
            display_warning_cargo = TRUE;
        } else {
            // Increment the inventory since there's enough space or allow exceeding max once
            materials[material_index].inventory++;
            // Update current cargo weight
            player.cargo.current_value = new_weight;

            // If after adding the item, the cargo goes beyond the max, set warning
            if (player.cargo.current_value >= player.cargo.max_value) {
                display_warning_cargo = TRUE;
            } else {
                // Reset the warning flag as cargo is not exceeded and not full
                display_warning_cargo = FALSE;
            }
        }
    }


    // Handling special cases where materials directly translate into money
    switch(material_index) {
        case BONES:
            player.money += 1000;
            break;
        case ARTEFACT:
            player.money += 5000;
            break;
        case SKULL:
            player.money += 10000;
            break;
    }
}


void calculate_cargo(void) {
    uint16_t total_weight = 0;  // Use uint16_t to avoid overflow
    for (uint8_t i = MIN_MINABLE_MATERIAL; i <= MAX_MINABLE_MATERIAL; i++) {
        total_weight += materials[i].inventory * materials[i].weight;
    }
    player.cargo.current_value = total_weight;
}

void fuel_up(void) {
    uint16_t fuel_needed = player.fuel.max_value - player.fuel.current_value;
    uint16_t fuel_cost = fuel_needed / 3; // 1 dineros per liter, good price

    if (player.money >= fuel_cost) {
        // Player has enough money to fully fuel up
        player.money -= fuel_cost;
        player.fuel.current_value = player.fuel.max_value;
    } else {
        // Player doesn't have enough money to fully fuel up
        uint16_t affordable_fuel = player.money * 3; // calculate how much fuel they can afford
        player.fuel.current_value += affordable_fuel;
        player.money = 0;
    }
}