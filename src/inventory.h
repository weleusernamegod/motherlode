#ifndef INVENTORY_H
#define INVENTORY_H

#include <gb/gb.h>
// empty
#define EMPTY 0
// normal
#define DIRT 1
#define GRASS 2
#define STONE 3
// ores
#define COAL 4
#define IRON 5
#define TIN 6
#define COPPER 7
#define SILVER 8
#define GOLD 9
#define MITHRIL 10
#define PLATINUM 11
#define TITANIUM 12
#define OBSIDIUM 13
#define ELEMENTIUM 14
#define ADAMANTITE 15
// gems
#define EMERALD 16
#define RUBY 17
#define DIAMOND 18
#define AQUAMARINE 19
// hazards
#define LAVA 20
#define GAS 21
// special
#define BONES 22
#define SKULL 23
#define ARTEFACT 24

#define LOWEST_ORE COAL
#define HIGHEST_ORE AQUAMARINE

#define OPTION_FUEL_UP 0
#define OPTION_REPAIR 1
#define OPTION_EXTRA_TANK 2
#define OPTION_REPAIR_KIT 3
#define OPTION_DYNAMITE 4
#define OPTION_TELEPORTER 5

void update_inventory(void);
void calculate_cargo(void);

typedef struct Material {
    const char* name;               // Name of the material
    uint8_t tile_number;            // Corresponding tile number for display
    uint8_t ore_resistance;         // Resistance value for mining or interaction
    uint8_t weight;                 // Weight of the material
    uint32_t value;                 // Value of the material per piece
    uint8_t inventory;              // How many of that type in inventory
    uint8_t palette_number;         // In what color palette to load the color
    uint16_t depth_threshold;       // At what depth to load that ore
    uint8_t rarity;                 // How often to use that ore in the map
    } Material;
extern Material materials[];

typedef struct PowerUp {
    const char *name;
    const char *description;
    const char *description_extended;
    uint8_t inventory;              // How many of that type in inventory
    int16_t cost;                   // How much does it cost to buy 1x
} PowerUp;
extern PowerUp powerup[];

#endif // INVENTORY_H