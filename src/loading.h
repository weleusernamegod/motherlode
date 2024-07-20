#ifndef LOADING_H
#define LOADING_H

#include <gb/gb.h>
#include <stdio.h>
#include "attributes.h"

BANKREF_EXTERN(bank_loading)

void init_loading_screen(void);
void draw_loading_screen(uint16_t rows, uint16_t desired_rows);
void done_loading(void);
void generate_map(uint16_t desired_rows);
void init_attributes(void);


#endif // LOADING_H
