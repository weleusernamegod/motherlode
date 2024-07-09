
#include <gb/gb.h>
#include "constants.h"
#include "globals.h"
#include "inventory.h"
#include "palettes.h"

#include "level.h"
#include "attributes.h"

Material materials[] = {
    // name           tile number   res.  weight   value  inv.  palette number         depth threshold      rarity
    {   "empty",      EMPTY,         0,     0,       0,    0,   PALETTE_DEFAULT,       DEPTH_THRESHOLD_0,   100  },
    {   "dirt",       DIRT,         16,     1,       0,    0,   PALETTE_DIRT,          DEPTH_THRESHOLD_0,   100  },
    {   "grass",      GRASS,        16,     1,       0,    0,   PALETTE_GRASS,         DEPTH_THRESHOLD_0,   100  },
    {   "stone",      STONE,         0,     0,       0,    0,   PALETTE_STONE,         DEPTH_THRESHOLD_0,   100  },
    // ore
    {   "coal",       COAL,         32,     1,      30,    0,   PALETTE_COAL,          DEPTH_THRESHOLD_0,   50  },
    {   "iron",       IRON,         32,     1,      50,    0,   PALETTE_IRON,          DEPTH_THRESHOLD_0,   50  },
    {   "tin",        TIN,          40,     2,     200,    0,   PALETTE_TIN,           DEPTH_THRESHOLD_0,   30  },
    {   "copper",     COPPER,       45,     2,     100,    0,   PALETTE_COPPER,        DEPTH_THRESHOLD_1,   30  },
    {   "silver",     SILVER,       50,     3,     500,    0,   PALETTE_SILVER,        DEPTH_THRESHOLD_2,   30  },
    {   "gold",       GOLD,         64,     3,     750,    0,   PALETTE_GOLD,          DEPTH_THRESHOLD_3,   30  },
    {   "mithril",    MITHRIL,      80,     4,    1000,    0,   PALETTE_MITHRIL,       DEPTH_THRESHOLD_4,   20  },
    {   "platinum",   PLATINUM,    100,     5,    1500,    0,   PALETTE_PLATINUM,      DEPTH_THRESHOLD_5,   20  },
    {   "titanium",   TITANIUM,    120,     8,    2500,    0,   PALETTE_TITANIUM,      DEPTH_THRESHOLD_6,   20  },
    {   "obsidium",   OBSIDIUM,    150,    10,    5000,    0,   PALETTE_OBSIDIUM,      DEPTH_THRESHOLD_7,   20  },
    {   "elementium", ELEMENTIUM,  200,    20,   10000,    0,   PALETTE_ELEMENTIUM,    DEPTH_THRESHOLD_8,   20  },
    {   "adamantite", ADAMANTITE,  250,    30,   15000,    0,   PALETTE_ADAMANTITE,    DEPTH_THRESHOLD_8,   10  },
    // gems
    {   "emerald",    EMERALD,      80,    10,    2000,    0,   PALETTE_EMERALD,                      30,   5  },
    {   "ruby",       RUBY,         80,    10,    5000,    0,   PALETTE_RUBY,                         30,   5  },
    {   "diamond",    DIAMOND,     160,    10,   10000,    0,   PALETTE_DIAMOND,                      30,   5  },
    {   "aquamarine", AQUAMARINE,  200,    10,   20000,    0,   PALETTE_AQUAMARINE,                  100,   5  },
    // hazards
    {   "lava",       LAVA,          0,     0,       0,    0,   PALETTE_LAVA,                        100,   0  },
    {   "gas",        GAS,           0,     0,       0,    0,   PALETTE_GAS,                         100,   0  },
    // special
    {   "bones",      BONES,        64,     0,       0,    0,   PALETTE_BONES,                       200,   0  },
    {   "skull",      SKULL,        64,     0,       0,    0,   PALETTE_SKULL,                       200,   0  },
    {   "artefact",   ARTEFACT,     64,     0,       0,    0,   PALETTE_ARTEFACT,                    200,   0  },
};

PowerUp powerup[] = {
{"REFUEL SHIP", "", "", 0, 0},
{"REPAIR SHIP", "", "", 0, 0},
{"EXTRA TANK", "press A to", "refuel ship", 0, 2000},
{"REPAIR KIT", "press B to", "repair ship", 0, 7500},
{"DYNAMITE", "press start", "to use item", 20, 2000},
{"TELEPORTER", "press select", "to use item", 0, 10000}
};

void update_inventory(void) {
    uint8_t material_index = level_array[wrapped_depth][width];
    
    // Check if the material is minable and within the defined range
    if (material_index >= MIN_MINABLE_MATERIAL && material_index <= MAX_MINABLE_MATERIAL) {
        // Calculate potential new weight if this material is added
        uint16_t new_weight = player.cargo.current_value + materials[material_index].weight;
        
        // If adding this material would exceed cargo capacity and already is beyond or at capacity, show warning
        if (player.cargo.current_value >= player.cargo.max_value) {
            // Since the cargo is already full or over, do not add more and warn the player
            display_warning_cargo_normal = TRUE;
        } else {
            // Increment the inventory since there's enough space or allow exceeding max once
            materials[material_index].inventory++;
            // Update current cargo weight
            player.cargo.current_value = new_weight;

            // If after adding the item, the cargo goes beyond the max, set warning
            if (player.cargo.current_value >= player.cargo.max_value) {
                display_warning_cargo_normal = TRUE;
            } else {
                // Reset the warning flag as cargo is not exceeded and not full
                display_warning_cargo_normal = FALSE;
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