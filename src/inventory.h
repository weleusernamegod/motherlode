#ifndef INVENTORY_H
#define INVENTORY_H

#include <gb/gb.h>

// empty
#define EMPTY 0
// normal
#define DIRT 1
#define GRAS 2
#define STONE 3
// ores
#define COAL 4
#define IRON 5
#define COPPER 6
#define TIN 7
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

void update_inventory(void);
void calculate_cargo(void);
void sell_all_ores(void);
void fuel_up(void);

typedef struct Material {
    const char* name;            // Name of the material
    uint8_t tile_number;            // Corresponding tile number for display
    uint8_t ore_resistance;         // Resistance value for mining or interaction
    uint8_t weight;                 // Weight of the material
    uint16_t value;                  // Value of the material per piece
    uint8_t inventory;              // How many of that type in inventory
    uint8_t color_palette;
    } Material;
extern Material materials[];


#endif // INVENTORY_H