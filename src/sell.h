#ifndef SELL_H
#define SELL_H

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include "inventory.h"

void init_sell(void);
void draw_total_value(void);
void draw_one_ore_line(const Material *material, uint8_t counter);
void draw_collected_ores(void);
void draw_sell_menu(void);
void sell_all_ores(void);

#endif // SELL_H