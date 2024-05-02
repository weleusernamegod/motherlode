
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
{"Coal", COAL, 32, 1, 15, 0, PALETTE_COAL},
{"Iron", IRON, 32, 1, 30, 0, PALETTE_IRON},
{"Copper", COPPER, 40, 2, 60, 0, PALETTE_COPPER},
{"Tin", TIN, 45, 2, 80, 0, PALETTE_TIN},
{"Silver", SILVER, 50, 3, 100, 0, PALETTE_SILVER},
{"Gold", GOLD, 64, 3, 250, 0, PALETTE_GOLD},
{"Mithril", MITHRIL, 80, 4, 500, 0, PALETTE_MITHRIL},
{"Platinum", PLATINUM, 100, 5, 750, 0, PALETTE_PLATINUM},
{"Titanium", TITANIUM, 120, 8, 1200, 0, PALETTE_TITANIUM},
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
    // Increment the inventory count for materials that can be mined
    if (material_index >= COAL && material_index <= DIAMOND) {
        materials[material_index].inventory++;
    }
    // Handle special cases for money directly here if needed
    if (material_index == BONES) {
        player.money += 1000;
    } else if (material_index == ARTEFACT) {
        player.money += 5000;
    } else if (material_index == SKULL) {
        player.money += 10000;
    }
}

void calculate_cargo(void) {
    uint8_t total_weight = 0;
    for (uint8_t i = COAL; i <= DIAMOND; i++) {
        total_weight += materials[i].inventory * materials[i].weight;
    }
    player.cargo.current_value = total_weight;
}

void sell_all_ores(void) {
    uint8_t total_value = 0;
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