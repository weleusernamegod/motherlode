#ifndef SELL_H
#define SELL_H

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>
#include <stdio.h>
#include "inventory.h"

void draw_sell(void);
void init_sell(void);
void draw_total_value(uint8_t line);
void draw_one_ore_line(const Material *material, uint8_t counter, uint8_t line);
void draw_collected_ores(uint8_t line);
void draw_sell_menu(void);
void sell_all_ores(void);
void sell_menu_loop(void);

#endif // SELL_H