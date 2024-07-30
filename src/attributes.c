#include <gb/gb.h>
#include <stdio.h>

#include "attributes.h"
#include "palettes.h"

struct Player player = {
    .fuel = {
        .attribute_name = "fueltanks",
        .attribute_unit = "LTR",
        .attribute_unit_short = "?",
        .upgrade_level = 0,
        .upgrade_value = {60, 120, 200, 350, 800, 1200},
        .upgrade_cost = {0, 750, 2000, 8000, 10000, 30000},
        .upgrade_name = {"jerry can", "gas cylinder", "stainless tank", "dual cylinder", "pressure tank", "lithium pack"}
    },
    .hull = {
        .attribute_name = "hull",
        .attribute_unit = "PT",
        .attribute_unit_short = "())",
        .upgrade_level = 0,
        .upgrade_value = {17, 30, 50, 80, 120, 180},
        .upgrade_cost = {0, 750, 2000, 5000, 15000, 30000},
        .upgrade_name = {"iron hull", "bronze hull", "steel hull", "carbon hull", "platinum hull", "energy shield"}
    },
    .drill = {
        .attribute_name = "drills",
        .attribute_unit = "M/S",
        .attribute_unit_short = NULL,
        .upgrade_level = 0,
        .upgrade_value = {1, 2, 4, 6, 8, 10},
        .upgrade_cost = {0, 2000, 5000, 8000, 10000, 30000},
        .upgrade_name = {"iron drill", "bronze drill", "steel drill", "titanium drill", "diamond drill", "platinum drill"}
    },
    .cargo = {
        .attribute_name = "cargo bays",
        .attribute_unit = "M&",
        .attribute_unit_short = NULL,
        .upgrade_level = 0,
        .upgrade_value = {8, 16, 28, 40, 70, 120},
        .upgrade_cost = {0, 750, 2000, 5000, 10000, 30000},
        .upgrade_name = {"micro bay", "medium bay", "huge bay", "gigantic bay", "titanic bay", "dimension void"}
    },
    .radiator = {
        .attribute_name = "radiators",
        .attribute_unit = "%",
        .attribute_unit_short = NULL,
        .upgrade_level = 0,
        .upgrade_value = {0, 10, 25, 40, 30, 80},
        .upgrade_cost = {0, 2000, 5000, 8000, 10000, 30000},
        .upgrade_name = {"air condition", "single fan", "dual fans", "propeller", "single turbine", "jet turbine"}
    },
    .engine = {
        .attribute_name = "engines",
        .attribute_unit = "HP",
        .attribute_unit_short = NULL,
        .upgrade_level = 0,
        .upgrade_value = {50, 80, 115, 140, 175, 250},
        .upgrade_cost = {0, 750, 2000, 5000, 20000, 30000},
        .upgrade_name = {"stock engine", "125cc", "v2 1.0 ltr", "v6 3.8 ltr", "v8 5.0 ltr turbo", "v8 jaguar"}
    },
    .money = 50,
};


player_attributes *attributes_numbers[] = {
        &player.drill,
        &player.hull,
        &player.engine,
        &player.fuel,
        &player.radiator,
        &player.cargo
};

void init_attributes(void){
    // initialise the speed
    player.speed.l = 0;
    player.speed.h = 16;
    player.prev_speed.w = player.speed.w;

    // set all attributes based on the upgrade level
    for (uint8_t i = 0; i < 6; i++) {
        attributes_numbers[i]->current_value = attributes_numbers[i]->max_value = attributes_numbers[i]->upgrade_value[attributes_numbers[i]->upgrade_level];
    }
}
