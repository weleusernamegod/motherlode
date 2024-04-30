#ifndef MENU_H
#define MENU_H

#include <gb/gb.h>
#include <gb/cgb.h>
#include <gb/metasprites.h>

BANKREF_EXTERN(bank_main_menu)

void draw_menu_buttons(void);
void draw_main_menu(void);
void init_main_menu(void);



#endif // MENU_H