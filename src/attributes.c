#include <gb/gb.h>
#include <stdio.h>

#include "attributes.h"
#include "palettes.h"

player_attributes *attributes_numbers[] = {
        &player.drill,
        &player.hull,
        &player.engine,
        &player.fuel,
        &player.radiator,
        &player.cargo
};

void init_attributes(void){
    player.drill.attribute_name = "Drill";
    player.drill.attribute_unit = "m/s";
    player.drill.upgrade_level = 0;
    player.drill.upgrade_value[0] = 1;
    player.drill.upgrade_value[1] = 2;
    player.drill.upgrade_value[2] = 4;    
    player.drill.upgrade_value[3] = 6;
    player.drill.upgrade_value[4] = 8;
    player.drill.upgrade_value[5] = 10;
    player.drill.upgrade_cost[0] = 0;
    player.drill.upgrade_cost[1] = 2000;
    player.drill.upgrade_cost[2] = 5000;
    player.drill.upgrade_cost[3] = 8000;
    player.drill.upgrade_cost[4] = 10000;
    player.drill.upgrade_cost[5] = 30000;
    player.drill.upgrade_name[0] = "Stock Drill";
    player.drill.upgrade_name[1] = "Iron Drill";
    player.drill.upgrade_name[2] = "Steel Drill";
    player.drill.upgrade_name[3] = "Titanium Drill";
    player.drill.upgrade_name[4] = "Diamond Drill";
    player.drill.upgrade_name[5] = "Platinum Drill";
    player.drill.color_palette[0] = palette_default;
    player.drill.color_palette[1] = palette_default;
    player.drill.color_palette[2] = palette_default;
    player.drill.color_palette[3] = palette_default;
    player.drill.color_palette[4] = palette_default;
    player.drill.color_palette[5] = palette_default;

    player.hull.attribute_name = "Hull";
    player.hull.attribute_unit = "pt";
    player.hull.upgrade_level = 0;
    player.hull.upgrade_value[0] = 17;
    player.hull.upgrade_value[1] = 30;
    player.hull.upgrade_value[2] = 50;
    player.hull.upgrade_value[3] = 80;
    player.hull.upgrade_value[4] = 120;
    player.hull.upgrade_value[5] = 180;
    player.hull.upgrade_cost[0] = 0;
    player.hull.upgrade_cost[1] = 750;
    player.hull.upgrade_cost[2] = 2000;
    player.hull.upgrade_cost[3] = 5000;
    player.hull.upgrade_cost[4] = 15000;
    player.hull.upgrade_cost[5] = 30000;
    player.hull.upgrade_name[0] = "Stock Hull";
    player.hull.upgrade_name[1] = "Iron Hull";
    player.hull.upgrade_name[2] = "Bronze Hull";
    player.hull.upgrade_name[3] = "Steel Hull";
    player.hull.upgrade_name[4] = "Platinum Hull";
    player.hull.upgrade_name[5] = "Enegry Shield";
    player.hull.color_palette[0] = palette_default;
    player.hull.color_palette[1] = palette_default;
    player.hull.color_palette[2] = palette_default;
    player.hull.color_palette[3] = palette_default;
    player.hull.color_palette[4] = palette_default;
    player.hull.color_palette[5] = palette_default;

    player.engine.attribute_name = "Engine";
    player.engine.attribute_unit = "hp";
    player.engine.upgrade_level = 0;
    player.engine.upgrade_value[0] = 16;
    player.engine.upgrade_value[1] = 18;
    player.engine.upgrade_value[2] = 21;
    player.engine.upgrade_value[3] = 25;
    player.engine.upgrade_value[4] = 32;
    player.engine.upgrade_value[5] = 40;
    player.engine.upgrade_cost[0] = 0;
    player.engine.upgrade_cost[1] = 750;
    player.engine.upgrade_cost[2] = 2000;
    player.engine.upgrade_cost[3] = 5000;
    player.engine.upgrade_cost[4] = 20000;
    player.engine.upgrade_cost[5] = 30000;
    player.engine.upgrade_name[0] = "Stock Engine";
    player.engine.upgrade_name[1] = "V4 1.6 Ltr";
    player.engine.upgrade_name[2] = "V4 2.0 Ltr Turbo";
    player.engine.upgrade_name[3] = "V6 3.8 Ltr";
    player.engine.upgrade_name[4] = "V8 5.0 Ltr Turbo";
    player.engine.upgrade_name[5] = "V16 Jaguar";
    player.engine.color_palette[0] = palette_default;
    player.engine.color_palette[1] = palette_default;
    player.engine.color_palette[2] = palette_default;
    player.engine.color_palette[3] = palette_default;
    player.engine.color_palette[4] = palette_default;
    player.engine.color_palette[5] = palette_default;

    player.fuel.attribute_name = "Fueltank";
    player.fuel.attribute_unit = "ltr";
    player.fuel.upgrade_level = 2;
    player.fuel.upgrade_value[0] = 120;
    player.fuel.upgrade_value[1] = 200;
    player.fuel.upgrade_value[2] = 350;
    player.fuel.upgrade_value[3] = 600;
    player.fuel.upgrade_value[4] = 950;
    player.fuel.upgrade_value[5] = 1200;
    player.fuel.upgrade_cost[0] = 0;
    player.fuel.upgrade_cost[1] = 750;
    player.fuel.upgrade_cost[2] = 2000;
    player.fuel.upgrade_cost[3] = 8000;
    player.fuel.upgrade_cost[4] = 10000;
    player.fuel.upgrade_cost[5] = 30000;
    player.fuel.upgrade_name[0] = "Micro Tank";
    player.fuel.upgrade_name[1] = "Medium Tank";
    player.fuel.upgrade_name[2] = "Huge Tank";
    player.fuel.upgrade_name[3] = "Titanic Tank";
    player.fuel.upgrade_name[4] = "Leviathan Tank";
    player.fuel.upgrade_name[5] = "Liquid Gas";
    player.fuel.color_palette[0] = palette_default;
    player.fuel.color_palette[1] = palette_default;
    player.fuel.color_palette[2] = palette_default;
    player.fuel.color_palette[3] = palette_default;
    player.fuel.color_palette[4] = palette_default;
    player.fuel.color_palette[5] = palette_default;

    player.radiator.attribute_name = "Radiator";
    player.radiator.attribute_unit = "&";
    player.radiator.upgrade_level = 1;
    player.radiator.upgrade_value[0] = 0;
    player.radiator.upgrade_value[1] = 10;
    player.radiator.upgrade_value[2] = 25;
    player.radiator.upgrade_value[3] = 40;
    player.radiator.upgrade_value[4] = 30;
    player.radiator.upgrade_value[5] = 80;
    player.radiator.upgrade_cost[0] = 0;
    player.radiator.upgrade_cost[1] = 2000;
    player.radiator.upgrade_cost[2] = 5000;
    player.radiator.upgrade_cost[3] = 8000;
    player.radiator.upgrade_cost[4] = 10000;
    player.radiator.upgrade_cost[5] = 30000;
    player.radiator.upgrade_name[0] = "Stock Fan";
    player.radiator.upgrade_name[1] = "Dual Fans";
    player.radiator.upgrade_name[2] = "Single Turbine";
    player.radiator.upgrade_name[3] = "Dual Turbines";
    player.radiator.upgrade_name[4] = "Puron Cooling";
    player.radiator.upgrade_name[5] = "Tri-Turbine";
    player.radiator.color_palette[0] = palette_default;
    player.radiator.color_palette[1] = palette_default;
    player.radiator.color_palette[2] = palette_default;
    player.radiator.color_palette[3] = palette_default;
    player.radiator.color_palette[4] = palette_default;
    player.radiator.color_palette[5] = palette_default;

    player.cargo.attribute_name = "Cargo Bay";
    player.cargo.attribute_unit = "m3";
    player.cargo.upgrade_level = 1;
    player.cargo.upgrade_value[0] = 7;
    player.cargo.upgrade_value[1] = 15;
    player.cargo.upgrade_value[2] = 25;
    player.cargo.upgrade_value[3] = 40;
    player.cargo.upgrade_value[4] = 70;
    player.cargo.upgrade_value[5] = 120;
    player.cargo.upgrade_cost[0] = 0;
    player.cargo.upgrade_cost[1] = 750;
    player.cargo.upgrade_cost[2] = 2000;
    player.cargo.upgrade_cost[3] = 5000;
    player.cargo.upgrade_cost[4] = 10000;
    player.cargo.upgrade_cost[5] = 30000;
    player.cargo.upgrade_name[0] = "Micro Bay";
    player.cargo.upgrade_name[1] = "Medium Bay";
    player.cargo.upgrade_name[2] = "Huge Bay";
    player.cargo.upgrade_name[3] = "Gigantic Bay";
    player.cargo.upgrade_name[4] = "Titanic Bay";
    player.cargo.upgrade_name[5] = "Leviathan Bay";
    player.cargo.color_palette[0] = palette_default;
    player.cargo.color_palette[1] = palette_default;
    player.cargo.color_palette[2] = palette_default;
    player.cargo.color_palette[3] = palette_default;
    player.cargo.color_palette[4] = palette_default;
    player.cargo.color_palette[5] = palette_default;

    player.money = 31100;
    player.speed.l = 0;
    player.speed.h = 16;
    player.prev_speed.w = player.speed.w;

    // set all attributes based on the upgrade level
    for (uint8_t i = 0; i < 6; i++) {
        attributes_numbers[i]->current_value = attributes_numbers[i]->max_value = attributes_numbers[i]->upgrade_value[attributes_numbers[i]->upgrade_level];
    }

}

