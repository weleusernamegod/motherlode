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
    player.drill.attribute_name = "drill";
    player.drill.attribute_unit = "M/S";
    player.drill.upgrade_level = 5;
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
    player.drill.upgrade_name[0] = "stock drill";
    player.drill.upgrade_name[1] = "iron drill";
    player.drill.upgrade_name[2] = "steel drill";
    player.drill.upgrade_name[3] = "titanium drill";
    player.drill.upgrade_name[4] = "diamond drill";
    player.drill.upgrade_name[5] = "platinum drill";

    player.hull.attribute_name = "hull";
    player.hull.attribute_unit = "PT";
    player.hull.attribute_unit_short = "?";
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
    player.hull.upgrade_name[0] = "stock hull";
    player.hull.upgrade_name[1] = "iron hull";
    player.hull.upgrade_name[2] = "bronze hull";
    player.hull.upgrade_name[3] = "steel hull";
    player.hull.upgrade_name[4] = "platinum hull";
    player.hull.upgrade_name[5] = "enegry shield";

    player.engine.attribute_name = "engine";
    player.engine.attribute_unit = "HP";
    player.engine.upgrade_level = 0;
    player.engine.upgrade_value[0] = 50;
    player.engine.upgrade_value[1] = 80;
    player.engine.upgrade_value[2] = 115;
    player.engine.upgrade_value[3] = 140;
    player.engine.upgrade_value[4] = 175;
    player.engine.upgrade_value[5] = 250;
    player.engine.upgrade_cost[0] = 0;
    player.engine.upgrade_cost[1] = 750;
    player.engine.upgrade_cost[2] = 2000;
    player.engine.upgrade_cost[3] = 5000;
    player.engine.upgrade_cost[4] = 20000;
    player.engine.upgrade_cost[5] = 30000;
    player.engine.upgrade_name[0] = "stock engine";
    player.engine.upgrade_name[1] = "v4 1.6 ltr";
    player.engine.upgrade_name[2] = "v4 2.0 ltr turbo";
    player.engine.upgrade_name[3] = "v6 3.8 ltr";
    player.engine.upgrade_name[4] = "v8 5.0 ltr turbo";
    player.engine.upgrade_name[5] = "v16 jaguar";

    player.fuel.attribute_name = "fueltank";
    player.fuel.attribute_unit = "LTR";
    player.fuel.attribute_unit_short = "?";
    player.fuel.upgrade_level = 1;
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
    player.fuel.upgrade_name[0] = "micro tank";
    player.fuel.upgrade_name[1] = "medium tank";
    player.fuel.upgrade_name[2] = "huge tank";
    player.fuel.upgrade_name[3] = "titanic tank";
    player.fuel.upgrade_name[4] = "leviathan tank";
    player.fuel.upgrade_name[5] = "liquid gas";

    player.radiator.attribute_name = "radiator";
    player.radiator.attribute_unit = "%";
    player.radiator.upgrade_level = 0;
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
    player.radiator.upgrade_name[0] = "stock fan";
    player.radiator.upgrade_name[1] = "dual fans";
    player.radiator.upgrade_name[2] = "single turbine";
    player.radiator.upgrade_name[3] = "dual turbines";
    player.radiator.upgrade_name[4] = "puron cooling";
    player.radiator.upgrade_name[5] = "tri-turbine";

    player.cargo.attribute_name = "cargo bay";
    player.cargo.attribute_unit = "M&";
    player.cargo.upgrade_level = 0;
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
    player.cargo.upgrade_name[0] = "micro bay";
    player.cargo.upgrade_name[1] = "medium bay";
    player.cargo.upgrade_name[2] = "huge bay";
    player.cargo.upgrade_name[3] = "gigantic bay";
    player.cargo.upgrade_name[4] = "titanic bay";
    player.cargo.upgrade_name[5] = "leviathan bay";


    player.money = 0;
    player.speed.l = 0;
    player.speed.h = 16;
    player.prev_speed.w = player.speed.w;
    
    // set all attributes based on the upgrade level
    for (uint8_t i = 0; i < 6; i++) {
        attributes_numbers[i]->current_value = attributes_numbers[i]->max_value = attributes_numbers[i]->upgrade_value[attributes_numbers[i]->upgrade_level];
    }

}

