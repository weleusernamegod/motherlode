
#include <gb/gb.h>
#include "constants.h"
#include "globals.h"
#include "inventory.h"
#include "palettes.h"

#include "level.ba0.h"
#include "attributes.h"

Material materials[] = {
// empty
{"Empty", EMPTY, 0, 0, 0, 0, PALETTE_DEFAULT},
// normal
{"Dirt", DIRT, 16, 1, 0, 0, PALETTE_DIRT},
{"Grass", GRAS, 16, 1, 0, 0, PALETTE_GRAS},
{"Stone", STONE, 0, 0, 0, 0, PALETTE_STONE},
// ore
{"Coal", COAL, 32, 1, 30, 0, PALETTE_COAL},
{"Iron", IRON, 32, 1, 50, 0, PALETTE_IRON},
{"Copper", COPPER, 40, 2, 100, 0, PALETTE_COPPER},
{"Tin", TIN, 45, 2, 200, 0, PALETTE_TIN},
{"Silver", SILVER, 50, 3, 500, 0, PALETTE_SILVER},
{"Gold", GOLD, 64, 3, 750, 0, PALETTE_GOLD},
{"Mithril", MITHRIL, 80, 4, 1000, 0, PALETTE_MITHRIL},
{"Platinum", PLATINUM, 100, 5, 1500, 0, PALETTE_PLATINUM},
{"Titanium", TITANIUM, 120, 8, 2500, 0, PALETTE_TITANIUM},
{"Obsidium", OBSIDIUM, 150, 10, 5000, 0, PALETTE_OBSIDIUM},
{"Elementium", ELEMENTIUM, 200, 20, 10000, 0, PALETTE_ELEMENTIUM},
{"Adamantite", ADAMANTITE, 250, 30, 15000, 0, PALETTE_ADAMANTITE},
// gems
{"Emerald", EMERALD, 80, 10, 2000, 0, PALETTE_EMERALD},
{"Ruby", RUBY, 80, 10, 5000, 0, PALETTE_RUBY},
{"Diamond", DIAMOND, 160, 10, 10000, 0, PALETTE_DIAMOND},
{"Aquamarine", AQUAMARINE, 200, 10, 20000, 0, PALETTE_AQUAMARINE},
// hazards
{"Lava", LAVA, 0, 0, 0, 0, PALETTE_LAVA},
{"Gas", GAS, 0, 0, 0, 0, PALETTE_GAS},
// special
{"Bones", BONES, 64, 0, 0, 0, PALETTE_BONES},
{"Skull", SKULL, 64, 0, 0, 0, PALETTE_SKULL},
{"Artefact", ARTEFACT, 64, 0, 0, 0, PALETTE_ARTEFACT},
};



void update_inventory(void) {
    uint8_t material_index = level_array[depth][width];
    
    // Check if the material is minable and within the defined range
    if (material_index >= MIN_MINABLE_MATERIAL && material_index <= MAX_MINABLE_MATERIAL) {
        // Calculate potential new weight if this material is added
        uint16_t new_weight = player.cargo.current_value + materials[material_index].weight;
        
        // Check if adding this material would exceed the cargo capacity
        if (new_weight > player.cargo.max_value) {
            // Set the warning flag to true because adding this material would exceed cargo capacity
            display_warning_cargo = TRUE;
        } else {
            // Increment the inventory since there's enough space
            materials[material_index].inventory++;
            // Update current cargo weight
            player.cargo.current_value = new_weight;

            // Check if the cargo is now exactly full
            if (player.cargo.current_value == player.cargo.max_value) {
                display_warning_cargo = TRUE;
            } else {
                // Reset the warning flag as cargo is not exceeded and not full
                display_warning_cargo = FALSE;
            }
        }


        return;  // Skip adding the item to inventory and exit the function
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

void sell_all_ores(void) {
    uint32_t total_value = 0;
    // Assuming COAL to DIAMOND includes all sellable ores and gems
    for (uint8_t i = COAL; i <= DIAMOND; i++) {
        total_value += materials[i].inventory * materials[i].value;
    }
    // Update player's money or another financial attribute
    player.money += total_value;

    // Optionally reset inventory if they're sold
    for (uint8_t i = COAL; i <= DIAMOND; i++) {
        materials[i].inventory = 0;  // Reset inventory after selling
    }
}
void fuel_up(void) {
    uint16_t fuel_needed = player.fuel.max_value - player.fuel.current_value;
    player.money -= fuel_needed / 3; // 1 dineros pro liter, good price
    player.fuel.current_value = player.fuel.max_value;
}