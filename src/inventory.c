
#include <gb/gb.h>
#include "constants.h"
#include "globals.h"
#include "inventory.h"
#include "palettes.h"

#include "level.h"
#include "attributes.h"

Material materials[] = {
    // name           tile number   res.  weight   value  inv.  pal nr depth threshold  rar.  depth_range
    {   "empty",      EMPTY,         0,     0,       0,    0,   0,            0,        255,     0  },
    {   "dirt",       DIRT,         16,     1,       0,    0,   2,            0,        255,     0  },
    {   "grass",      GRASS,        16,     1,       0,    0,   1,            0,        255,     0  },
    {   "stone",      STONE,         0,     0,       0,    0,   1,           30,        100,     0  },
    // ore         
    {   "coal",       COAL,         32,     1,      30,    0,   2,            0,        50,      0  },
    {   "iron",       IRON,         32,     1,      50,    0,   3,            0,        50,      0  },
    {   "tin",        TIN,          40,     2,     200,    0,   4,           30,        50,      0  },
    {   "copper",     COPPER,       45,     2,     100,    0,   5,           30,        20,      0  },
    {   "silver",     SILVER,       50,     3,     500,    0,   6,           45,        20,      0  },
    {   "gold",       GOLD,         64,     3,     750,    0,   7,           60,        10,      0  },
    {   "mithril",    MITHRIL,      80,     4,    1000,    0,   2,           90,        10,      0  },
    {   "platinum",   PLATINUM,    100,     5,    1500,    0,   5,          120,        10,      0  },
    {   "titanium",   TITANIUM,    120,     8,    2500,    0,   2,          150,        10,      0  },
    {   "obsidium",   OBSIDIUM,    150,    10,    5000,    0,   3,          180,        10,      0  },
    {   "elementium", ELEMENTIUM,  200,    20,   10000,    0,   4,          210,        10,      0  },
    {   "adamantite", ADAMANTITE,  250,    30,   15000,    0,   5,          240,        10,      0  },
    // gems         
    {   "emerald",    EMERALD,      80,    10,    2000,    0,   7,          400,         2,      0  },
    {   "ruby",       RUBY,         80,    10,    5000,    0,   7,          500,         2,      0  },
    {   "diamond",    DIAMOND,     160,    10,   10000,    0,   7,          900,         2,      0  },
    {   "aquamarine", AQUAMARINE,  200,    10,   20000,    0,   7,         1000,         2,      0  },
    // hazards         
    {   "lava",       LAVA,          0,     0,       0,    0,   5,         1000,         0,      0  },
    {   "gas",        GAS,           0,     0,       0,    0,   5,         1000,         0,      0  },
    // special         
    {   "bones",      BONES,        64,     0,       0,    0,   6,          300,         1,      0  },
    {   "skull",      SKULL,        64,     0,       0,    0,   6,          500,         1,      0  },
    {   "artefact",   ARTEFACT,     64,     0,       0,    0,   6,         1000,         1,      0  },
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